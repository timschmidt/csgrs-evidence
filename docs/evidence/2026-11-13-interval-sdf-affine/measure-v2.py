from pathlib import Path
import subprocess,json,time,shutil,statistics
s=Path('/tmp/interval-refactor/sdf-affine');art=Path('/mnt/development/.interval-refactor-build/sdf-affine-artifacts');rows=[]
for index,label in enumerate(['baseline-legacy','candidate-v2-legacy','candidate-v2-legacy','baseline-legacy','affine-v2']):
 target=art/'measured';shutil.copy2(art/label,target)
 cmd=['taskset','-c','0','setarch','x86_64','-R','python3',str(s/'warm-exec.py'),str(target)]
 t=time.monotonic()
 with (s/f'measure-v2-{index}-{label}.log').open('w') as out:r=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(index=index,label=label,command=cmd,returncode=r.returncode,seconds=time.monotonic()-t));(s/'measurement-v2-commands.json').write_text(json.dumps(rows,indent=2)+'\n');print(index,label,r.returncode,flush=True);assert r.returncode==0
fixed=[];timing=[]
for row in rows:
 data=(s/f'measure-v2-{row["index"]}-{row["label"]}.log').read_text().splitlines();fixed.append([l for l in data if l.startswith(('DEFINITION|','ROW|','ALLOC|'))]);times={}
 for l in data:
  p=l.split('|')
  if p[0]=='TIME':times.setdefault(p[1],[]).append(int(p[4])/int(p[3]))
 timing.append(times)
assert all(x==fixed[0] for x in fixed[1:4]);summary={}
for name in timing[0]:
 baseline=timing[0][name]+timing[3][name];candidate=timing[1][name]+timing[2][name]
 summary[name]=dict(baseline_ns=baseline,candidate_ns=candidate,median_ratio=statistics.median(candidate)/statistics.median(baseline),candidate_min_exceeds_baseline_max=min(candidate)>max(baseline))
(s/'legacy-v2-comparison.json').write_text(json.dumps(dict(exact_rows=len(fixed[0]),all_exact_match=True,timings=summary),indent=2)+'\n')
new={}
for l in fixed[4]:
 p=l.split('|')
 if p[0]=='ALLOC':new[p[1]]=dict(allocations=int(p[2]),deallocations=int(p[3]),reallocations=int(p[4]),allocated_bytes=int(p[5]),peak_bytes=int(p[6]),live_delta=int(p[7]));assert new[p[1]]['live_delta']==0
for name,values in timing[4].items():new[name].update(samples_ns=values,median_ns=statistics.median(values))
(s/'affine-v2-measurement.json').write_text(json.dumps(new,indent=2)+'\n')
print('exact rows',len(fixed[0]),'separated adverse',[name for name,r in summary.items() if r['candidate_min_exceeds_baseline_max']],flush=True)
