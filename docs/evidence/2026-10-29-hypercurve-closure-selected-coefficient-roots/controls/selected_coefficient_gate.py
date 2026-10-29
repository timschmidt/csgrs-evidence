from pathlib import Path
import json,os,time
r=Path(__file__).resolve().parents[1];c=r/'controls'
def wait():
 while True:
  results=[]
  for name,kind in [('selected-coefficient-roots-fix4','focus'),('selected-coefficient-roots-preflight-4','lint'),('selected-coefficient-roots-owners-3','owners')]:
   d=c/name
   if (d/'results.json').exists():
    assert all(x['exit_code']==0 and x['source_stable'] for x in json.loads((d/'results.json').read_text())),name
   if (d/'complete.json').exists():
    v=json.loads((d/'complete.json').read_text())
    assert (v['exit_code']==0 and v['source_stable']) if kind=='lint' else v['all_passed'], name
    results.append(v)
  if len(results)==3:
   assert results[0]['source']==results[1]['source']==results[2]['source']
   return results[0]['source']
  time.sleep(10)
