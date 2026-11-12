import subprocess,json,os
from pathlib import Path
root=Path('/tmp/interval-refactor/logarithm')
prior=json.loads((root/'checks.json').read_text()); rows=[]
for i,row in enumerate(prior):
 if row['exit_code']==0: continue
 name=f'recheck-{i}.log'
 with (root/name).open('w') as out:r=subprocess.run(row['command'],stdout=out,stderr=subprocess.STDOUT,env=os.environ|{'RUSTDOCFLAGS':'-D warnings'})
 rows.append(dict(command=row['command'],exit_code=r.returncode,log=name));print(rows[-1],flush=True)
 (root/'rechecks.json').write_text(json.dumps(rows,indent=2)+'\n')
assert all(r['exit_code']==0 for r in rows)
