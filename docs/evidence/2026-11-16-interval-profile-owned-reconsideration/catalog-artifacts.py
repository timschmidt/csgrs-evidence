from pathlib import Path
import subprocess,os,time,json,hashlib,shutil
s=Path(__file__).parent;root=Path('/mnt/development/interval-profile-static/csgrs');rel='crates/hyperreal/tests/gmp_api_coverage.rs';path=root/rel
repaired=path.read_bytes();assert repaired==(Path('/mnt/development/csgrs')/rel).read_bytes()
baseline=subprocess.check_output(['git','show','HEAD:'+rel],cwd=root)
assert len(repaired.splitlines())==len(baseline.splitlines())+4
artifact=Path('/mnt/development/.interval-refactor-build/profile-owned-reconsideration/artifacts')
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/profile-typed-fraction/owner','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'};rows=[]
try:
 for label,source in [('baseline',baseline),('repaired',repaired)]:
  path.write_bytes(source)
  cmd=['cargo','+1.95.0','test','--locked','-p','hyperreal','--all-features','--release','--test','gmp_api_coverage','--no-run','--message-format=json']
  start=time.monotonic()
  with (s/(label+'-catalog-build.jsonl')).open('w') as out,(s/(label+'-catalog-build.log')).open('w') as err:p=subprocess.run(cmd,cwd=root,env=env,stdout=out,stderr=err)
  assert p.returncode==0
  artifacts=[json.loads(line) for line in (s/(label+'-catalog-build.jsonl')).read_text().splitlines()]
  matches=[a for a in artifacts if a.get('reason')=='compiler-artifact' and a.get('executable') and a['target']['name']=='gmp_api_coverage'];assert len(matches)==1
  dest=artifact/(label+'-gmp-api-coverage');shutil.copy2(matches[0]['executable'],dest)
  raw=subprocess.check_output(['size','-A',str(dest)],text=True);(s/(label+'-catalog-sections.txt')).write_text(raw)
  sections={x[0]:int(x[1]) for line in raw.splitlines() if len(x:=line.split())==3 and x[0].startswith('.')}
  nm=subprocess.check_output(['nm','-S','--defined-only',str(dest)],text=True);(s/(label+'-catalog-symbols.txt')).write_text(nm)
  spans=set()
  for line in nm.splitlines():
   a=line.split()
   if len(a)>=4 and a[2] in ['t','T']:spans.add((int(a[0],16),int(a[1],16)))
  end=total=0
  for address,size in sorted(spans):total+=max(0,address+size-max(end,address));end=max(end,address+size)
  check=subprocess.run([str(dest),'--nocapture'],cwd=root,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True);(s/(label+'-catalog-release-test.log')).write_text(check.stdout)
  assert check.returncode==(101 if label=='baseline' else 0)
  rows.append({'label':label,'command':cmd,'build_exit_code':p.returncode,'seconds':time.monotonic()-start,'test_exit_code':check.returncode,'path':str(dest),'bytes':dest.stat().st_size,'sha256':hashlib.sha256(dest.read_bytes()).hexdigest(),'sections':sections,'named_text_union':total,'source_sha256':hashlib.sha256(source).hexdigest()})
  (s/'catalog-artifacts.json').write_text(json.dumps(rows,indent=2)+'\n');print(label,rows[-1]['bytes'],sections['.text'],total,flush=True)
finally:path.write_bytes(repaired)
