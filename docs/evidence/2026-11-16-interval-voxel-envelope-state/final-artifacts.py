from pathlib import Path
import subprocess,sys,json,os,time,shutil,hashlib
from artifact_sizes import native,wasm
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root']);label=sys.argv[1];assert not (s/f'final-{label}.json').exists()
head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip();assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
target=Path('/mnt/development/.interval-refactor-build/voxel-envelope-state-final');art=Path('/mnt/development/.interval-refactor-build/voxel-envelope-state-final-artifacts');art.mkdir(exist_ok=True)
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'};rows=[]
for kind in ['benchmark','native','wasm']:
 if kind=='benchmark':cmd=['cargo','+1.95.0','build','--locked','--manifest-path','crates/hypervoxel/Cargo.toml','-p','hypervoxel','--features','interval-enclosure,dispatch-trace','--release','--bench','grid_frame','--message-format=json']
 else:
  cmd=['cargo','+1.95.0','build','--locked','--release','--manifest-path',str(s/'consumer/Cargo.toml')]
  cmd+=['--bin','voxel-envelope-consumer'] if kind=='native' else ['--lib','--target','wasm32-unknown-unknown']
 name=f'final-{label}-{kind}';start=time.time()
 with (s/(name+'-build.log')).open('w') as log:code=subprocess.run(cmd,cwd=r,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1800).returncode
 row={'label':label,'source':head,'kind':kind,'command':cmd,'exit_code':code,'elapsed':time.time()-start};rows.append(row);(s/f'final-{label}.json').write_text(json.dumps(rows,indent=2)+'\n');assert code==0,row
 if kind=='benchmark':
  arts=[]
  for line in (s/(name+'-build.log')).read_text().splitlines():
   try:x=json.loads(line)
   except json.JSONDecodeError:continue
   if x.get('reason')=='compiler-artifact' and x.get('executable') and x['target']['name']=='grid_frame':arts.append(x)
  assert len(arts)==1;source=Path(arts[0]['executable']);lock=r/'crates/hypervoxel/Cargo.lock'
 else:source=target/('release/voxel-envelope-consumer' if kind=='native' else 'wasm32-unknown-unknown/release/voxel_envelope_consumer.wasm');lock=s/'consumer/Cargo.lock'
 dest=art/(label+'-'+kind+('.wasm' if kind=='wasm' else ''));shutil.copyfile(source,dest);dest.chmod(0o755)
 size=wasm(dest) if kind=='wasm' else native(dest)
 if kind=='wasm':size['executable_code']=size['code']
 else:
  total=0
  for line in subprocess.check_output(['readelf','-SW',str(dest)],text=True).splitlines():
   parts=line.split()
   if 'PROGBITS' in parts:
    i=parts.index('PROGBITS')
    if 'X' in parts[i+5]:total+=int(parts[i+3],16)
  size['executable_code']=total
 expected=15 if label in ['validated','inplace'] else 0
 run=[str(dest),'--test'] if kind=='benchmark' else [str(dest)] if kind=='native' else ['node',str(s/'invoke.cjs'),str(dest),str(expected)]
 done=subprocess.run(run,cwd=r,env=env,capture_output=True,text=True,timeout=180);(s/(name+'-run.log')).write_text(done.stdout+done.stderr);row.update(size=size,lock_sha256=hashlib.sha256(lock.read_bytes()).hexdigest(),runtime_command=run,runtime_exit_code=done.returncode,expected_invalid_mask=None if kind=='benchmark' else expected);(s/f'final-{label}.json').write_text(json.dumps(rows,indent=2)+'\n');assert done.returncode==0,row
 if kind=='native':assert done.stdout.strip()==f'invalid_mask={expected}',done.stdout
 print(label,kind,size['file'],size['executable_code'],flush=True)
