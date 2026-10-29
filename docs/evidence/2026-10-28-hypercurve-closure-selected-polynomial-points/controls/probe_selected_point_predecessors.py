from pathlib import Path
import argparse, importlib.util, json, os, signal, subprocess, sys, time

sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
parser = argparse.ArgumentParser()
parser.add_argument('--checkout', required=True)
parser.add_argument('--attempt', required=True)
parser.add_argument('--target', required=True)
parser.add_argument('--debug-order', action='store_true')
args = parser.parse_args()
w = r / args.checkout
record = c / ('selected-point-predecessors-' + args.attempt)
record.mkdir()
spec = importlib.util.spec_from_file_location('e', w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
e.save_json(record / 'source-before.json', source)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_BUILD_JOBS': '2',
       'RUST_TEST_THREADS': '1', 'CARGO_TARGET_DIR': str(r.parent / args.target)}
if args.debug_order:
    env['HYPERCURVE_DEBUG_SELECTED_POINT_ORDER'] = '1'
rows = []

def run(name, command, timeout):
    assert e.source_snapshot()[0] == source
    started = time.time()
    with (record / (name + '.log')).open('w') as log:
        proc = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=w, env=env,
                                stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        e.save_json(record / 'active.json', {'name': name, 'pid': proc.pid,
                    'command': command, 'started_epoch': started})
        try:
            code = proc.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.wait()
            code = 'external_timeout'
    after, after_files, _ = e.source_snapshot()
    row = {'name': name, 'command': command, 'exit_code': code,
           'elapsed_seconds': time.time() - started, 'external_timeout_seconds': timeout,
           'source_stable': source == after}
    rows.append(row)
    e.save_json(record / 'results.json', rows)
    e.save_json(record / 'source-after.json', after)
    e.save_json(record / 'files-after.json', after_files)
    print(row, flush=True)
    assert source == after
    return code

command = ['cargo', 'test', '--locked', '--release', '-p', 'hypercurve', '--all-features',
           '--lib', '--test', 'hypercurve_composed_workloads', '--test', 'polynomial_closure_composition', '--test', 'polynomial_generated_lines',
           '--no-run', '--message-format=json']
if run('compile', command, 3600) != 0:
    sys.exit(1)
artifacts = {}
for line in (record / 'compile.log').read_text().splitlines():
    try:
        row = json.loads(line)
    except json.JSONDecodeError:
        continue
    if row.get('reason') == 'compiler-artifact' and row.get('executable'):
        artifacts[row['target']['name']] = row['executable']
e.save_json(record / 'binaries.json', {name: {'path': path, 'sha256': e.digest_file(Path(path))}
    for name, path in artifacts.items()})
cases = [('hypercurve', 'bezier_region::tests::nonlinear_algebraic_endpoint_fillet_uses_complete_incident_domain'), ('hypercurve', 'bezier_region::tests::nonrepresented_chord_parallel_corner_fillets_without_reintersection'), ('hypercurve_composed_workloads', 'chamfered_conic_minus_its_fillet_completes'), ('polynomial_closure_composition', 'selected_face_probes_keep_quintic_ordinates_and_policy_receipts'), ('polynomial_generated_lines', 'generated_rational_line_reuses_polynomial_sections'), ('polynomial_generated_lines', 'generated_selected_endpoint_line_reuses_polynomial_sections'), ('polynomial_generated_lines', 'generated_selected_line_retains_common_component_overlap'), ('polynomial_generated_lines', 'generated_constant_line_point_locations_use_selected_coordinate_evidence'), ('polynomial_generated_lines', 'generated_polynomial_contacts_keep_orientation_and_replay'), ('polynomial_generated_lines', 'generated_polynomial_overlaps_keep_restrictions_and_reversal'), ('polynomial_generated_lines', 'generated_constant_components_remain_distinct_and_clip_endpoints'), ('polynomial_generated_lines', 'generated_polynomial_sections_keep_similarity_charts'), ('polynomial_generated_lines', 'generated_polynomial_sections_clip_finite_contacts_and_tangency'), ('polynomial_generated_lines', 'generated_polynomial_sections_retry_and_keep_certainty')]
for target, case in cases:
    run(case.rsplit('::', 1)[-1], [artifacts[target], case, '--exact', '--nocapture'], 180)
e.save_json(record / 'complete.json', {'source': source, 'groups': len(rows),
    'all_passed': all(row['exit_code'] == 0 for row in rows), 'epoch': time.time(),
    'scope': 'Fourteen unchanged predecessor cases: native fillets, composed conic, selected quintic and ten generated polynomial-line cases after the projective gauge correction. External containment is not a typed geometry resource outcome; failed attempts remain retained.'})
