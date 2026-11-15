from pathlib import Path
import json,os,subprocess,time,hashlib
s=Path(__file__).parent;b=Path('/mnt/development/.interval-refactor-build/release-curve-consumer');old=b/'negative';c=b/'focused-control';(c/'src').mkdir(parents=True,exist_ok=False)
(c/'src/main.rs').write_bytes((old/'src/main.rs').read_bytes())
manifest=(old/'Cargo.toml').read_text().replace('hypersolve="=0.4.0"','hypersolve={version="=0.4.0",features=["interval-program"]}')
(c/'Cargo.lock').write_bytes((old/'Cargo.lock').read_bytes())
rows=[]
for name,enabled in [('focused-negative',False),('focused-positive',True)]:
 text=manifest.replace('hypercurve="=0.4.0"','hypercurve={version="=0.4.0",features=["interval-ranges"]}') if enabled else manifest
 (c/'Cargo.toml').write_text(text);(s/(name+'-Cargo.toml')).write_text(text)
 cmd=['cargo','+1.95.0','check','--offline'];start=time.monotonic()
 p=subprocess.run(cmd,cwd=c,env=os.environ|{'CARGO_TARGET_DIR':str(b/'negative-target'),'CARGO_BUILD_JOBS':'2'},stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
 (s/(name+'.log')).write_bytes(p.stdout)
 if enabled:assert p.returncode==0,p.stdout
 else:assert p.returncode!=0 and p.stdout.count(b'error[E0432]')==1 and b'unresolved import `hypercurve::interval_ranges`' in p.stdout,p.stdout
 rows.append({'name':name,'command':cmd,'returncode':p.returncode,'seconds':time.monotonic()-start,'expected':True,'scope':'external workspace-source consumer; explicitly enable solver features already unified by the release consumers hyperdynamics/field; isolate only the Hypercurve feature difference'})
(s/'focused-controls.json').write_text(json.dumps(rows,indent=2)+'\n')
print('isolated missing-feature rejection and enabled-feature build both verified')
