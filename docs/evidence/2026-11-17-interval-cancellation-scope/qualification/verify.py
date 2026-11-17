from pathlib import Path
from collections import Counter
import gzip,hashlib,json,re,subprocess
s=Path(__file__).parent;r=Path('/dev/shm/interval-cancellation-scope/csgrs');old=s.parent/'solver-cancellation-boundary';consumer=s.parent/'solver-cancellation-consumer';sha=lambda b:hashlib.sha256(b).hexdigest();read=lambda n:json.loads((s/n).read_text())
assert read('completion.json')['exit_code']==read('supplement-completion.json')['exit_code']==0
assert read('supplement-completion.json')['finished']<read('continuation.json')['original_deadline_unix']
commands=read('commands.json');supplement=read('supplement-commands.json');extra=read('curve-clippy.json');assert extra['finished']<extra['original_deadline_unix'];assert len(commands)==893 and len(supplement)==6
original=read('attempt-01/commands.json');assert commands[:len(original)]==original and len(original)==442
for c in commands+supplement+[extra]:
 assert c['exit_code']==0 and not c['timeout'];raw=gzip.decompress((s/c['log']).read_bytes());assert sha(raw)==c['log_sha256'];assert not any(line.startswith((b'warning:',b'warning[')) for line in raw.splitlines())
expected={'owner-no-default.log.gz':[642],'owner-all-features.log.gz':[645],'curve-tests.log.gz':[1,7],'owner-resultant-integrations.log.gz':[16,10]}
for name,counts in expected.items():
 text=gzip.decompress((s/name).read_bytes()).decode();actual=list(map(int,re.findall(r'test result: ok\. (\d+) passed; 0 failed; 0 ignored;',text)));assert actual==counts,(name,actual)
assert 'kind: Cancellation' in gzip.decompress((s/'native-witness-invoke.log.gz').read_bytes()).decode()
wasm=[json.loads(x) for x in gzip.decompress((s/'wasm-witness-invoke.log.gz').read_bytes()).decode().splitlines()];assert [x['case'] for x in wasm]==[0,1,2] and all(not x['expected_trap'] and x['assertions_pass'] for x in wasm)
for name in ['candidate-witness','candidate-wasm']:
 for p in (s/name).iterdir():
  if p.name!='Cargo.toml':assert p.read_bytes()==(old/name/p.name).read_bytes()
 assert (s/name/'Cargo.toml').read_text()==(old/name/'Cargo.toml').read_text().replace('/dev/shm/interval-cancellation-boundary/csgrs','/dev/shm/interval-cancellation-scope/csgrs')
for row in read('consumer-provenance.json'):assert sha((s/'consumer'/row['path']).read_bytes())==row['sha256']
assert (s/'consumer/Cargo.toml').read_text()==(consumer/'consumer/Cargo.toml').read_text().replace('/dev/shm/interval-cancellation-boundary/csgrs','/dev/shm/interval-cancellation-scope/csgrs')
base=read('started.json')['parent'];path='crates/hypersolve/src/work_budget.rs';before=subprocess.check_output(['git','show',base+':'+path],cwd=r,text=True)
expected_source=before.replace('''    enter(budget, Some(cancellation.clone()), None, || {
        let value = operation();
        let _ = exhaustion();
        value
    })''','    enter::<true, T>(budget, Some(cancellation.clone()), None, operation)').replace('enter(budget, None, None, operation)','enter::<false, T>(budget, None, None, operation)').replace('enter(WorkBudget::UNLIMITED, None, Some(bits), operation)','enter::<false, T>(WorkBudget::UNLIMITED, None, Some(bits), operation)').replace('fn enter<T>(', 'fn enter<const CHECK_CANCELLATION: bool, T>(').replace('    let value = operation();\n    let frame = scope.finish();','    let value = operation();\n    if CHECK_CANCELLATION {\n        let _ = exhaustion();\n    }\n    let frame = scope.finish();')
assert (r/path).read_text()==expected_source
assert subprocess.check_output(['git','diff','--name-only',base],cwd=r,text=True).splitlines()==[path]
patch=subprocess.check_output(['git','diff','--binary',base],cwd=r);assert sha(patch)==read('started.json')['source_patch_sha256'];(s/'candidate.patch').write_bytes(patch)
images=read('images.json')+read('witness-images.json')
for image in images:assert sha(Path(image['path']).read_bytes())==image['sha256'] and Path(image['path']).stat().st_size==image['bytes']
refs={};oldimages={a['path']:(b['label'],b['features']) for b in json.loads((consumer/'builds.json').read_text()) for k,a in b['artifacts'].items() if k=='resource'}
def full(raw):return tuple(l for l in raw.splitlines() if l.startswith(('OUTPUT ','TRACE ')))
for c in json.loads((consumer/'commands.json').read_text()):
 if c['command'][0] not in oldimages or c['exit_code']:continue
 label,features=oldimages[c['command'][0]];raw=gzip.decompress((consumer/c['log']).read_bytes()).decode();key=(label,features,tuple(c['command'][1:]))
 if key in refs:assert refs[key]==full(raw)
 else:refs[key]=full(raw)
rows=read('observations.json');assert len(rows)==882 and len({(x['features'],tuple(x['args'])) for x in rows})==882
for row in rows:
 raw=gzip.decompress((s/row['log']).read_bytes()).decode();key=('candidate',row['features'],tuple(row['args']));assert full(raw)==refs[key]
 if 'cancel-retry' not in row['features']:assert full(raw)==refs[('baseline',*key[1:])]
 if 'STACK' in row['fields']:
  mapping,guard,caller,touched,remaining=map(int,row['fields']['HEADROOM'].split());assert mapping==2*1024**2 and touched==int(row['fields']['STACK']) and touched>0 and guard>0 and caller>0 and guard+caller+touched+remaining==mapping
  assert remaining>=1024**2
pilot=read('stack-pilot.json');assert len(pilot['stack_comparisons'])==336
for c in pilot['stack_comparisons']:
 key=c['key'];features,case,policy,trace,reuse,warm=key;mode='stack' if c['metric']=='stack' else 'stack-drop';matching=[x for x in rows if x['features']==features and x['args'][0]==str(case) and x['args'][1]==mode and x['args'][2]==str(warm) and x['args'][4:]==[trace,policy,reuse]];assert len(matching)==2 and {x['args'][3] for x in matching}=={'165','90'}
 value=max(int(x['fields']['STACK']) for x in matching);assert value==c['alternative'];positive=max(0,value-c['baseline']);assert c['initial_growth_pass']==(positive<=256 and 100*positive<=4*c['baseline'])
result=dict(parent=base,patch_sha256=sha(patch),source_files_changed=1,commands=len(commands)+len(supplement)+1,preserved_completed_prefix=len(original),original_deadline_preserved=True,external_storage_stop_preserved=True,candidate_test_invocations=1321,native_witness_pass=True,wasm_witness_cases=3,complete_consumer_controls=882,full_output_trace_comparisons=882+840,stack_groups=336,failed_stack_groups=pilot['failed_stack_comparisons'],initial_stack_allowance_unchanged=True,earlier_wrapper_charges_preserved=True,owner_all_target_all_feature_clippy=True,consumer_all_target_all_feature_clippy=True,direct_curve_strict_feature_clippy=True,strict_owner_curve_docs=True,images=6,admitted=False,complete_lifetime_resource_qualification_pending=True,quiet_runtime_pending=True,cumulative_accounting_pending=True)
(s/'verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
