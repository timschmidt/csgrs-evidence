from pathlib import Path
import subprocess,os,json,time,sys
s=Path(__file__).parent;r=Path('/mnt/development/interval-jacobian-context/csgrs');tc=sys.argv[1];target='/mnt/development/.interval-refactor-build/'+('dyadic-quotient-current' if tc=='1.95.0' else 'dyadic-quotient-current-stable');env=os.environ|{'CARGO_TARGET_DIR':target,'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'}
commands=[('final-lib',['test','--locked','-p','hypersolve','--all-features','--lib','--tests']),('doc-tests',['test','--locked','-p','hypersolve','--all-features','--doc']),('clippy',['clippy','--locked','-p','hypersolve','--all-features','--all-targets','--','-D','warnings'])] if tc=='1.95.0' else [('default-witness',['test','--locked','-p','hypersolve','--lib','jacobian::tests']),('default-jacobian',['test','--locked','-p','hypersolve','--test','smoke','--test','symbolic_power_boundary','jacobian']),('clippy',['clippy','--locked','-p','hypersolve','--all-features','--all-targets','--','-D','warnings'])]
if tc=='1.95.0':commands += [('docs',['doc','--locked','-p','hypersolve','--all-features','--no-deps']),('fmt',['fmt','--all','--','--check'])]
head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip();assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
for name,args in commands:
 label='unit-'+tc+'-'+name;cmd=['cargo','+'+tc,*args];actual=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {});start=time.time()
 with (s/(label+'.log')).open('w') as log:
  try:code=subprocess.run(cmd,cwd=r,env=actual,stdout=log,stderr=subprocess.STDOUT,timeout=1800).returncode
  except subprocess.TimeoutExpired:code=124
 (s/(label+'.json')).write_text(json.dumps({'command':cmd,'head':head,'exit_code':code,'elapsed':time.time()-start,'environment':{k:actual.get(k) for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','RUSTDOCFLAGS']}},indent=2)+'\n');print(label,code,flush=True);assert code==0,(label,code)
