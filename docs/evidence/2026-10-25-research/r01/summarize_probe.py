from pathlib import Path
from statistics import median
import json
r=Path(__file__).resolve().parent
summary=[]
for mode,n in json.loads((r/'paired-manifest.json').read_text())['cases']:
 data={}
 for version in ['baseline','candidate']:
  rows=[]
  for repeat in range(3):
   rows.extend(line.split('\t') for line in (r/f'{version}-{mode}-{n}-{repeat}.tsv').read_text().splitlines())
  assert len(rows)==15 and all(row[3]=='certified' for row in rows)
  data[version]={temperature:{key:median(int(x[column]) for x in rows if (int(x[2])==0)==(temperature=='cold')) for column,key in [(4,'ns'),(5,'calls'),(6,'requested'),(7,'peak'),(8,'result_live'),(9,'retained_after_drop')]} for temperature in ['cold','warm']}
  data[version]['row_bytes']=int(rows[0][13]);data[version]['checksum']=rows[0][14]
  assert all(row[13:]==rows[0][13:] for row in rows)
 a,b=data['baseline']['warm'],data['candidate']['warm']
 print(mode,n,'ns',int(a['ns']),int(b['ns']),'alloc',int(a['requested']),int(b['requested']),'peak',int(a['peak']),int(b['peak']),'same',data['baseline']['checksum']==data['candidate']['checksum'])
 summary.append({'case':mode,'segments':n,**data})
(r/'paired-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
