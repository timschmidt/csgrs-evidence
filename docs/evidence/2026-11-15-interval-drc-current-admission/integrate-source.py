from pathlib import Path
import subprocess,json,hashlib,os,tempfile
s=Path('/tmp/interval-refactor/drc-current-admission');w=Path('/mnt/development/interval-profile-static/csgrs');r=Path('/mnt/development/csgrs')
def git(repo,*args,input=None,env=None):return subprocess.check_output(['git','-C',str(repo),*args],input=input,env=env)
initial=json.loads((s/'initial-state.json').read_text());base=initial['csgrs']['head'];paths=json.loads((s/'source-audit.json').read_text())['paths']
for label in ['final-fixture-witnesses','final-formatting','strict-clippy','required-app-tests','required-gerber-smoke','zizmor']:
 assert json.loads((s/(label+'.json')).read_text())['exit_code']==0,label
smoke=json.loads((s/'required-kicad-smoke.json').read_text());assert smoke['exit_code']==101
assert 'complex project KiCad smoke suite took' in (s/'required-kicad-smoke.log').read_text()
assert git(r,'rev-parse','HEAD').decode().strip()==base==git(w,'rev-parse','HEAD').decode().strip()
pending=git(r,'diff','--cached','--binary');assert hashlib.sha256(pending).hexdigest()==initial['csgrs']['staged_sha256'];assert not git(r,'diff','--binary')
assert not git(w,'diff','--cached','--binary');assert git(w,'diff','--name-only').decode().splitlines()==paths
patch=git(w,'diff','--binary');assert patch==(s/'source.patch').read_bytes()
git(w,'add','--',*paths);git(w,'commit','-m','test(hyperdrc): require smoke fixtures in workspace CI and fail extraction errors')
commit=git(w,'rev-parse','HEAD').decode().strip();assert not git(w,'status','--porcelain')
assert git(w,'diff-tree','--no-commit-id','--name-only','-r',commit).decode().splitlines()==paths
with tempfile.TemporaryDirectory() as tmp:
 env=os.environ.copy();env['GIT_INDEX_FILE']=tmp+'/index';git(r,'read-tree',commit,env=env);git(r,'apply','--cached','--binary','-',input=pending,env=env);expected=git(r,'write-tree',env=env)
 git(r,'apply','--check','-',input=patch);git(r,'apply','-',input=patch)
 git(r,'restore','--source='+commit,'--staged','--',*paths);assert git(r,'write-tree')==expected;git(r,'update-ref','HEAD',commit,base)
assert git(r,'diff','--cached','--binary')==pending;assert not git(r,'diff','--binary')
out={'parent':base,'source_commit':commit,'paths':paths,'pending_patch_sha256':hashlib.sha256(pending).hexdigest(),'pending_patch_unchanged':True,'production_source_changed':False,'existing_kicad_cpu_gate_still_fails':True}
(s/'source-integration.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
