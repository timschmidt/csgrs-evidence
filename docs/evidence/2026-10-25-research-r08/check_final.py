from pathlib import Path
import hashlib, json, os, signal, subprocess, time, sys

root = Path('/home/tim/Documents/GitHub/workspace/csgrs')
out = Path(__file__).resolve().parent / ('final-checks-' + str(time.time_ns()))
out.mkdir(exist_ok=True)
env = os.environ.copy()
env['CSGRS_LIBRARY'] = str(root / 'target/release/libcsgrs_ffi.so')
env['PYTHONPATH'] = str(root / 'bindings/python')
env['CCACHE_DIR'] = '/tmp/csgrs-research-ccache'
env['CCACHE_TEMPDIR'] = '/tmp/csgrs-research-ccache-tmp'
env['WASM_BINDGEN'] = '/tmp/claude-1000/-home-tim-Documents-GitHub-workspace-csgrs/1dd6969b-b3fa-493b-8161-505ab6355a7e/scratchpad/wasm-bindgen-0.2.126/bin/wasm-bindgen'
checks = [
    ('fmt', ['cargo', 'fmt', '--all', '--', '--check'], 300),
    ('clippy', ['cargo', 'clippy', '--locked', '-p', 'csgrs', '-p', 'hypercurve', '-p', 'hypercircuit', '-p', 'hyperbrep', '--all-features', '--all-targets', '--', '-D', 'warnings'], 900),
    ('qualified-closure', ['cargo', 'test', '--locked', '--release', '-p', 'hypercurve', '--all-features', '--test', 'qualified_closure'], 300),
    ('policy-fiber-replay', ['cargo', 'test', '--locked', '--release', '-p', 'hypercurve', '--all-features', '--lib', 'selected_fiber_rational_', '--', '--test-threads=2'], 300),
    ('policy-circle-replay', ['cargo', 'test', '--locked', '--release', '-p', 'hypercurve', '--all-features', '--lib', 'selected_parallel_normal_circle_keeps_contacts_when_center_refines_to_exact'], 300),
    ('hypercircuit-consumers', ['cargo', 'test', '--locked', '--release', '-p', 'hypercircuit', '--all-features', '--test', 'board_boundary_receipts', '--test', 'curved_outline', '--test', 'curved_routing', '--test', 'materialize', '--', '--test-threads=2'], 900),
    ('modeling-consumers', ['cargo', 'test', '--locked', '--release', '-p', 'csgrs', '--all-features', '--test', 'receipt_composition', '--test', 'adapter_curve_failures', '--test', 'native_boundary_failures', '--test', 'exact_linear_modeling', '--test', 'exact_profile_sweeps', '--test', 'mixed_modeling_profiles', '--test', 'transform_failures', '--test', 'geometry_context', '--', '--test-threads=2'], 900),
    ('brep-consumers', ['cargo', 'test', '--locked', '--release', '-p', 'hyperbrep', '--all-features', '--test', 'affine_curve_images', '--test', 'parallel_profile_extrusion', '--test', 'parallel_pcurve_archive', '--test', 'selected_profiles', '--', '--test-threads=2'], 900),
    ('curve-consumers', ['cargo', 'test', '--locked', '--release', '-p', 'hypercurve', '--all-features', '--test', 'hypercurve_curve_region_boolean', '--test', 'hypercurve_curve_region_promotion', '--test', 'hypercurve_open_path_compositions', '--test', 'hypercurve_exact_closure', '--test', 'hypercurve_composed_workloads', '--test', 'native_curve_images', '--test', 'retained_bezier_images', '--test', 'selected_fiber_images', '--test', 'work_budget', '--', '--test-threads=2'], 1200),
    ('docs', ['cargo', 'doc', '--locked', '--no-deps', '-p', 'hypercurve', '-p', 'hypercircuit', '--all-features'], 600),
    ('wasm-check', ['cargo', 'check', '--locked', '-p', 'hypercurve', '-p', 'hypercircuit', '--features', 'hypercircuit/layout', '--target', 'wasm32-unknown-unknown'], 600),
    ('ffi-tests', ['cargo', 'test', '--locked', '--release', '-p', 'csgrs-ffi'], 900),
    ('ffi-build', ['cargo', 'build', '--locked', '--release', '-p', 'csgrs-ffi'], 900),
    ('wasm-bindings', ['bash', 'scripts/test-wasm-bindings.sh'], 900),
    ('repository-budget', ['bash', 'scripts/check-repository-budget.sh'], 300),
    ('diff-check', ['git', 'diff', '--check'], 300),
]

bindings = []
for fixture in ['curve_operation_failures', 'transform_failures', 'construction_evidence']:
    for language, compiler, standard, suffix in [('c', 'cc', 'c11', 'c'), ('cpp', 'c++', 'c++17', 'cpp')]:
        binary = str(out / (fixture + '-' + language))
        bindings += [(fixture + '-' + language + '-build', [compiler, '-std=' + standard, '-Wall', '-Wextra', '-Werror', '-I', 'crates/csgrs-ffi/include', '-I', 'bindings/cpp', 'tests/ffi/' + fixture + '.' + suffix, '-L', 'target/release', '-lcsgrs_ffi', '-Wl,-rpath,' + str(root / 'target/release'), '-o', binary], 300), (fixture + '-' + language, [binary], 300)]
    bindings.append((fixture + '-python', ['python3', 'tests/ffi/' + fixture + '.py'], 300))
i = next(i for i, step in enumerate(checks) if step[0] == 'wasm-bindings')
checks[i:i] = bindings
if len(sys.argv) > 1:
    checks = checks[next(i for i, step in enumerate(checks) if step[0] == sys.argv[1]):]
print('RECORD', out, flush=True)

patch = subprocess.check_output(['git', 'diff', '--binary'], cwd=root)
(out / 'source.patch').write_bytes(patch)
sources = [
    'crates/hypercurve/tests/qualified_closure.rs',
    'crates/hypercircuit/tests/board_boundary_receipts.rs',
]
metadata = {'source_revision': subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=root, text=True).strip(),
            'source_patch_sha256': hashlib.sha256(patch).hexdigest(),
            'new_tests': {s: hashlib.sha256((root / s).read_bytes()).hexdigest() for s in sources},
            'compiler': subprocess.check_output(['rustc', '-Vv'], text=True)}
(out / 'source.json').write_text(json.dumps(metadata, indent=2) + '\n')
with (out / 'commands.jsonl').open('w', buffering=1) as journal:
    for name, cmd, limit in checks:
        step_env = env.copy()
        if name == 'docs':
            step_env['RUSTDOCFLAGS'] = '-D warnings'
        start = time.time()
        journal.write(json.dumps({'event': 'start', 'name': name, 'command': cmd, 'cwd': str(root), 'timeout_seconds': limit, 'epoch': start}) + '\n')
        print('START', name, flush=True)
        with (out / (name + '.log')).open('w') as log:
            process = subprocess.Popen(cmd, cwd=root, env=step_env, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
            try:
                code = process.wait(timeout=limit)
            except subprocess.TimeoutExpired:
                os.killpg(process.pid, signal.SIGKILL)
                process.wait()
                code = 'timeout'
        journal.write(json.dumps({'event': 'finish', 'name': name, 'code': code, 'seconds': time.time() - start}) + '\n')
        print('FINISH', name, code, flush=True)
        if code:
            raise SystemExit(1)
