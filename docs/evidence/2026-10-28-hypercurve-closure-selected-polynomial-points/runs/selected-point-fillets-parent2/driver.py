from pathlib import Path
import argparse, hashlib, importlib.util, json, os, signal, subprocess, sys, time

sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
p = argparse.ArgumentParser()
p.add_argument('--checkout', required=True)
p.add_argument('--attempt', required=True)
p.add_argument('--target', required=True)
p.add_argument('--timeout', type=int, default=1800)
args = p.parse_args()
w = r / args.checkout
record = c / ('selected-point-fillets-' + args.attempt)
record.mkdir()
spec = importlib.util.spec_from_file_location('e', w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before, files, patch = e.source_snapshot()
e.save_json(record / 'source-before.json', before)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = {**os.environ, 'RUSTUP_TOOLCHAIN':'1.98.1', 'CARGO_BUILD_JOBS':'2',
       'RUST_TEST_THREADS':'1', 'CARGO_TARGET_DIR':str(r.parent / args.target)}
rows = []
def run(name, command, timeout):
    assert e.source_snapshot()[0] == before
    started = time.time()
    with (record / (name + '.log')).open('w') as log:
        proc = subprocess.Popen(['/usr/bin/time','-v',*command], cwd=w, env=env,
                                stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        e.save_json(record / 'active.json', {'name':name, 'pid':proc.pid,
                    'command':command, 'started_epoch':started})
        try: code = proc.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.wait()
            code = 'external_timeout'
    after, af, _ = e.source_snapshot()
    row = {'name':name, 'command':command, 'exit_code':code,
           'elapsed_seconds':time.time()-started, 'external_timeout_seconds':timeout,
           'source_stable':before == after}
    rows.append(row)
    e.save_json(record / 'results.json', rows)
    e.save_json(record / 'source-after.json', after)
    e.save_json(record / 'files-after.json', af)
    print(row, flush=True)
    assert before == after
    return code
command = ['cargo','test','--locked','--release','-p','hypercurve','--all-features',
           '--lib','--no-run','--message-format=json']
if run('compile',command,3600) != 0: sys.exit(1)
artifacts = []
for line in (record / 'compile.log').read_text().splitlines():
    try: artifacts.append(json.loads(line))
    except json.JSONDecodeError: pass
binary = Path(next(row['executable'] for row in artifacts
    if row.get('reason') == 'compiler-artifact' and row['target']['name'] == 'hypercurve'
    and row.get('executable')))
e.save_json(record / 'binary.json', {'path':str(binary), 'sha256':e.digest_file(binary),
    'toolchain':subprocess.check_output(['rustc','+1.98.1','-vV'],text=True),
    'settings':{k:env[k] for k in ['RUSTUP_TOOLCHAIN','CARGO_BUILD_JOBS','RUST_TEST_THREADS','CARGO_TARGET_DIR']}})
for name in ['nonlinear_algebraic_endpoint_fillet_uses_complete_incident_domain',
             'nonrepresented_chord_parallel_corner_fillets_without_reintersection']:
    run(name,[str(binary),'bezier_region::tests::'+name,'--exact','--nocapture'],args.timeout)
e.save_json(record / 'complete.json', {'source':before, 'groups':len(rows),
    'all_passed':all(row['exit_code'] == 0 for row in rows), 'epoch':time.time(),
    'scope':'Original unmodified complete fillet witnesses; external timeout is an observation, not a typed geometry resource outcome. Build time is recorded separately.'})
