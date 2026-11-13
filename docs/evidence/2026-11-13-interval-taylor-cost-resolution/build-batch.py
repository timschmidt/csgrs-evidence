from pathlib import Path
import subprocess,json,time,shutil,hashlib,re
p=Path(__file__).parent;old=Path('/tmp/interval-refactor/taylor');root=Path('/mnt/development/csgrs-taylor');q=p/'batch-cost';(q/'src').mkdir(parents=True,exist_ok=True)
for name in ['Cargo.toml','Cargo.lock']:(q/name).write_bytes((old/'old-native-cost'/name).read_bytes())
s=(old/'old-native-cost/src/main.rs').read_text();old_loop='for _ in 0..8 {drop(black_box(f()));}samples.push(t.elapsed().as_nanos() as f64/8.0);';assert s.count(old_loop)==1;s=s.replace(old_loop,'for _ in 0..64 {drop(black_box(f()));}samples.push(t.elapsed().as_nanos() as f64/64.0);');(q/'src/main.rs').write_text(s)
state=json.loads((p/'SOURCE_FINAL.json').read_text());paths=[v['path'] for v in state['paths']];head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip();assert not subprocess.check_output(['git','status','--porcelain'],cwd=root)
rows=[];bins=Path('/tmp/interval-refactor/taylor-resolution-binaries');target=Path('/tmp/interval-refactor/taylor-batch-target')
def build(label):
 cmd=['cargo','+1.95.0','build','--release','--locked','--manifest-path',str(q/'Cargo.toml'),'--target-dir',str(target)];start=time.monotonic()
 with (p/('batch-'+label+'-build.log')).open('w') as f:r=subprocess.run(cmd,cwd=root,stdout=f,stderr=subprocess.STDOUT)
 assert r.returncode==0;dest=bins/('batch-'+label);shutil.copy2(target/'release/dyadic-evolution-cost-probe',dest);data=dest.read_bytes();headers=subprocess.check_output(['readelf','-SW',str(dest)],text=True);m=re.search(r'\]\s+\.text\s+\S+\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)',headers);code=data[int(m[2],16):int(m[2],16)+int(m[3],16)]
 rows.append(dict(label=label,command=cmd,returncode=r.returncode,seconds=time.monotonic()-start,path=str(dest),bytes=len(data),sha256=hashlib.sha256(data).hexdigest(),text_bytes=len(code),text_sha256=hashlib.sha256(code).hexdigest()));(p/'batch-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(label,len(data),flush=True)
try:
 subprocess.run(['git','restore','--source','e72c0d8b06f91e9bf915d6ae6ac975c94a96b72e','--worktree','--',*paths],cwd=root,check=True)
 build('baseline')
finally:
 subprocess.run(['git','restore','--worktree','--',*paths],cwd=root,check=True)
 assert not subprocess.check_output(['git','status','--porcelain'],cwd=root)
 for row in state['paths']:assert hashlib.sha256((root/row['path']).read_bytes()).hexdigest()==row['sha256']
build('final');assert rows[0]['text_sha256']==rows[1]['text_sha256'];assert rows[1]['bytes']<=rows[0]['bytes'];assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip()==head
