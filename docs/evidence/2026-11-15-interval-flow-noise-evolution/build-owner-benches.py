from pathlib import Path
import os,subprocess,json,shutil,time,hashlib,sys
s=Path(__file__).resolve().parent;label=sys.argv[1];env=os.environ.copy();env.update(CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/workspace-qualification',CARGO_BUILD_JOBS='12',CARGO_TERM_COLOR='never')
args=['cargo','+stable','bench','--locked','-p','hyperdynamics','--all-features','--no-run','--message-format=json'];start=time.time()
with (s/(label+'-owner-benches.jsonl')).open('w') as out,(s/(label+'-owner-benches-build.log')).open('w') as log:r=subprocess.run(args,cwd='/mnt/development/csgrs-flow-noise-evolution',env=env,stdout=out,stderr=log)
rows=[]
if r.returncode==0:
 for line in (s/(label+'-owner-benches.jsonl')).read_text().splitlines():
  try:item=json.loads(line)
  except ValueError:continue
  if item.get('reason')=='compiler-artifact' and item.get('executable') and 'bench' in item['target']['kind']:
   name=item['target']['name'];src=Path(item['executable']);dst=Path('/mnt/development/.interval-refactor-build')/('noise-evolution-'+label+'-bench-'+name);shutil.copy2(src,dst);rows.append(dict(name=name,path=str(dst),bytes=dst.stat().st_size,sha256=hashlib.file_digest(dst.open('rb'),'sha256').hexdigest()))
record=dict(command=args,exit_code=r.returncode,elapsed_seconds=time.time()-start,binaries=rows);(s/(label+'-owner-benches.json')).write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True)
