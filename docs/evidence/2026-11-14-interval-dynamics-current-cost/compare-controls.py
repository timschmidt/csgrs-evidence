from pathlib import Path
import json,hashlib
s=Path(__file__).parent;previous=Path('/tmp/interval-refactor/dynamics-replay-inline');rows=[]
baseline=(s/'observer-baseline.log').read_bytes()
assert len([x for x in baseline.splitlines() if x.startswith(b'RESULT|')])==194
for name in ['baseline','extraction','provider-control']:
 meta=json.loads((s/(name+'-build.json')).read_text());prior=json.loads((previous/(name+'-build.json')).read_text())
 assert meta['returncode']==0
 rows.append(dict(variant=name,bytes=meta['bytes'],sha256=meta['sha256'],previous_sha256=prior['sha256'],artifact_identical=meta['sha256']==prior['sha256']))
 obs=json.loads((s/('observer-'+name+'-build.json')).read_text());assert obs['observation_returncode']==0
 assert (s/('observer-'+name+'.log')).read_bytes()==baseline
 assert obs['external_versions']==json.loads((s/'observer-baseline-build.json').read_text())['external_versions']
(s/'observer-comparison.json').write_text(json.dumps(dict(cases=194,full_results_and_allocations_identical=True,log_sha256=hashlib.sha256(baseline).hexdigest(),external_dependency_versions_identical=True),indent=2)+'\n')
(s/'artifact-provenance.json').write_text(json.dumps(rows,indent=2)+'\n')
print(rows)
