from pathlib import Path
import hashlib, json, re, subprocess
s=Path(__file__).parent
repo=Path('/mnt/development/interval-profile-static/csgrs')
budget=json.loads((s/'retained-size-budget.json').read_text())
b={r['source']:r for r in json.loads((s/'baseline-binaries.json').read_text())}
c={r['source']:r for r in json.loads((s/'retained-binaries.json').read_text())}
sections={r['source']:r for r in json.loads((s/'retained-section-comparison.json').read_text())}
def named(path):
 values={}
 for line in subprocess.check_output(['nm','-S','--defined-only',path],text=True).splitlines():
  m=re.match(r'([0-9a-f]+) ([0-9a-f]+) [tT] ',line)
  if m:
   addr,n=m.groups();n=int(n,16)
   if addr in values and values[addr]!=n:raise RuntimeError('alias mismatch')
   values[addr]=n
 return sum(values.values())
accounts=[]
for source in b:
 path=Path(source).relative_to(repo).as_posix()
 harness=path=='crates/hyperlattice-interval/src/lib.rs'
 if not harness and not sections[source]['all_selected_sections_identical']:raise RuntimeError('existing code/data/unwind changed')
 metrics={}
 for metric,old,new in [('file',b[source]['bytes'],c[source]['bytes']),('text',b[source]['sections']['.text'],c[source]['sections']['.text']),('named_text',named(b[source]['path']),named(c[source]['path']))]:
  caps=budget['new_lattice_test_harness'][metric] if harness else budget['existing_artifacts']['native_monomorphized_text_sum' if metric=='named_text' else 'native_final_file_and_allocated_sections']
  delta=new-old;percent=100*delta/old
  passed=delta<=caps['incremental_bytes'] and percent<=caps['incremental_percent'] and delta<=caps['cumulative_bytes'] and percent<=caps['cumulative_percent']
  if not passed:raise RuntimeError(f'cap failed: {path} {metric}')
  metrics[metric]={'baseline':old,'retained':new,'net_growth_bytes':delta,'growth_percent':percent,'accepted_positive_growth_bytes':max(0,delta),'remaining_cumulative_bytes':caps['cumulative_bytes']-max(0,delta),'remaining_cumulative_percent':caps['cumulative_percent']-max(0,percent),'caps':caps,'passes_both_caps':passed}
 for metric in ['.data','.bss']:
  if c[source]['sections'].get(metric,0)>b[source]['sections'].get(metric,0):raise RuntimeError('writable memory grew')
 accounts.append({'artifact':path,'role':'test harness with two new tests' if harness else 'unchanged completed-workload executable','target':'x86_64-unknown-linux-gnu','features':b[source]['features'],'baseline_sha256':b[source]['sha256'],'retained_sha256':c[source]['sha256'],'selected_runtime_sections_identical':sections[source]['all_selected_sections_identical'],'metrics':metrics})
wasm=json.loads((s/'retained-wasm-comparison.json').read_text())
if not wasm['baseline_byte_identical']:raise RuntimeError('WASM changed')
old_wasm=next(r for r in json.loads((s/'size-account.json').read_text())['artifacts'] if r['artifact']=='centered-interval-wasm')['baseline']
if wasm['sha256']!=old_wasm['sha256']:raise RuntimeError('WASM digest mismatch')
caps=budget['existing_artifacts']['wasm_final_file_and_code']
metrics={name:{'baseline':old_wasm[name],'retained':old_wasm[name],'net_growth_bytes':0,'growth_percent':0,'accepted_positive_growth_bytes':0,'remaining_cumulative_bytes':caps['cumulative_bytes'],'remaining_cumulative_percent':caps['cumulative_percent'],'caps':caps,'passes_both_caps':True} for name in ('file','code')}
accounts.append({'artifact':'crates/hyperlattice-interval/conformance/centered-wasm','role':'unchanged completed-workload WASM boundary','target':'wasm32-unknown-unknown','features':['fixed','float-enclosure'],'baseline_sha256':wasm['sha256'],'retained_sha256':wasm['sha256'],'selected_runtime_sections_identical':True,'metrics':metrics})
record={**budget,'status':'retained tests pass the declared bounds; no matrix implementation accepted','accepted_changes':[{'id':'array-construction-lifecycle-tests','benefit':'independent first-error callback order and nested ownership cleanup witnesses','source':'crates/hyperlattice-interval/src/lib.rs','production_implementation_changed':False}],'accounts':accounts}
(s/'retained-size-account.json').write_text(json.dumps(record,indent=2)+'\n')
(repo/'docs/research/interval-size-accounts.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps({'artifacts':len(accounts),'existing_runtime_sections_identical':sum(r['selected_runtime_sections_identical'] for r in accounts),'new_test_harness':[r['metrics'] for r in accounts if not r['selected_runtime_sections_identical']],'maximum_other_positive_file_growth':max(r['metrics']['file']['net_growth_bytes'] for r in accounts if r['selected_runtime_sections_identical'])}))
