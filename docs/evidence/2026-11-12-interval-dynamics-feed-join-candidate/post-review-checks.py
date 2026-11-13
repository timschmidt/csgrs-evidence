from pathlib import Path
import subprocess,json,time,hashlib
out=Path('/tmp/interval-refactor/dynamics-feed-join');rows=[]
commands=[['cargo','+1.95.0','test','--locked','-p','hyperdynamics','-p','hyperpath','--all-features'],['cargo','+1.95.0','clippy','--locked','-p','hyperdynamics','-p','hyperpath','--all-features','--all-targets','--','-D','warnings'],['cargo','+1.95.0','doc','--locked','-p','hyperdynamics','-p','hyperpath','--all-features','--no-deps'],['cargo','+1.95.0','bench','--locked','-p','hyperpath','--bench','path_predicates','--','--test'],['cargo','+1.95.0','fmt','--all','--','--check']]
for i,c in enumerate(commands):
 start=time.monotonic()
 with (out/f'post-review-{i}.log').open('w') as f:r=subprocess.run(c,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(command=c,exit=r.returncode,seconds=time.monotonic()-start));(out/'post-review-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(i,r.returncode,flush=True);assert r.returncode==0
p=Path('/mnt/development/csgrs/target/release/deps/path_predicates-f6f4f4070af4a364');expected=json.loads((out/'candidate-owner-binary.json').read_text())
actual=hashlib.sha256(p.read_bytes()).hexdigest();assert actual==expected['sha256'];(out/'post-review-binary.json').write_text(json.dumps(dict(path=str(p),sha256=actual,identical=True),indent=2)+'\n')
