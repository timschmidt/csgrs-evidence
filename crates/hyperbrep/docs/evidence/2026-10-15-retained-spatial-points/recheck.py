from pathlib import Path
import json
import subprocess
import sys

root=Path('/mnt/development/csgrs')
out=Path('/tmp/hyperbrep-spatial-qualification')
records=json.loads((out/'commands.json').read_text())
assert len(records)==25 and all(record['exit_code']==0 for record in records)
commands=[
    ('final-tests',['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--quiet']),
    ('final-default-tests',['cargo','test','--offline','--locked','-p','hyperbrep','--quiet']),
    ('final-release-regressions',['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--release','--test','retained_points']),
    ('final-clippy',['cargo','clippy','--offline','--locked','-p','hyperbrep','--all-targets','--all-features','--','-D','warnings']),
    ('final-fmt',['cargo','fmt','--all','--','--check']),
]
for name,args in commands:
    print('Starting '+name,flush=True)
    with (out/(name+'.log')).open('w') as log:
        process=subprocess.run(args,cwd=root,stdout=log,stderr=subprocess.STDOUT)
    records.append({'name':name,'args':args,'exit_code':process.returncode,'log':name+'.log','reason':'Final selected-coordinate ambient-policy assertion added; production and benchmark sources unchanged.'})
    (out/'commands.json').write_text(json.dumps(records,indent=2)+'\n')
    print(f'{name}: exit {process.returncode}',flush=True)
    if process.returncode:sys.exit(process.returncode)
