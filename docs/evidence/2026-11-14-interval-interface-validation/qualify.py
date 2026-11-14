from pathlib import Path
import subprocess,os,time,json
s=Path(__file__).parent;r='/mnt/development/alumina-interface-validation';env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/clock-migration-interface','CARGO_BUILD_JOBS':'3'};rows=[]
commands=[('workspace-tests',['cargo','+1.95.0','test','--workspace','--locked']),('native-clippy',['cargo','+1.95.0','clippy','--workspace','--all-targets','--no-deps','--locked','--','-D','warnings']),('wasm-clippy',['cargo','+1.95.0','clippy','--workspace','--target','wasm32-unknown-unknown','--no-deps','--locked','--','-D','warnings']),('client-docs',['cargo','+1.95.0','doc','--locked','-p','alumina-interface-client','--no-deps']),('format',['cargo','+1.95.0','fmt','--all','--','--check']),('source-policy',['bash','scripts/audit-source-policy.sh'])]
for name,cmd in commands:
 start=time.monotonic()
 with (s/f'{name}.log').open('w') as out:code=subprocess.run(cmd,cwd=r,env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='client-docs' else {}),stdout=out,stderr=subprocess.STDOUT).returncode
 rows.append(dict(name=name,command=cmd,returncode=code,seconds=time.monotonic()-start));(s/'qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,code,flush=True)
