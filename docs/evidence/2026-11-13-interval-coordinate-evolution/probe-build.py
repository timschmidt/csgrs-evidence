from pathlib import Path
import os,subprocess,shutil,json,time,hashlib
s=Path(__file__).parent;p=s/'probe';art=Path('/mnt/development/.interval-refactor-build/coordinate-evolution-artifacts');art.mkdir(exist_ok=True)
env=dict(os.environ,CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/coordinate-evolution-probe',CARGO_BUILD_JOBS='4',HYPERREAL_SKIP_BENCHMARK_REPORTS='1')
rows=[]
for label in ['baseline','candidate']:
 root='/mnt/development/csgrs-dynamics-replay-inline/' if label=='baseline' else '/mnt/development/csgrs-coordinate-evolution/'
 manifest=(p/'Cargo.toml').read_text().replace('/mnt/development/csgrs-dynamics-replay-inline/',root).replace('/mnt/development/csgrs-coordinate-evolution/',root);(p/'Cargo.toml').write_text(manifest)
 cmd=['cargo','+1.95.0','build','--locked','--release']+(['--features','candidate'] if label=='candidate' else [])
 start=time.monotonic()
 with (s/(label+'-build.log')).open('w') as out:r=subprocess.run(cmd,cwd=p,env=env,stdout=out,stderr=subprocess.STDOUT)
 assert r.returncode==0,label
 binary=Path(env['CARGO_TARGET_DIR'])/'release/coordinate-evolution-probe';dest=art/label;shutil.copyfile(binary,dest);dest.chmod(0o755)
 row={'label':label,'command':cmd,'seconds':time.monotonic()-start,'bytes':dest.stat().st_size,'sha256':hashlib.sha256(dest.read_bytes()).hexdigest()};rows.append(row)
 for tool,args in [('size',['-A']),('nm',['-S','--size-sort','--defined-only'])]:
  (s/(label+'-'+tool+'.txt')).write_bytes(subprocess.check_output([tool,*args,str(dest)]))
 (s/'probe-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(label,'built',flush=True)
