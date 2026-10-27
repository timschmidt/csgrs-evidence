from pathlib import Path
import hashlib,json,os,subprocess,time
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-publish-904e')
target='/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-voxel-oracle'
paths=subprocess.check_output(['git','ls-files'],cwd=checkout,text=True).splitlines()
def hashes(): return {n:hashlib.sha256((checkout/n).read_bytes()).hexdigest() for n in paths if (checkout/n).is_file()}
before=hashes();(root/'voxel-write-oracle-final-files.json').write_text(json.dumps(before,indent=2)+'\n')
(root/'voxel-write-oracle-final-candidate.patch').write_bytes(subprocess.check_output(['git','diff'],cwd=checkout))
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.99.1','CARGO_NET_OFFLINE':'true','CARGO_TARGET_DIR':target,'CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'2','CCACHE_DIR':'/tmp/hypercurve-voxel-oracle-ccache'}
commands=[('fmt',['cargo','fmt','--all','--check'],'crates/hypervoxel'),('test',['cargo','test','--locked'],'crates/hypervoxel'),('clippy',['cargo','clippy','--locked','-p','voxelis','--all-targets','--all-features','--','-D','warnings'],'crates/hypervoxel'),('consumer',['cargo','test','--locked','-p','hypervoxel','--all-features'],'crates/hypervoxel'),('typos',['typos'],'.'),('diff',['git','diff','--check'],'.'),('budget',['scripts/check-repository-budget.sh'],'.')]
results=[]
for label,cmd,where in commands:
 print('START',label,flush=True);now=time.time()
 with (root/('voxel-write-oracle-final-'+label+'.log')).open('w') as out:
  r=subprocess.run(['/usr/bin/time','-v',*cmd],cwd=checkout/where,env=env,stdout=out,stderr=subprocess.STDOUT)
 row={'label':label,'command':cmd,'cwd':str(checkout/where),'exit_code':r.returncode,'elapsed_seconds':time.time()-now,'source_stable':before==hashes()};results.append(row)
 (root/'voxel-write-oracle-final-results.json').write_text(json.dumps(results,indent=2)+'\n');print(row,flush=True)
 if r.returncode or not row['source_stable']:raise SystemExit(r.returncode or 1)
