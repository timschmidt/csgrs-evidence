from pathlib import Path
import subprocess,json,hashlib,shutil
s=Path(__file__).parent;rows=[]
commands=[['rustc','+1.95.0','-Vv'],['rustc','+stable','-Vv'],['cargo','+1.95.0','-V'],['cargo','+stable','-V'],['cargo','hack','--version'],['/mnt/development/.interval-refactor-build/dynamics-ci-tools/bin/zizmor','--version'],['/mnt/development/.interval-refactor-build/dynamics-ci-tools/bin/python','-c','import yaml;print(yaml.__version__)'],['uname','-a']]
for cmd in commands:
 p=subprocess.run(cmd,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True);assert p.returncode==0;rows.append(dict(command=cmd,output=p.stdout,returncode=p.returncode))
(s/'environment.json').write_text(json.dumps(rows,indent=2)+'\n')
