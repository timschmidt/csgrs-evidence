from pathlib import Path
import hashlib
import json
import subprocess
import time

raw=Path(__file__).resolve().parent
record=raw/('matched-builds-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
candidate=json.loads((raw/'latest-candidate-runtime.json').read_text())
assert hashlib.sha256(Path(candidate['source']).read_bytes()).hexdigest()==candidate['sha256']
commands=[
 ['set_variant.py','candidate'],
 ['build_variant.py','candidate'],
 ['build_cost.py','candidate','native'],
 ['build_cost.py','candidate','allocations'],
 ['build_brep.py','candidate'],
 ['set_variant.py','baseline'],
 ['build_cost.py','baseline','native'],
 ['build_cost.py','baseline','allocations'],
 ['build_brep.py','baseline'],
 ['set_variant.py','candidate'],
]
rows=[]
try:
    for args in commands:
        command=['python',str(raw/args[0]),*args[1:]]
        print('R19 BUILD STAGE',args,flush=True)
        start=time.monotonic();p=subprocess.run(command,cwd='/tmp/csgrs-r19-trace',timeout=1200)
        rows.append({'command':command,'status':p.returncode,'seconds':time.monotonic()-start})
        (record/'commands.json').write_text(json.dumps(rows,indent=2)+'\n')
        assert p.returncode==0,(record,args)
finally:
    subprocess.run(['python',str(raw/'set_variant.py'),'candidate'],cwd='/tmp/csgrs-r19-trace',check=True)
(record/'completion.json').write_text(json.dumps({'passed':True,'candidate_restored':True,'commands':rows},indent=2)+'\n')
(raw/'latest-matched-builds.json').write_text(json.dumps({'record':str(record),'passed':True},indent=2)+'\n')
print('R19 MATCHED BUILDS COMPLETE',record,flush=True)
