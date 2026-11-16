from pathlib import Path
import json,sys
from artifact_sizes import native
s=Path(__file__).parent;lock=sys.argv[1];rows=[]
for mode in ['allocation','trace','stack']:
 a=native(json.loads((s/f'baseline-{lock}-{mode}-build.json').read_text())['binary']);b=native(json.loads((s/f'candidate-{lock}-{mode}-build.json').read_text())['binary'])
 delta={k:b[k]-a[k] for k in ['file','text','named_text']}
 row={'mode':mode,'baseline':a,'candidate':b,'delta':delta,'screen':all(delta[k]<=cap and delta[k]<=a[k]*.01 for k,cap in [('file',4096),('text',2048),('named_text',2048)])}
 rows.append(row);print(mode,delta,'initial_caps',row['screen'])
(s/f'{lock}-artifact-screen.json').write_text(json.dumps(rows,indent=2)+'\n')
