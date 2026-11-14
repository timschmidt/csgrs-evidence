from pathlib import Path
import subprocess,json,hashlib,re
s=Path(__file__).parent;r=Path('/mnt/development/csgrs')
rows=[]
for name,cmd in [('shell-syntax',['/mnt/development/.interval-refactor-build/dynamics-ci-tools/bin/python',str(s/'check-shell.py')]),('zizmor',['/mnt/development/.interval-refactor-build/dynamics-ci-tools/bin/zizmor','--pedantic','--strict-collection','.']),('format',['cargo','+1.95.0','fmt','--all','--','--check']),('budget',['bash','scripts/check-repository-budget.sh']),('diff',['git','diff','--check'])]:
 p=subprocess.run(cmd,cwd=r,stdout=subprocess.PIPE,stderr=subprocess.STDOUT);(s/f'main-{name}.log').write_bytes(p.stdout);rows.append(dict(name=name,command=cmd,returncode=p.returncode));assert p.returncode==0,(name,p.stdout)
(s/'main-validation.json').write_text(json.dumps(rows,indent=2)+'\n')
source=json.loads((s/'SOURCE.json').read_text())
for path in source['paths']:
 actual=(r/path).read_bytes();qualified=subprocess.check_output(['git','show',source['commit']+':'+path],cwd=r)
 assert actual==qualified,path
source['status']='qualified locally on Rust 1.95 and stable; integrated preserving exact pending extraction patch'
(s/'SOURCE.json').write_text(json.dumps(source,indent=2)+'\n')
baseline=json.loads((s/'BASELINE.json').read_text());repos={}
for name in baseline:
 root=Path('/mnt/development')/name
 def git(*args):return subprocess.check_output(['git',*args],cwd=root)
 row=dict(head=git('rev-parse','HEAD').decode().strip(),status=git('status','--porcelain=v1').decode(),staged_sha256=hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),unstaged_sha256=hashlib.sha256(git('diff','--binary')).hexdigest())
 if name!='csgrs':assert row==baseline[name],name
 else:
  assert row['head']==source['commit'] and row['status']==baseline[name]['status']
  assert row['staged_sha256']==json.loads((s/'INTEGRATION.json').read_text())['pending_after_sha256']
  assert row['unstaged_sha256']==baseline[name]['unstaged_sha256']
 repos[name]=row
(s/'FINAL-REPOSITORIES.json').write_text(json.dumps(repos,indent=2)+'\n')
(s/'REVIEW.json').write_text(json.dumps(dict(changed_paths=source['paths'],qualified_sections_match=True,production_kernel_unchanged=True,existing_acceptance_not_removed=True,sibling_states_preserved=True,pending_extraction_preserved=True,active_validation_processes=0,publication=False),indent=2)+'\n')
(s/'CHECKPOINT.json').write_text(json.dumps(dict(status='integrated and qualified; ready for evidence archive',active_sessions=[],source_commit=source['commit'],goal_complete=False),indent=2)+'\n')
print(json.dumps(rows,indent=2))
