from pathlib import Path
import hashlib,json,os,re,statistics,subprocess,time
s=Path(__file__).parent;b=Path('/mnt/development/.interval-refactor-build/flow-noise-cost/qualified');cpu=8
assert cpu in os.sched_getaffinity(0)
processes=subprocess.check_output(['ps','-eo','pid,etime,args'],text=True)
(s/'timing-processes-before.txt').write_text(processes)
# The controller starts only after the explicitly tracked package/build jobs end.
(s/'timing-environment.json').write_text(json.dumps({'cpu':cpu,'affinity':sorted(os.sched_getaffinity(0)),'uname':subprocess.check_output(['uname','-a'],text=True),'lscpu':subprocess.check_output(['lscpu'],text=True),'binary_sha256':hashlib.sha256((b/'timing').read_bytes()).hexdigest(),'pairs':30,'rounds_per_process':6,'first_round_excluded_from_steady_summary_but_retained':True,'clock':'std::time::Instant','allocator':'System, no allocation instrumentation','cache':'new process per pair side; source and prepared programs as documented; one complete workload before summarized rounds'},indent=2)+'\n')
rows=[];summary=[]
for case,cells in [('constant',1),('shear',8),('shear',32),('shear',128)]:
 for temperature in ['cold','warm']:
  for pair in range(30):
   for mode in (['boxes','noise'] if pair%2==0 else ['noise','boxes']):
    cmd=['taskset','-c',str(cpu),str(b/'timing'),mode,case,str(cells),temperature,'6']
    label=f'timing-{case}-{cells}-{temperature}-{pair}-{mode}'
    result=subprocess.run(cmd,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
    (s/(label+'.log')).write_text(result.stdout)
    assert result.returncode==0,label
    samples=[dict(zip(['iteration','ns','graph','scalar','hull_scalar'],map(int,m))) for m in re.findall(r'sample iteration=(\d+) ns=(\d+) graph=(\d+) scalar=(\d+) hull_scalar=(\d+) certified=true',result.stdout)]
    assert len(samples)==6
    rows.append({'case':case,'cells':cells,'temperature':temperature,'pair':pair,'mode':mode,'command':cmd,'returncode':result.returncode,'samples':samples})
  selected=[x for x in rows if (x['case'],x['cells'],x['temperature'])==(case,cells,temperature)]
  ratios=[]
  for pair in range(30):
   medians={x['mode']:statistics.median(t['ns'] for t in x['samples'][1:]) for x in selected if x['pair']==pair}
   ratios.append(medians['noise']/medians['boxes'])
  row={'case':case,'cells':cells,'temperature':temperature,'pairs':30,'median_paired_noise_over_boxes':statistics.median(ratios),'paired_ratio_min':min(ratios),'paired_ratio_max':max(ratios),'paired_ratios':ratios}
  for mode in ['boxes','noise']:
   values=[t['ns'] for x in selected if x['mode']==mode for t in x['samples'][1:]]
   row[mode+'_median_ns']=statistics.median(values)
  summary.append(row);(s/'timing-samples.json').write_text(json.dumps(rows,indent=2)+'\n');(s/'timing-summary.json').write_text(json.dumps(summary,indent=2)+'\n');print({k:v for k,v in row.items() if k!='paired_ratios'},flush=True)
# Memory runs are separate and include the first-use retained bytes explicitly.
allocations=[]
for case,cells in [('constant',1),('shear',8),('shear',32),('shear',128)]:
 for temperature in ['cold','warm']:
  for mode in ['boxes','noise']:
   label=f'memory-{case}-{cells}-{temperature}-{mode}'
   cmd=[str(b/'allocation'),mode,case,str(cells),temperature,'20']
   result=subprocess.run(cmd,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT);(s/(label+'.log')).write_text(result.stdout);assert result.returncode==0,label
   samples=[]
   for line in result.stdout.splitlines():
    if line.startswith('allocation '):
     match=re.fullmatch(r'allocation iteration=(\d+) baseline=(\d+) retained=AllocationStats \{ (.*?) \} final=AllocationStats \{ (.*?) \}',line);assert match,line
     def stats(text):return {k:int(v) for k,v in re.findall(r'(\w+): (\d+)',text)}
     samples.append({'iteration':int(match[1]),'baseline':int(match[2]),'retained':stats(match[3]),'final':stats(match[4])})
   assert len(samples)==20
   cleanup=re.search(r'cleanup after_prepared=(\d+) after_source=(\d+)',result.stdout);assert cleanup
   allocations.append({'case':case,'cells':cells,'temperature':temperature,'mode':mode,'samples':samples,'after_prepared':int(cleanup[1]),'after_source':int(cleanup[2]),'no_post_first_workload_growth':all(x['baseline']==x['final']['live_bytes'] for x in samples[1:])})
(s/'memory-summary.json').write_text(json.dumps(allocations,indent=2)+'\n');print('all memory checks passed',flush=True)
