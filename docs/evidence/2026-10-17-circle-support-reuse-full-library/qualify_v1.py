"""Run both full library modes from exact frozen binaries and a fresh mirror."""
import gzip
import hashlib
import json
import os
from pathlib import Path
import re
import runpy
import shutil
import subprocess
import sys
import tomllib

sys.dont_write_bytecode = True
W = Path(__file__).resolve().parent
ROOT = W.parents[2]
R = Path('/run/user/1000/csgrs-circle-support-reuse-corpus-v1')
M = ROOT / 'target/properties/circle-support-reuse-corpus-source-v1'
P = ROOT / 'docs/evidence/2026-10-17-package-artifact-whitespace'
OLD_W = ROOT / 'target/properties/circle-support-reuse-index'
OLD_R = Path('/dev/shm/csgrs-circle-support-reuse-index-v1')
OLD_A = ROOT / 'target/properties/circle-support-reuse-library-v1'
sys.path.insert(0, str(P.parent / '2026-10-16-physical-build-requalification'))
from load_expectations_v1 import load


def sha(path):
    with Path(path).open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def read(path):
    return json.loads(Path(path).read_text())


def dump(path, value):
    Path(path).write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')


assert not R.exists() and not M.exists()
assert shutil.disk_usage(ROOT).free >= (512 + 32 + 2) * 1024**2
assert shutil.disk_usage(R.parent).free >= (256 + 8) * 1024**2
subprocess.run(['git', 'diff', '--quiet'], cwd=ROOT, check=True)
subprocess.run(['git', 'diff', '--cached', '--quiet'], cwd=ROOT, check=True)
previous = read(P / 'checkpoint-v1.json')
assert all(sha(ROOT / path) == digest for path, digest in previous['evidence_files_sha256'].items())
expected, missing = load(ROOT / previous['artifact_expectations'], allow_unqualified=True)
assert len(expected) == 1232716 and len(missing) == 27093
records = [OLD_R / 'build-v1/protocol.json', OLD_R / 'build-v1/result.json', OLD_R / 'build-v1/commands.json',
    OLD_R / 'corpus-v1/protocol.json', OLD_R / 'corpus-v1/result.json', OLD_R / 'corpus-v1/commands.json', OLD_A / 'protocol.json',
    OLD_A / 'result.json', OLD_A / 'commands.json', OLD_W / 'runner_v2.py',
    OLD_R / 'proposal-v1/result.json']
for path in records:
    assert sha(path) == expected[str(path)], path
build = read(OLD_R / 'build-v1/protocol.json')
built = read(OLD_R / 'build-v1/result.json')
all_protocol = read(OLD_A / 'protocol.json')
all_built = read(OLD_A / 'result.json')
assert built['complete'] and not built['command_failures'] and build['features'] == []
features = ['comparative-benchmarks', 'default', 'dispatch-trace', 'hershey', 'svg', 'triangulation']
assert all_protocol['features'] == features
assert build['rustc'] == all_protocol['rustc'] == subprocess.check_output(['rustc', '-vV'], text=True)
assert all_protocol['source'] == build['sources']['candidate']
source = build['sources']['candidate']
assert len(source['sha256']) == 461
assert sum((Path(source['path']) / path).stat().st_size for path in source['sha256']) == 26709356
source_inputs = {str(Path(source['path']) / path): digest for path, digest in source['sha256'].items()}
dependencies = build['read_only_dependencies_sha256'] | all_protocol['read_only_dependencies_sha256']
for path in build['read_only_dependencies_sha256'].keys() & all_protocol['read_only_dependencies_sha256'].keys():
    assert build['read_only_dependencies_sha256'][path] == all_protocol['read_only_dependencies_sha256'][path]
for path, digest in (source_inputs | dependencies).items():
    assert sha(path) == digest == expected[path], path
assert len(all_built['binaries']) == 1
all_binary_path, all_binary_record = next(iter(all_built['binaries'].items()))
binaries = {'no-feature': built['binaries']['candidate'],
            'all-feature': {'path': all_binary_path, **all_binary_record}}
common_flags = ['rustc', '--crate-name', 'hypercurve', '--edition=2024', '--test', 'crates/hypercurve/src/lib.rs',
                '-C', 'opt-level=3', '-C', 'codegen-units=16', '-C', 'embed-bitcode=no', '-D', 'warnings']
