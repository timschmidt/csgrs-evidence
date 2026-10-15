from pathlib import Path
import json
import subprocess

root = Path('/mnt/development/csgrs')
out = Path('/tmp/hyperbrep-selected-topology-final-qualification')
records = json.loads((out/'commands.json').read_text())
assert len(records) == 28 and all(record['exit_code'] == 0 for record in records)
commands = [
    ('final-tests', ['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--quiet']),
    ('final-default-tests', ['cargo','test','--offline','--locked','-p','hyperbrep','--quiet']),
    ('final-release-regressions', ['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--release','--test','selected_topology']),
    ('final-clippy', ['cargo','clippy','--offline','--locked','-p','hyperbrep','--all-targets','--all-features','--','-D','warnings']),
    ('final-fmt', ['cargo','fmt','--all','--','--check']),
    ('final-fuzz-fmt', ['cargo','fmt','--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--','--check']),
]
for name, args in commands:
    assert not (out/(name+'.log')).exists()
    print('Starting '+name, flush=True)
    with (out/(name+'.log')).open('w') as log:
        result = subprocess.run(args,cwd=root,stdout=log,stderr=subprocess.STDOUT)
    records.append({'name':name,'args':args,'exit_code':result.returncode,'log':name+'.log','reason':'Final native scalar fast paths, source restored after four rejected mutants, and added curved planar pcurve reflection coverage.'})
    (out/'commands.json').write_text(json.dumps(records,indent=2)+'\n')
    print(f'{name}: exit {result.returncode}',flush=True)
    if result.returncode:
        raise SystemExit(result.returncode)
