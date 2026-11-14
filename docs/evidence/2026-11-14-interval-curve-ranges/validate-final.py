from pathlib import Path
import subprocess,os,json,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-curve-interval-ranges');rows=[]
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/curve-interval-ranges','CARGO_BUILD_JOBS':'2','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
source=json.loads((s/'SOURCE.json').read_text());assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r).decode().strip()==source['commit'];assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
base=['cargo','+1.95.0'];commands=[
('final-consumer-test',base+['test','--locked','-p','hypercurve','--features','interval-ranges','--test','interval_ranges_example']),
('final-consumer',base+['run','--locked','-p','hypercurve','--features','interval-ranges','--example','interval_ranges']),
('final-clippy',base+['clippy','--locked','-p','hypercurve','--all-features','--all-targets','--','-D','warnings']),
('final-docs',base+['doc','--locked','-p','hypercurve','--all-features','--no-deps']),
('final-disabled',base+['check','--locked','-p','hypercurve','--no-default-features','--lib']),
('final-format',base+['fmt','--all','--','--check']),
('final-owner-release',base+['test','--release','--locked','-p','hypercurve','--all-features','--no-fail-fast','--','--test-threads=2']),
('final-downstream',base+['test','--release','--locked','-p','hyperbrep','--features','hypercurve/interval-ranges,hypercurve/dispatch-trace','--test','work_budget','--','--test-threads=2']),
('final-wasm',base+['check','--locked','-p','hypercurve','--features','interval-ranges','--target','wasm32-unknown-unknown','--lib']),
('final-stable',['cargo','+stable','check','--locked','-p','hypercurve','--all-features','--all-targets']),
('final-benchmark-build',base+['bench','--locked','-p','hypercurve','--features','interval-ranges','--bench','interval_ranges','--no-run']),
]
for name,cmd in commands:
 assert not (s/f'{name}.log').exists(),name
 print(name,flush=True);start=time.monotonic()
 with (s/f'{name}.log').open('wb') as out:p=subprocess.run(cmd,cwd=r,env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='final-docs' else {}),stdout=out,stderr=subprocess.STDOUT)
 (s/f'{name}.exit').write_text(str(p.returncode)+'\n');rows.append(dict(name=name,command=cmd,source_commit=source['commit'],returncode=p.returncode,seconds=time.monotonic()-start));(s/'final-validation.json').write_text(json.dumps(rows,indent=2)+'\n')
 if p.returncode:raise SystemExit(p.returncode)
print('complete',flush=True)
