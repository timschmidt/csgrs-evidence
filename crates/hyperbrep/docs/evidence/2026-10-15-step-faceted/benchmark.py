"""Absolute costs for newly implemented imports; no equivalent prior importer baseline."""
import hashlib,importlib.util,json,os,re,statistics,subprocess,sys,time
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
cmd=['cargo','build','--offline','--locked','-p','hyperbrep-io','--release','--bench','faceted','--message-format=json']
p=subprocess.run(cmd,cwd=root,env=env,capture_output=True,text=True)
(out/'faceted-build.log').write_text(p.stderr);(out/'faceted-artifacts.jsonl').write_text(p.stdout);assert p.returncode==0,p.stderr
items=[json.loads(line) for line in p.stdout.splitlines()]
exe=Path(next(x['executable'] for x in items if x.get('reason')=='compiler-artifact' and x['target']['name']=='faceted' and x['target']['kind']==['bench'] and x.get('executable')))
(out/'faceted-executable.json').write_text(json.dumps(dict(path=str(exe),bytes=exe.stat().st_size,sha256=hashlib.sha256(exe.read_bytes()).hexdigest()),indent=2)+'\n')
launcher='/tmp/hyperbrep-faceted-measure'
subprocess.run(['cc','-O2','-Wall','-Wextra','-Werror',str(out/'measure.c'),'-o',launcher],check=True)
spec=importlib.util.spec_from_file_location('receipt',root/'crates/hyperbrep/tools/benchmark_receipt.py');m=importlib.util.module_from_spec(spec);sys.modules[spec.name]=m;spec.loader.exec_module(m)
expected=m.expected_cases((root/'crates/hyperbrep-io/benches/faceted.rs').read_text());assert len(expected)==7,expected
rows=[];records=[];allocations=[];fixture_rows=None
for trial in range(1,4):
    label=f'faceted-{trial}';cmd=[launcher,str(out/(label+'-resources.json')),'taskset','-c','0',str(exe)]
    print('running',label,flush=True);started=time.time();p=subprocess.run(cmd,cwd=root,capture_output=True,text=True)
    log=p.stdout+p.stderr;(out/(label+'.log')).write_text(log)
    records.append(dict(command=cmd,exit_code=p.returncode,elapsed_seconds=time.time()-started));assert p.returncode==0,log
    parsed=m.read_receipt(p.stdout,expected);rows.append(parsed);m.compare(rows[0],parsed)
    facts=[line for line in p.stdout.splitlines() if line.startswith('fixture ')]
    if fixture_rows is None:fixture_rows=facts
    assert facts==fixture_rows,(facts,fixture_rows)
    allocations.append({name:dict(calls=int(calls),requested_bytes=int(size)) for name,calls,size in re.findall(r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)',log)})
costs=[]
for i,case in enumerate(expected):
    iterations=rows[0][i].iterations
    costs.append(dict(case=case,iterations=iterations,checksum=rows[0][i].checksum,median_ns=statistics.median(x[i].per_iteration_ns for x in rows),allocation_calls_per_iteration=statistics.median(x[case]['calls']/iterations for x in allocations),requested_bytes_per_iteration=statistics.median(x[case]['requested_bytes']/iterations for x in allocations)))
(out/'faceted-costs.json').write_text(json.dumps(costs,indent=2)+'\n');(out/'benchmark-commands.json').write_text(json.dumps(records,indent=2)+'\n')
print(json.dumps(costs,indent=2))
