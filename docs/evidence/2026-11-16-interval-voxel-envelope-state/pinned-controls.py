from pathlib import Path
import subprocess,sys,os,json,time,shutil,hashlib
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root']);h=s/'pinned-probe';candidate=json.loads((s/'candidate.json').read_text())['head'];art=Path('/mnt/development/.interval-refactor-build/voxel-envelope-state-pinned-artifacts');art.mkdir(exist_ok=True)
target=Path('/mnt/development/.interval-refactor-build/voxel-envelope-state-pinned');env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'}
cases=['empty','first','many','incompatible','surd','computable','inverted','malformed','unknown','late_inverted','late_unknown'];builds=[];runs=[];start=time.time()
assert not (s/'pinned-builds.json').exists();assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
(s/'pinned-active.json').write_text(json.dumps({'pid':os.getpid(),'proc_starttime':Path(f'/proc/{os.getpid()}/stat').read_text().split()[21],'start':start},indent=2)+'\n')
try:
 for label,head in [('original','17522b4eb8e26e1f3538a0c24aa6d5044cda7f8f'),('validated','644732fdf9b6f4995d51635a43743b63b0a034c7'),('inplace',candidate)]:
  subprocess.run(['git','switch','--detach',head],cwd=r,check=True)
  for mode in ['allocation','trace','stack']:
   cmd=['cargo','+1.95.0','build','--locked','--release','--manifest-path',str(h/'Cargo.toml')]
   if mode!='stack':cmd+=['--features',mode]
   name=f'pinned-{label}-{mode}';started=time.time()
   with (s/(name+'-build.log')).open('w') as log:code=subprocess.run(cmd,cwd=r,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
   row={'label':label,'head':head,'mode':mode,'command':cmd,'elapsed':time.time()-started,'exit_code':code};builds.append(row);(s/'pinned-builds.json').write_text(json.dumps(builds,indent=2)+'\n');assert code==0,row
   binary=art/(label+'-'+mode);shutil.copyfile(target/'release/voxel-envelope-resources',binary);binary.chmod(0o755);row.update(binary=str(binary),sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),lock_sha256=hashlib.sha256((h/'Cargo.lock').read_bytes()).hexdigest());(s/'pinned-builds.json').write_text(json.dumps(builds,indent=2)+'\n')
   for repeat in range(3):
    for warm in [0,16]:
     for case in cases:
      command=[str(binary),mode,case,str(warm),'baseline' if label=='original' else 'candidate'];logname=f'{name}-{repeat}-{warm}-{case}.log';started=time.time()
      with (s/logname).open('w') as log:code=subprocess.run(command,stdout=log,stderr=subprocess.STDOUT,timeout=120).returncode
      result={'label':label,'mode':mode,'repeat':repeat,'warm':warm,'case':case,'command':command,'log':logname,'elapsed':time.time()-started,'exit_code':code};runs.append(result);(s/'pinned-runs.json').write_text(json.dumps(runs,indent=2)+'\n');assert code==0,result
   print(name,'66fresh processes pass',flush=True)
finally:
 subprocess.run(['git','switch','--detach',candidate],cwd=r,check=True)
assert len(builds)==9 and len(runs)==594 and len({r['lock_sha256'] for r in builds})==1
(s/'pinned-complete.json').write_text(json.dumps({'builds':9,'processes':594,'elapsed':time.time()-start,'restored_candidate':candidate,'status':subprocess.check_output(['git','status','--porcelain'],cwd=r,text=True)},indent=2)+'\n')
