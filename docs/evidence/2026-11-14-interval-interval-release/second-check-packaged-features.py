from pathlib import Path
import subprocess,os,json,shutil,tomllib,re
s=Path(__file__).parent;base=Path('/mnt/development/.interval-refactor-build/interval-release-readme-final');r=base/'all-features-consumer';shutil.copytree(base/'consumer',r,dirs_exist_ok=True);rows=[];env=os.environ|{'CARGO_NET_OFFLINE':'true','CARGO_TARGET_DIR':str(base/'all-features-target'),'CARGO_BUILD_JOBS':'2'};selection=['-p','hyperinterval','-p','hyperlattice-interval','-p','hyperdynamics']
manifest=(r/'Cargo.toml').read_text();expected={}
for name in ['hyperinterval','hyperlattice-interval','hyperdynamics']:
 package,=(base/'packages').glob(name+'-[0-9]*');features=sorted(tomllib.loads((package/'Cargo.toml').read_text())['features']);expected[name]=features
 pattern=r'^'+re.escape(name)+r'=.*$';manifest=re.sub(pattern,name+'={version="=0.1.0",features='+json.dumps(features)+'}',manifest,flags=re.M)
(r/'Cargo.toml').write_text(manifest);(s/'packaged-features-manifest.toml').write_text(manifest);(s/'packaged-features-expected.json').write_text(json.dumps(expected,indent=2)+'\n')
commands=[('prepare',['cargo','+1.95.0','check','--message-format=json','--lib',*selection]),('clippy',['cargo','+1.95.0','clippy','--locked','--lib',*selection,'--','-D','warnings']),('docs',['cargo','+1.95.0','doc','--locked','--no-deps',*selection]),('tree',['cargo','+1.95.0','tree','--locked','--edges','features',*selection])]
for name,cmd in commands:
 with (s/f'packaged-features-{name}.log').open('w') as out:p=subprocess.run(cmd,cwd=r,env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {}),stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,returncode=p.returncode));(s/'packaged-feature-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,p.returncode,flush=True)
 if p.returncode:break
(s/'packaged-features-Cargo.lock').write_bytes((r/'Cargo.lock').read_bytes())

if all(x['returncode']==0 for x in rows):
 built={}
 for line in (s/'packaged-features-prepare.log').read_text().splitlines():
  try:value=json.loads(line)
  except json.JSONDecodeError:continue
  if value.get('reason')=='compiler-artifact':
   name=value.get('target',{}).get('name','').replace('_','-')
   if name in expected:built[name]=value['features']
 assert set(built)==set(expected),(built,expected)
 assert all(set(expected[n])<=set(built[n]) for n in expected),(built,expected)
 (s/'packaged-features-built.json').write_text(json.dumps(built,indent=2)+'\n')
