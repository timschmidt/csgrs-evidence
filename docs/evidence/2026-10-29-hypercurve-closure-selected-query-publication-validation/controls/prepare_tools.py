from pathlib import Path
import hashlib,json,os,subprocess,time,tomllib,urllib.request
p=Path(__file__).resolve().parent;r=p.parent;u=r.parents[1];w=(p/'normal').resolve();source=json.loads((p/'publication-source.json').read_text())
env=os.environ.copy();env.pop('NO_COLOR',None);env['PATH']=str(u/'target/research-closeout-tools/bin')+':'+str(u/'target/research-closeout-tools/go/bin')+':'+env['PATH']
channels={};requests=[]
for name in ['stable','nightly']:
 url='https://static.rust-lang.org/dist/channel-rust-'+name+'.toml'
 with urllib.request.urlopen(url,timeout=60) as response:payload=response.read()
 (p/('rust-'+name+'-channel.toml')).write_bytes(payload);channels[name]=tomllib.loads(payload.decode())
 requests.append({'url':url,'sha256':hashlib.sha256(payload).hexdigest(),'epoch':time.time()})
stable=channels['stable']['pkg']['rust']['version'].split()[0];nightly='nightly-'+channels['nightly']['date']
assert stable=='1.99.1',('new stable requires explicit matrix review',stable)
installed=subprocess.check_output(['rustup','toolchain','list'],env=env,text=True).splitlines();install=[]
if not any(line.startswith(nightly+'-') for line in installed):
 command=['rustup','toolchain','install',nightly,'--profile','minimal','--component','clippy'];start=time.time()
 with (p/'nightly-install.log').open('w') as log:result=subprocess.run(command,stdout=log,stderr=subprocess.STDOUT,env=env)
 install.append({'command':command,'exit_code':result.returncode,'elapsed_seconds':time.time()-start});assert result.returncode==0
commands=[['rustc','+'+stable,'--version','--verbose'],['rustc','+1.95.0','--version','--verbose'],['rustc','+'+nightly,'--version','--verbose'],['cargo','+'+nightly,'clippy','--version'],['rustup','target','list','--toolchain',stable,'--installed'],['rustup','component','list','--toolchain',stable,'--installed'],['rustup','component','list','--toolchain',nightly,'--installed'],['cargo','hack','--version'],['cargo','fuzz','--version'],['wasm-bindgen','--version'],['trunk','--version'],['typos','--version'],['zizmor','--version'],['node','--version'],['npm','--version'],['go','version']]
rows=[]
for command in commands:
 result=subprocess.run(command,env=env,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
 row={'command':command,'exit_code':result.returncode,'output':result.stdout};rows.append(row)
 (p/'installed-tools.json').write_text(json.dumps({'recorded_epoch':time.time(),'tools':rows,'fresh_execution':True},indent=2)+'\n');assert result.returncode==0,row
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=w,text=True).strip()==source['head']
assert not subprocess.check_output(['git','status','--porcelain'],cwd=w,text=True).strip()
record={'source_revision':source['head'],'source_unchanged':True,'stable':stable,'nightly':nightly,'msrv':'1.95.0','requests':requests,'install':install,'tools':rows,'default_toolchain_unchanged':True,'build_caches':'Reuse existing Cargo build caches with changed source recompiled normally; execute every command freshly. New independent coverage report paths. No prior test outcomes reused.','coverage_output_suffix':'selected-queries','epoch':time.time()}
(p/'cache-preparation.json').write_text(json.dumps(record,indent=2)+'\n');print({'head':source['head'],'stable':stable,'nightly':nightly,'tool_checks':len(rows)})
