from pathlib import Path
import subprocess,json,re
p=Path(__file__).parent;r=Path('/mnt/development/csgrs-dynamics-adapters')
def build(name):subprocess.run(['python3',str(p/'build.py'),name],check=True)
assert subprocess.check_output(['git','status','--porcelain'],cwd=r)==b''
build('baseline')
subprocess.run(['git','apply','--index',str(p/'pending-main.patch')],cwd=r,check=True)
build('candidate')
changed=[]
name='crates/hyperpath/src/routing/dynamics.rs';f=r/name;s=f.read_text();old=s
for signature in ['    fn from(', '    fn exact_length(', '    fn dynamics_class(', '    fn classify_join(']:
 s=s.replace(signature,'    #[inline]\n'+signature)
assert s.count('#[inline]')==5
f.write_text(s);changed.append(dict(path=name,attributes=5))
for name in ['crates/hyperpath/src/routing/'+x+'.rs' for x in ['feed','jerk_schedule','lookahead','axis_projection']]+['crates/hyperpath/src/routing.rs']:
 f=r/name;s=f.read_text();s,count=re.subn(r'(#\[deprecated\([\s\S]*?\)\]\n)(pub fn )',r'\1#[inline]\n\2',s);assert count>0
 f.write_text(s);changed.append(dict(path=name,attributes=count))
(p/'adapter-edits.json').write_text(json.dumps(changed,indent=2)+'\n')
(p/'adapter.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=r))
for row in changed:
 f=r/row['path'];out=p/'adapter-source'/row['path'];out.parent.mkdir(parents=True,exist_ok=True);out.write_bytes(f.read_bytes())
build('inline-adapters')
