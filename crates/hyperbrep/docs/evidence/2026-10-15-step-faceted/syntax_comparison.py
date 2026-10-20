"""Rebuild HEAD syntax and current syntax with equivalent isolated Cargo manifests."""
import hashlib,importlib.util,json,os,shutil,statistics,subprocess,sys,time
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-syntax-comparison-target')
baseline='cd1cc8d42c35c7204ba5331118ecfaaee4096741'
records=[];executables={}
files=subprocess.check_output(['git','ls-tree','-r','--name-only',baseline,'crates/hyperbrep-io'],cwd=root,text=True).splitlines()
for kind in ['baseline','candidate']:
    stage=Path('/tmp/hyperbrep-syntax-'+kind);stage.mkdir(exist_ok=True)
    for item in files:
        rel=Path(item).relative_to('crates/hyperbrep-io')
        if rel.parts[0] not in ['src','benches'] and str(rel) not in ['Cargo.toml','README.md']:continue
        data=subprocess.check_output(['git','show',baseline+':'+item],cwd=root) if kind=='baseline' else (root/item).read_bytes()
        path=stage/rel;path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(data)
    if kind=='candidate':shutil.copytree(root/'crates/hyperbrep-io/src/step',stage/'src/step',dirs_exist_ok=True)
    manifest=(stage/'Cargo.toml').read_text()
    for dep in ['hyperreal','hypercurve','hyperbrep']:manifest=manifest.replace(f'path = "../{dep}"',f'path = "{root}/crates/{dep}"')
    # Only the unchanged syntax bench is used in this isolated comparison.
    manifest=manifest.replace('\n[[bench]]\nname = "faceted"\nharness = false\n','\n')
    manifest+='\n[workspace]\n[profile.release]\nopt-level = 3\ndebug = false\ndebug-assertions = false\noverflow-checks = false\n'
    (stage/'Cargo.toml').write_text(manifest);(stage/'Cargo.lock').write_bytes((root/'Cargo.lock').read_bytes())
    (out/f'syntax-{kind}-Cargo.toml').write_text(manifest)
    cmd=['cargo','build','--offline','--manifest-path',str(stage/'Cargo.toml'),'--release','--bench','part21','--message-format=json']
    started=time.time();p=subprocess.run(cmd,cwd=root,env=env,capture_output=True,text=True)
    (out/f'syntax-{kind}-build.log').write_text(p.stderr)
    (out/f'syntax-{kind}-artifacts.jsonl').write_text(p.stdout)
    records.append(dict(command=cmd,exit_code=p.returncode,elapsed_seconds=time.time()-started))
    assert p.returncode==0,p.stderr
    items=[json.loads(x) for x in p.stdout.splitlines()]
    path=Path(next(x['executable'] for x in items if x.get('reason')=='compiler-artifact' and x['target']['name']=='part21' and x['target']['kind']==['bench'] and x.get('executable')))
    frozen=stage/'part21-bench';shutil.copy2(path,frozen);executables[kind]=frozen
    (out/f'syntax-{kind}-executable.json').write_text(json.dumps(dict(bytes=frozen.stat().st_size,sha256=hashlib.sha256(frozen.read_bytes()).hexdigest(),manifest_sha256=hashlib.sha256(manifest.encode()).hexdigest()),indent=2)+'\n')
spec=importlib.util.spec_from_file_location('receipt',root/'crates/hyperbrep/tools/benchmark_receipt.py');m=importlib.util.module_from_spec(spec);sys.modules[spec.name]=m;spec.loader.exec_module(m)
expected=m.expected_cases((root/'crates/hyperbrep-io/benches/part21.rs').read_text());assert len(expected)==4
rows={k:[] for k in executables}
for trial in range(1,4):
    order=['baseline','candidate'] if trial%2 else ['candidate','baseline']
    for kind in order:
        label=f'syntax-{kind}-{trial}';cmd=['taskset','-c','0',str(executables[kind])]
        started=time.time();p=subprocess.run(cmd,cwd=root,capture_output=True,text=True)
        (out/(label+'.log')).write_text(p.stdout+p.stderr)
        records.append(dict(command=cmd,label=label,exit_code=p.returncode,elapsed_seconds=time.time()-started))
        assert p.returncode==0,p.stderr
        parsed=m.read_receipt(p.stdout,expected);rows[kind].append(parsed)
        m.compare(rows['baseline'][0],parsed)
costs=[]
for i,case in enumerate(expected):
    b=statistics.median(x[i].elapsed_ns/x[i].iterations for x in rows['baseline']);c=statistics.median(x[i].elapsed_ns/x[i].iterations for x in rows['candidate'])
    costs.append(dict(case=case,iterations=rows['candidate'][0][i].iterations,checksum=rows['candidate'][0][i].checksum,baseline_median_ns=b,candidate_median_ns=c,ratio=c/b,baseline_reported_floor_ns=statistics.median(x[i].per_iteration_ns for x in rows['baseline']),candidate_reported_floor_ns=statistics.median(x[i].per_iteration_ns for x in rows['candidate'])))
(out/'syntax-costs.json').write_text(json.dumps(costs,indent=2)+'\n')
(out/'syntax-commands.json').write_text(json.dumps(dict(baseline=baseline,commands=records,scope='Three alternating CPU-0 pairs, isolated equivalent Cargo contexts, unchanged syntax benchmark; not faceted-import performance baseline'),indent=2)+'\n')
print(json.dumps(costs,indent=2))
