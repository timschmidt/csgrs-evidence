from pathlib import Path
import importlib.util, json, statistics, subprocess, sys, time
root=Path('/mnt/development/csgrs');out=Path('/tmp/hyperbrep-archive-admission-evidence')
spec=importlib.util.spec_from_file_location('benchmark_receipt',root/'crates/hyperbrep/tools/benchmark_receipt.py');m=importlib.util.module_from_spec(spec);sys.modules[spec.name]=m;spec.loader.exec_module(m)
expected=m.expected_cases((root/'crates/hyperbrep/benches/kernel.rs').read_text())
records=json.loads((out/'benchmark-commands.json').read_text())
executables=json.loads((out/'executables.json').read_text())
for trial in range(4,7):
    for kind in (['candidate','baseline'] if trial%2==0 else ['baseline','candidate']):
        label=f'{kind}-{trial}';print('running',label,flush=True)
        cmd=['/tmp/hyperbrep-selected-archive-measure',str(out/(label+'-resources.json')),'taskset','-c','0',executables[kind]['path']];started=time.time()
        with (out/(label+'.log')).open('w') as log:run=subprocess.run(cmd,cwd=root,stdout=log,stderr=subprocess.STDOUT)
        records.append(dict(name=label,command=cmd,exit_code=run.returncode,elapsed_seconds=time.time()-started));(out/'benchmark-commands.json').write_text(json.dumps(records,indent=2)+'\n')
        assert run.returncode==0,label
        m.compare(m.read_receipt((out/'baseline-1.log').read_text(),expected),m.read_receipt((out/(label+'.log')).read_text(),expected))
        print(label,'matched all 66 receipts',flush=True)
for name,trials in [('repeat-comparison',range(4,7)),('combined-comparison',range(1,7))]:
    rows={kind:[m.read_receipt((out/f'{kind}-{trial}.log').read_text(),expected) for trial in trials] for kind in ['baseline','candidate']}
    cases=[]
    for index,case in enumerate(expected):
        baseline=statistics.median(row[index].per_iteration_ns for row in rows['baseline']);candidate=statistics.median(row[index].per_iteration_ns for row in rows['candidate'])
        cases.append(dict(case=case,baseline_median_ns=baseline,candidate_median_ns=candidate,ratio=candidate/baseline))
    (out/(name+'.json')).write_text(json.dumps(dict(all_66_receipts_equal=True,median_case_ratio=statistics.median(row['ratio'] for row in cases),cases=cases),indent=2)+'\n')
    print(name,'median',statistics.median(row['ratio'] for row in cases),'maximum',max(row['ratio'] for row in cases),flush=True)
