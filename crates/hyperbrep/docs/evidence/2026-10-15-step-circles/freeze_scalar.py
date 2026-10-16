"""Freeze unchanged scalar controls before extending the inverse-trig certificate."""
from check import ROOT, OUT, ENV, hashes, run
import hashlib
import json
from pathlib import Path
import shutil
import subprocess

assert subprocess.check_output(['git','diff','6ca4b6531','--','crates/hyperreal/src'],cwd=ROOT)==b''
assert run('scalar-reproduction',['cargo','test','--offline','--locked','-p','hyperreal','--features','serde',
                                 '--test','atan_quarter_turns'])==101
log=(OUT/json.loads((OUT/'attempts.json').read_text())[-1]['log']).read_text()
assert 'test result: FAILED.' in log and 'rational_atan_quarter_turns_retain_exact_coordinates_and_cotangent ... FAILED' in log
cmd=['cargo','build','--offline','--locked','-p','hyperreal','--features','serde','--release',
     '--bench','scalar_micro','--bench','numerical_micro','--message-format=json']
p=subprocess.run(['timeout','--signal=TERM','--kill-after=30s','900s',*cmd],cwd=ROOT,env=ENV,capture_output=True,text=True)
(OUT/'scalar-baseline-build.log').write_text(p.stderr)
(OUT/'scalar-baseline-artifacts.jsonl').write_text(p.stdout)
assert p.returncode==0,p.stderr
items=[json.loads(line) for line in p.stdout.splitlines()]
binaries={}
for name in ['scalar_micro','numerical_micro']:
    source=next(x['executable'] for x in items if x.get('reason')=='compiler-artifact' and x['target']['name']==name and x.get('executable'))
    destination=Path('/tmp/hyperbrep-before-step-circles-'+name)
    shutil.copy2(source,destination)
    binaries[name]=dict(path=str(destination),bytes=destination.stat().st_size,
                        sha256=hashlib.sha256(destination.read_bytes()).hexdigest())
(OUT/'scalar-baseline.json').write_text(json.dumps(dict(command=cmd,source=hashes(),binaries=binaries),indent=2)+'\n')
print('scalar controls frozen',flush=True)
