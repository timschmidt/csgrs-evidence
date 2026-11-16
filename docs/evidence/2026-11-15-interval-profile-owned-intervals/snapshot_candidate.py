from pathlib import Path
import subprocess,json,hashlib,shutil
s=Path(__file__).parent;rows=[]
for name in ['csgrs','alumina-interface']:
 r=Path('/mnt/development/interval-profile-static')/name
 def git(*args):return subprocess.check_output(['git',*args],cwd=r)
 tracked=git('diff','--name-only').decode().splitlines();new=git('ls-files','--others','--exclude-standard').decode().splitlines()
 assert tracked and not git('diff','--cached')
 patch=git('diff','--binary')
 for rel in new:
  p=subprocess.run(['git','diff','--no-index','--binary','--','/dev/null',rel],cwd=r,stdout=subprocess.PIPE);assert p.returncode==1;patch+=p.stdout
 (s/(name+'-candidate.patch')).write_bytes(patch)
 for rel in tracked+new:
  dest=s/'final-source'/name/rel;dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(r/rel,dest)
  rows.append({'repo':name,'path':rel,'new':rel in new,'sha256':hashlib.sha256((r/rel).read_bytes()).hexdigest()})
(s/'candidate-paths.json').write_text(json.dumps(rows,indent=2)+'\n')
print('saved',len(rows),'changed source files')
