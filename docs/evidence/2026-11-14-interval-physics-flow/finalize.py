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
for name in ['owner-tests','main-owner-tests','downstream-circuit-tests','main-circuit-tests']:
 text=(s/f'{name}.log').read_text();values=list(map(int,re.findall(r'test result: ok\. (\d+) passed',text)));counts[name]=dict(tests=sum(values),groups=len(values))
new={}
for i in [3,7,8]:
 for key,value in re.findall(r'^(\w+): .*ns_per_operation=(\d+)',(s/f'timing-{i}-new.log').read_text(),re.M):new.setdefault(key,[]).append(int(value))
summary=dict(source=integration['source_commit'],counts=counts,timing_ns=new,optional_enabled_slab_regression={'baseline_ns':[2005,2206],'default_ns':[1997,2015],'enabled_ns':[2314,2350],'disposition':'accepted opt-in cost for added continuous certification; no default or enabled blanket no-regression claim'},allocation={'prepare_bytes_per_op':7576,'reuse_bytes_per_op':15004,'combined_bytes_per_op':22580,'prepare_retained':3926,'query_retained':328,'all_after_drop':0},prior_stages=34,source_commit_integrated=True,main_validation_passed=True,goal_complete=False,pushed=False)
(s/'SUMMARY.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary,indent=2))
p=s/'STATUS.md';x=p.read_text().replace('The combined main checkout validation is recorded separately in main-validation.json.',f"The combined main checkout passes {counts['main-owner-tests']['tests']} owner tests and {counts['main-circuit-tests']['tests']} downstream circuit tests, strict owner Clippy, formatting and repository budget; main-validation.json records the commands.");p.write_text(x)
