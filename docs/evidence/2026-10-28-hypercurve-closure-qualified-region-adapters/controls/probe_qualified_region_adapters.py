from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode = True
parser = argparse.ArgumentParser()
parser.add_argument('--checkout', default='qualified-region-queries')
parser.add_argument('--record', required=True)
parser.add_argument('--trace', action='store_true')
parser.add_argument('--extra-cases', action='store_true')
args = parser.parse_args()
root = Path(__file__).resolve().parents[1]
checkout = root / args.checkout
record = root / 'controls' / args.record
record.mkdir()
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
e.save_json(record / 'source-before.json', source)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
for name in source['untracked_inputs']:
    destination = record / 'inputs' / name
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_bytes((checkout / name).read_bytes())
target = root.parent / 'hypercurve-circle-line-contacts-admission'
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_TARGET_DIR': str(target), 'CARGO_BUILD_JOBS': '2',
       'CCACHE_DIR': str(root.parent / 'hypercurve-admission-ccache'), 'CCACHE_TEMPDIR': str(root.parent / 'hypercurve-admission-ccache/tmp')}
if args.trace:
    env['HYPERCURVE_CORNER_TRACE'] = '1'
rows = []

def run(name, command, timeout, json_output=False):
    assert e.source_snapshot()[0] == source
    started = time.time()
    with (record / (name + ('.jsonl' if json_output else '.log'))).open('w') as out, (record / (name + '-stderr.log')).open('w') as err:
        process = subprocess.Popen(command, cwd=checkout, env=env, stdout=out, stderr=err, start_new_session=True)
        e.save_json(record / 'active.json', {'pid': process.pid, 'name': name, 'started_epoch': started, 'command': command})
        try:
            code = process.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGKILL)
            process.wait()
            code = 'external_timeout'
    after, after_files, _ = e.source_snapshot()
    row = {'name': name, 'command': command, 'exit_code': code, 'elapsed_seconds': time.time() - started, 'source_stable': source == after, 'external_timeout_seconds': timeout}
    rows.append(row)
    e.save_json(record / 'results.json', rows)
    e.save_json(record / 'source-after.json', after)
    e.save_json(record / 'files-after.json', after_files)
    print(row, flush=True)
    assert row['source_stable']
    return code

assert run('build', ['cargo', 'build', '--locked', '--release', '--all-features', '-p', 'csgrs', '--lib', '--message-format=json'], 1800, True) == 0
artifacts = [json.loads(line) for line in (record / 'build.jsonl').read_text().splitlines()]
def library(name):
    return Path(next(filename for item in artifacts if item.get('reason') == 'compiler-artifact' and item['target']['name'] == name for filename in item['filenames'] if filename.endswith('.rlib')))
curve = library('hypercurve')
csgrs = library('csgrs')
solver = library('hypersolve')
test = record / 'original.rs'
test.write_bytes((checkout / 'crates/hypercurve/tests/qualified_region_queries.rs').read_bytes() + (root / 'controls/qualified-region-adapter-tests.rs').read_bytes())
binary = record / 'original'
assert run('original-build', ['rustc', '+1.98.1', '--edition=2024', '--test', '--cfg', 'feature="svg"', '-C', 'opt-level=3', str(test), '--crate-name', 'selected_circle_corner_probe', '-L', 'dependency=' + str(curve.parent), '-L', 'dependency=' + str(solver.parent), '--extern', 'hypercurve=' + str(curve), '--extern', 'hypersolve=' + str(solver), '--extern', 'csgrs=' + str(csgrs), '-o', str(binary)], 120) == 0
for case in ['csgrs_empty_membership_preserves_inherited_topology_receipt', 'csgrs_empty_bounds_preserve_inherited_topology_receipt']:
    run(case, [str(binary), case, '--exact', '--nocapture'], 120)
e.save_json(record / 'attribution.json', {'csgrs_library': str(csgrs), 'csgrs_library_sha256': hashlib.sha256(csgrs.read_bytes()).hexdigest(), 'library': str(curve), 'library_sha256': hashlib.sha256(curve.read_bytes()).hexdigest(), 'test_sha256': hashlib.sha256(test.read_bytes()).hexdigest(), 'source': source, 'full_positive_assertions_preserved': True})
print('PROBE COMPLETE: inspect actual outcomes; timeout is not shared-work exhaustion.', flush=True)
