from pathlib import Path
import hashlib,json,os,re,subprocess,sys,tarfile,time,tomllib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-release-curve-consumer')
label,toolchain=sys.argv[1:]
b=Path('/mnt/development/.interval-refactor-build/release-curve-consumer')/label
(b/'tmp').mkdir(parents=True,exist_ok=False)
source=json.loads((s/'SOURCE.json').read_text())
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r).decode().strip()==source['commit']
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
cmd=['bash','scripts/release-check.sh','--toolchain',toolchain]
env=os.environ|{'CARGO_TARGET_DIR':str(b/'target'),'TMPDIR':str(b/'tmp'),'CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true'}
(s/(label+'-environment.json')).write_text(json.dumps({'command':cmd,'cwd':str(r),'environment':{k:env[k] for k in ['CARGO_TARGET_DIR','TMPDIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE']},'source_commit':source['commit'],'rustc':subprocess.check_output(['rustc','+'+toolchain,'-Vv']).decode(),'cargo':subprocess.check_output(['cargo','+'+toolchain,'-Vv']).decode()},indent=2)+'\n')
start=time.monotonic();captured=False;run_logs={}
with (s/(label+'-release.log')).open('wb') as out:
 p=subprocess.Popen(cmd,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT)
 while p.poll() is None:
  for w in (b/'tmp').glob('csgrs-release-check.*'):
   consumer=w/'consumer'
   if (consumer/'Cargo.lock').exists() and not captured:
    for name in ['Cargo.toml','Cargo.lock']:(s/(label+'-consumer-'+name)).write_bytes((consumer/name).read_bytes())
    files={str(x.relative_to(consumer)):hashlib.sha256(x.read_bytes()).hexdigest() for x in sorted((consumer/'src').rglob('*.rs'))}
    example=consumer/'src/bin/curve_interval_ranges.rs'
    packaged=w/'packages/hypercurve-0.4.0/examples/interval_ranges.rs'
    assert example.read_bytes()==packaged.read_bytes()==(r/'crates/hypercurve/examples/interval_ranges.rs').read_bytes()
    (s/(label+'-consumer-sources.json')).write_text(json.dumps(files,indent=2)+'\n')
    captured=True
   for f in (w/'run').glob('*.log'):
    data=f.read_bytes()
    if data!=run_logs.get(f.name):
     (s/(label+'-client-'+f.name)).write_bytes(data);run_logs[f.name]=data
  time.sleep(0.25)
 code=p.wait()
elapsed=time.monotonic()-start
(s/(label+'-release.exit')).write_text(str(code)+'\n')
(s/(label+'-run.json')).write_text(json.dumps({'command':cmd,'returncode':code,'seconds':elapsed,'consumer_captured':captured},indent=2)+'\n')
assert code==0,(label,code)
assert captured
text=(s/(label+'-release.log')).read_text()
names=re.search(r'^crates=\(\n(.*?)\n\)',(r/'scripts/release-check.sh').read_text(),re.M|re.S).group(1).split()
expected=['user_path','curve_interval_ranges','ffi_smoke','cpp_smoke','python_bindings','go_bindings','typescript_bindings']+['quickstart_'+n.replace('-','_') for n in names if n!='csgrs-ffi']
clients=re.findall(r'^(\S+)\s+ok\s*$',text,re.M)
assert sorted(clients)==sorted(expected),clients
assert 'resolution: 21 released crates from packages' in text and text.rstrip().endswith('release check passed')
counts={}
for action in ['Packaging','Verifying','Documenting']:
 found=[n for n in re.findall(r'^\s*'+action+r' (\S+) v',text,re.M) if n in names]
 assert sorted(found)==sorted(names),(action,found)
 counts[action]=len(found)
artifacts=[]
for n in names:
 archive,=(b/'target/release-check/package').glob(n+'-[0-9]*.crate')
 data=archive.read_bytes()
 with tarfile.open(archive) as t:
  members={m.name.split('/',1)[1]:t.extractfile(m).read() for m in t.getmembers() if m.isfile()}
  vcs=json.loads(members['.cargo_vcs_info.json']);assert vcs['git']['sha1']==source['commit'] and not vcs['git'].get('dirty',False)
  if n=='hypercurve':assert members['examples/interval_ranges.rs']==(r/'crates/hypercurve/examples/interval_ranges.rs').read_bytes()
 artifacts.append({'name':n,'sha256':hashlib.sha256(data).hexdigest(),'bytes':len(data),'vcs':vcs})
(s/(label+'-package-artifacts.json')).write_text(json.dumps(artifacts,indent=2)+'\n')
(s/(label+'-qualification.json')).write_text(json.dumps({'source_commit':source['commit'],'counts':counts,'clients':clients,'client_count':len(clients),'seconds':elapsed,'archive_example_matches_source':True,'release_log_sha256':hashlib.sha256(text.encode()).hexdigest(),'production_rust_sources_changed':False,'push_or_publication':False},indent=2)+'\n')
print(label+': 21 verified packages and 27 clients passed',flush=True)
