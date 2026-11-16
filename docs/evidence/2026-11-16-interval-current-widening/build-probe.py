from pathlib import Path
import subprocess,os,json,time,hashlib,shutil,sys
s=Path(__file__).parent;label,version=sys.argv[1:];target=Path('/mnt/development/.interval-refactor-build/current-widening')/('probe-'+version);art=target.parent/'artifacts';art.mkdir(parents=True,exist_ok=True)
cmd=['cargo','+'+version,'build','--offline','--release','--manifest-path',str(s/'probe/Cargo.toml')];start=time.monotonic();env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'}
with (s/f'{label}-{version}-build.log').open('w') as out:p=subprocess.run(cmd,cwd='/mnt/development/csgrs',env=env,stdout=out,stderr=subprocess.STDOUT)
r={'command':cmd,'cwd':'/mnt/development/csgrs','exit_code':p.returncode,'seconds':time.monotonic()-start};assert p.returncode==0,(label,version)
exe=art/f'{label}-foc-{version}';shutil.copy2(target/'release/current-widen-probe',exe);r.update(path=str(exe),bytes=exe.stat().st_size,sha256=hashlib.sha256(exe.read_bytes()).hexdigest())
raw=subprocess.check_output(['size','-A',str(exe)],text=True);(s/f'{label}-{version}-sections.txt').write_text(raw);r['sections']={p[0]:int(p[1]) for line in raw.splitlines() if len(p:=line.split())==3 and p[0].startswith('.')}
with (s/f'{label}-{version}-values.log').open('w') as out:p=subprocess.run([str(exe)],stdout=out,stderr=subprocess.STDOUT)
assert p.returncode==0;(s/f'{label}-{version}-artifact.json').write_text(json.dumps(r,indent=2)+'\n');print(label,version,r['bytes'])
