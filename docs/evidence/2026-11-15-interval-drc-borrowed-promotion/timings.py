from pathlib import Path
import subprocess,json,hashlib,os,time,re,resource
s=Path(__file__).parent;cwd=Path('/mnt/development/interval-profile-static/csgrs/crates/hyperdrc');results=[]
assert json.loads((s/'promotion-witness.json').read_text())['exit_code']==0
for index,label in enumerate(['baseline','candidate','candidate','baseline','baseline','candidate']):
 info=json.loads((s/(label+'-binary.json')).read_text());binary=Path(info['path']);assert hashlib.sha256(binary.read_bytes()).hexdigest()==info['sha256']
 cmd=[str(binary),'--exact','zz_complex_project_performance_tests::kicad_board_completes_smoke_check_suite','--nocapture','--test-threads=1'];log=s/f'timing-{index}-{label}.log';start=time.monotonic();before=resource.getrusage(resource.RUSAGE_CHILDREN)
 with log.open('w') as out:
  p=subprocess.run(cmd,cwd=cwd,env=os.environ|{'HYPERDRC_REQUIRE_COMPLEX_FIXTURES':'1'},stdout=out,stderr=subprocess.STDOUT,timeout=600)
 after=resource.getrusage(resource.RUSAGE_CHILDREN);text=log.read_text();m=re.search(r'complex project KiCad smoke suite took ([0-9.]+)s of worker time',text)
 worker=float(m[1]) if m else None
 r={'index':index,'label':label,'command':cmd,'cwd':str(cwd),'required_fixtures':True,'binary_sha256':info['sha256'],'exit_code':p.returncode,'wall_seconds':time.monotonic()-start,'children_cpu_seconds':after.ru_utime+after.ru_stime-before.ru_utime-before.ru_stime,'worker_seconds':worker,'worker_limit_seconds':120,'external_limit_seconds':600,'note':'original smoke is complete but fails when worker CPU exceeds120; successful run does not print worker CPU'}
 (s/f'timing-{index}-{label}.json').write_text(json.dumps(r,indent=2)+'\n');results.append(r);(s/'timings.json').write_text(json.dumps(results,indent=2)+'\n');print(json.dumps(r),flush=True)
 assert p.returncode==0 or (p.returncode==101 and worker is not None and worker>=120),r
