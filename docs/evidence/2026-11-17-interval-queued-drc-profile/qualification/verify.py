from pathlib import Path
from collections import Counter
import hashlib,json,re,subprocess
s=Path(__file__).parent; source=json.loads((s/'source.json').read_text());r=Path(source['source_worktree'])
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==source['source_revision']
assert not subprocess.check_output(['git','status','--porcelain=v1'],cwd=r)
assert sha(source['binary'])==source['binary_sha256']
for fixture in json.loads((s/'fixtures.json').read_text())['fixtures']:
 p=r/fixture['path'];assert p.stat().st_size==fixture['bytes'] and sha(p)==fixture['sha256']
 assert p.read_bytes()==subprocess.check_output(['git','show',source['source_revision']+':'+fixture['path']],cwd=r)
queue=Path('/tmp/interval-refactor/coordinated-ci/quiet-workflow-executed-plan.json')
assert sha(queue)=='1674343e351f5abe53f9c7bfdc9a5414f514ae15f38f3b328b1652ef6fb981b4'
f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939'
samples=json.loads((s/'drc-stack-samples.json').read_text());result=json.loads((s/'drc-stack-profile-result.json').read_text());log=(s/'drc-stack-profile.log').read_text()
assert len(samples)==result['samples']==66 and result['completed'] and result['debugger_exit_code']==0
assert 'exit-code="0145"' in result['inferior_exit_record']
assert 'test result: FAILED. 0 passed; 1 failed; 0 ignored;' in log
cpu=re.search(r'complex project KiCad smoke suite took ([0-9.]+)s of worker time',log).group(1)
assert float(cpu)>120
patterns=['try_from_native_contours_with_policy','regions_to_profile','regularized_region_raw','events::','curve_intersection::','regularized_fragment','boundary_side_ray','gcd','to_f64_enclosure','min_copper_neck']
counts={k:sum(any(k in f for f in row['functions']) for row in samples) for k in patterns}
top=Counter(f for row in samples for f in set(row['functions'])).most_common(25)
record=dict(samples=len(samples),worker_cpu_seconds=cpu,inferior_exit_code=int('0145',8),inclusive_overlapping_sample_counts=counts,top_inclusive_functions=top,source_image_fixtures_queue_unchanged=True,parent_held=True,acceptance_timing=False,admitted=False)
(s/'verification.json').write_text(json.dumps(record,indent=2)+'\n'); print(json.dumps({k:v for k,v in record.items() if k!='top_inclusive_functions'},indent=2))
