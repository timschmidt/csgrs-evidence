from pathlib import Path
import subprocess,time,json,signal,hashlib
p=Path(__file__).resolve().parent;out=p/'callgrind-controls';out.mkdir(exist_ok=False)
(out/'purpose.txt').write_text('The isolated timing rerun contains two small adverse whole-workflow intervals (forward approximate line and forward strict zero parallel). Compare deterministic whole-process instruction work on these controls and the nonzero parallel target; do not interpret Valgrind wall-clock time as native latency. Includes input construction, all 20 completed strokes, witness/rebuild/audit continuation and teardown. Timing-field serialization is included and can cause small count variation. Three alternating pairs; all exact artifacts must match the native corpus.\n')
(out/'version.txt').write_text(subprocess.check_output(['valgrind','--version'],text=True))
with (out/'journal.jsonl').open('x',buffering=1) as journal:
 for repeat in range(3):
  for kind,policy in [(0,'approximate'),(2,'strict'),(3,'strict')]:
   for variant in (['baseline','candidate'] if repeat%2==0 else ['candidate','baseline']):
    tag=f'{repeat}-{kind}-{policy}-{variant}';exact=out/(tag+'-rows.json');profile=out/(tag+'.callgrind');cmd=['valgrind','--tool=callgrind','--cache-sim=no','--branch-sim=no','--callgrind-out-file='+str(profile),str(p/(variant+'-probe')),str(kind),'forward',policy,str(exact)];start=time.time();journal.write(json.dumps({'event':'start','tag':tag,'command':cmd,'epoch':start})+'\n')
    with (out/(tag+'.jsonl')).open('x') as log,(out/(tag+'.stderr')).open('x') as err:
     proc=subprocess.Popen(cmd,stdout=log,stderr=err,start_new_session=True)
     try:code=proc.wait(timeout=600)
     except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();code='timeout'
    row={'event':'finish','tag':tag,'code':code,'seconds':time.time()-start}
    if code==0:
     assert exact.read_bytes()==(p/'paired/rows'/f'00-{kind}-forward-{policy}-{variant}.json').read_bytes()
     row['ir']=int(next(line.split(':',1)[1].strip() for line in profile.read_text().splitlines() if line.startswith('summary:')))
    journal.write(json.dumps(row)+'\n');print(tag,code,row.get('ir'),flush=True)
    if code!=0:raise SystemExit(1)
