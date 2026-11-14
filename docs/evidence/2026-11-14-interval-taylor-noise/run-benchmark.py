from pathlib import Path
import subprocess,json,os,hashlib,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor-noise');target=Path('/mnt/development/.interval-refactor-build/taylor-noise-cost');binary,=[p for p in (target/'release/deps').glob('taylor_noise-*') if p.is_file() and os.access(p,os.X_OK)];cpu=min(os.sched_getaffinity(0));cmd=['taskset','-c',str(cpu),str(binary),'--bench','--warm-up-time','1','--measurement-time','2','--sample-size','30','--noplot']
assert subprocess.run(['pgrep','-x','rustc'],stdout=subprocess.DEVNULL).returncode==1
start=time.monotonic()
with (s/'benchmark.log').open('wb') as out:p=subprocess.run(cmd,cwd=r,env=os.environ|{'CARGO_TARGET_DIR':str(target)},stdout=out,stderr=subprocess.STDOUT)
(s/'benchmark.json').write_text(json.dumps(dict(command=cmd,returncode=p.returncode,seconds=time.monotonic()-start,binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),binary_bytes=binary.stat().st_size,cpu=cpu,scope='focused same-output query probe; cold means noise preparation, not cold scalar caches; host clocks/unrelated activity uncontrolled'),indent=2)+'\n');print(p.returncode)
