from pathlib import Path
import subprocess,json,time,hashlib,re,statistics
p=Path(__file__).parent;bins=Path('/tmp/interval-refactor/coordinates-binaries')
builds=json.loads((p/'consumer-builds.json').read_text());assert len(builds)==9 and all(r['returncode']==0 for r in builds)
subprocess.run(['python3',str(p/'compare-consumers.py')],check=True)
comparison=json.loads((p/'consumer-comparison.json').read_text());assert len(comparison)==4
# An artifact change requires review before timings/retention, not a silent waiver.
assert all(x['text_identical'] and x['loaded_sections_identical_except_build_id'] for x in comparison)
subprocess.run(['python3',str(p/'run-legacy-pairs.py')],check=True)
subprocess.run(['python3',str(p/'analyze-legacy-pairs.py')],check=True)
runs=[];files={}
for project in ['model-cost','affine-cost','coordinate-cost']:
 files[project]=[]
 for trial in range(2):
  variants=(['final'] if project=='coordinate-cost' else (['baseline','final'] if trial==0 else ['final','baseline']))
  for variant in variants:
   exe=bins/(variant+'-'+project);log=p/f'{project}-{trial}-{variant}.log';files[project].append(log)
   cmd=['setarch','x86_64','-R','taskset','-c','0','python3',str(p/'warm-exec.py'),str(exe)];start=time.monotonic()
   with log.open('w') as f:result=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
   runs.append(dict(project=project,trial=trial,variant=variant,command=cmd,returncode=result.returncode,seconds=time.monotonic()-start,sha256=hashlib.sha256(exe.read_bytes()).hexdigest()));(p/'cost-runs.json').write_text(json.dumps(runs,indent=2)+'\n');assert result.returncode==0,(project,trial,variant)
summary={}
for project,logs in files.items():
 records=[];timings={}
 for log in logs:
  lines=log.read_text().splitlines();records.append([re.sub(r' cold_ns=\d+','',line) for line in lines if line.startswith(('COMPLETE','RETAINED','IMAGE','|'))])
  for line in lines:
   m=re.match(r'TIMING (\S+) ns_per_operation=(.*)',line)
   if m:timings.setdefault(m[1],[]).append(dict(file=log.name,median_ns=statistics.median(json.loads(m[2]))))
 assert all(x==records[0] for x in records),(project,'resource/image/allocation records differ')
 summary[project]=dict(records_identical=True,records=records[0],timing=timings)
(p/'cost-comparison.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps({k:v['timing'] for k,v in summary.items()},indent=2))
