import subprocess,json,csv,statistics,hashlib
from pathlib import Path
root=Path('/tmp/interval-refactor/fixed-integer-div');bins=Path('/tmp/interval-refactor/fixed-integer-div-binaries')
rows=[];commands=[]
for repeat in range(6):
 for tc in (['188','stable'] if repeat%2==0 else ['stable','188']):
  for revision in (['baseline','final'] if repeat%2==0 else ['final','baseline']):
   cmd=[str(bins/f'{revision}-{tc}-cost')]; file=f'paired-{repeat}-{tc}-{revision}.csv'
   with (root/file).open('w') as f:subprocess.run(cmd,stdout=f,check=True)
   commands.append({'command':cmd,'csv':file,'sha256':hashlib.sha256(Path(cmd[0]).read_bytes()).hexdigest()})
   data=list(csv.DictReader((root/file).open()));assert len(data)==200
   for row in data:
    assert int(row['completed_operations'])==512 and int(row['allocation_calls'])==int(row['allocated_bytes'])==0
    rows.append(row|{'compiler':tc,'revision':revision,'repeat':repeat})
actions=list(dict.fromkeys(r['action'] for r in rows))
for action in actions:assert len({r['checksum'] for r in rows if r['action']==action})==1
summary=[]
for tc in ['188','stable']:
 for action in actions:
  def median(revision,implementation):return statistics.median(int(r['elapsed_ns'])/512 for r in rows if r['compiler']==tc and r['action']==action and r['revision']==revision and r['implementation']==implementation)
  bn,bs,fn,fs=[median(*pair) for pair in [('baseline','native'),('baseline','shared'),('final','native'),('final','shared')]]
  summary.append({'compiler':tc,'action':action,'samples_per_revision_provider':120,'baseline_native_ns':bn,'baseline_shared_ns':bs,'final_native_ns':fn,'final_shared_ns':fs,'baseline_shared_over_native':bs/bn,'final_shared_over_native':fs/fn,'final_over_baseline_shared':fs/bs})
(root/'paired-cost-commands.json').write_text(json.dumps(commands,indent=2)+'\n')
(root/'paired-cost-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
probes=[]
for tc in ['188','stable']:
 for seed in [0,1,64,165,2**32-1]:
  outputs=[]
  for revision in ['baseline','final']:
   for provider in ['native','shared']:
    cmd=[str(bins/f'{revision}-{tc}-{provider}-probe'),str(seed)];out=subprocess.check_output(cmd,text=True);outputs.append(out)
    probes.append({'compiler':tc,'revision':revision,'provider':provider,'seed':seed,'output':out})
  assert len(set(outputs))==1
(root/'paired-probes.json').write_text(json.dumps(probes,indent=2)+'\n')
print(json.dumps(summary,indent=2))
