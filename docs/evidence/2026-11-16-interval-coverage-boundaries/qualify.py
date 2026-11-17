from pathlib import Path
import subprocess,json,sys,time,os
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root']);tc=sys.argv[1];env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/interval-coverage-qualification-'+tc,'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'}
base=['--locked','-p','hyperinterval'];features=['--no-default-features','--features','dyadic'] if tc=='1.88.0' else ['--all-features']
commands=[('tests',['cargo','+'+tc,'test',*base,*features,*(['--test','trigonometry','--test','tangent','--test','fractional_power'] if tc=='1.88.0' else [])]),('clippy',['cargo','+'+tc,'clippy',*base,*features,'--all-targets','--','-D','warnings'])]
if tc=='1.95.0':commands+=[('docs',['cargo','+'+tc,'doc',*base,'--all-features','--no-deps']),('fmt',['cargo','+'+tc,'fmt','--all','--','--check'])]
rows=[]
for name,cmd in commands:
 key=(sys.argv[2]+'-' if len(sys.argv)>2 else '')+name+'-'+tc;assert not (s/(key+'.json')).exists();start=time.time();run_env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {})
 with (s/(key+'.log')).open('w') as log:
  try:code=subprocess.run(cmd,cwd=r,env=run_env,stdout=log,stderr=subprocess.STDOUT,timeout=1800).returncode
  except subprocess.TimeoutExpired:code=124
 row={'command':cmd,'cwd':str(r),'exit_code':code,'elapsed':time.time()-start,'environment':{k:run_env.get(k) for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','RUSTDOCFLAGS']}};(s/(key+'.json')).write_text(json.dumps(row,indent=2)+'\n');print(key,code,flush=True)
 if code:sys.exit(code)
