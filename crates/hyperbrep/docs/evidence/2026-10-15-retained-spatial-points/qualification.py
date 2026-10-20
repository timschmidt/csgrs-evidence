from pathlib import Path
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys

root = Path('/mnt/development/csgrs')
out = Path('/tmp/hyperbrep-spatial-qualification')
out.mkdir(exist_ok=False)
commands = [
    ('tests', ['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--quiet'], {}),
    ('default-tests', ['cargo','test','--offline','--locked','-p','hyperbrep','--quiet'], {}),
    ('release-regressions', ['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--release','--test','retained_points'], {}),
    ('clippy', ['cargo','clippy','--offline','--locked','-p','hyperbrep','--all-targets','--all-features','--','-D','warnings'], {}),
    ('docs', ['cargo','doc','--offline','--locked','-p','hyperbrep','--all-features','--no-deps'], {'RUSTDOCFLAGS':'-D warnings'}),
    ('wasm', ['cargo','build','--offline','--locked','-p','hyperbrep','--all-features','--lib','--target','wasm32-unknown-unknown'], {}),
    ('fuzz-clippy', ['cargo','clippy','--offline','--locked','--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--bins','--','-D','warnings'], {}),
    ('fmt', ['cargo','fmt','--all','--','--check'], {}),
    ('fuzz-fmt', ['cargo','fmt','--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--','--check'], {}),
    ('benchmark-build', ['cargo','bench','--offline','--locked','-p','hyperbrep','--all-features','--bench','kernel','--bench','work_budget','--bench','retained_parameters','--bench','retained_points','--no-run'], {}),
]
results=[]
def run(name, args, environment=None, resources=None):
    print('Starting '+name, flush=True)
    run_env = os.environ.copy(); run_env.update(environment or {})
    with (out/(name+'.log')).open('w') as log:
        process = subprocess.run(args,cwd=root,env=run_env,stdout=log,stderr=subprocess.STDOUT)
    record = {'name':name,'args':args,'environment':environment or {},'exit_code':process.returncode,'log':name+'.log'}
    if resources:
        record['resources']=resources
        assert json.loads((out/resources).read_text())['exit_code']==process.returncode
    results.append(record)
    (out/'commands.json').write_text(json.dumps(results,indent=2)+'\n')
    print(f'{name}: exit {process.returncode}',flush=True)
    if process.returncode: sys.exit(process.returncode)

for name,args,environment in commands: run(name,args,environment)

build_log=(out/'benchmark-build.log').read_text()
def copy_executable(target, destination):
    match=re.search(r'Executable benches/'+target+r'\.rs \(([^)]+)\)',build_log)
    assert match,(target,build_log)
    executable=Path(destination)
    shutil.copy2(match[1],executable)
    return executable

candidate=copy_executable('kernel','/tmp/hyperbrep-spatial-kernel')
baseline=Path('/tmp/hyperbrep-retained-kernel')
def executable_info(path):
    return {'path':str(path),'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
executables={name:executable_info(path) for name,path in [('baseline',baseline),('candidate',candidate)]}
assert executables['baseline']['sha256']=='f2769684f774071ac0e65a97cfd22f7ed9404e91ae43e166d4264684944eae06'
(out/'executables.json').write_text(json.dumps(executables,indent=2)+'\n')
# Preserve the exact harness migration for review: source is not byte-identical.
diff=subprocess.check_output(['git','diff','7bc780d89','--','crates/hyperbrep/benches/kernel.rs'],cwd=root,text=True)
(out/'kernel-harness.patch').write_text(diff)
old_source=subprocess.check_output(['git','show','7bc780d89:crates/hyperbrep/benches/kernel.rs'],cwd=root,text=True)
new_source=(root/'crates/hyperbrep/benches/kernel.rs').read_text()
sys.path.insert(0,str(root/'crates/hyperbrep/tools'))
import benchmark_receipt as checker
expected=checker.expected_cases(new_source)
assert expected==checker.expected_cases(old_source)
assert len(expected)==66
reference=None
for trial in range(1,4):
    for name in (['baseline','candidate'] if trial%2 else ['candidate','baseline']):
        label=f'{name}-{trial}'
        resource=label+'-resources.json'
        args=['/tmp/hyperbrep-ownership-measure',str(out/resource),'taskset','-c','0',executables[name]['path']]
        run(label,args,resources=resource)
        receipt=checker.read_receipt((out/(label+'.log')).read_text(),expected)
        if reference is None: reference=receipt
        checker.compare(reference,receipt)
        print(label+': all 66 receipts agree',flush=True)

for target,checksum_values in [('retained_points',[1000]*7),('retained_parameters',[250,250,0,500]),('work_budget',[10000,10000,2500,2500])]:
    executable=copy_executable(target,'/tmp/hyperbrep-spatial-'+target+'-benchmark')
    (out/(target+'-executable.json')).write_text(json.dumps(executable_info(executable),indent=2)+'\n')
    expected=checker.expected_cases((root/('crates/hyperbrep/benches/'+target+'.rs')).read_text())
    assert len(expected)==len(checksum_values)
    reference=None
    for trial in range(1,4):
        label=f'{target}-{trial}'
        resource=label+'-resources.json'
        args=['/tmp/hyperbrep-ownership-measure',str(out/resource),'taskset','-c','0',str(executable)]
        if target=='work_budget' and trial%2==0: args.append('--scoped-first')
        run(label,args,resources=resource)
        receipt=checker.read_receipt((out/(label+'.log')).read_text(),expected)
        if reference is None: reference=receipt
        checker.compare(reference,receipt)
        assert [row.checksum for row in receipt]==checksum_values
        print(label+': '+str(len(expected))+' receipts verified',flush=True)
print('Spatial point qualification and measured trials completed.',flush=True)
