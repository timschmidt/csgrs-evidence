from pathlib import Path
import subprocess,shutil,time,json,statistics
s=Path('/tmp/interval-refactor/sdf-lipschitz');art=Path('/mnt/development/.interval-refactor-build/sdf-lipschitz-artifacts');rows=[];fixed=[];times=[]
for i,label in enumerate(['candidate-probe','vector-probe','vector-probe','candidate-probe']):
 target=art/'measured-probe';shutil.copy2(art/label,target);cmd=['taskset','-c','0','setarch','x86_64','-R','python3',str(s/'warm-exec.py'),str(target)];start=time.monotonic()
 with (s/f'vector-{i}-{label}.log').open('w') as out:r=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(index=i,label=label,command=cmd,returncode=r.returncode,seconds=time.monotonic()-start));(s/'vector-probe-commands.json').write_text(json.dumps(rows,indent=2)+'\n');print(i,label,r.returncode,flush=True);assert r.returncode==0
 data=(s/f'vector-{i}-{label}.log').read_text().splitlines();fixed.append([x for x in data if x.startswith(('ROW|','ALLOC|'))]);t={}
 for line in data:
  p=line.split('|')
  if p[0]=='TIME':t.setdefault(p[1],[]).append(int(p[4])/int(p[3]))
 times.append(t)
assert all(x==fixed[0] for x in fixed[1:])
summary={}
for name in times[0]:
 matrix=times[0][name]+times[3][name];vector=times[1][name]+times[2][name]
 summary[name]=dict(matrix_ns=matrix,vector_ns=vector,median_ratio=statistics.median(vector)/statistics.median(matrix),vector_min_exceeds_matrix_max=min(vector)>max(matrix))
(s/'vector-comparison.json').write_text(json.dumps(dict(exact_rows=len(fixed[0]),all_match=True,timings=summary),indent=2)+'\n')
print('matched',len(fixed[0]),'rows',flush=True)
