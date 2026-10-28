from pathlib import Path
import argparse
import importlib.util
import json
import os
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode = True
parser = argparse.ArgumentParser()
parser.add_argument('increment', choices=['qualified-region-adapters'])
parser.add_argument('--attempt', default='recovered1')
parser.add_argument('--target', type=Path)
parser.add_argument('--resume-from')
args = parser.parse_args()
root = Path(__file__).resolve().parents[1]
checkout = root / args.increment
record = root / 'controls' / (args.increment + '-qualification-' + args.attempt)
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, files, patch = evidence.source_snapshot()
evidence.save_json(record / 'source-before.json', source)
evidence.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
for name in source['untracked_inputs']:
    destination = record / 'inputs' / name
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_bytes((checkout / name).read_bytes())
target = str(args.target.resolve() if args.target else root.parent / ('hypercurve-' + args.increment + '-admission'))
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_TARGET_DIR': target,
       'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '2',
       'CCACHE_DIR': str(root.parent / 'hypercurve-admission-ccache'),
       'CCACHE_TEMPDIR': str(root.parent / 'hypercurve-admission-ccache/tmp')}
base = ['cargo','test','--locked','--release','--all-features','-p','csgrs']
focused = [('adapter-queries', [*base,'--test','qualified_region_queries'], {}),
           ('receipt-consumers', [*base,'--test','receipt_composition','--test','planar_operation_failures','--test','geometry_context'], {})]
tools = root.parent / 'research-closeout-tools'
wasm_env = {'RUSTUP_TOOLCHAIN':'1.99.1', 'CARGO_TARGET_DIR':str(root.parent / 'hypercurve-region-adapters-wasm'),
            'WASM_BINDGEN':str(tools/'bin/wasm-bindgen'),
            'TSC':str((root/'publication/tests/wasm/node_modules/.bin/tsc').resolve()),
            'CARGO_NET_OFFLINE':'true'}
commands = [
    ('fmt', ['cargo','+1.99.1','fmt','--all','--','--check'], {}),
    ('msrv-clippy', ['cargo','clippy','--locked','-p','csgrs','-p','csgrs-ffi','-p','hyperdrc','-p','hypercircuit','--all-targets','--all-features','--','-D','warnings'], {'RUSTUP_TOOLCHAIN':'1.95.0','CARGO_TARGET_DIR':target+'-msrv'}),
    ('minimal-queries', ['cargo','test','--locked','--release','-p','csgrs','--no-default-features','--features','curve','--test','qualified_region_queries'], {}),
    ('docs', ['cargo','doc','--locked','--no-deps','--all-features','-p','csgrs','-p','csgrs-ffi'], {'RUSTDOCFLAGS':'-D warnings'}),
    ('full-root', [*base,'--no-fail-fast'], {}),
    ('hyperdrc', ['cargo','test','--locked','--release','--all-features','-p','hyperdrc','--no-fail-fast'], {}),
    ('hypercircuit', ['cargo','test','--locked','--release','--all-features','-p','hypercircuit','--no-fail-fast'], {}),
    ('ffi', ['cargo','test','--locked','--release','--all-features','-p','csgrs-ffi','--no-fail-fast'], {}),
    ('wasm-clippy', ['cargo','clippy','--locked','--profile','wasm','--target','wasm32-unknown-unknown','--no-default-features','--features','wasm','--lib','--','-D','warnings'], wasm_env),
    ('wasm-consumers', ['bash','scripts/test-wasm-bindings.sh'], wasm_env),
    ('typos', ['typos'], {}),
    ('budget', ['scripts/check-repository-budget.sh'], {}),
    ('diff', ['git','diff','--check'], {}),
]
assert len(commands) == 13
records = []
continued = {}
if args.resume_from:
    previous = root / 'controls' / args.resume_from
    assert previous.parent == record.parent and previous != record
    assert json.loads((previous/'source-before.json').read_text()) == source
    assert json.loads((previous/'source-after.json').read_text()) == source
    assert json.loads((previous/'files-before.json').read_text()) == files
    assert json.loads((previous/'files-after.json').read_text()) == files
    previous_rows = json.loads((previous/'results.json').read_text())
    assert previous_rows[-1]['exit_code'] != 0
    assert all(row['exit_code'] == 0 and row['source_stable'] for row in previous_rows[:-1])
    for row in previous_rows[:-1]:
        continued[(row['phase'],row['name'])] = row
        filename = row['phase']+'-'+row['name']+'.log'
        (record/filename).write_bytes((previous/filename).read_bytes())
    evidence.save_json(record/'continuation.json', {'previous':str(previous),'source':source,'passed_prefix_groups':len(continued),'failed_group_reexecuted':previous_rows[-1],'reason':'Use the workflow Bash invocation for its non-executable script. Retain successful groups on identical complete source; rerun the failed group and remaining checks.'})
for phase, plan in [('focused', focused), ('qualification', commands)]:
    for name, command, extra in plan:
        assert evidence.source_snapshot()[0] == source, 'Source changed before ' + name
        if (phase,name) in continued:
            row=continued[(phase,name)]
            assert row['command'] == command
            records.append({**row,'continued_from':args.resume_from})
            evidence.save_json(record/'results.json',records)
            continue
        print('START', phase, name, flush=True)
        started = time.time()
        timeout = 21600 if phase == 'qualification' else 3600
        with (record / (phase + '-' + name + '.log')).open('w') as log:
            process = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=checkout, env={**env, **extra}, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
            active = {'pid': process.pid, 'phase': phase, 'name': name, 'started_epoch': started, 'command': command, 'source': source}
            evidence.save_json(record / 'active.json', active)
            try:
                code = process.wait(timeout=timeout)
            except subprocess.TimeoutExpired:
                os.killpg(process.pid, signal.SIGKILL)
                process.wait()
                code = 'external_timeout'
        after, after_files, _ = evidence.source_snapshot()
        row = {'phase': phase, 'name': name, 'command': command, 'cwd': str(checkout), 'started_epoch': started,
               'elapsed_seconds': time.time() - started, 'exit_code': code, 'source_stable': source == after,
               'external_timeout_seconds': timeout,
               'settings': {key: value for key, value in {**env, **extra}.items() if key in ['RUSTUP_TOOLCHAIN', 'CARGO_TARGET_DIR', 'CARGO_BUILD_JOBS', 'RUST_TEST_THREADS', 'RUSTDOCFLAGS', 'CCACHE_DIR', 'CCACHE_TEMPDIR']}}
        records.append(row)
        evidence.save_json(record / 'results.json', records)
        evidence.save_json(record / 'source-after.json', after)
        evidence.save_json(record / 'files-after.json', after_files)
        print('FINISH', phase, name, code, round(row['elapsed_seconds'], 2), 'stable', row['source_stable'], flush=True)
        if code != 0 or not row['source_stable']:
            sys.exit(1)
evidence.save_json(record / 'complete.json', {'source': source, 'focused_groups': len(focused), 'qualification_groups': 13, 'all_passed': True, 'epoch': time.time()})
print('QUALIFICATION COMPLETE', flush=True)
