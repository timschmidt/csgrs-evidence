from pathlib import Path
import json,subprocess,re
s=Path(__file__).parent;labels=['original','validated','inplace'];allrows=[];summaries=[];frames=[]
for label in labels:
 runs=json.loads((s/(label+'-runs.json')).read_text());assert len(runs)==54 and all(x['exit_code']==0 for x in runs)
 for run in runs:
  lines=[line.split() for line in (s/run['log']).read_text().splitlines() if line.startswith('stack ')];assert len(lines)==4
  for x in lines:allrows.append({'label':label,'case':run['case'],'warm':run['warm'],'repeat':run['repeat'],'pattern':int(x[3]),'bytes':int(x[4])})
 binary=json.loads((s/(label+'-build.json')).read_text())['binary'];symbols=subprocess.check_output(['nm','-S','-C',binary],text=True)
 for line in symbols.splitlines():
  if not (line.endswith('voxel_envelope_resources::execute') or line.endswith('voxel_envelope_resources::callback')):continue
  addr,size,kind,name=line.split(' ',3);start=int(addr,16);asm=subprocess.check_output(['objdump','-d','-C','--no-show-raw-insn',f'--start-address={start}',f'--stop-address={start+int(size,16)}',binary],text=True);name=name.split('::')[-1];filename=f'{label}-{name}-disassembly.txt';(s/filename).write_text(asm);frames.append({'label':label,'name':name,'code_bytes':int(size,16),'prologue':asm.splitlines()[7:23],'file':filename})
for case in ['empty','first','many','incompatible','surd','computable','inverted','malformed','unknown']:
 row={'case':case}
 for label in labels:
  values=[x['bytes'] for x in allrows if x['case']==case and x['label']==label];row[label]={'min':min(values),'max':max(values),'values':sorted(set(values))}
 row['inplace_minus_original_max']=row['inplace']['max']-row['original']['max'];row['inplace_minus_validated_max']=row['inplace']['max']-row['validated']['max'];summaries.append(row);print(json.dumps(row))
(s/'stack-comparison.json').write_text(json.dumps({'processes':162,'observations':648,'rows':allrows,'summary':summaries,'frames':frames,'scope':'Fresh same-path before-edit reproduction and one ownership hypothesis. Original invalid publications remain bugs. Empty and valid original workloads remain supported baselines; their regressions cannot be erased by a synthetic completed-validation wrapper. No universal stack bound, heap or timing admission.'},indent=2)+'\n')
