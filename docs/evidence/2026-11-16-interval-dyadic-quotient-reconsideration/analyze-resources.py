from pathlib import Path
from fractions import Fraction
import json,re,sys
s=Path(__file__).parent;lock=sys.argv[1];cases=json.loads((s/'cases.json').read_text());samples={};checks=[]
def integer(x):return x[0]*sum(v<<(32*k) for k,v in enumerate(x[1]))
def finite(x):
 if x is None:return None
 a,b,e=x;assert abs(e)<10000
 scale=Fraction(2)**e;return integer(a)*scale,integer(b)*scale
def directed(x,p=-64):
 v=x/Fraction(2)**p;lo=v.numerator//v.denominator;hi=-((-v.numerator)//v.denominator);return lo*Fraction(2)**p,hi*Fraction(2)**p
rationals={'positive':(Fraction(1,8),Fraction(3,8),Fraction(12),Fraction(28)),'negative':(Fraction(-7,4),Fraction(-3,4),Fraction(-18),Fraction(-10)),'mixed':(Fraction(-24),Fraction(56),Fraction(-9,4),Fraction(-5,4)),'exact':(Fraction(8),Fraction(16),Fraction(2),Fraction(4)),'zero':(Fraction(0),Fraction(0),Fraction(3),Fraction(7)),'retry':(Fraction(2),Fraction(3),Fraction(3),Fraction(7)),'wide':(Fraction((1<<1024)+3,1<<512),Fraction((1<<1024)+17,1<<512),Fraction((1<<1024)+5,1<<512),Fraction((1<<1024)+19,1<<512))}
for label in ['baseline','candidate']:
 runs=json.loads((s/f'resource-runs-{label}-{lock}.json').read_text());assert len(runs)==len(cases)*3*3*2 and all(r['exit_code']==0 for r in runs)
 for r in runs:
  outputs=[];metrics=[]
  for line in (s/r['log']).read_text().splitlines():
   if line.startswith('output '):
    _,remaining,raw=line.split(' ',2);int(remaining);case=r['case'];outputs.append(line)
    if case in ['contains_zero','size','work']:
     assert raw=='error:'+{'contains_zero':'ContainsZero','size':'SizeExhausted','work':'WorkExhausted'}[case]
     continue
    assert not raw.startswith('error:'),(case,raw);out=json.loads(raw)
    if case in rationals:
     a,b,c,d=rationals[case];corners=[a/c,a/d,b/c,b/d];p=-256 if case=='wide' else -64;expected=(directed(min(corners),p)[0],directed(max(corners),p)[1]);assert finite(out['Finite'])==expected
    elif case=='rational':assert finite(out['Finite'])==directed(Fraction(-7,13))
    elif case=='midpoint':assert [integer(t) for t in out['Finite'][:2]]==[2,3] and out['Finite'][2]==-(1<<31)
    elif case=='radius':assert [integer(t) for t in out['Finite'][:2]]==[5,6] and out['Finite'][2]==-(1<<31)
    elif case=='empty':assert out=={'Finite':None}
    elif case=='sqrt':
     bounds,coverage=out['Range'];lo,hi=finite(bounds);grid=Fraction(2)**-256;assert coverage==0 and lo*lo<=2<(lo+grid)**2 and (hi-grid)**2<3<=hi*hi
   elif line.startswith('allocation '):
    row=[{k:int(v) for k,v in re.findall(r'(\w+): (\d+)',part)} for part in re.findall(r'AllocationStats \{([^}]+)\}',line)];assert len(row)==3;metrics.append(row)
   elif line.startswith('stack '):metrics.append(int(line.split()[-1]))
   elif line.startswith('trace '):metrics.append(line[line.index('TraceSnapshot'):])
  expected=4 if r['mode']=='stack' else 8;assert len(outputs)==len(metrics)==expected
  samples[(label,r['mode'],r['repeat'],r['warm'],r['case'])]=(outputs,metrics)
summary=[];adverse=[];matched={'output':0,'trace':0,'allocation':0,'stack':0}
for mode in ['allocation','trace','stack']:
 for case in cases:
  row={'mode':mode,'case':case,'baseline':[],'candidate':[],'deltas':[]}
  for repeat in range(3):
   for warm in [0,16]:
    a,aa=samples[('baseline',mode,repeat,warm,case)];b,bb=samples[('candidate',mode,repeat,warm,case)];assert a==b,(mode,case,'output');matched['output']+=len(a)
    for k,(x,y) in enumerate(zip(aa,bb)):
     matched[mode]+=1
     if mode=='trace':assert x==y,(case,repeat,warm,k,'trace')
     elif mode=='allocation':
      assert x[0]['live_bytes']==y[0]['live_bytes']==x[2]['live_bytes']==y[2]['live_bytes']==0
      for metric in ['allocation_count','reallocation_count','allocated_bytes','reallocated_bytes','live_bytes','peak_live_bytes']:
       delta=y[1][metric]-x[1][metric]
       if delta>0:adverse.append({'case':case,'mode':mode,'repeat':repeat,'warm':warm,'iteration':k,'metric':metric,'delta':delta})
      row['baseline'].append(x[1]);row['candidate'].append(y[1])
     else:
      row['baseline'].append(x);row['candidate'].append(y);row['deltas'].append(y-x)
      if y>x:adverse.append({'case':case,'mode':mode,'repeat':repeat,'warm':warm,'pattern_index':k,'delta':y-x})
  if mode=='trace':row['identical']=True
  elif mode=='stack':
   row={k:v for k,v in row.items() if k not in ['baseline','candidate','deltas']}|{'baseline':sorted(set(row['baseline'])),'candidate':sorted(set(row['candidate'])),'deltas':sorted(set(row['deltas']))}
  else:
   row={k:v for k,v in row.items() if k not in ['baseline','candidate','deltas']}|{label:sorted({json.dumps(x,sort_keys=True) for x in row[label]}) for label in ['baseline','candidate']}
  summary.append(row)
result={'lock':lock,'processes':len(cases)*3*3*2*2,'matched':matched,'adverse_count':len(adverse),'adverse':adverse,'summary':summary,'scope':'Independent tight-grid checks on direct division/rational conversion/root/min-exponent cases; identical full serialization/work and full trace elsewhere. Equality alone is not an independent oracle for elementary functions. No timing or universal bound claim.'}
(s/f'{lock}-resource-comparison.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k not in ['adverse','summary']}))
for row in summary:
 if row['mode']=='stack':print(json.dumps(row))
