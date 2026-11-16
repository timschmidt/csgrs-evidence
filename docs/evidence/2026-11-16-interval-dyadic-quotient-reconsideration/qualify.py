from pathlib import Path
import subprocess,os,json,time,sys
s=Path(__file__).parent;r=Path(json.loads((s/'initial-state.json').read_text())['root'])
env=os.environ.copy();env.update(CARGO_BUILD_JOBS='6',CARGO_NET_OFFLINE='true',CARGO_TARGET_DIR=os.environ.get('INTERVAL_QUALIFY_TARGET','/mnt/development/.interval-refactor-build/dyadic-quotient-current'))
commands={
'restored-owner':['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features'],
'restored-clippy':['cargo','+1.95.0','clippy','--locked','-p','hyperinterval','--all-features','--all-targets','--','-D','warnings'],
'restored-fmt':['cargo','+1.95.0','fmt','--all','--','--check'],
'baseline-focused':['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features','--lib','quotient_tests'],
'candidate-focused':['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features','--lib','quotient_tests'],
'candidate-owner':['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features'],
'candidate-clippy':['cargo','+1.95.0','clippy','--locked','-p','hyperinterval','--all-features','--all-targets','--','-D','warnings'],
'candidate-minimal':['cargo','+1.95.0','test','--locked','-p','hyperinterval','--no-default-features','--features','dyadic'],
'candidate-msrv-dyadic':['cargo','+1.88.0','test','--locked','-p','hyperinterval','--no-default-features','--features','dyadic'],
'candidate-msrv-clippy':['cargo','+1.88.0','clippy','--locked','-p','hyperinterval','--no-default-features','--features','dyadic','--all-targets','--','-D','warnings'],
'candidate-stable-clippy':['cargo','+stable','clippy','--locked','-p','hyperinterval','--all-features','--all-targets','--','-D','warnings'],
'candidate-fmt':['cargo','+1.95.0','fmt','--all','--','--check'],
'candidate-lattice':['cargo','+1.95.0','test','--locked','-p','hyperlattice-interval','--all-features'],
'candidate-solver':['cargo','+1.95.0','test','--locked','-p','hypersolve','--all-features'],
'candidate-lattice-clippy':['cargo','+1.95.0','clippy','--locked','-p','hyperlattice-interval','--all-features','--all-targets','--','-D','warnings'],
'candidate-stable-owner':['cargo','+stable','test','--locked','-p','hyperinterval','--all-features'],
'candidate-wasm':['cargo','+1.95.0','clippy','--locked','-p','hyperinterval','--all-features','--lib','--target','wasm32-unknown-unknown','--','-D','warnings'],
}
for label in sys.argv[1:]:
 cmd=commands[label];assert not (s/(label+'.json')).exists();start=time.time()
 with (s/(label+'.log')).open('w') as f:
  try:code=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=1800).returncode
  except subprocess.TimeoutExpired:code=124
 (s/(label+'.json')).write_text(json.dumps({'command':cmd,'cwd':str(r),'head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip(),'start':start,'elapsed':time.time()-start,'exit_code':code},indent=2)+'\n')
 print(label,code,flush=True)
 if code:sys.exit(code)
