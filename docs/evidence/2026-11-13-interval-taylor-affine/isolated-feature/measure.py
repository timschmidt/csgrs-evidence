from pathlib import Path
import subprocess,json,time,hashlib,re,statistics
q=Path(__file__).parent;p=q.parent;r='/mnt/development/csgrs-taylor-affine';bins=Path('/tmp/interval-refactor/taylor-affine-binaries')
rows=json.loads((q/'post-domain-qualification.json').read_text());assert len(rows)==12 and all(x['returncode']==0 for x in rows)
# Last test-only extension exercises zero-output-to-constant composition. Its
# assertions pass in final-controls.log; recheck its strict lint and formatting.
for name,cmd in [('test-clippy',['cargo','+1.95.0','clippy','--locked','-p','hypersolve','--all-features','--test','program_taylor_affine','--','-D','warnings']),('test-fmt',['cargo','+1.95.0','fmt','-p','hypersolve','-p','hyperdynamics','--','--check'])]:
 with (q/(name+'.log')).open('w') as f:result=subprocess.run(cmd,cwd=r,stdout=f,stderr=subprocess.STDOUT,env={**__import__('os').environ,'CARGO_TARGET_DIR':'/mnt/development/csgrs-taylor/target'})
 assert result.returncode==0
subprocess.run(['python3',str(q/'build-final-consumers.py')],check=True)
subprocess.run(['python3',str(q/'compare-consumers.py')],check=True)
comparison=json.loads((q/'consumer-comparison.json').read_text());assert all(x['text_identical'] and x['loaded_sections_identical_except_build_id'] for x in comparison)
assert [x['final_bytes']-x['baseline_bytes'] for x in comparison]==[0,0,8]
print('Final source/artifact checks complete; starting fixed timings',flush=True)
subprocess.run(['python3',str(q/'run-legacy-pairs.py')],check=True)
subprocess.run(['python3',str(q/'analyze-legacy-pairs.py')],check=True)
runs=[]
for trial in range(2):
 for variant in (['baseline','isolated'] if trial==0 else ['isolated','baseline']):
  exe=bins/(variant+'-model-cost');cmd=['setarch','x86_64','-R','taskset','-c','0','python3',str(q/'warm-exec.py'),str(exe)];start=time.monotonic()
  with (q/f'model-{trial}-{variant}.log').open('w') as f:result=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
  runs.append(dict(project='model-cost',trial=trial,variant=variant,command=cmd,returncode=result.returncode,seconds=time.monotonic()-start,sha256=hashlib.sha256(exe.read_bytes()).hexdigest()));assert result.returncode==0
for trial in range(2):
 exe=bins/'isolated-affine-cost';cmd=['setarch','x86_64','-R','taskset','-c','0','python3',str(q/'warm-exec.py'),str(exe)];start=time.monotonic()
 with (q/f'affine-{trial}.log').open('w') as f:result=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
 runs.append(dict(project='affine-cost',trial=trial,command=cmd,returncode=result.returncode,seconds=time.monotonic()-start,sha256=hashlib.sha256(exe.read_bytes()).hexdigest()));(q/'model-affine-runs.json').write_text(json.dumps(runs,indent=2)+'\n');assert result.returncode==0
summary={}
for project,files in [('model-cost',[q/f'model-{i}-{v}.log' for i in range(2) for v in ['baseline','isolated']]),('affine-cost',[q/f'affine-{i}.log' for i in range(2)])]:
 records=[];timings={}
 for file in files:
  lines=file.read_text().splitlines();records.append([re.sub(r' cold_ns=\d+','',line) for line in lines if line.startswith(('COMPLETE','RETAINED','IMAGE','|'))])
  for line in lines:
   m=re.match(r'TIMING (\S+) ns_per_operation=(.*)',line)
   if m:timings.setdefault(m[1],[]).append(dict(file=file.name,median_ns=statistics.median(json.loads(m[2]))))
 assert all(x==records[0] for x in records)
 summary[project]=dict(records_identical=True,records=records[0],timing=timings)
(q/'model-affine-comparison.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps({k:v['timing'] for k,v in summary.items()},indent=2))
