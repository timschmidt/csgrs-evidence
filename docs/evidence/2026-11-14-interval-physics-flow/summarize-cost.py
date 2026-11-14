from pathlib import Path
import json,re
s=Path(__file__).parent;rows={}
for run in json.loads((s/'timing-runs.json').read_text()):
 name=run['variant']
 if not name.startswith('physics-'):continue
 text=(s/f"timing-{run['index']}-{name}.log").read_text()
 for case,value,unit,checksum in re.findall(r'^(\w+):.*\(([\d.]+)(ns|µs|ms)/iter\), checksum=(\S+)',text,re.M):
  assert checksum=='0';rows.setdefault(case,{}).setdefault(name,[]).append(float(value)*{'ns':1,'µs':1000,'ms':1000000}[unit])
assert len(rows)==16
for case,v in rows.items():
 assert all(len(v[n])==2 for n in ['physics-base','physics-default','physics-enabled']);v['default_adverse_minmax']=min(v['physics-default'])>max(v['physics-base']);v['enabled_adverse_minmax']=min(v['physics-enabled'])>max(v['physics-base'])
(s/'physics-control-timings.json').write_text(json.dumps(rows,indent=2)+'\n');print([(k,v) for k,v in rows.items() if v['default_adverse_minmax'] or v['enabled_adverse_minmax']])
