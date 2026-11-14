from pathlib import Path
import subprocess,os,json,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-curve-interval-ranges');rows=[]
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/curve-interval-ranges','CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
base=['cargo','+1.95.0'];commands=[
('owner',base+['test','--locked','-p','hypercurve','--features','interval-ranges','--lib']),
('consumer-test',base+['test','--locked','-p','hypercurve','--features','interval-ranges','--test','interval_ranges_example']),
('consumer',base+['run','--locked','-p','hypercurve','--features','interval-ranges','--example','interval_ranges']),
('clippy',base+['clippy','--locked','-p','hypercurve','--features','interval-ranges','--all-targets','--','-D','warnings']),
('docs',base+['doc','--locked','-p','hypercurve','--features','interval-ranges','--no-deps']),
('doctests',base+['test','--locked','-p','hypercurve','--features','interval-ranges','--doc']),
('disabled',base+['check','--locked','-p','hypercurve','--no-default-features','--lib']),
('format',base+['fmt','--all','--','--check']),
('benchmark-build',base+['bench','--locked','-p','hypercurve','--features','interval-ranges','--bench','interval_ranges','--no-run']),
]
for name,cmd in commands:
 print(name,flush=True);start=time.monotonic()
 with (s/f'{name}.log').open('wb') as out:p=subprocess.run(cmd,cwd=r,env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {}),stdout=out,stderr=subprocess.STDOUT)
 (s/f'{name}.exit').write_text(str(p.returncode)+'\n');rows.append(dict(name=name,command=cmd,returncode=p.returncode,seconds=time.monotonic()-start));(s/'validation.json').write_text(json.dumps(rows,indent=2)+'\n')
 if p.returncode:raise SystemExit(p.returncode)
print('complete',flush=True)
