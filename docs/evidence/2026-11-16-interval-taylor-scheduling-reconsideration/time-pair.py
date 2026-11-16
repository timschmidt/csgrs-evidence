from pathlib import Path
import subprocess,time,json,statistics,sys
s=Path(__file__).parent;art=Path('/mnt/development/.interval-refactor-build/taylor-scheduling-reconsideration/artifacts')
label=sys.argv[1] if len(sys.argv)>1 else 'paired'
rows=[]
for block in range(4):
 for position,variant in enumerate(['baseline','candidate','candidate','baseline']):
  command=['setarch','x86_64','-R','taskset','-c','0',str(art/(variant+'-timing-probe')),'2000','30']
  start=time.monotonic();p=subprocess.run(command,capture_output=True,text=True)
  name=f'{label}-{block}-{position}-{variant}';(s/(name+'.jsonl')).write_text(p.stdout);(s/(name+'.stderr')).write_text(p.stderr)
  assert p.returncode==0,p.stderr
  data=[json.loads(l) for l in p.stdout.splitlines()];rows.append({'block':block,'position':position,'variant':variant,'command':command,'seconds':time.monotonic()-start,'samples':data})
  print(name,flush=True)
(s/(label+'-timings.json')).write_text(json.dumps(rows,indent=2)+'\n')
summary=[]
for mode in ['construct','complete_strict','complete_approximate']:
 per=[]
 for block in range(4):
  v={variant:statistics.median([r['total_ns']/r['iterations'] for row in rows if row['block']==block and row['variant']==variant for r in row['samples'] if r['mode']==mode]) for variant in ['baseline','candidate']}
  per.append(v|{'percent':100*(v['candidate']/v['baseline']-1)})
 summary.append({'mode':mode,'blocks':per})
(s/(label+'-summary.json')).write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary))
