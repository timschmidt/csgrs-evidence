from pathlib import Path
import subprocess,json,shutil,hashlib,time
p=Path(__file__).parent;r=Path('/mnt/development/csgrs-dynamics-adapters');q=p/'owner-probe';bins=Path('/tmp/interval-refactor/dynamics-adapters-binaries')
assert (p/'observer-comparison.json').exists()
assert subprocess.check_output(['git','diff','--binary'],cwd=r)==(p/'adapter.patch').read_bytes()
paths=[row['path'] for row in json.loads((p/'adapter-edits.json').read_text()) if not row['path'].endswith('/dynamics.rs')]
subprocess.run(['git','restore','--worktree','--',*paths],cwd=r,check=True)
patch=subprocess.check_output(['git','diff','--binary'],cwd=r);(p/'boundary.patch').write_bytes(patch)
assert patch.count(b'+    #[inline]')==5
(p/'boundary-dynamics.rs').write_bytes((r/'crates/hyperpath/src/routing/dynamics.rs').read_bytes())
subprocess.run(['python3',str(p/'build.py'),'inline-boundary'],check=True)
cmd=['cargo','+1.95.0','build','--release','--locked','--offline','--manifest-path',str(q/'Cargo.toml'),'--target-dir','/tmp/interval-refactor/dynamics-adapters-observer-target'];start=time.monotonic()
with (p/'observer-inline-boundary-build.log').open('w') as log:run=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT)
row=dict(variant='inline-boundary',command=cmd,returncode=run.returncode,seconds=time.monotonic()-start);assert run.returncode==0
src=Path('/tmp/interval-refactor/dynamics-adapters-observer-target/release/dynamics-owner-probe');dest=bins/'observer-inline-boundary';shutil.copy2(src,dest);row.update(sha256=hashlib.sha256(dest.read_bytes()).hexdigest(),bytes=dest.stat().st_size)
with (p/'observer-inline-boundary.log').open('w') as log:run=subprocess.run([str(dest)],stdout=log,stderr=subprocess.STDOUT,timeout=180)
row['observation_returncode']=run.returncode;(p/'observer-boundary-build.json').write_text(json.dumps(row,indent=2)+'\n');assert run.returncode==0
observations={}
for label in ['baseline','inline-boundary']:
 lines=(p/('observer-'+label+'.log')).read_text().splitlines();observations[label]=dict(results=[x for x in lines if x.startswith('RESULT|')],allocations=[x for x in lines if x.startswith('| ')])
assert len(observations['baseline']['results'])==194
comparison={k:observations['baseline'][k]==observations['inline-boundary'][k] for k in ['results','allocations']};assert all(comparison.values())
(p/'boundary-observer-comparison.json').write_text(json.dumps(dict(cases=194,comparison=comparison),indent=2)+'\n');print('boundary observations match',flush=True)
