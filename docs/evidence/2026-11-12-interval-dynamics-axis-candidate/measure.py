from pathlib import Path
import subprocess,csv,json,statistics,hashlib
out=Path('/tmp/interval-refactor/dynamics-axis');data={};metadata=[]
for label in ['baseline','candidate','candidate','baseline']:
 index=sum(x['label']==label for x in metadata)
 exe=Path('/tmp/interval-refactor/dynamics-axis-probe-'+label+'/target/release/axis-probe')
 log=out/f'{label}-sample-{index}.csv'
 with log.open('w') as f:subprocess.run(['taskset','-c','0',str(exe)],stdout=f,check=True)
 metadata.append(dict(label=label,command=['taskset','-c','0',str(exe)],bytes=exe.stat().st_size,sha256=hashlib.sha256(exe.read_bytes()).hexdigest()))
 for row in csv.DictReader(log.open()):
  key=(row['axes'],row['spans'],row['policy']);data.setdefault((label,key),[]).append(row)
summary=[]
for label,key in data:
 if label!='baseline':continue
 a=data[(label,key)];b=data[('candidate',key)]
 for field in ['checksum','allocations','bytes']:
  assert {r[field] for r in a}=={r[field] for r in b},(key,field)
 ta=statistics.median(int(r['elapsed_ns']) for r in a);tb=statistics.median(int(r['elapsed_ns']) for r in b)
 summary.append(dict(axes=int(key[0]),spans=int(key[1]),policy=key[2],baseline_ns=ta/16,candidate_ns=tb/16,ratio=tb/ta,allocations=int(a[0]['allocations']),allocated_bytes=int(a[0]['bytes']),checksum=a[0]['checksum']))
(out/'measure-summary.json').write_text(json.dumps(dict(metadata=metadata,cases=summary),indent=2)+'\n');print('ratios',min(r['ratio'] for r in summary),max(r['ratio'] for r in summary))
