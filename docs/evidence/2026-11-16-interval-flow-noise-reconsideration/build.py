from pathlib import Path
import subprocess,os,json,hashlib,shutil,time,sys
s=Path(__file__).parent;label=sys.argv[1]
art=Path('/mnt/development/.interval-refactor-build/flow-noise-reconsideration/artifacts');art.mkdir(parents=True,exist_ok=True)
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/profile-typed-fraction/owner','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'}
command=['cargo','+1.95.0','build','--locked','-p','hypersolve','-p','hyperdynamics','-p','hyperlattice-interval','--all-features','--release','--benches','--examples','--message-format=json'];start=time.monotonic()
with (s/(label+'-build.jsonl')).open('w') as out,(s/(label+'-build.log')).open('w') as err:p=subprocess.run(command,env=env,stdout=out,stderr=err)
(s/(label+'-build.json')).write_text(json.dumps({'command':command,'cwd':str(Path.cwd()),'exit_code':p.returncode,'seconds':time.monotonic()-start},indent=2)+'\n');assert p.returncode==0
rows=[]
for line in (s/(label+'-build.jsonl')).read_text().splitlines():
 x=json.loads(line)
 if x.get('reason')!='compiler-artifact' or not x.get('executable'):continue
 name=x['target']['name'];key=hashlib.sha256(x['target']['src_path'].encode()).hexdigest()[:12];dest=art/(label+'-'+name+'-'+key);shutil.copy2(x['executable'],dest)
 sections=subprocess.check_output(['size','-A',str(dest)],text=True);(s/(label+'-sections-'+name+'-'+key+'.txt')).write_text(sections)
 sections={a[0]:int(a[1]) for l in sections.splitlines() if len(a:=l.split())==3 and a[0].startswith('.')}
 rows.append({'name':name,'source':x['target']['src_path'],'executable':x['executable'],'path':str(dest),'bytes':dest.stat().st_size,'sha256':hashlib.sha256(dest.read_bytes()).hexdigest(),'features':x['features'],'sections':sections})
assert len({x['source'] for x in rows})==len(rows)
(s/(label+'-binaries.json')).write_text(json.dumps(rows,indent=2)+'\n');print(label,'saved',len(rows),'binaries')
