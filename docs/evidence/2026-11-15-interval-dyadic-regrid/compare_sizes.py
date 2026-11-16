from pathlib import Path
import subprocess, hashlib, json
s=Path(__file__).parent;a=Path('/mnt/development/.interval-refactor-build/regrid-identity-artifacts');rows=[]
for baseline in sorted(a.glob('baseline-*')):
 candidate=a/baseline.name.replace('baseline-','candidate-',1)
 if not candidate.exists():continue
 name=baseline.name[len('baseline-'):];row={'name':name}
 for side,p in [('baseline',baseline),('candidate',candidate)]:
  sections=subprocess.check_output(['size','-A',str(p)],text=True)
  (s/(side+'-sections-'+name+'.txt')).write_text(sections)
  sections={f[0]:int(f[1]) for line in sections.splitlines() if len(f:=line.split())==3 and f[0].startswith('.')}
  raw=subprocess.check_output(['nm','-S','--defined-only','-C',str(p)],text=True)
  code=[f for line in raw.splitlines() if len(f:=line.split(maxsplit=3))==4 and f[2] in ('t','T')]
  (s/(side+'-owner-symbols-'+name+'.txt')).write_text('\n'.join(' '.join(f) for f in code if 'hyperinterval::' in f[3])+'\n')
  row[side]={'path':str(p),'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'sections':sections,'code_symbol_bytes':sum(int(f[1],16) for f in code),'owner_symbol_bytes':sum(int(f[1],16) for f in code if 'hyperinterval::' in f[3])}
 b,c=row['baseline'],row['candidate'];row['delta']={key:c[key]-b[key] for key in ['bytes','code_symbol_bytes','owner_symbol_bytes']};row['delta']['text']=c['sections']['.text']-b['sections']['.text'];rows.append(row)
(s/'complete-size-comparison.json').write_text(json.dumps(rows,indent=2)+'\n')
for r in rows:print(r['name'],r['delta'])
