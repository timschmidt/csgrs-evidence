from pathlib import Path
import subprocess,os,json,hashlib,shutil,time
p=Path(__file__).parent;root=Path('/mnt/development/csgrs-program-composition');probe=p/'probe';rows=json.loads((p/'final-source.json').read_text());tracked=[r for r in rows if subprocess.run(['git','cat-file','-e','HEAD:'+r['path']],cwd=root,capture_output=True).returncode==0];env=os.environ|{'CARGO_BUILD_JOBS':'4','CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/composition-observer'};records=[]
try:
 for label in ['baseline','candidate']:
  for r in tracked:(root/r['path']).write_bytes(subprocess.check_output(['git','show','HEAD:'+r['path']],cwd=root) if label=='baseline' else (p/'final-source'/r['path']).read_bytes())
  cmd=['cargo','+1.95.0','build','--release','--offline','--manifest-path',str(probe/'Cargo.toml')]+(['--locked','--features','composition'] if label=='candidate' else [])
  start=time.monotonic()
  with (p/('observer-'+label+'-build.log')).open('w') as log:r=subprocess.run(cmd,env=env,stdout=log,stderr=subprocess.STDOUT)
  assert r.returncode==0,label
  binary=Path(env['CARGO_TARGET_DIR'])/'release/composition-probe';dest=Path('/mnt/development/.interval-refactor-build/program-composition-artifacts')/('observer-'+label);shutil.copy2(binary,dest)
  with (p/('observer-'+label+'.log')).open('w') as log:r=subprocess.run([str(dest)],stdout=log,stderr=subprocess.STDOUT)
  assert r.returncode==0,label
  (p/('observer-'+label+'-Cargo.lock')).write_bytes((probe/'Cargo.lock').read_bytes());records.append(dict(variant=label,command=cmd,returncode=r.returncode,seconds=time.monotonic()-start,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()));(p/'observer-commands.json').write_text(json.dumps(records,indent=2)+'\n');print(label,'pass',flush=True)
finally:
 for r in tracked:(root/r['path']).write_bytes((p/'final-source'/r['path']).read_bytes())
 for r in rows:assert hashlib.sha256((root/r['path']).read_bytes()).hexdigest()==r['sha256']
 print('candidate source restored',flush=True)
a=(p/'observer-baseline.log').read_text().splitlines();b=[l for l in (p/'observer-candidate.log').read_text().splitlines() if l.startswith(('ROW|legacy-','ALLOC|legacy-'))];assert a==b
assert (p/'observer-baseline-Cargo.lock').read_bytes()==(p/'observer-candidate-Cargo.lock').read_bytes()
(p/'observer-comparison.json').write_text(json.dumps(dict(legacy_rows=len(a),exact_match=True,dependency_lock_identical=True),indent=2)+'\n');print('legacy rows and allocations match',flush=True)
