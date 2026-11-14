from pathlib import Path
import subprocess,json,time,os,hashlib,tomllib,re
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-circuit-residual-enclosures');rows=json.loads((s/'cost-builds.json').read_text());assert len(rows)==4
art={row['variant']:row for row in rows};runs=[]
for key,row in art.items():assert hashlib.sha256(Path(row['path']).read_bytes()).hexdigest()==row['sha256']
# Dependency-version attribution is independent of allocator observations.
workspace=tomllib.loads((r/'Cargo.lock').read_text());external=tomllib.loads((s/'allocation/Cargo.lock').read_text());known={(p['name'],p['version'],p.get('source')) for p in workspace['package']};missing=[p for p in external['package'] if 'source' in p and (p['name'],p['version'],p.get('source')) not in known];assert not missing
(s/'observer-dependencies.json').write_text(json.dumps(dict(all_external_versions_match=True,external_packages=len(external['package'])),indent=2)+'\n')
for index,variant in enumerate(['baseline','candidate-default','candidate-enabled','new','candidate-enabled','candidate-default','baseline','new','new']):
 cmd=['taskset','-c','0','setarch','x86_64','-R',art[variant]['path']];start=time.monotonic()
 with (s/f'timing-{index}-{variant}.log').open('w') as out:code=subprocess.run(cmd,env=os.environ|{'CIRCUIT_RESIDUAL_ITERATIONS':'10000'},stdout=out,stderr=subprocess.STDOUT).returncode
 row=dict(index=index,variant=variant,command=cmd,returncode=code,seconds=time.monotonic()-start);runs.append(row);(s/'timing-runs.json').write_text(json.dumps(runs,indent=2)+'\n');print(index,variant,code,flush=True);assert code==0
observer='/mnt/development/.interval-refactor-build/circuit-residual-cost/release/circuit-residual-allocation'
with (s/'allocation-results.log').open('w') as out:result=subprocess.run([observer],env=os.environ|{'CIRCUIT_RESIDUAL_ITERATIONS':'32'},stdout=out,stderr=subprocess.STDOUT)
assert result.returncode==0
(s/'observer-artifact.json').write_text(json.dumps(dict(path=observer,bytes=Path(observer).stat().st_size,sha256=hashlib.sha256(Path(observer).read_bytes()).hexdigest(),returncode=result.returncode),indent=2)+'\n')
print('timings and allocation complete',flush=True)
