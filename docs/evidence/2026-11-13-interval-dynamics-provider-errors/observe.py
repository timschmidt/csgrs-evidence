from pathlib import Path
import hashlib,json,os,shutil,subprocess,time,tomllib
stage=Path(__file__).parent;tree=Path('/mnt/development/csgrs-dynamics-return');probe=stage/'owner-probe';artifacts=Path('/mnt/development/.interval-refactor-build/dynamics-provider-errors-artifacts');target=Path('/mnt/development/.interval-refactor-build/dynamics-provider-observer')
original=(stage/'pending-extraction.patch').read_bytes();assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=tree)==original
names=set(subprocess.check_output(['git','diff','--cached','--name-only'],cwd=tree,text=True).splitlines())|{r['path'] for r in json.loads((stage/'candidate-source.json').read_text())};assert len(names)==42
candidate={n:(tree/n).read_bytes() for n in names};baseline={};extraction={}
for name in names:
 for state,ref in [(baseline,'HEAD:'),(extraction,':')]:
  r=subprocess.run(['git','show',ref+name],cwd=tree,capture_output=True);state[name]=r.stdout if r.returncode==0 else None
rows=[];external=None
try:
 for variant,state in [('baseline',baseline),('extraction',extraction),('provider-errors',candidate)]:
  for name,data in state.items():
   p=tree/name
   if data is None:p.unlink(missing_ok=True)
   else:p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(data)
  command=['cargo','+1.95.0','build','--release','--offline','--manifest-path',str(probe/'Cargo.toml'),'--target-dir',str(target)];start=time.monotonic()
  with (stage/('observer-'+variant+'-build.log')).open('w') as log:r=subprocess.run(command,env=dict(os.environ,CARGO_BUILD_JOBS='4'),stdout=log,stderr=subprocess.STDOUT)
  row={'variant':variant,'command':command,'returncode':r.returncode,'seconds':time.monotonic()-start};rows.append(row);(stage/'observer-builds.json').write_text(json.dumps(rows,indent=2)+'\n');assert r.returncode==0
  lock=(probe/'Cargo.lock').read_bytes();(stage/('observer-'+variant+'-Cargo.lock')).write_bytes(lock)
  versions=sorted((x['name'],x['version'],x.get('source'),x.get('checksum')) for x in tomllib.loads(lock.decode())['package'] if x.get('source'))
  if external is None:external=versions
  else:assert external==versions
  source=target/'release/dynamics-owner-probe';dest=artifacts/('observer-'+variant);shutil.copy2(source,dest);row.update(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest())
  with (stage/('observer-'+variant+'.log')).open('w') as log:r=subprocess.run([str(dest)],stdout=log,stderr=subprocess.STDOUT,timeout=180)
  row['observation_returncode']=r.returncode;(stage/'observer-builds.json').write_text(json.dumps(rows,indent=2)+'\n');assert r.returncode==0;print(variant,'observed',flush=True)
finally:
 for name,data in candidate.items():
  p=tree/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(data)
for name,data in candidate.items():assert (tree/name).read_bytes()==data
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=tree)==original
observations={}
for variant in ['baseline','extraction','provider-errors']:
 lines=(stage/('observer-'+variant+'.log')).read_text().splitlines();observations[variant]={'results':[x for x in lines if x.startswith('RESULT|')],'allocations':[x for x in lines if x.startswith('| ')]}
assert len(observations['baseline']['results'])==194
comparison={v:{k:observations['baseline'][k]==observations[v][k] for k in ['results','allocations']} for v in ['extraction','provider-errors']}
(stage/'observer-comparison.json').write_text(json.dumps({'cases':194,'comparison':comparison,'external_dependency_versions':external,'scope':'Full Debug differential results and warmed completed-result/drop allocations; not an independent geometry oracle or canonical wire serialization.'},indent=2)+'\n')
assert all(all(v.values()) for v in comparison.values()),comparison
print('all 194 complete result/allocation rows match',flush=True)
