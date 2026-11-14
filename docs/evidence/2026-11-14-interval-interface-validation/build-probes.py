from pathlib import Path
import subprocess,json,hashlib,os,time,shutil
s=Path(__file__).parent;root=Path('/mnt/development/.interval-refactor-build');art=root/'interface-validation-artifacts';art.mkdir(exist_ok=True);rows=[]
for variant in ['base','candidate']:
 target=root/('interface-validation-probe-'+variant);cmd=['cargo','+1.95.0','build','--release','--manifest-path',str(s/('probe-'+variant)/'Cargo.toml'),'--target-dir',str(target)];start=time.monotonic()
 with (s/f'build-{variant}.log').open('w') as out:code=subprocess.run(cmd,env=os.environ|{'CARGO_BUILD_JOBS':'3'},stdout=out,stderr=subprocess.STDOUT).returncode
 assert code==0;exe=target/'release/network-event-probe';dest=art/variant;shutil.copy2(exe,dest);rows.append(dict(variant=variant,command=cmd,seconds=time.monotonic()-start,returncode=code,path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()));(s/'cost-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(variant,code,flush=True)