build_rows = {'no-feature': next(row for row in read(OLD_R / 'build-v1/commands.json') if row['name'] == 'candidate'),
              'all-feature': next(row for row in read(OLD_A / 'commands.json') if row['name'] == 'build')}
for mode, binary in binaries.items():
    assert sha(binary['path']) == binary['sha256'] == expected[binary['path']]
    assert Path(binary['path']).stat().st_size == binary['bytes']
    assert str(source['path']).encode() not in Path(binary['path']).read_bytes()
    row = build_rows[mode]
    assert row['exit_code'] == 0 and not row['external_stop_reason']
    argv = row['command']
    assert argv[:len(common_flags)] == common_flags
    tail = argv[len(common_flags):]
    assert len(tail) % 2 == 0
    options = list(zip(tail[::2], tail[1::2]))
    assert all(key in ['-L', '-o', '--cfg', '--extern'] for key, value in options)
    assert [value for key, value in options if key == '-o'] == [binary['path']]
    externs = build['externs'] if mode == 'no-feature' else all_protocol['externs']
    assert dict(value.split('=', 1) for key, value in options if key == '--extern') == externs
    assert [value for key, value in options if key == '-L'] == ['dependency=' + str(Path(externs['hyperreal']).parent)]
    assert [value for key, value in options if key == '--cfg'] == [
        'feature="' + feature + '"' for feature in ([] if mode == 'no-feature' else features)]
    for suffix in ['stdout', 'stderr', 'resources']:
        path = (OLD_R / 'build-v1' if mode == 'no-feature' else OLD_A) / (row['name'] + '.' + suffix)
        assert sha(path) == row[suffix + '_sha256'] == expected[str(path)]
        records.append(path)
root_manifest_before = ROOT / 'target/properties/package-evidence-boundary/Cargo.toml.before'
assert sha(root_manifest_before) == expected[str(root_manifest_before)] == all_protocol['dependency_source_sha256']['Cargo.toml']
before_toml = tomllib.loads(root_manifest_before.read_text())
current_toml = tomllib.loads((ROOT / 'Cargo.toml').read_text())
assert current_toml['package'].pop('exclude') == ['/docs/evidence']
assert current_toml == before_toml
dependency_sources = all_protocol['dependency_source_sha256']
for path, digest in dependency_sources.items():
    if path != 'Cargo.toml':
        assert sha(ROOT / path) == digest, path
old_environment = read(OLD_R / 'corpus-v1/protocol.json')['existing_generated_test_environment']
current_environment = {key: value for key, value in os.environ.items() if key.startswith('PROPTEST_')}
assert old_environment == all_protocol['existing_generated_test_environment'] == current_environment
old_commands = {'no-feature': read(OLD_R / 'corpus-v1/commands.json')[0],
                'all-feature': next(row for row in read(OLD_A / 'commands.json') if row['name'] == 'tests')}
for mode, binary in binaries.items():
    assert old_commands[mode]['command'] == [binary['path'], '--nocapture', '--test-threads=1']
scope = runpy.run_path(str(OLD_W / 'runner_v2.py'))
run = scope['run']
original_resources = scope['resources']
original_violation = scope['violation']


def resources():
    observed = original_resources()
    observed['fresh_runtime_output_bytes'] = sum(path.stat().st_size for path in R.rglob('*') if path.is_file()) if R.exists() else 0
    return observed


def violation(observed):
    reason = original_violation(observed)
    if not reason and observed['fresh_runtime_output_bytes'] > 8 * 1024**2:
        reason = 'fresh-runtime-output-limit'
    return reason


run.__globals__['resources'] = resources
run.__globals__['violation'] = violation
assert not violation(resources())
assert shutil.disk_usage(ROOT).free >= (512 + 32 + 2) * 1024**2
R.mkdir()
M.mkdir()
for path, digest in source['sha256'].items():
    origin = Path(source['path']) / path
    target = M / path
    target.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(origin, target)
    assert not target.is_symlink() and sha(target) == digest
    assert (origin.stat().st_dev, origin.stat().st_ino) != (target.stat().st_dev, target.stat().st_ino)
