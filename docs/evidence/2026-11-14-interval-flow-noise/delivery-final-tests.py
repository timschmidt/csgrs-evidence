from pathlib import Path
import hashlib,json,os,shutil,subprocess,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-flow-noise');b=Path('/mnt/development/.interval-refactor-build/flow-noise-delivery');p=b/'consumer'
source=r/'crates/hyperdynamics/tests/flow_noise_witness.rs';shutil.copy2(source,p/'tests/flow_noise_witness.rs');rows=[]
for label,toolchain in [('msrv','1.95.0'),('stable','stable')]:
 cmd=['cargo','+'+toolchain,'test','--locked','--test','flow_noise_witness'];start=time.monotonic()
 with (s/('delivery-final-'+label+'-tests.log')).open('wb') as f:done=subprocess.run(cmd,cwd=p,env=os.environ|{'CARGO_TARGET_DIR':str(b/label),'CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true'},stdout=f,stderr=subprocess.STDOUT)
 row={'label':label,'command':cmd,'test_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'returncode':done.returncode,'seconds':time.monotonic()-start};rows.append(row);(s/'delivery-final-tests.json').write_text(json.dumps(rows,indent=2)+'\n');assert done.returncode==0;print(label+' final archive tests passed',flush=True)
