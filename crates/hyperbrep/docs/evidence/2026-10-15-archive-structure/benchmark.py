import os, subprocess, time, json, hashlib, statistics, importlib.util, sys, shutil
from pathlib import Path
root=Path('/mnt/development/csgrs'); out=Path('/tmp/hyperbrep-archive-structure-evidence')
env=os.environ.copy()
env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'], CARGO_HOME='/tmp/hyperbrep-review-cargo', CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
build=subprocess.run(['cargo','build','--offline','--locked','-p','hyperbrep','--release','--all-features','--benches','--message-format=json'],cwd=root,env=env,capture_output=True,text=True,check=True)
(out/'bench-artifacts.jsonl').write_text(build.stdout)
artifacts=[json.loads(line) for line in build.stdout.splitlines()]
def executable(name):
    found=[item['executable'] for item in artifacts if item.get('reason')=='compiler-artifact' and item['target']['name']==name and item['target']['kind']==['bench'] and item.get('executable')]
    assert len(found)==1,(name,found)
    return Path(found[0])

baseline=Path('/tmp/hyperbrep-archive-admission-kernel')
candidate=Path('/tmp/hyperbrep-archive-structure-kernel')
shutil.copy2(executable('kernel'),candidate)
feature=Path('/tmp/hyperbrep-archive-structure-bench');shutil.copy2(executable('archive_limits'),feature)
metadata={}
for name,path in [('baseline',baseline),('candidate',candidate),('archive_structure',feature)]:
    metadata[name]={'path':str(path),'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
(out/'executables.json').write_text(json.dumps(metadata,indent=2)+'\n')
assert metadata['baseline']['sha256']=='bcf02c12ac2d719defa92be74f2dc7c1ad96432734d3bcea0ba167e64ad87a24'
spec=importlib.util.spec_from_file_location('benchmark_receipt',root/'crates/hyperbrep/tools/benchmark_receipt.py');m=importlib.util.module_from_spec(spec);sys.modules[spec.name]=m;spec.loader.exec_module(m)
expected=m.expected_cases((root/'crates/hyperbrep/benches/kernel.rs').read_text())
records=[]; rows={'baseline':[],'candidate':[]}; times={}
for trial in range(1,4):
    for name,exe in ([('baseline',baseline),('candidate',candidate)] if trial%2 else [('candidate',candidate),('baseline',baseline)]):
        label=f'{name}-{trial}';print('running',label,flush=True)
        started=time.time();cmd=['/tmp/hyperbrep-selected-archive-measure',str(out/(label+'-resources.json')),'taskset','-c','0',str(exe)]
        with (out/(label+'.log')).open('w') as log: run=subprocess.run(cmd,cwd=root,stdout=log,stderr=subprocess.STDOUT)
        records.append(dict(name=label,command=cmd,exit_code=run.returncode,elapsed_seconds=time.time()-started))
        (out/'benchmark-commands.json').write_text(json.dumps(records,indent=2)+'\n')
        if run.returncode: raise SystemExit(f'{label} failed; see log')
        rows[name].append(m.read_receipt((out/(label+'.log')).read_text(),expected))
        if rows['baseline'] and rows['candidate']:m.compare(rows['baseline'][0],rows['candidate'][-1])
        print(label,'passed 66 rows',flush=True)
comparison=[]
for i,case in enumerate(expected):
    b=statistics.median(r[i].per_iteration_ns for r in rows['baseline']);c=statistics.median(r[i].per_iteration_ns for r in rows['candidate']);comparison.append(dict(case=case,baseline_median_ns=b,candidate_median_ns=c,ratio=c/b))
(out/'comparison.json').write_text(json.dumps({'all_66_receipts_equal':True,'median_case_ratio':statistics.median(r['ratio'] for r in comparison),'cases':comparison},indent=2)+'\n')
feature_baseline=Path('/tmp/hyperbrep-archive-admission-bench')
assert hashlib.sha256(feature_baseline.read_bytes()).hexdigest()=='c060710f692ae0a42cb6787f89afb6d64da8cd0bc5e9ef702a2336dc0e323770'
metadata['input_limits_baseline']={'path':str(feature_baseline),'bytes':feature_baseline.stat().st_size,'sha256':hashlib.sha256(feature_baseline.read_bytes()).hexdigest()}
(out/'executables.json').write_text(json.dumps(metadata,indent=2)+'\n')
old_source=subprocess.check_output(['git','show','155f15e4f:crates/hyperbrep/benches/archive_limits.rs'],cwd=root,text=True)
old_expected=m.expected_cases(old_source)
new_expected=m.expected_cases((root/'crates/hyperbrep/benches/archive_limits.rs').read_text())
assert len(old_expected)==4 and len(new_expected)==8 and new_expected[:4]==old_expected
feature_rows=[];old_feature_rows=[]
for trial in range(1,4):
    cases=[('input_limits_baseline',feature_baseline),('archive_structure',feature)]
    if trial%2==0:cases.reverse()
    for kind,exe in cases:
        label=f'{kind}-{trial}';print('running',label,flush=True)
        started=time.time();cmd=['/tmp/hyperbrep-selected-archive-measure',str(out/(label+'-resources.json')),'taskset','-c','0',str(exe)]
        with (out/(label+'.log')).open('w') as log:run=subprocess.run(cmd,cwd=root,stdout=log,stderr=subprocess.STDOUT)
        records.append(dict(name=label,command=cmd,exit_code=run.returncode,elapsed_seconds=time.time()-started));(out/'benchmark-commands.json').write_text(json.dumps(records,indent=2)+'\n')
        assert run.returncode==0,label
        parsed=m.read_receipt((out/(label+'.log')).read_text(),old_expected if kind=='input_limits_baseline' else new_expected)
        (old_feature_rows if kind=='input_limits_baseline' else feature_rows).append(parsed)
        if old_feature_rows and feature_rows:m.compare(old_feature_rows[0],feature_rows[-1][:4])
        if kind=='archive_structure' and len(feature_rows)>1:m.compare(feature_rows[0],parsed)
comparison=[]
for index,case in enumerate(old_expected):
    baseline=statistics.median(r[index].per_iteration_ns for r in old_feature_rows);candidate=statistics.median(r[index].per_iteration_ns for r in feature_rows)
    comparison.append(dict(case=case,baseline_median_ns=baseline,candidate_median_ns=candidate,ratio=candidate/baseline))
(out/'admission-comparison.json').write_text(json.dumps(comparison,indent=2)+'\n')
(out/'feature-cost.json').write_text(json.dumps([dict(case=r.name,median_ns=statistics.median(rows[i].per_iteration_ns for rows in feature_rows),checksum=r.checksum,iterations=r.iterations) for i,r in enumerate(feature_rows[0])],indent=2)+'\n')
print('all benchmark processes passed',flush=True)

# Existing complete replay cohorts isolate the added scanner's cost on actual
# native and selected archives. Keep the old executable frozen before rebuilds.
positive_baseline=Path('/tmp/hyperbrep-admitted-spline-replay-bench')
positive_candidate=Path('/tmp/hyperbrep-structure-spline-replay-bench')
shutil.copy2(executable('spline_replay_cost'),positive_candidate)
assert hashlib.sha256(positive_baseline.read_bytes()).hexdigest()=='b8384b4abe16307493eec4177c0df665ecab27bb6332b744588d4c2869bd0cc5'
for name,path in [('positive_baseline',positive_baseline),('positive_candidate',positive_candidate)]:
    metadata[name]={'path':str(path),'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
(out/'executables.json').write_text(json.dumps(metadata,indent=2)+'\n')
positive_expected=m.expected_cases((root/'crates/hyperbrep/benches/spline_replay_cost.rs').read_text())
positive_rows={'positive_baseline':[],'positive_candidate':[]}
for trial in range(1,4):
    cases=[('positive_baseline',positive_baseline),('positive_candidate',positive_candidate)]
    if trial%2==0:cases.reverse()
    for name,exe in cases:
        label=f'{name}-{trial}';print('running',label,flush=True)
        started=time.time();cmd=['/tmp/hyperbrep-selected-archive-measure',str(out/(label+'-resources.json')),'taskset','-c','0',str(exe)]
        with (out/(label+'.log')).open('w') as log:run=subprocess.run(cmd,cwd=root,stdout=log,stderr=subprocess.STDOUT)
        records.append(dict(name=label,command=cmd,exit_code=run.returncode,elapsed_seconds=time.time()-started));(out/'benchmark-commands.json').write_text(json.dumps(records,indent=2)+'\n')
        assert run.returncode==0,label
        parsed=m.read_receipt((out/(label+'.log')).read_text(),positive_expected)
        positive_rows[name].append(parsed)
        m.compare(positive_rows['positive_baseline'][0],parsed)
positive_comparison=[]
for i,case in enumerate(positive_expected):
    b=statistics.median(r[i].per_iteration_ns for r in positive_rows['positive_baseline']);c=statistics.median(r[i].per_iteration_ns for r in positive_rows['positive_candidate']);positive_comparison.append(dict(case=case,baseline_median_ns=b,candidate_median_ns=c,ratio=c/b))
(out/'positive-comparison.json').write_text(json.dumps(positive_comparison,indent=2)+'\n')
print('positive archive comparisons passed',flush=True)
