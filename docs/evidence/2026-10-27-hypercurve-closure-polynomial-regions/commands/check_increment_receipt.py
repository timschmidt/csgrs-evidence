from pathlib import Path
import hashlib
import json
import subprocess
import sys
import time

root=Path(__file__).resolve().parent
prefix=sys.argv[1]
checkout=Path(sys.argv[2])
receipts={'crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv'}
for name,mode,digest in json.loads((root/(prefix+'-final-files-before.json')).read_text()):
    if mode in ('file','executable') and name not in receipts:
        assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
archive=json.loads((root/(prefix+'-evidence-archive.json')).read_text())
commands=[('fmt',['cargo','+1.99.1','fmt','--all','--','--check']),('typos',['typos']),('budget',['scripts/check-repository-budget.sh']),('diff',['git','diff','--check']),('archive',['python3','scripts/evidence_archive.py','verify','/tmp/csgrs-closure-evidence.git',archive['commit']])]
records=[]
for name,command in commands:
    started=time.time()
    with (root/(prefix+'-receipt-'+name+'.log')).open('w') as out:
        result=subprocess.run(command,cwd=checkout,stdout=out,stderr=subprocess.STDOUT)
    record={'name':name,'command':command,'exit_code':result.returncode,'elapsed_seconds':time.time()-started}
    records.append(record)
    (root/(prefix+'-receipt-checks.json')).write_text(json.dumps(records,indent=2)+'\n')
    print(record,flush=True)
    if result.returncode:raise SystemExit(result.returncode)
