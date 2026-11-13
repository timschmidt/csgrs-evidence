from pathlib import Path
import subprocess, os, json, hashlib, shutil, time
from elf_sections import sections
p=Path(__file__).parent
root=Path('/mnt/development/csgrs-jacobian-matrix')
bins=Path('/tmp/interval-refactor/jacobian-matrix-binaries');bins.mkdir(exist_ok=True)
rows=json.loads(p.joinpath('final-source.json').read_text())
tracked=[row for row in rows if subprocess.run(['git','cat-file','-e','HEAD:'+row['path']],cwd=root,capture_output=True).returncode==0]
for row in rows: assert hashlib.sha256((root/row['path']).read_bytes()).hexdigest()==row['sha256']
records={}
env=os.environ.copy();env['CARGO_TARGET_DIR']='/tmp/interval-refactor/jacobian-matrix-target'
try:
 for label in ['baseline','candidate']:
  for row in tracked:
   data=subprocess.check_output(['git','show','HEAD:'+row['path']],cwd=root) if label=='baseline' else (p/'final-source'/row['path']).read_bytes()
   (root/row['path']).write_bytes(data)
  cmd=['cargo','+1.95.0','bench','--locked','-p','hypersolve','--features','expression-program','--bench','expression_program','--no-run','--message-format=json']
  start=time.monotonic()
  with p.joinpath(label+'-existing-benchmark.jsonl').open('w') as out, p.joinpath(label+'-existing-benchmark.log').open('w') as err:
   q=subprocess.run(cmd,cwd=root,env=env,stdout=out,stderr=err)
  assert q.returncode==0,label
  messages=[json.loads(line) for line in p.joinpath(label+'-existing-benchmark.jsonl').read_text().splitlines() if line.startswith('{')]
  artifacts=[m['executable'] for m in messages if m.get('reason')=='compiler-artifact' and m.get('target',{}).get('name')=='expression_program' and m.get('executable')]
  assert len(artifacts)==1,artifacts
  dest=bins/(label+'-expression-program');shutil.copy2(artifacts[0],dest);parts=sections(dest)
  records[label]={'command':cmd,'returncode':q.returncode,'seconds':time.monotonic()-start,'path':str(dest),'bytes':dest.stat().st_size,'sha256':hashlib.sha256(dest.read_bytes()).hexdigest(),'text_bytes':len(parts['.text']),'text_sha256':hashlib.sha256(parts['.text']).hexdigest()}
  p.joinpath('existing-benchmark-builds.json').write_text(json.dumps(records,indent=2)+'\n')
  print(label,records[label]['bytes'],flush=True)
finally:
 for row in tracked:(root/row['path']).write_bytes((p/'final-source'/row['path']).read_bytes())
 for row in rows:assert hashlib.sha256((root/row['path']).read_bytes()).hexdigest()==row['sha256']
 print('candidate restored and verified',flush=True)
print(json.dumps(records,indent=2))
