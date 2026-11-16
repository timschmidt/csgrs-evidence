from pathlib import Path
import os,subprocess,sys,json,time,shutil,hashlib
s=Path(__file__).parent;p=s/'probe';variant=sys.argv[1];lock=sys.argv[2]
a=Path('/mnt/development/.interval-refactor-build/dyadic-quotient-current-artifacts');a.mkdir(exist_ok=True)
t=Path('/mnt/development/.interval-refactor-build/dyadic-quotient-current-probe')
env=os.environ.copy();env.update(CARGO_BUILD_JOBS='6',CARGO_NET_OFFLINE='true',CARGO_TARGET_DIR=str(t))
for mode in ['allocation','trace','stack']:
 label=f'{variant}-{lock}-{mode}';record=s/(label+'-build.json');assert not record.exists()
 cmd=['cargo','+1.95.0','build','--release','--manifest-path',str(p/'Cargo.toml')]
 if mode!='stack':cmd+=['--features',mode]
 if (s/(lock+'-Cargo.lock')).exists():cmd+=['--locked']
 start=time.time()
 with (s/(label+'-build.log')).open('w') as f:
  try:code=subprocess.run(cmd,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=1800).returncode
  except subprocess.TimeoutExpired:code=124
 data={'cmd':cmd,'env':{k:env[k] for k in ['CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','CARGO_TARGET_DIR']},'start':start,'elapsed':time.time()-start,'exit_code':code}
 if not code:
  binary=a/label;shutil.copyfile(t/'release/dyadic-quotient-current-probe',binary);binary.chmod(0o755)
  data.update(binary=str(binary),sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),bytes=binary.stat().st_size)
  for command,suffix in [(['size','-A',str(binary)],'sections'),(['nm','-S','--size-sort','-C',str(binary)],'symbols')]:
   with (s/(label+'-'+suffix+'.txt')).open('w') as f:subprocess.run(command,stdout=f,check=True)
  if not (s/(lock+'-Cargo.lock')).exists():shutil.copyfile(p/'Cargo.lock',s/(lock+'-Cargo.lock'))
 record.write_text(json.dumps(data,indent=2)+'\n');print(label,code,flush=True)
 if code:sys.exit(code)
