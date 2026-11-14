from pathlib import Path
import subprocess,json,statistics,random,os
s=Path(__file__).parent;art=Path('/mnt/development/.interval-refactor-build/coordinate-evolution-artifacts');cpu=min(os.sched_getaffinity(0));rng=random.Random(20261114);rows=[]
for round in range(8):
 tasks=[(label,mode,n) for n in [16,64] for label,mode in [('baseline','native'),('candidate','native'),('baseline','manual'),('candidate','owned')]];rng.shuffle(tasks)
 for label,mode,n in tasks:
  cmd=['taskset','-c',str(cpu),str(art/label),mode,str(n),'time'];data=subprocess.check_output(cmd);(s/f'paired-{round}-{label}-{mode}-{n}.log').write_bytes(data)
  samples=[int(l.split('|')[-1])/16 for l in data.decode().splitlines()];rows.append(dict(round=round,label=label,mode=mode,segments=n,median_ns=statistics.median(samples)))
 (s/'paired-timings.json').write_text(json.dumps(rows,indent=2)+'\n');print('round',round,'done',flush=True)
for n in [16,64]:
 for label,mode in [('baseline','native'),('candidate','native'),('baseline','manual'),('candidate','owned')]:
  a=[r['median_ns'] for r in rows if (r['label'],r['mode'],r['segments'])==(label,mode,n)];print(n,label,mode,statistics.median(a),min(a),max(a),flush=True)
