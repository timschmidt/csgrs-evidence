from pathlib import Path
import subprocess,json,hashlib,collections,time
s=Path(__file__).parent;out=s/'stack-repeat';out.mkdir(exist_ok=False);plan=json.loads((s/'stack-plan.json').read_text());groups={v:collections.defaultdict(list) for v in ['baseline','candidate']};outcomes={v:collections.defaultdict(set) for v in groups};metadata=[];start=time.monotonic()
for block in range(plan['processes_per_variant']):
 for variant in (['baseline','candidate'] if block%2==0 else ['candidate','baseline']):
  assert time.monotonic()-start<plan['repeat_campaign_budget_seconds']
  binary=s/'stack-artifacts'/variant;expected=json.loads((s/f'stack-{variant}-artifact.json').read_text())['sha256'];assert hashlib.sha256(binary.read_bytes()).hexdigest()==expected
  p=out/f'{block:02d}-{variant}.tsv';t=time.monotonic()
  with p.open('w') as log, p.with_suffix('.stderr').open('w') as err:
   result=subprocess.run([str(binary)],stdout=log,stderr=err,timeout=plan['run_timeout_seconds_each'])
  metadata.append({'block':block,'variant':variant,'exit_code':result.returncode,'elapsed_seconds':time.monotonic()-t,'binary_sha256':expected,'output_sha256':hashlib.sha256(p.read_bytes()).hexdigest()});(out/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n');assert result.returncode==0
  lines=p.read_text().splitlines();assert len(lines)==plan['rows_per_process']
  for line in lines:
   repetition,name,warm,pattern,peak,outcome=line.split('\t',5);key=(name,warm);assert int(repetition)<plan['repetitions_per_process'] and int(pattern) in plan['patterns'];groups[variant][key].append(int(peak));outcomes[variant][key].add(outcome)
  print(block,variant,'complete',round(metadata[-1]['elapsed_seconds'],2),flush=True)
assert groups['baseline'].keys()==groups['candidate'].keys();assert len(groups['baseline'])==100
rows=[]
for key in sorted(groups['baseline']):
 a=groups['baseline'][key];b=groups['candidate'][key];assert len(a)==len(b)==plan['samples_per_case_and_warm_state'];assert outcomes['baseline'][key]==outcomes['candidate'][key];assert len(outcomes['baseline'][key])==1
 rows.append({'case':key[0],'warm':key[1]=='true','samples_per_variant':len(a),'baseline_min_max':[min(a),max(a)],'candidate_min_max':[min(b),max(b)],'maximum_delta':max(b)-max(a),'outcome_sha256':hashlib.sha256(next(iter(outcomes['baseline'][key])).encode()).hexdigest()})
result={'rows':rows,'higher_candidate_maxima':[r for r in rows if r['maximum_delta']>0],'outcomes_identical':True,'observations_per_variant':sum(len(v) for v in groups['baseline'].values()),'scope':plan['scope'],'earlier_baseline_probe_retained':'runs/stack-baseline-first-run','disposition':'Measured envelope only; inspect emitted frames and any adverse rows before memory admission.'}
(out/'summary.json').write_text(json.dumps(result,indent=2)+'\n');print('Higher candidate per-case maxima:',len(result['higher_candidate_maxima']),flush=True)
