from pathlib import Path
import subprocess,os,time,json
s=Path('/tmp/interval-refactor/sdf-enclosure');cmd=['cargo','+nightly','test','--locked','-p','hypersdf','--all-features','--test','enclosure_program','--target','x86_64-unknown-linux-gnu','--','--test-threads=1']
extra={'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/sdf-enclosure-asan','CARGO_BUILD_JOBS':'4','RUSTFLAGS':'-Zsanitizer=address','ASAN_OPTIONS':'detect_leaks=1'};start=time.monotonic()
with (s/'asan.log').open('w') as out:r=subprocess.run(cmd,cwd='/mnt/development/csgrs-sdf-enclosure',env=dict(os.environ,**extra),stdout=out,stderr=subprocess.STDOUT)
(s/'asan-command.json').write_text(json.dumps(dict(command=cmd,env=extra,returncode=r.returncode,seconds=time.monotonic()-start,std_instrumented=False),indent=2)+'\n');print(r.returncode,flush=True);raise SystemExit(r.returncode)
