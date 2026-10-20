"""Sequential fixed-source qualification; stop on a failed stage."""
import json, subprocess, sys, time
from pathlib import Path
from check import OUT, ROOT, ENV, hashes
source=hashes(); rows=[]
for stage in ['qualify','consumers','preserve','artifacts','consumer_costs','new_costs']:
    command=['python3','-B',str(OUT/'analysis-recipes'/f'{stage}.py')]
    if stage == 'qualify':
        command += ['--reuse-unaffected-owner']
    start=time.monotonic()
    result=subprocess.run(command,cwd=ROOT,env=ENV)
    unchanged=hashes()==source
    rows.append(dict(stage=stage,command=command,exit_code=result.returncode,elapsed_seconds=time.monotonic()-start,source_unchanged=unchanged))
    (OUT/'final-stages.json').write_text(json.dumps(dict(source=source,rows=rows),indent=2)+'\n')
    assert unchanged and result.returncode==0, stage
