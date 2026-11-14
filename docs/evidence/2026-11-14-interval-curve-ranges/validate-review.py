from pathlib import Path
import subprocess,os,json,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-curve-interval-ranges');rows=[]
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/curve-interval-ranges','CARGO_BUILD_JOBS':'2','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
base=['cargo','+1.95.0'];commands=[
('review-consumer-test',base+['test','--locked','-p','hypercurve','--features','interval-ranges','--test','interval_ranges_example']),
('review-consumer',base+['run','--locked','-p','hypercurve','--features','interval-ranges','--example','interval_ranges']),
('review-clippy',base+['clippy','--locked','-p','hypercurve','--all-features','--all-targets','--','-D','warnings']),
('review-docs',base+['doc','--locked','-p','hypercurve','--all-features','--no-deps']),
('review-disabled',base+['check','--locked','-p','hypercurve','--no-default-features','--lib']),
('review-format',base+['fmt','--all','--','--check']),
('review-owner-release',base+['test','--release','--locked','-p','hypercurve','--all-features','--no-fail-fast','--','--test-threads=2']),
('review-downstream',base+['test','--release','--locked','-p','hyperbrep','--features','hypercurve/interval-ranges,hypercurve/dispatch-trace','--test','work_budget','--','--test-threads=2']),
('review-wasm',base+['check','--locked','-p','hypercurve','--features','interval-ranges','--target','wasm32-unknown-unknown','--lib']),
('review-stable',['cargo','+stable','check','--locked','-p','hypercurve','--all-features','--all-targets']),
('review-benchmark-build',base+['bench','--locked','-p','hypercurve','--features','interval-ranges','--bench','interval_ranges','--no-run']),
]
for name,cmd in commands:
 assert not (s/f'{name}.log').exists(),name
 print(name,flush=True);start=time.monotonic()
 with (s/f'{name}.log').open('wb') as out:p=subprocess.run(cmd,cwd=r,env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='review-docs' else {}),stdout=out,stderr=subprocess.STDOUT)
 (s/f'{name}.exit').write_text(str(p.returncode)+'\n');rows.append(dict(name=name,command=cmd,returncode=p.returncode,seconds=time.monotonic()-start));(s/'review-validation.json').write_text(json.dumps(rows,indent=2)+'\n')
 if p.returncode:raise SystemExit(p.returncode)
print('complete',flush=True)
