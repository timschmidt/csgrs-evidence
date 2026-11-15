from pathlib import Path
import json,subprocess,sys,time
p=Path(__file__).parent;label=sys.argv[1];output=p/(label+'-processes.json')
assert not output.exists()
r=subprocess.run(['node',str(p/'inspect-cdp.mjs'),'9224','processes','unused',str(output)],stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True,check=True)
rows=[]
for item in json.loads(output.read_text())['processInfo']:
 row=dict(item);root=Path('/proc')/str(item['id'])
 for file,fields in [('status',['VmRSS','VmHWM']),('smaps_rollup',['Rss','Pss','Private_Clean','Private_Dirty','Shared_Clean','Shared_Dirty'])]:
  try:
   data={line.split(':',1)[0]:line.split(':',1)[1].strip() for line in (root/file).read_text().splitlines() if ':' in line}
   row[file]={k:data.get(k) for k in fields}
  except OSError as error:row[file]={'error':str(error)}
 rows.append(row)
(p/(label+'-process-memory.json')).write_text(json.dumps({'unix_seconds':time.time(),'processes':rows},indent=2)+'\n')
print(len(rows))
