from pathlib import Path
import subprocess,csv,io,statistics,json
stage=Path('/tmp/interval-refactor/servo-migration'); build=Path('/mnt/development/.interval-refactor-build')
rows={}
for pair in range(24):
 for name in (['baseline','candidate'] if pair%2==0 else ['candidate','baseline']):
  data=subprocess.check_output(['taskset','-c','0',str(build/f'servo-probe-{name}-195'/'release/cost')],text=True)
  (stage/f'cost-195-{pair}-{name}.csv').write_text(data)
  rows[pair,name]=list(csv.DictReader(io.StringIO(data)))
summary={}
for action in ['0','1','2']:
 ratios=[]
 for pair in range(24):
  a=[r for r in rows[pair,'baseline'] if r['action']==action]; b=[r for r in rows[pair,'candidate'] if r['action']==action]
  assert [(r['completed'],r['checksum'],r['allocation_calls'],r['allocated_bytes']) for r in a]==[(r['completed'],r['checksum'],r['allocation_calls'],r['allocated_bytes']) for r in b]
  ratios.append(statistics.median(int(r['elapsed_ns']) for r in b)/statistics.median(int(r['elapsed_ns']) for r in a))
 summary[action]={'paired_ratios':ratios,'median_ratio':statistics.median(ratios)}
(stage/'cost-195-summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary,indent=2))
