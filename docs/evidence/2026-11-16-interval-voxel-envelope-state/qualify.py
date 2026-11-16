from pathlib import Path
import subprocess,os,sys,json,time
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root']);tc=sys.argv[1];names=sys.argv[2:];env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/voxel-envelope-state-tests'+('' if tc=='1.95.0' else '-'+tc),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'}
owner=['--locked','--manifest-path','crates/hypervoxel/Cargo.toml','-p','hypervoxel','--all-features']
commands={
'owner':['cargo','+'+tc,'test',*owner],
'clippy':['cargo','+'+tc,'clippy',*owner,'--all-targets','--','-D','warnings'],
'downstream':['cargo','+'+tc,'test','--locked','-p','hypersdf','--all-features'],
'downstream-clippy':['cargo','+'+tc,'clippy','--locked','-p','hypersdf','--all-features','--all-targets','--','-D','warnings'],
'docs':['cargo','+'+tc,'doc',*owner,'--no-deps'],
'wasm':['cargo','+'+tc,'clippy','--locked','--manifest-path','crates/hypervoxel/Cargo.toml','-p','hypervoxel','--lib','--no-default-features','--features','interval-enclosure','--target','wasm32-unknown-unknown','--','-D','warnings'],
'fmt':['cargo','+'+tc,'fmt','--manifest-path','crates/hypervoxel/Cargo.toml','--all','--','--check']}
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==json.loads((s/'candidate.json').read_text())['head'];assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
for name in names:
 label=name+'-'+tc;assert not (s/(label+'.json')).exists();cmd=commands[name];start=time.time()
 if name=='docs':env['RUSTDOCFLAGS']='-D warnings'
 else:env.pop('RUSTDOCFLAGS',None)
 with (s/(label+'.log')).open('w') as log:
  try:code=subprocess.run(cmd,cwd=r,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1800).returncode
  except subprocess.TimeoutExpired:code=124
 (s/(label+'.json')).write_text(json.dumps({'command':cmd,'cwd':str(r),'head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip(),'exit_code':code,'elapsed':time.time()-start,'environment':{k:env.get(k) for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','RUSTDOCFLAGS']}},indent=2)+'\n');print(label,code,flush=True)
 if code:sys.exit(code)
