from pathlib import Path
import subprocess,json
s=Path(__file__).parent;rows={}
def uleb(data,start):
 n=shift=0
 while True:
  byte=data[start];start+=1;n|=(byte&127)<<shift
  if byte<128:return n,start
  shift+=7
for label in ['baseline','candidate']:
 artifacts=json.loads((s/(label+'-builds.json')).read_text());sections={}
 for name,path in [('interface',artifacts[0]['path']),('sqrt',json.loads((s/(label+'-sqrt-native-artifact.json')).read_text())['path'])]:
  raw=subprocess.check_output(['size','-A',path],text=True);(s/(label+'-'+name+'-sections.txt')).write_text(raw);sections[name]={p[0]:int(p[1]) for line in raw.splitlines() if len(p:=line.split())==3 and p[0].startswith('.')}
 w=Path(artifacts[1]['path']).read_bytes();pos=8;code=None
 while pos<len(w):
  tag=w[pos];length,pos=uleb(w,pos+1)
  if tag==10:code=length
  pos+=length
 rows[label]={'interface_file':artifacts[0]['bytes'],'interface_text':sections['interface']['.text'],'sqrt_file':json.loads((s/(label+'-sqrt-native-artifact.json')).read_text())['bytes'],'sqrt_text':sections['sqrt']['.text'],'sections':sections,'wasm_file':len(w),'wasm_code_payload':code}
deltas={k:rows['candidate'][k]-rows['baseline'][k] for k in rows['baseline'] if k!='sections'}
result={'measurements':rows,'deltas':deltas,'owner_file_cap_failures':[x for x in json.loads((s/'owner-initial-comparison.json').read_text()) if not x['file_cap_ok']],'scope':'Initial per-target artifact screen only. No complete cumulative size admission after runtime rejection.','new_allowance_accepted':False,'size_accounts_changed':False}
(s/'size-summary.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(deltas))
