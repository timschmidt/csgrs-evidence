from pathlib import Path
import subprocess,json,os,hashlib,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-adaptive-order-sharing');target=Path('/mnt/development/.interval-refactor-build/adaptive-order-sharing-shared-cost');target.mkdir();binary,=[p for p in Path('/mnt/development/.interval-refactor-build/adaptive-order-sharing-typed-binaries').glob('adaptive_shared-*') if p.is_file() and os.access(p,os.X_OK)];cpu=min(os.sched_getaffinity(0));cmd=['taskset','-c',str(cpu),str(binary),'--bench','--warm-up-time','1','--measurement-time','2','--sample-size','30','--noplot']
assert subprocess.run(['pgrep','-x','rustc'],stdout=subprocess.DEVNULL).returncode==1
start=time.monotonic()
with (s/'benchmark.log').open('wb') as out:p=subprocess.run(cmd,cwd=r,env=os.environ|{'CARGO_TARGET_DIR':str(target)},stdout=out,stderr=subprocess.STDOUT)
(s/'benchmark.json').write_text(json.dumps(dict(command=cmd,returncode=p.returncode,seconds=time.monotonic()-start,binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),binary_bytes=binary.stat().st_size,cpu=cpu,scope='three complete adaptive histories; all demanded trajectory preparation and proof destruction included; original field/controller common; host clocks/unrelated activity uncontrolled'),indent=2)+'\n');print(p.returncode)

assert p.returncode==0
import shutil
summary={}
for info_file in sorted((target/'criterion').rglob('new/benchmark.json')):
 directory=info_file.parent.parent
 info=json.loads((directory/'new/benchmark.json').read_text());name=info['full_id'];estimates=json.loads((directory/'new/estimates.json').read_text());samples=json.loads((directory/'new/sample.json').read_text());assert len(samples['times'])==30
 summary[name]=dict(mean=estimates['mean'],samples=30)
 dest=s/'criterion'/directory.relative_to(target/'criterion');dest.mkdir(parents=True)
 for file in (directory/'new').glob('*.json'):shutil.copyfile(file,dest/file.name)
assert len(summary)==6,summary
(s/'timing-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
