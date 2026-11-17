from pathlib import Path
import hashlib, json, os, shutil, subprocess, sys, time

s = Path(__file__).parent
h = s / 'resource-harness'
r = Path('/mnt/development/interval-jacobian-context/csgrs')
label, features = sys.argv[1:]
assert features in ['default', 'trace']
assert not (s.parent / 'coordinated-ci/quiet-workflow-executed-plan.json').exists()
assert not (s / 'build-barrier/result.json').exists()
target = Path('/mnt/development/.interval-refactor-build/alpha-proof-stack')
art = Path('/mnt/development/.interval-refactor-build/jacobian-context-artifacts')
art.mkdir(exist_ok=True)
env = os.environ | {'CARGO_TARGET_DIR': str(target), 'CARGO_BUILD_JOBS': '6', 'CARGO_NET_OFFLINE': 'true'}
cmd = ['cargo', '+1.95.0', 'build', '--release', '--offline']
if (s / 'resource-lock-established.json').exists(): cmd += ['--locked']
if features == 'trace': cmd += ['--features', 'trace']
start = time.monotonic()
with (s / f'{label}-{features}-resource-build.log').open('w') as log:
    p = subprocess.run(cmd, cwd=h, env=env, stdout=log, stderr=subprocess.STDOUT, timeout=1800)
row = {'revision': subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=r, text=True).strip(), 'command': cmd, 'features': features, 'exit_code': p.returncode, 'elapsed': time.monotonic()-start, 'lock_sha256': hashlib.sha256((h / 'Cargo.lock').read_bytes()).hexdigest()}
(s / f'{label}-{features}-resource-build.json').write_text(json.dumps(row, indent=2)+'\n')
assert p.returncode == 0
(s / 'resource-lock-established.json').write_text(json.dumps({'sha256': row['lock_sha256']}, indent=2)+'\n')
source = target / 'release/jacobian-context-resource-probe'
dest = art / f'{label}-{features}-resource'
shutil.copy2(source, dest)
row['binary'] = {'path': str(dest), 'sha256': hashlib.sha256(dest.read_bytes()).hexdigest(), 'bytes': dest.stat().st_size}
functional = []
for case in range(8):
    for mode in ['observe', 'stack']:
        cmd = [str(dest), str(case), mode, '0', '165']
        p = subprocess.run(cmd, capture_output=True, text=True, timeout=60)
        (s / f'{label}-{features}-functional-{case}-{mode}.log').write_text(p.stdout+p.stderr)
        functional.append({'case': case, 'mode': mode, 'exit_code': p.returncode})
        assert p.returncode == 0, (case, mode, p.stderr)
row['functional'] = functional
(s / f'{label}-{features}-resource-build.json').write_text(json.dumps(row, indent=2)+'\n')
print(label, features, 'resource artifact and16functional invocations passed', flush=True)
