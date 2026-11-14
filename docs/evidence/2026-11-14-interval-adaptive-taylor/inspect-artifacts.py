from pathlib import Path
import subprocess,json,hashlib
s=Path(__file__).parent;rows=json.loads((s/'cost-builds.json').read_text());out=[]
for row in rows:
 p=row['path'];sections={}
 for section in ['.text','.rodata','.data.rel.ro']:
  dest=Path('/mnt/development/.interval-refactor-build/adaptive-taylor-artifacts')/(row['name']+section)
  subprocess.run(['objcopy','--dump-section',section+'='+str(dest),p,str(dest)+'.scratch'],check=True)
  data=dest.read_bytes();sections[section]={'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()}
 out.append({'name':row['name'],'sections':sections,'size':subprocess.check_output(['size',p],text=True)})
(s/'artifact-sections.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
