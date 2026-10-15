import os, subprocess, time, json, hashlib, statistics, importlib.util, sys, shutil
from pathlib import Path
root=Path('/mnt/development/csgrs'); out=Path('/tmp/hyperbrep-spline-replay-evidence')
env=os.environ.copy()
env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'], CARGO_HOME='/tmp/hyperbrep-review-cargo', CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
build=subprocess.run(['cargo','build','--offline','--locked','-p','hyperbrep','--release','--all-features','--benches','--message-format=json'],cwd=root,env=env,capture_output=True,text=True,check=True)
(out/'bench-artifacts.jsonl').write_text(build.stdout)
artifacts=[json.loads(line) for line in build.stdout.splitlines()]
def executable(name):
    found=[item['executable'] for item in artifacts if item.get('reason')=='compiler-artifact' and item['target']['name']==name and item['target']['kind']==['bench'] and item.get('executable')]
    assert len(found)==1,(name,found)
    return Path(found[0])

baseline=Path('/tmp/hyperbrep-selected-solids-kernel')
candidate=Path('/tmp/hyperbrep-spline-replay-kernel')
shutil.copy2(executable('kernel'),candidate)
feature=Path('/tmp/hyperbrep-spline-replay-bench');shutil.copy2(executable('spline_replay_cost'),feature)
metadata={}
for name,path in [('baseline',baseline),('candidate',candidate),('spline_replay',feature)]:
    metadata[name]={'path':str(path),'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
(out/'executables.json').write_text(json.dumps(metadata,indent=2)+'\n')
assert metadata['baseline']['sha256']=='1073700a697cb0f93132cae0d45d767b21db5f1a689e1f63d826d8928ea6a1ac'
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
feature_rows=[]
for trial in range(1,4):
    label=f'spline_replay-{trial}';print('running',label,flush=True)
    started=time.time();cmd=['/tmp/hyperbrep-selected-archive-measure',str(out/(label+'-resources.json')),'taskset','-c','0',str(feature)]
    with (out/(label+'.log')).open('w') as log:run=subprocess.run(cmd,cwd=root,stdout=log,stderr=subprocess.STDOUT)
    records.append(dict(name=label,command=cmd,exit_code=run.returncode,elapsed_seconds=time.time()-started));(out/'benchmark-commands.json').write_text(json.dumps(records,indent=2)+'\n')
    if run.returncode:raise SystemExit(f'{label} failed')
    parsed=m.read_receipt((out/(label+'.log')).read_text(),m.expected_cases((root/'crates/hyperbrep/benches/spline_replay_cost.rs').read_text()))
    # Source interleaves each encode/replay pair; fixture output follows that order.
    feature_rows.append(parsed)
    if len(feature_rows)>1:m.compare(feature_rows[0],parsed)
(out/'feature-cost.json').write_text(json.dumps([dict(case=r.name,median_ns=statistics.median(rows[i].per_iteration_ns for rows in feature_rows),checksum=r.checksum,iterations=r.iterations) for i,r in enumerate(feature_rows[0])],indent=2)+'\n')
print('all benchmark processes passed',flush=True)
