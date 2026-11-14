from pathlib import Path
import subprocess,json,hashlib,re
s=Path(__file__).parent;r=Path('/mnt/development');baseline=json.loads((s/'BASELINE.json').read_text());integration=json.loads((s/'INTEGRATION.json').read_text());repos={}
for name in baseline:
 def git(*args):return subprocess.check_output(['git',*args],cwd=r/name)
 row=dict(head=git('rev-parse','HEAD').decode().strip(),status=git('status','--porcelain=v1').decode(),staged_sha256=hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),unstaged_sha256=hashlib.sha256(git('diff','--binary')).hexdigest())
 if name=='csgrs':assert row['head']==integration['source_commit'] and row['status']==baseline[name]['status'] and row['staged_sha256']==integration['pending_after_sha256'] and row['unstaged_sha256']==baseline[name]['unstaged_sha256']
 else:assert row==baseline[name],(name,row)
 repos[name]=row
(s/'FINAL-REPOSITORIES.json').write_text(json.dumps(repos,indent=2)+'\n')
validation=json.loads((s/'main-validation.json').read_text());assert len(validation)==5 and all(x['returncode']==0 for x in validation)
counts={}
for name in ['owner-tests','main-owner-tests','downstream-physics','main-physics-tests']:
 text=(s/f'{name}.log').read_text();values=list(map(int,re.findall(r'test result: ok\. (\d+) passed',text)));counts[name]=dict(tests=sum(values),groups=len(values))
summary=dict(source=integration['source_commit'],counts=counts,new_timing_ns=json.loads((s/'new-timings.json').read_text()),initial_control_screen=json.loads((s/'control-timings.json').read_text()),followup_control_screen=json.loads((s/'same-path-control-timings.json').read_text()),disposition='retained optional automatic local-quality capability; slower new-method workloads and persistent default Picard timing separation explicitly accepted; no universal speedup/no-regression claim',prior_stages=35,source_commit_integrated=True,main_validation_passed=True,goal_complete=False,pushed=False)
(s/'SUMMARY.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(counts,indent=2))
p=s/'STATUS.md';x=p.read_text().replace('Combined main results are recorded\nin main-validation.json.',f"Combined main passes {counts['main-owner-tests']['tests']} owner tests and {counts['main-physics-tests']['tests']} physical-flow tests, strict owner Clippy, formatting and repository budget; main-validation.json records exact commands.");p.write_text(x)
