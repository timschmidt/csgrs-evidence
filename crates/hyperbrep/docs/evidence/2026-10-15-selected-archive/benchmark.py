import os, subprocess, time, json, hashlib, statistics, importlib.util, sys, shutil
from pathlib import Path
root=Path('/mnt/development/csgrs'); out=Path('/tmp/hyperbrep-selected-archive-evidence')
benchdir=Path('/tmp/hyperbrep-review-target/release/deps')
def executable(name):
    paths=[p for p in benchdir.glob(name+'-*') if p.is_file() and os.access(p,os.X_OK) and p.suffix=='']
    return max(paths,key=lambda p:p.stat().st_mtime)
baseline=Path('/tmp/hyperbrep-selected-topology-final-kernel')
candidate=Path('/tmp/hyperbrep-selected-archive-kernel')
shutil.copy2(executable('kernel'),candidate)
feature=Path('/tmp/hyperbrep-selected-archive-bench');shutil.copy2(executable('selected_archive'),feature)
metadata={}
for name,path in [('baseline',baseline),('candidate',candidate),('selected_archive',feature)]:
    metadata[name]={'path':str(path),'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
(out/'executables.json').write_text(json.dumps(metadata,indent=2)+'\n')
assert metadata['baseline']['sha256']=='f8ce6b2fe34c7b9ff1fd34c9351b53415c9b6151b17acc1f551b8563d817ce39'
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
    label=f'selected_archive-{trial}';print('running',label,flush=True)
    started=time.time();cmd=['/tmp/hyperbrep-selected-archive-measure',str(out/(label+'-resources.json')),'taskset','-c','0',str(feature)]
    with (out/(label+'.log')).open('w') as log:run=subprocess.run(cmd,cwd=root,stdout=log,stderr=subprocess.STDOUT)
    records.append(dict(name=label,command=cmd,exit_code=run.returncode,elapsed_seconds=time.time()-started));(out/'benchmark-commands.json').write_text(json.dumps(records,indent=2)+'\n')
    if run.returncode:raise SystemExit(f'{label} failed')
    parsed=m.read_receipt((out/(label+'.log')).read_text(),m.expected_cases((root/'crates/hyperbrep/benches/selected_archive.rs').read_text()))
    # Source interleaves each encode/replay pair; fixture output follows that order.
    feature_rows.append(parsed)
    if len(feature_rows)>1:m.compare(feature_rows[0],parsed)
(out/'feature-cost.json').write_text(json.dumps([dict(case=r.name,median_ns=statistics.median(rows[i].per_iteration_ns for rows in feature_rows),checksum=r.checksum,iterations=r.iterations) for i,r in enumerate(feature_rows[0])],indent=2)+'\n')
print('all benchmark processes passed',flush=True)
