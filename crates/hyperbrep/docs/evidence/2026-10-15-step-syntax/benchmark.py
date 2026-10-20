from pathlib import Path
import os,json,subprocess,time,hashlib,importlib.util,sys,statistics
root=Path('/mnt/development/csgrs');out=Path('/tmp/hyperbrep-step-syntax-evidence')
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
build=subprocess.run(['cargo','build','--offline','--locked','-p','hyperbrep-io','--release','--benches','--message-format=json'],cwd=root,env=env,capture_output=True,text=True)
(out/'bench-build.log').write_text(build.stderr);(out/'bench-artifacts.jsonl').write_text(build.stdout);assert build.returncode==0,build.stderr
items=[json.loads(line) for line in build.stdout.splitlines()]
paths=[i['executable'] for i in items if i.get('reason')=='compiler-artifact' and i['target']['name']=='part21' and i['target']['kind']==['bench'] and i.get('executable')];assert len(paths)==1
exe=Path(paths[0]);(out/'executable.json').write_text(json.dumps(dict(path=str(exe),bytes=exe.stat().st_size,sha256=hashlib.sha256(exe.read_bytes()).hexdigest()),indent=2)+'\n')
spec=importlib.util.spec_from_file_location('receipt',root/'crates/hyperbrep/tools/benchmark_receipt.py');m=importlib.util.module_from_spec(spec);sys.modules[spec.name]=m;spec.loader.exec_module(m)
expected=m.expected_cases((root/'crates/hyperbrep-io/benches/part21.rs').read_text());assert len(expected)==4
baseline=Path('/tmp/hyperbrep-part21-per-record-bench')
initial=json.loads((out/'per-record-frames/executable.json').read_text())
assert hashlib.sha256(baseline.read_bytes()).hexdigest()==initial['sha256']
records=[];rows={'baseline':[],'candidate':[]}
for trial in range(1,4):
    cases=[('baseline',baseline),('candidate',exe)]
    if trial%2==0:cases.reverse()
    for kind,path in cases:
        label=f'{kind}-{trial}';print('running',label,flush=True);started=time.time()
        cmd=['/tmp/hyperbrep-selected-archive-measure',str(out/(label+'-resources.json')),'taskset','-c','0',str(path)]
        with (out/(label+'.log')).open('w') as log:run=subprocess.run(cmd,cwd=root,stdout=log,stderr=subprocess.STDOUT)
        records.append(dict(name=label,command=cmd,exit_code=run.returncode,elapsed_seconds=time.time()-started));(out/'benchmark-commands.json').write_text(json.dumps(records,indent=2)+'\n');assert run.returncode==0,label
        parsed=m.read_receipt((out/(label+'.log')).read_text(),expected);rows[kind].append(parsed);m.compare(rows['baseline'][0],parsed)
comparisons=[]
for i,case in enumerate(expected):
    b=statistics.median(r[i].per_iteration_ns for r in rows['baseline']);c=statistics.median(r[i].per_iteration_ns for r in rows['candidate'])
    comparisons.append(dict(case=case,iterations=rows['candidate'][0][i].iterations,checksum=rows['candidate'][0][i].checksum,baseline_median_ns=b,candidate_median_ns=c,ratio=c/b))
(out/'costs.json').write_text(json.dumps(comparisons,indent=2)+'\n')
print('all four receipts preserved across three matched pairs',flush=True)
