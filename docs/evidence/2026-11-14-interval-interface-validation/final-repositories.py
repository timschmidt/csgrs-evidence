from pathlib import Path
import subprocess,json,hashlib
s=Path(__file__).parent;base=json.loads((s/'BASELINE.json').read_text());source=json.loads((s/'SOURCE.json').read_text())['source_commit'];rows={}
assert len(json.loads((s/'main-validation.json').read_text()))==6
assert all(x['returncode']==0 for x in json.loads((s/'main-validation.json').read_text()))
for repo,expected in base.items():
 root=Path('/mnt/development')/repo
 def git(*args):return subprocess.check_output(['git',*args],cwd=root)
 row=dict(head=git('rev-parse','HEAD').decode().strip(),status=git('status','--porcelain').decode(),staged_sha256=hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),unstaged_sha256=hashlib.sha256(git('diff','--binary')).hexdigest())
 want=expected|({'head':source} if repo=='alumina-interface' else {});assert row==want,(repo,row,want);rows[repo]=row
(s/'FINAL-REPOSITORIES.json').write_text(json.dumps(rows,indent=2)+'\n');print('Source revision and all pending/sibling states verified')
