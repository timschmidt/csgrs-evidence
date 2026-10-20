"""Deliberate implementation faults must fail at runtime; restore in finally."""
import difflib, hashlib, json, os, subprocess, time
from pathlib import Path
root = Path('/mnt/development/csgrs')
out = Path(__file__).resolve().parent / 'controls'
out.mkdir(exist_ok=True)
env = os.environ.copy()
env.update(PATH='/home/tim/.cargo/bin:' + env['PATH'], CARGO_HOME='/tmp/hyperbrep-review-cargo', CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
builder = 'crates/hyperbrep/src/topology/builder.rs'
positive = 'closed_circle_edges_keep_single_vertex_identity_and_replay'
admission = 'closed_edge_admission_requires_a_full_regular_period_and_actual_endpoint'
period = '''            require_real_equal(
                &(domain.represented_end()? - domain.represented_start()?),
                &Real::tau(),
                BuildError::ClosedEdgePeriodMismatch,
            )?;'''
arc = '''            let Segment2::Line(segment) = segment else {
                continue;
            };
'''
cases = [
    ('ban-closed-edge', builder, '        let start_point = self.vertex_ref(start)?.point();',
     '        if start == end { return Err(BuildError::ClosedEdgePeriodMismatch); }\n        let start_point = self.vertex_ref(start)?.point();', 'hyperbrep', 'closed_edges', positive),
    ('duplicate-adjacency', builder, '        if end != start {', '        if true {', 'hyperbrep', 'closed_edges', positive),
    ('omit-period-proof', builder, period, '', 'hyperbrep', 'closed_edges', admission),
    ('omit-closed-endpoint-proof', builder, '        if !endpoint_certificate {', '        if !endpoint_certificate && start != end {', 'hyperbrep', 'closed_edges', admission),
    ('restore-arc-zero-chord-guard', 'crates/hypercurve/src/curve_string.rs', arc, '', 'hypercurve', 'hypercurve_curve_string', 'full_circle_segments_retain_area_moment_and_winding_in_native_contours'),
    ('omit-conservative-bound-fallback', 'crates/hyperbrep/src/boolean_kernel/sets.rs', '            return Ok(model.bounds()?);', '            return Ok(None);', 'hyperbrep', 'closed_edges', 'closed_edges_continue_through_disconnected_selections_and_empty_results'),
]
rows = []
for name, file, old, new, package, target, test in cases:
    path = root / file
    original = path.read_text()
    assert original.count(old) == 1, name
    changed = original.replace(old, new)
    before = hashlib.sha256(original.encode()).hexdigest()
    (out / (name + '.patch')).write_text(''.join(difflib.unified_diff(original.splitlines(True), changed.splitlines(True), fromfile=file, tofile=file)))
    cmd = ['cargo', 'test', '--offline', '--locked', '-p', package, '--test', target, test, '--', '--exact']
    started = time.time()
    try:
        path.write_text(changed)
        run = subprocess.run(['timeout', '--signal=TERM', '--kill-after=30s', '900s', *cmd], cwd=root, env=env, capture_output=True, text=True)
    finally:
        path.write_text(original)
        assert hashlib.sha256(path.read_bytes()).hexdigest() == before
    log = run.stdout + run.stderr
    (out / (name + '.log')).write_text(log)
    rejected = run.returncode != 0 and 'test result: FAILED' in log and 'could not compile' not in log
    rows.append(dict(name=name, command=cmd, external_timeout_seconds=900, exit_code=run.returncode, rejected_at_runtime=rejected, source_restored=True, source=file, source_sha256=before, elapsed_seconds=time.time() - started))
    (out / 'results.json').write_text(json.dumps(rows, indent=2) + '\n')
    assert rejected, log
    print(name, 'rejected and restored', flush=True)
