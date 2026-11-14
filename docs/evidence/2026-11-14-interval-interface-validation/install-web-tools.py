from pathlib import Path
import subprocess,os,time,json
s=Path(__file__).parent;root=Path('/mnt/development/.interval-refactor-build/interface-web-tools');rows=[]
for name,extra in [('trunk',['--version','0.21.14']),('wasm-tools',[])]:
 cmd=['cargo','+1.95.0','install','--locked',name,*extra,'--root',str(root),'--target-dir',str(root/'build'/name)];start=time.monotonic()
 with (s/f'install-{name}.log').open('w') as out:code=subprocess.run(cmd,env=os.environ|{'CARGO_BUILD_JOBS':'3'},stdout=out,stderr=subprocess.STDOUT).returncode
 rows.append(dict(name=name,command=cmd,seconds=time.monotonic()-start,returncode=code));(s/'web-tool-installation.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,code,flush=True)
 if code:raise SystemExit(code)
