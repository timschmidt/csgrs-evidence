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
parser.add_argument('--checkout', default='selected-circle-corners')
parser.add_argument('--record', required=True)
parser.add_argument('--attribution', default='corner-composition-resource-policy-retry2/attribution.json')
parser.add_argument('--case', action='append')
args = parser.parse_args()
root = Path(__file__).resolve().parents[1]
checkout = root / args.checkout
record = root / 'controls' / args.record
record.mkdir()
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
attribution = json.loads((root / 'controls' / args.attribution).read_text())
assert source == attribution['source']
library = Path(attribution['library'])
assert hashlib.sha256(library.read_bytes()).hexdigest() == attribution['library_sha256']
e.save_json(record / 'source-before.json', source)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
test = record / 'original.rs'
test.write_bytes((checkout / 'crates/hypercurve/tests/svg_region_replay.rs').read_bytes() + (root / 'controls/empty-native-replay-tests.rs').read_bytes())
rows = []

def run(name, command, timeout):
    assert e.source_snapshot()[0] == source
    started = time.time()
    with (record / (name + '.log')).open('w') as log:
        process = subprocess.Popen(command, cwd=checkout, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        e.save_json(record / 'active.json', {'pid': process.pid, 'name': name, 'started_epoch': started, 'command': command})
        try:
            code = process.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGKILL)
            process.wait()
            code = 'external_timeout'
    after, after_files, _ = e.source_snapshot()
    row = {'name': name, 'command': command, 'exit_code': code, 'elapsed_seconds': time.time()-started, 'source_stable': source == after, 'external_timeout_seconds': timeout}
    rows.append(row)
    e.save_json(record / 'results.json', rows)
    e.save_json(record / 'source-after.json', after)
    e.save_json(record / 'files-after.json', after_files)
    assert row['source_stable']
    print(row, flush=True)
    return code

binary = record / 'original'
assert run('compile', ['rustc', '+1.98.1', '--edition=2024', '--test', '--cfg', 'feature="svg"', '-C', 'opt-level=3', str(test), '--crate-name', 'empty_native_replay_probe', '-L', 'dependency='+str(library.parent / 'deps'), '--extern', 'hypercurve='+str(library), '-o', str(binary)], 120) == 0
for name in args.case or ['canonical_empty_document_replays_before_further_operations', 'generated_empty_document_replays_with_valid_options_and_policy', 'empty_region_export_keeps_inherited_topology_qualification_with_a_stroke', 'empty_region_projection_keeps_inherited_topology_qualification', 'empty_region_topology_replay_observes_inherited_approximation']:
    run(name, [str(binary), name, '--exact', '--nocapture'], 120)
assert hashlib.sha256(library.read_bytes()).hexdigest() == attribution['library_sha256']
e.save_json(record / 'attribution.json', {**attribution, 'test_sha256': hashlib.sha256(test.read_bytes()).hexdigest(), 'all_passed': all(row['exit_code']==0 for row in rows)})
print('EMPTY REPLAY PROBE COMPLETE', flush=True)
