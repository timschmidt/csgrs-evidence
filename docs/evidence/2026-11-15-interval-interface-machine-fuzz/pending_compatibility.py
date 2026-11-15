from pathlib import Path
import subprocess,json,hashlib
stage=Path(__file__).parent;layout=Path('/mnt/development/interval-machine-fuzz')
def git(repo,*args,input=None):return subprocess.check_output(['git','-C',str(repo),*args],input=input)
for name,opts in [('csgrs',['--cached']),('alumina-interface',[])]:
 repo=layout/name;assert not git(repo,'status','--porcelain')
 patch=git(Path('/mnt/development')/name,'diff',*opts,'--binary');(stage/(name+'-pending.patch')).write_bytes(patch)
 git(repo,'apply','--check','-',input=patch);git(repo,'apply','-',input=patch)
print('Applied only retained pending patches in isolated sibling worktrees.')
