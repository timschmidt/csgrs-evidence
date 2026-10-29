from pathlib import Path
import json,os,subprocess,time
r=Path(__file__).resolve().parents[1];p=r/'prepush-selected-fields'
launches=json.loads((p/'launches.json').read_text())
def alive(pid):
 try:return (Path('/proc')/str(pid)/'stat').read_text().rsplit(')',1)[1].split()[0]!='Z'
 except FileNotFoundError:return False
while True:
 ready=True
 for mode,expected in [('normal',['quick','lint','workflow','release']),('directed',['workflow'])]:
  path=p/(mode+'-phases.json');rows=json.loads(path.read_text()) if path.exists() else []
  if any(row['exit_code']!=0 for row in rows):raise SystemExit(mode+' validation failed; no closeout')
  if [row['phase'] for row in rows]!=expected:
   ready=False
   launch=launches[mode]
   if not alive(launch['pid']):raise SystemExit(mode+' validation stopped before completion; no closeout')
 if ready:break
 time.sleep(15)
for script,args in [('audit_validation.py',['--require-complete']),('archive_validation_recovered.py',[]),('close_publication_receipt_recovered.py',[]),('persist_publication_receipt_recovered.py',[]),('audit_publication_payload_recovered.py',[])]:
 command=['python3',str(p/script),*args];print('START',command,flush=True);result=subprocess.run(command,cwd=p/'normal');print('FINISH',result.returncode,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
record=json.loads((p/'publication-final-commit.json').read_text());(p/'publication-ready.json').write_text(json.dumps({'code':record['head'],'evidence':record['evidence'],'qualified_groups':record['qualified_groups'],'payload_scoped':True,'push':False,'epoch':time.time()},indent=2)+'\n')
print('QUALIFIED, ARCHIVED AND COMMITTED LOCALLY; ORDINARY PUSH STILL TO EXECUTE',flush=True)
