from pathlib import Path
import json
s=Path(__file__).parent
a={x['name']:x for x in json.loads((s/'baseline-binaries.json').read_text())}
b={x['name']:x for x in json.loads((s/'restored-binaries.json').read_text())}
assert a.keys()==b.keys()
rows=[{'name':n,'identical':x['sha256']==b[n]['sha256'],'sha256':b[n]['sha256'],'bytes':b[n]['bytes']} for n,x in a.items()]
(s/'restored-binary-comparison.json').write_text(json.dumps(rows,indent=2)+'\n')
assert all(x['identical'] for x in rows),rows
print('all',len(rows),'original release binaries match baseline bytes')
