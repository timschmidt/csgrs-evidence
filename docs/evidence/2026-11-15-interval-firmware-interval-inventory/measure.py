from pathlib import Path
import subprocess,os,json,statistics
s=Path(__file__).parent;art=Path('/mnt/development/.interval-refactor-build/firmware-clock-counter/artifacts');cpu=min(os.sched_getaffinity(0));rows=[]
for block in range(8):
 for position,label in enumerate(['baseline','candidate','candidate','baseline']):
  command=['setarch','x86_64','-R','taskset','-c',str(cpu),str(art/('clock-'+label)),'time']
  out=subprocess.check_output(command,text=True);(s/f'timing-{block}-{position}-{label}.log').write_text(out)
  times=[line.split() for line in out.splitlines() if line.startswith('TIME ')]
  assert len(times)==30 and [int(x[1]) for x in times]==list(range(30)) and all(int(x[2])==6144 and int(x[3])>0 for x in times)
  samples=[int(x[3])/int(x[2]) for x in times];rows.append({'block':block,'position':position,'label':label,'command':command,'samples_ns':samples,'median_ns':statistics.median(samples)})
summary={label:statistics.median(v for row in rows if row['label']==label for v in row['samples_ns']) for label in ['baseline','candidate']}
summary['relative_change']=summary['candidate']/summary['baseline']-1
(s/'timing.json').write_text(json.dumps({'cpu':cpu,'aslr':'disabled','ordering':'eight ABBA blocks','rows':rows,'summary':summary},indent=2)+'\n');print(json.dumps(summary))
