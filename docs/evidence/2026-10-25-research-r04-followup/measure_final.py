from pathlib import Path
import subprocess,time,json,hashlib
root=Path('/tmp/csgrs-research-2026-10-25')
r12=root/'r12/isolated-verification/remapped';tri=root/'r04-followup/tri-probe/locked';journal=root/'r04-followup/final-measurement-journal.jsonl'
source_roots=[Path('/tmp/csgrs-r12-verification-baseline'),Path('/tmp/csgrs-r12-verification-candidate'),Path('/tmp/csgrs-r04-priority-baseline'),Path('/tmp/csgrs-r04-proof-search')]
def sources():
 return {str(p):hashlib.sha256(subprocess.check_output(['git','diff','--binary'],cwd=p)).hexdigest() for p in source_roots}
before=sources()
with journal.open('x',buffering=1) as log:
 log.write(json.dumps({'event':'sources-before','patches':before})+'\n')
 for tag,cmd in [('r12-pairs',['python3',str(r12/'paired_probe.py'),'paired','30']),('r12-analysis',['python3',str(r12/'analyze_pairs.py')]),('tri-pairs',['python3',str(tri/'paired_probe.py'),'paired','30'])]:
  start=time.time();log.write(json.dumps({'event':'start','tag':tag,'command':cmd,'epoch':start})+'\n');print('START',tag,flush=True)
  result=subprocess.run(cmd,timeout=3600)
  log.write(json.dumps({'event':'finish','tag':tag,'code':result.returncode,'seconds':time.time()-start})+'\n')
  if result.returncode:raise SystemExit(result.returncode)
 after=sources();log.write(json.dumps({'event':'sources-after','patches':after})+'\n');assert before==after
 print('All paired runs complete; frozen source patches unchanged',flush=True)