assert not violation(resources())
input_pins = {str(path): sha(path) for path in records + [root_manifest_before, Path(__file__), W / 'contract-v1.md']}
input_pins.update({binary['path']: binary['sha256'] for binary in binaries.values()})
live_dependency_pins = {str(ROOT / path): sha(ROOT / path) for path in dependency_sources}
base = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip()
dump(R / 'protocol.json', {'base_revision': base, 'input_sha256': input_pins,
    'read_only_source_sha256': source_inputs, 'read_only_dependencies_sha256': dependencies,
    'live_dependency_source_sha256': live_dependency_pins, 'source_mirror': str(M), 'source_mirror_sha256': source['sha256'],
    'binaries': binaries, 'successful_build_rows': build_rows, 'rustc': build['rustc'],
    'features': {'no-feature': [], 'all-feature': features}, 'PROPTEST_environment': current_environment,
    'manifest_equivalence': {'original_sha256': sha(root_manifest_before), 'current_sha256': sha(ROOT / 'Cargo.toml'),
        'only_toml_change': 'package.exclude = ["/docs/evidence"]', 'all_dependency_tables_unchanged': True},
    'original_resource_supervisor_sha256': sha(OLD_W / 'runner_v2.py'),
    'resource_change': 'Only an added 8 MiB monitored fresh-runtime-output limit; original guards retained.',
    'fresh_source_mirror_shared_sequentially_until_final_closure': True,
    'hard_links_or_symlinks_used': False, 'compiler_or_dependency_substitution': False,
    'completed_output_roots_reopened': False, 'performance_measurement': False,
    'cache_admitted': False, 'full_plan_complete': False})
print(json.dumps({'preflight_complete': True, 'source_files': len(source['sha256']), 'source_bytes': 26709356,
    'frozen_dependencies_verified': len(dependencies), 'source_mirror': str(M)}), flush=True)
del expected
results = {}
for mode, binary in binaries.items():
    output = R / mode
    output.mkdir()
    row = run(output, 'tests', [binary['path'], '--nocapture', '--test-threads=1'], M, {'RUST_BACKTRACE': '0'})
    stdout = (output / 'tests.stdout').read_text() if (output / 'tests.stdout').exists() else ''
    stderr = (output / 'tests.stderr').read_text() if (output / 'tests.stderr').exists() else ''
    summaries = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out;', stdout)
    unchanged = all(sha(M / path) == digest for path, digest in source['sha256'].items())
    generated = {str(path.relative_to(M)): sha(path) for path in M.rglob('*')
                 if path.is_file() and str(path.relative_to(M)) not in source['sha256']}
    passed = row['exit_code'] == 0 and not row['external_stop_reason'] and len(summaries) == 1
    passed = passed and summaries[0][0] == 'ok' and summaries[0][2] == '0' and summaries[0][5] == '0'
    passed = passed and unchanged and not generated and 'FileFailurePersistence' not in stderr
    result = {'complete': True, 'output_closed': True, 'command': row, 'suite_passed': passed,
        'source_mirror_unchanged': unchanged, 'generated_mirror_files': generated, 'test_summaries': summaries,
        'property_persistence_warnings': 'FileFailurePersistence' in stderr,
        'partial_individual_ok_lines': sum(line.endswith(' ... ok') for line in stdout.splitlines()),
        'partial_lines_are_not_a_terminal_pass': True, 'cache_admitted': False}
    dump(output / 'result.json', result)
    results[mode] = result
    print(json.dumps({'mode': mode, 'suite_passed': passed, 'summaries': summaries}), flush=True)
    if not passed:
        break
for mode in binaries:
    if mode not in results:
        results[mode] = {'complete': False, 'suite_passed': False, 'not_run': True,
                         'reason': 'The preceding mode did not establish a complete pass with an unchanged, clean mirror.'}
assert all(sha(path) == digest for path, digest in (input_pins | source_inputs | dependencies | live_dependency_pins).items())
unchanged = all(sha(M / path) == digest for path, digest in source['sha256'].items())
dump(R / 'result.json', {'complete': True, 'output_closed': True, 'modes': results,
    'both_library_suites_passed': all(result['suite_passed'] for result in results.values()),
    'all_read_only_inputs_unchanged': True, 'source_mirror_unchanged': unchanged,
    'earlier_resource_stops_preserved': True, 'full_cargo_matrix_qualified': False,
    'downstream_or_native_gates_qualified': False, 'cache_admitted': False,
    'release_qualified': False, 'full_plan_complete': False})
raise SystemExit(0 if all(result['suite_passed'] for result in results.values()) else 101)
