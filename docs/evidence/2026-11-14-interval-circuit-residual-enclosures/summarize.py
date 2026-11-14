from pathlib import Path
import json,subprocess,hashlib,re
s=Path(__file__).parent;root=Path('/mnt/development');baseline=json.loads((s/'BASELINE.json').read_text());source=json.loads((s/'SOURCE.json').read_text());integration=json.loads((s/'INTEGRATION.json').read_text())
validation=json.loads((s/'main-validation.json').read_text());assert len(validation)==4 and all(r['returncode']==0 for r in validation)
counts=list(map(int,re.findall(r'^test result: ok\. (\d+) passed;', (s/'main-core-tests.log').read_text(),re.M)));assert sum(counts)==117
assert '11 passed; 0 failed' in (s/'final-focused-tests.log').read_text()
assert 'Finished `dev` profile' in (s/'all-features-clippy.log').read_text()
assert 'warning:' not in (s/'final-allocation-build.log').read_text()
assert all(r['returncode']==0 for r in json.loads((s/'qualification.json').read_text()))
assert all(r['matched'] for r in json.loads((s/'prior-stages-verification.json').read_text()))
art=json.loads((s/'cost-builds.json').read_text());assert art[0]['sha256']==art[1]['sha256']
runs=json.loads((s/'timing-runs.json').read_text());assert len(runs)==9 and all(r['returncode']==0 for r in runs)
final={}
for name,old in baseline.items():
 def git(*args):return subprocess.check_output(['git',*args],cwd=root/name)
 row=dict(head=git('rev-parse','HEAD').decode().strip(),status=git('status','--porcelain=v1').decode(),staged_sha256=hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),unstaged_sha256=hashlib.sha256(git('diff','--binary')).hexdigest())
 if name=='csgrs':
  assert row['head']==source['commit'];assert row['status']==old['status'];assert row['staged_sha256']==integration['pending_after_sha256'];assert row['unstaged_sha256']==old['unstaged_sha256']
 else:assert row==old,(name,row,old)
 final[name]=row
(s/'FINAL-REPOSITORIES.json').write_text(json.dumps(final,indent=2)+'\n')
summary=dict(source=source['commit'],core_tests_initial=116,core_tests_final_main=117,new_tests=11,main_groups=len(counts),all_features_all_targets_clippy=True,completed_timing_runs=9,default_control_binary_identical=True,enabled_control_binary_growth_bytes=art[2]['bytes']-art[0]['bytes'],prior_frozen_stages_preserved=33,disposition='retained opt-in circuit consumer; full goal remains active')
(s/'SUMMARY.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary,indent=2))
