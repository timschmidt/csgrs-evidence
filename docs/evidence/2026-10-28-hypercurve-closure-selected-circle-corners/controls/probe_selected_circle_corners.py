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
parser.add_argument('--checkout', default='circle-line-contacts')
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
target = root.parent / ('hypercurve-' + args.checkout + '-admission')
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

assert run('build', ['cargo', 'build', '--locked', '--release', '--all-features', '-p', 'hypercurve', '--lib', '--message-format=json'], 1800, True) == 0
artifacts = [json.loads(line) for line in (record / 'build.jsonl').read_text().splitlines()]
def library(name):
    return Path(next(filename for item in artifacts if item.get('reason') == 'compiler-artifact' and item['target']['name'] == name for filename in item['filenames'] if filename.endswith('.rlib')))
curve = library('hypercurve')
solver = library('hypersolve')
test = record / 'original.rs'
test.write_bytes((checkout / 'crates/hypercurve/tests/fiber_point_incidence.rs').read_bytes() + (root / 'controls/selected-circle-corners-tests.rs').read_bytes())
if args.extra_cases:
    test.write_bytes(test.read_bytes() + (root / 'controls/retained-circle-pair-tests.rs').read_bytes() + (root / 'controls/selected-circle-corners-extra-tests.rs').read_bytes() + (root / 'controls/selected-corner-offset-query-tests.rs').read_bytes() + (root / 'controls/selected-circle-overlap-extra-tests.rs').read_bytes())
    contents = test.read_text()
    signature = 'fn circle_path_in_frame(radius: i32, clockwise: bool) -> hypercurve::CurvePath2 {'
    assert contents.count(signature) == 1
    contents = contents.replace(signature, signature + '\n    circle_path_with_anchor(radius, clockwise, 3, 4)\n}\nfn circle_path_with_anchor(radius: i32, clockwise: bool, dx: i32, dy: i32) -> hypercurve::CurvePath2 {')
    assert contents.count('        point(3, 4),') == 1
    contents = contents.replace('        point(3, 4),', '        point(dx, dy),')
    start = contents.index('fn circle_path_with_anchor(')
    end = contents.index('    let mut bytes = b"HCP4"', start)
    body = contents[start:end]
    body = body.replace('    let nodes = vec![', '''    let anchor_chord = |tag, references: &[u32]| {
        let mut bytes = record(tag, references);
        bytes.extend([u8::from(dx == 0), u8::from(if dx == 0 { dy > 0 } else { dx > 0 })]);
        bytes
    };
    let nodes = vec![''').replace('chord(11, &[2, 3])', 'anchor_chord(11, &[2, 3])').replace('chord(12, &[4, 2, 3])', 'anchor_chord(12, &[4, 2, 3])')
    contents = contents[:start] + body + contents[end:]
    unused = 'fn chord(tag: u8, references: &[u32]) -> Vec<u8> {\n    let mut bytes = record(tag, references);\n    bytes.extend([0, 1]);\n    bytes\n}\n'
    assert contents.count(unused) == 1
    contents = contents.replace(unused, '')
    test.write_text(contents)
binary = record / 'original'
assert run('original-build', ['rustc', '+1.98.1', '--edition=2024', '--test', '--cfg', 'feature="svg"', '-C', 'opt-level=3', str(test), '--crate-name', 'selected_circle_corner_probe', '-L', 'dependency=' + str(curve.parent), '-L', 'dependency=' + str(solver.parent), '--extern', 'hypercurve=' + str(curve), '--extern', 'hypersolve=' + str(solver), '-o', str(binary)], 120) == 0
for name in ['selected_circle_diameter_chamfer_reconstructs_replays_and_offsets', 'selected_circle_diameter_constrained_fillet_reconstructs_replays_and_offsets', 'selected_circle_regions_boolean_annulus_and_empty_offsets', 'selected_circle_region_replays_in_a_fresh_process_then_offsets']:
    run(name, [str(binary), name, '--exact', '--nocapture'], 300)
if args.extra_cases:
    for name in ['selected_circle_shared_center_contacts_retry_and_keep_certainty', 'selected_circle_shared_center_contact_replays_before_further_intersection', 'selected_circle_corner_reversal_preserves_set_and_constraints', 'selected_corner_offset_queries_retain_mapped_endpoint_domains', 'selected_circle_shared_center_rotated_frames_keep_partial_overlap']:
        run(name, [str(binary), name, '--exact', '--nocapture'], 300)
e.save_json(record / 'attribution.json', {'library': str(curve), 'library_sha256': hashlib.sha256(curve.read_bytes()).hexdigest(), 'test_sha256': hashlib.sha256(test.read_bytes()).hexdigest(), 'source': source, 'full_positive_assertions_preserved': True})
print('PROBE COMPLETE: inspect actual outcomes; timeout is not shared-work exhaustion.', flush=True)
