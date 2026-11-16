from pathlib import Path
import json
s=Path(__file__).parent
rows=[]
for v in ['1.88.0','1.95.0']:
 a=json.loads((s/f'baseline-{v}-artifact.json').read_text());b=json.loads((s/f'candidate-{v}-artifact.json').read_text())
 rows.append({'compiler':v,'baseline_file':a['bytes'],'candidate_file':b['bytes'],'file_delta':b['bytes']-a['bytes'],'baseline_text':a['sections']['.text'],'candidate_text':b['sections']['.text'],'text_delta':b['sections']['.text']-a['sections']['.text'],'sections':{k:{'baseline':a['sections'].get(k,0),'candidate':b['sections'].get(k,0)} for k in a['sections']|b['sections'] if a['sections'].get(k,0)!=b['sections'].get(k,0)}})
def wasm_code(p):
 b=Path(p).read_bytes();i=8
 def leb():
  nonlocal i
  n=shift=0
  while True:
   c=b[i];i+=1;n|=(c&127)<<shift
   if c<128:return n
   shift+=7
 while i<len(b):
  section=b[i];i+=1;size=leb()
  if section==10:return size
  i+=size
 raise AssertionError('missing code section')
wa=json.loads((s/'baseline-wasm-artifact.json').read_text());wb=json.loads((s/'candidate-wasm-artifact.json').read_text())
wasm={'baseline_file':wa['bytes'],'candidate_file':wb['bytes'],'file_delta':wb['bytes']-wa['bytes'],'baseline_code':wasm_code(wa['path']),'candidate_code':wasm_code(wb['path'])};wasm['code_delta']=wasm['candidate_code']-wasm['baseline_code']
a=json.loads((s/'baseline-unit-metrics.json').read_text())[0];b=json.loads((s/'final-unit-metrics.json').read_text())[0]
metrics={}
for key,x,y,abs_cap,pct_cap in [('file',a['file_bytes'],b['file_bytes'],32768,4),('text',a['sections']['.text'],b['sections']['.text'],16384,4),('named_text',a['named_text_union'],b['named_text_union'],16384,4)]+[(k,a['allocated_sections'].get(k,0),v,4096,1) for k,v in b['allocated_sections'].items() if k!='.text' and v>a['allocated_sections'].get(k,0)]:
 delta=y-x;pct=100*delta/x;metrics[key]={'baseline':x,'tests_only':y,'growth_bytes':delta,'growth_percent':pct,'incremental_cap_bytes':abs_cap,'incremental_cap_percent':pct_cap,'passes':delta<=abs_cap and pct<=pct_cap}
r={'native_candidate':rows,'wasm_candidate':wasm,'test_only_metrics':metrics,'test_only_rejected':True,'failing_metrics':[k for k,v in metrics.items() if not v['passes']],'accounts_changed':False,'production_candidate_rejected_for_runtime':True,'scope':'Native/WASM diagnostic artifact screen. No final board image, stack or MCU-cycle qualification was pursued after host runtime rejection. Test executable exception covers file and code only; other allocated sections retain existing caps. Fixed firmware baseline matches 2d68e82; no budget reset.'}
(s/'size-summary.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
