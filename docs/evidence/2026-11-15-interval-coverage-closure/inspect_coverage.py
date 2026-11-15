from pathlib import Path
import json,sys,subprocess
s=Path(__file__).parent;label=sys.argv[1];out=s/label
commands=json.loads((out/'commands.json').read_text());export=next(c for c in commands if len(c)>1 and c[1]=='export');cmd=export[:2]+['-format=lcov']+export[2:]
with (out/'coverage.lcov').open('w') as f:subprocess.run(cmd,stdout=f,check=True)
files={};current=None
for line in (out/'coverage.lcov').read_text().splitlines():
 if line.startswith('SF:'):current=line[3:];files[current]=[]
 if line.startswith('DA:'):
  n,count,*rest=line[3:].split(',')
  if int(count)==0:files[current].append(int(n))
report=json.loads((out/'export.json').read_text());rows=[];excluded=[]
for data in report['data']:
 for f in data['files']:
  p=Path(f['filename']);entry={'file':p.name,'path':str(p),'summary':f['summary'],'uncovered_lines':files.get(str(p),[])}
  if p.name in ['ieee_tests.rs','dyadic_quotient_tests.rs']:excluded.append(entry);continue
  assert '/crates/hyperinterval/src/' in str(p),str(p)
  rows.append(entry)
totals={}
for kind in ['lines','regions','functions','branches']:
 count=sum(r['summary'][kind]['count'] for r in rows);covered=sum(r['summary'][kind]['covered'] for r in rows);totals[kind]={'count':count,'covered':covered,'percent':100*covered/count if count else None}
result={'production':rows,'test_only_excluded':excluded,'production_totals':totals,'scope':'all-feature library and integration tests on Rust1.95 native; missing branch counters do not establish branch coverage'}
(out/'production-summary.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'totals':totals,'uncovered':[{'file':r['file'],'lines':r['uncovered_lines']} for r in rows if r['uncovered_lines']]},indent=2))
