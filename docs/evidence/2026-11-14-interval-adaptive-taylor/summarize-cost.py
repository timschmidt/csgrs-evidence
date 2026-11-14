from pathlib import Path
import json,re
s=Path(__file__).parent;rows={};new={}
for run in json.loads((s/'timing-runs.json').read_text()):
 name=run['name'];text=(s/f"timing-{run['index']}-{name}.log").read_text()
 if name=='new':
  for case,value in re.findall(r'^(\w+/\w+): .*ns_per_operation=(\d+)',text,re.M):new.setdefault(case,[]).append(int(value))
 else:
  found=re.findall(r'^constant/(\w+)\s+time:\s+\[([\d.]+) µs ([\d.]+) µs ([\d.]+) µs\]',text,re.M);assert len(found)==4,(name,found)
  for case,lo,mean,hi in found:rows.setdefault(case,{}).setdefault(name,[]).append(dict(lower_us=float(lo),mean_us=float(mean),upper_us=float(hi)))
for case,v in rows.items():
 for name in ['default','enabled']:v[name+'_adverse_separation']=min(x['lower_us'] for x in v[name])>max(x['upper_us'] for x in v['base'])
(s/'control-timings.json').write_text(json.dumps(rows,indent=2)+'\n');(s/'new-timings.json').write_text(json.dumps(new,indent=2)+'\n');print(json.dumps(new,indent=2));print({k:(v['default_adverse_separation'],v['enabled_adverse_separation']) for k,v in rows.items()})
