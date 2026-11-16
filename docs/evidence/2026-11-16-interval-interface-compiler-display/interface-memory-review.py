from pathlib import Path
import subprocess,re,json,hashlib
s=Path(__file__).parent
out=s/'interface-memory-review';out.mkdir(exist_ok=True)
results={}
for name in ['desktop','fixture-driver','native-library']:
 variants={}
 for label,directory in [('baseline','interface-artifacts-baseline'),('candidate','interface-artifacts-ui-final')]:
  p=s/directory/name
  raw=subprocess.check_output(['readelf','--debug-dump=frames',str(p)],text=True)
  (out/f'{name}-{label}.frames').write_text(raw)
  entries=[]
  for part in re.split(r'\n(?=[0-9a-f]{8,} )',raw):
   if ' FDE ' not in part.split('\n')[0]:continue
   offsets=[int(v) for v in re.findall(r'DW_CFA_def_cfa(?:_offset)?: (?:r\d+ \([^)]*\) ofs )?(\d+)',part)]
   saved=re.findall(r'DW_CFA_offset: r\d+ \([^)]*\) at cfa-(\d+)',part)
   entries.append({'max_explicit_cfa_offset':max(offsets,default=0),'saved_register_offsets':saved,'expression_rules':re.findall(r'.*DW_CFA_.*expression.*',part)})
  variants[label]={'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'fde_count':len(entries),'entries':entries}
 a,b=[variants[k]['entries'] for k in ['baseline','candidate']]
 diffs=[{'index':i,'baseline':x,'candidate':y} for i,(x,y) in enumerate(zip(a,b)) if x!=y]
 results[name]={'variants':{k:{x:y for x,y in v.items() if x!='entries'} for k,v in variants.items()},'corresponding_frame_summaries_identical':a==b,'different_entries':diffs}
 (out/f'{name}-entries.json').write_text(json.dumps(variants,indent=2)+'\n')
report={'scope':'Uninstrumented shipped x86_64 ELF unwind metadata. Correspondence by FDE emission order; summary is supporting local-frame evidence, not a call-chain peak-stack or allocation bound. Full raw records retained.','artifacts':results}
(out/'report.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
