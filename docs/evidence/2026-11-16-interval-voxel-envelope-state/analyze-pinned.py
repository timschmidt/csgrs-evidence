from pathlib import Path
import json,re,collections
s=Path(__file__).parent;runs=json.loads((s/'pinned-runs.json').read_text());assert len(runs)==594 and all(r['exit_code']==0 for r in runs)
records={};alloc=[];stacks=[];traces=[];outcomes=[];cleanup=[]
for r in runs:
 key=(r['label'],r['mode'],r['repeat'],r['warm'],r['case']);outputs=[];metrics=[]
 for line in (s/r['log']).read_text().splitlines():
  if line.startswith('outcome '):outputs.append(line)
  elif line.startswith('allocation '):
   x=[{k:int(v) for k,v in re.findall(r'(\w+): (\d+)',part)} for part in re.findall(r'AllocationStats \{([^}]+)\}',line)];assert len(x)==3;metrics.append(x)
  elif line.startswith('trace '):metrics.append(line[line.index('TraceSnapshot'):])
  elif line.startswith('stack '):metrics.append(int(line.split()[-1]))
  elif line.startswith('cleanup '):cleanup.append({'key':key,'stats':{k:int(v) for k,v in re.findall(r'(\w+): (\d+)',line)}})
 expected=4 if r['mode']=='stack' else 8;assert len(metrics)==expected and len(outputs)==expected+r['warm'],(key,len(outputs),len(metrics))
 records[key]=(outputs,metrics)
results=[]
for mode in ['allocation','trace','stack']:
 for repeat in range(3):
  for warm in [0,16]:
   for case in ['empty','first','many','incompatible','surd','computable','inverted','malformed','unknown','late_inverted','late_unknown']:
    key=(mode,repeat,warm,case);vo,vm=records[('validated',*key)];io,im=records[('inplace',*key)];oo,om=records[('original',*key)]
    assert vo==io,(key,'outcome')
    if case not in ['inverted','malformed','unknown','late_inverted','late_unknown']:assert oo==io,(key,'original-outcome')
    if mode in ['allocation','trace']:assert vm==im,(key,mode,'changed')
    row={'mode':mode,'repeat':repeat,'warm':warm,'case':case,'outcomes_identical_to_validated':True,'original':om,'validated':vm,'inplace':im}
    if mode=='stack':row['deltas_from_validated']=[a-b for a,b in zip(im,vm)];assert all(a<=b for a,b in zip(im,vm)),(key,'stack')
    results.append(row)
for row in cleanup:
 if row['key'][0]=='validated':
  match=next(c for c in cleanup if c['key']==('inplace',*row['key'][1:]));assert match['stats']==row['stats'],('input-cleanup',row,match)
summary=[]
for case in ['empty','first','many','incompatible','surd','computable','inverted','malformed','unknown','late_inverted','late_unknown']:
 row={'case':case}
 for label in ['original','validated','inplace']:
  values=[x for key,(_,metrics) in records.items() if key[0]==label and key[1]=='stack' and key[-1]==case for x in metrics];row[label]={'stack_min':min(values),'stack_max':max(values)}
 summary.append(row)
(s/'pinned-comparison.json').write_text(json.dumps({'processes':594,'matched_validated_inplace_allocation_records':528,'matched_validated_inplace_trace_records':528,'matched_validated_inplace_stack_records':264,'all_allocation_trace_and_cleanup_records_identical_to_validated':True,'all_stack_observations_nonincreasing_vs_validated':True,'summary':summary,'comparisons':results,'cleanup':cleanup,'scope':'Proves no sampled resource/trace regressions from644to200, including errors after both vectors and tensors hold symbolic clones. Original-versus-validated proof costs remain explicit; no waiver, universal lifetime proof, whole-resource bound or admission.'},indent=2)+'\n')
for row in summary:print(json.dumps(row))
