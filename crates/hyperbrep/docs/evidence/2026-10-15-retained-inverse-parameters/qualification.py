from pathlib import Path
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import time

root = Path('/mnt/development/csgrs')
out = Path('/tmp/hyperbrep-retained-qualification-final')
out.mkdir(exist_ok=False)
commands = [
    ('tests', ['cargo', 'test', '--offline', '--locked', '-p', 'hyperbrep', '--all-features', '--quiet'], {}),
    ('release-regressions', ['cargo', 'test', '--offline', '--locked', '-p', 'hyperbrep', '--all-features', '--release', '--test', 'retained_parameters'], {}),
    ('curve-charts', ['cargo', 'test', '--offline', '--locked', '-p', 'hypercurve', '--test', 'parameter_charts'], {}),
    ('curve-parameter-tests', ['cargo', 'test', '--offline', '--locked', '-p', 'hypercurve', '--lib', 'bezier_parameter::', '--quiet'], {}),
    ('curve-clippy', ['cargo', 'clippy', '--offline', '--locked', '-p', 'hypercurve', '--all-targets', '--all-features', '--', '-D', 'warnings'], {}),
    ('clippy', ['cargo', 'clippy', '--offline', '--locked', '-p', 'hyperbrep', '--all-targets', '--all-features', '--', '-D', 'warnings'], {}),
    ('docs', ['cargo', 'doc', '--offline', '--locked', '-p', 'hyperbrep', '-p', 'hypercurve', '--all-features', '--no-deps'], {'RUSTDOCFLAGS': '-D warnings'}),
    ('wasm', ['cargo', 'build', '--offline', '--locked', '-p', 'hyperbrep', '--all-features', '--lib', '--target', 'wasm32-unknown-unknown'], {}),
    ('fuzz-clippy', ['cargo', 'clippy', '--offline', '--locked', '--manifest-path', 'crates/hyperbrep/fuzz/Cargo.toml', '--bins', '--', '-D', 'warnings'], {}),
    ('fmt', ['cargo', 'fmt', '--all', '--', '--check'], {}),
    ('fuzz-fmt', ['cargo', 'fmt', '--manifest-path', 'crates/hyperbrep/fuzz/Cargo.toml', '--', '--check'], {}),
    ('budget-benchmark-build', ['cargo', 'bench', '--offline', '--locked', '-p', 'hyperbrep', '--all-features', '--bench', 'work_budget', '--no-run'], {}),
    ('retained-benchmark-build', ['cargo', 'bench', '--offline', '--locked', '-p', 'hyperbrep', '--all-features', '--bench', 'retained_parameters', '--no-run'], {}),
    ('benchmark-build', ['cargo', 'bench', '--offline', '--locked', '-p', 'hyperbrep', '--all-features', '--bench', 'kernel', '--no-run'], {}),
]
results=[]
for name, args, environment in commands:
    print('Starting '+name, flush=True)
    run_env=os.environ.copy(); run_env.update(environment)
    with (out / (name+'.log')).open('w') as log:
        result=subprocess.run(args, cwd=root, env=run_env, stdout=log, stderr=subprocess.STDOUT)
    results.append({'name':name,'args':args,'environment':environment,'exit_code':result.returncode,'log':name+'.log'})
    (out/'commands.json').write_text(json.dumps(results,indent=2)+'\n')
    print(f'{name}: exit {result.returncode}',flush=True)
    if result.returncode:sys.exit(result.returncode)

build_log=(out/'benchmark-build.log').read_text()
match=re.search(r'Executable benches/kernel\.rs \(([^)]+)\)',build_log)
assert match,build_log
candidate=Path('/tmp/hyperbrep-retained-kernel')
shutil.copy2(match[1],candidate)
baseline=Path('/tmp/hyperbrep-context-kernel')
executables={name:{'path':str(path),'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()} for name,path in [('baseline',baseline),('candidate',candidate)]}
(out/'executables.json').write_text(json.dumps(executables,indent=2)+'\n')
sys.path.insert(0,str(root/'crates/hyperbrep/tools'))
import benchmark_receipt as checker
expected=checker.expected_cases((root/'crates/hyperbrep/benches/kernel.rs').read_text())
assert len(expected)==66
reference=None
for trial in range(1,4):
    order=['baseline','candidate'] if trial%2 else ['candidate','baseline']
    for name in order:
        label=f'{name}-{trial}'
        print('Starting pinned '+label,flush=True)
        args=['/tmp/hyperbrep-ownership-measure',str(out/(label+'-resources.json')),'taskset','-c','0',executables[name]['path']]
        with (out/(label+'.log')).open('w') as log:
            process=subprocess.run(args,cwd=root,stdout=log,stderr=subprocess.STDOUT)
        resources=json.loads((out/(label+'-resources.json')).read_text())
        assert resources['exit_code']==process.returncode
        results.append({'name':label,'args':args,'exit_code':process.returncode,'log':label+'.log','resources':label+'-resources.json'})
        (out/'commands.json').write_text(json.dumps(results,indent=2)+'\n')
        print(f'{label}: exit {process.returncode}',flush=True)
        if process.returncode:sys.exit(process.returncode)
        receipt=checker.read_receipt((out/(label+'.log')).read_text(),expected)
        if reference is None:reference=receipt
        checker.compare(reference,receipt)
        print(f'{label}: all {len(receipt)} rows retain counts, units and checksums',flush=True)
print('All retained-parameter checks and paired trials completed.',flush=True)


for target, checksum_values in [('retained_parameters',[250,250,0,500]),('work_budget',[10000,10000,2500,2500])]:
    build_name='retained-benchmark-build' if target=='retained_parameters' else 'budget-benchmark-build'
    build_log=(out/(build_name+'.log')).read_text()
    match=re.search(r'Executable benches/'+target+r'\.rs \(([^)]+)\)',build_log)
    assert match,build_log
    executable=Path('/tmp/hyperbrep-retained-'+target+'-benchmark')
    shutil.copy2(match[1],executable)
    (out/(target+'-executable.json')).write_text(json.dumps({'path':str(executable),'bytes':executable.stat().st_size,'sha256':hashlib.sha256(executable.read_bytes()).hexdigest()},indent=2)+'\n')
    expected=checker.expected_cases((root/('crates/hyperbrep/benches/'+target+'.rs')).read_text())
    assert len(expected)==4
    reference=None
    for trial in range(1,4):
        name=f'{target}-{trial}'
        args=['/tmp/hyperbrep-ownership-measure',str(out/(name+'-resources.json')),'taskset','-c','0',str(executable)]
        if target=='work_budget' and trial%2==0: args.append('--scoped-first')
        with (out/(name+'.log')).open('w') as log:
            process=subprocess.run(args,cwd=root,stdout=log,stderr=subprocess.STDOUT)
        results.append({'name':name,'args':args,'exit_code':process.returncode,'log':name+'.log','resources':name+'-resources.json'})
        (out/'commands.json').write_text(json.dumps(results,indent=2)+'\n')
        assert process.returncode==0,(out/(name+'.log')).read_text()
        receipt=checker.read_receipt((out/(name+'.log')).read_text(),expected)
        if reference is None:reference=receipt
        checker.compare(reference,receipt)
        assert [row.checksum for row in receipt]==checksum_values
        print(name+': four rows verified',flush=True)
