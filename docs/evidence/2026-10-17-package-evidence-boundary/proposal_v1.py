"""Evaluate an evidence-only package exclusion after a complete baseline list."""
import difflib
import gzip
import json
from pathlib import Path
import re
import runpy
import subprocess
import sys
import tomllib

sys.dont_write_bytecode = True
W = Path(__file__).resolve().parent
scope = runpy.run_path(str(W / 'runner_v1.py'))
ROOT, R, run, dump, sha = (scope[key] for key in ['ROOT', 'R', 'run', 'dump', 'sha'])
baseline = json.loads((R / 'baseline-result.json').read_text())
assert baseline['package_inventory_complete']
pins = json.loads((R / 'source-pins.json').read_text())
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == pins['base_revision']
assert all(sha(ROOT / name) == digest for name, digest in pins['inputs_sha256'].items())
subprocess.run(['git', 'diff', '--quiet'], cwd=ROOT, check=True)
subprocess.run(['git', 'diff', '--cached', '--quiet'], cwd=ROOT, check=True)
before_paths = set(gzip.open(R / 'package-before/stdout.gz', 'rt').read().splitlines())
evidence_paths = {name for name in before_paths if name.startswith('docs/evidence/')}
assert evidence_paths
retained_paths = before_paths - evidence_paths
source_hashes = {name: sha(ROOT / name) for name in sorted(retained_paths)
                 if name != 'Cargo.toml' and (ROOT / name).is_file()}
with gzip.open(W / 'retained-source-before-sha.json.gz', 'wt') as stream:
    json.dump(source_hashes, stream, sort_keys=True)
manifest = ROOT / 'Cargo.toml'
before = manifest.read_text()
before_data = tomllib.loads(before)
assert 'exclude' not in before_data['package'] and 'include' not in before_data['package']
needle = 'autobenches = false\n'
addition = '''autobenches = false
# Historical acceptance archives remain available in the repository.
exclude = ["/docs/evidence"]
'''
assert before.count(needle) == 1
after = before.replace(needle, addition)
after_data = tomllib.loads(after)
after_without_exclude = json.loads(json.dumps(after_data))
del after_without_exclude['package']['exclude']
assert after_without_exclude == before_data
(W / 'Cargo.toml.before').write_text(before)
(W / 'Cargo.toml.after').write_text(after)
(W / 'package-exclusion.patch').write_text(''.join(difflib.unified_diff(before.splitlines(True), after.splitlines(True),
    fromfile='a/Cargo.toml', tofile='b/Cargo.toml')))
manifest.write_text(after)
commands = []
failures = []
decision = {'retention_decision': 'unadmitted', 'base_revision': pins['base_revision'],
    'package_built': False, 'external_pipeline_run': False, 'release_qualified': False,
    'performance_claimed': False, 'previous_timeout_preserved': True}
try:
    result = run('package-after', ['cargo', 'package', '--list', '--offline', '--locked', '--allow-dirty', '-p', 'csgrs'], ROOT)
    commands.append(result)
    if result['exit_code'] != 0 or result['resource_stops']:
        failures.append('package-after-incomplete')
    else:
        after_paths = set(gzip.open(R / 'package-after/stdout.gz', 'rt').read().splitlines())
        removed = before_paths - after_paths
        added = after_paths - before_paths
        if removed != evidence_paths or added:
            failures.append('package-membership-difference')
        refs = []
        for name in sorted(after_paths):
            path = ROOT / name
            if path.suffix != '.rs' or not path.is_file():
                continue
            for match in re.finditer(r'include_(?:str|bytes)!\s*\(\s*"([^"\n]+)"\s*\)', path.read_text()):
                target = (path.parent / match.group(1)).resolve()
                try:
                    relative = str(target.relative_to(ROOT))
                except ValueError:
                    relative = str(target)
                included = relative in after_paths and target.is_file()
                refs.append({'source': name, 'literal': match.group(1), 'resolved': relative, 'included': included})
                if not included:
                    failures.append('missing-include-asset:' + relative)
        unchanged = all(sha(ROOT / name) == digest for name, digest in source_hashes.items())
        if not unchanged:
            failures.append('retained-source-bytes-changed')
        decision.update(before_files=len(before_paths), after_files=len(after_paths), removed_evidence_files=len(removed),
            added_paths=sorted(added), unexpected_removed_paths=sorted(removed - evidence_paths),
            unexpected_retained_evidence_paths=sorted(evidence_paths - removed),
            retained_physical_files_hashed=len(source_hashes), retained_source_bytes_unchanged=unchanged,
            compile_time_includes=refs, exact_evidence_only_membership_change=removed == evidence_paths and not added)
    if not failures:
        for name, argv in [
            ('metadata-after', ['cargo', 'metadata', '--offline', '--locked', '--no-deps', '--format-version', '1']),
            ('format-after', ['cargo', 'fmt', '--all', '--', '--check']),
            ('whitespace-after', ['git', 'diff', '--check', '--', 'Cargo.toml'])]:
            result = run(name, argv, ROOT)
            commands.append(result)
            if result['exit_code'] != 0 or result['resource_stops']:
                failures.append(name)
                break
    if not failures:
        assert all(sha(ROOT / name) == digest for name, digest in source_hashes.items())
        assert manifest.read_text() == after
        decision['retention_decision'] = 'kept'
except Exception as error:
    failures.append(type(error).__name__ + ': ' + str(error))
finally:
    if decision['retention_decision'] != 'kept':
        manifest.write_text(before)
        decision['production_manifest_restored'] = manifest.read_text() == before
    else:
        decision['production_manifest_restored'] = False
    decision.update(commands=commands, failures=failures, manifest_sha256=sha(manifest),
        baseline_manifest_sha256=sha(W / 'Cargo.toml.before'), candidate_manifest_sha256=sha(W / 'Cargo.toml.after'))
    dump(R / 'proposal-result.json', decision)
print(json.dumps({key: decision[key] for key in ['retention_decision', 'failures', 'production_manifest_restored',
    'package_built', 'release_qualified']}))
