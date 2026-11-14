from pathlib import Path
import subprocess,os,json,time,shutil,hashlib
s=Path(__file__).parent;out=Path('/mnt/development/.interval-refactor-build/qr-evolution-artifacts');out.mkdir(exist_ok=True);rows=[]
for name,repo,features,bench in [('base','csgrs-qr-evolution-base','qr-coordinates','qr_coordinates'),('default','csgrs-qr-evolution','qr-coordinates','qr_coordinates'),('enabled','csgrs-qr-evolution','qr-evolution','qr_coordinates'),('new','csgrs-qr-evolution','qr-evolution','qr_evolution')]:
 cmd=['cargo','+1.95.0','bench','--locked','-p','hyperdynamics','--features',features,'--bench',bench,'--no-run','--message-format','json','--target-dir','/mnt/development/.interval-refactor-build/'+('qr-evolution-base' if name=='base' else 'qr-evolution')]
 start=time.monotonic()
 with (s/f'build-{name}.log').open('w') as log:proc=subprocess.run(cmd,cwd='/mnt/development/'+repo,env=os.environ|{'CARGO_BUILD_JOBS':'3','RUSTFLAGS':'--remap-path-prefix=/mnt/development/csgrs-qr-evolution-base=/qualified-source --remap-path-prefix=/mnt/development/csgrs-qr-evolution=/qualified-source'},stdout=log,stderr=subprocess.STDOUT)
 row=dict(name=name,command=cmd,repository=repo,seconds=time.monotonic()-start,returncode=proc.returncode,rustflags='--remap-path-prefix=/mnt/development/csgrs-qr-evolution-base=/qualified-source --remap-path-prefix=/mnt/development/csgrs-qr-evolution=/qualified-source');rows.append(row)
 (s/'cost-builds.json').write_text(json.dumps(rows,indent=2)+'\n');assert proc.returncode==0
 artifacts=[]
 for line in (s/f'build-{name}.log').read_text().splitlines():
  try:value=json.loads(line)
  except json.JSONDecodeError:continue
  if value.get('reason')=='compiler-artifact' and value.get('target',{}).get('name')==bench and value.get('executable'):artifacts.append(value['executable'])
 assert len(artifacts)==1,artifacts
 dest=out/name;shutil.copy2(artifacts[0],dest);row.update(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest());(s/'cost-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,row['bytes'],flush=True)
