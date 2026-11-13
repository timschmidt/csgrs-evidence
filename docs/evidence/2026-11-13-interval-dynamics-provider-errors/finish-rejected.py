from pathlib import Path
import subprocess,json,hashlib,os,time
p=Path(__file__).parent;root=Path('/mnt/development/csgrs-dynamics-return')
confirmation=json.loads((p/'confirmation-comparison.json').read_text())
assert any(r['adverse_separated'] for r in confirmation),'No rejection established by this driver'
rows=[]
def run(name,cmd,cwd=None):
    start=time.monotonic()
    with (p/(name+'.log')).open('w') as log:
        r=subprocess.run(cmd,cwd=cwd,stdout=log,stderr=subprocess.STDOUT)
    rows.append(dict(name=name,command=cmd,cwd=str(cwd) if cwd else None,returncode=r.returncode,seconds=time.monotonic()-start))
    (p/'finish-commands.json').write_text(json.dumps(rows,indent=2)+'\n')
    assert r.returncode==0,(name,r.returncode)
    print(name,'pass',flush=True)
run('candidate-format',['cargo','+1.95.0','fmt','--all','--','--check'],root)
run('candidate-replay',['python3','-B',str(p/'capture-replay.py')])
run('restore-candidate',['python3','-B',str(p/'restore-candidate.py')])
run('restored-checks',['python3','-B',str(p/'restore-checks.py')])
run('restored-replay',['python3','-B',str(p/'capture-restored-replay.py')])
records={label:json.loads(path.read_text()) for label,path in [('candidate',p/'fresh-replay.json'),('restored',p/'fresh-replay-restored.json'),('prior',Path('/tmp/interval-refactor/dynamics-return/fresh-replay.json'))]}
hashes={label:{r['mode']:r['sha256'] for r in rows} for label,rows in records.items()}
assert hashes['candidate']==hashes['restored']==hashes['prior']
(p/'replay-comparison.json').write_text(json.dumps(dict(hashes=hashes,matched=True),indent=2)+'\n')
paths=subprocess.check_output(['git','diff','--cached','--name-only'],cwd=root,text=True).splitlines();assert len(paths)==41
assert subprocess.check_output(['git','diff','--binary'],cwd=root)==b''
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=root)==(p/'pending-extraction.patch').read_bytes()
subprocess.run(['git','restore','--source=HEAD','--staged','--worktree','--',*paths],cwd=root,check=True)
assert not subprocess.check_output(['git','status','--porcelain=v1'],cwd=root)
(p/'restored-clean.json').write_text(json.dumps(dict(repo=str(root),head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),status=''),indent=2)+'\n')
run('prior-stages',['python3','-B',str(p/'verify-prior-stages.py')])
final=[]
for before in json.loads((p/'BASELINE.json').read_text()):
    repo=before['repo'];after=dict(repo=repo,head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=repo,text=True).strip(),status=subprocess.check_output(['git','status','--porcelain=v1'],cwd=repo,text=True),staged_sha256=hashlib.sha256(subprocess.check_output(['git','diff','--cached','--binary'],cwd=repo)).hexdigest(),unstaged_sha256=hashlib.sha256(subprocess.check_output(['git','diff','--binary'],cwd=repo)).hexdigest())
    assert after==before,(after,before)
    final.append(after)
(p/'FINAL-REPOSITORIES.json').write_text(json.dumps(final,indent=2)+'\n')
print('candidate rejected; isolated tree clean; original repository states exact; no push',flush=True)
