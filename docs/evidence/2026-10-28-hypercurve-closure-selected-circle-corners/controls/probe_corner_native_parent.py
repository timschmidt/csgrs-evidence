from pathlib import Path
import hashlib
import importlib.util
import json
import os
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root=Path(__file__).resolve().parents[1]
checkout=(root/'circle-line-contacts').resolve()
record=root/'controls/corner-native-priority-parent1'
record.mkdir()
qualification=root/'controls/circle-line-contacts-qualification-recovered2'
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py')
e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot()
assert source['revision']=='2404957c1e109505b8a88038eb6a6dab4c4091e6' and not patch
receipts={'crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv'}
qualified=json.loads((qualification/'files-before.json').read_text())
assert [f for f in files if f[0] not in receipts]==[f for f in qualified if f[0] not in receipts]
binary=root.parent/'hypercurve-circle-line-contacts-admission/release/deps/hypercurve-923df5481342af44'
stamp=binary.stat().st_mtime
rows=json.loads((qualification/'results.json').read_text())
builds=[r for r in rows if r['started_epoch']<=stamp<=r['started_epoch']+r['elapsed_seconds'] and ('--lib' in r['command'] or r['name']=='full-suite')]
assert builds and all(r['exit_code']==0 and r['source_stable'] for r in builds)
digest=hashlib.sha256(binary.read_bytes()).hexdigest()
e.save_json(record/'attribution.json',{'source':source,'binary':str(binary),'binary_sha256':digest,'binary_modified_epoch':stamp,'qualified_build_commands':builds,'basis':'Existing executable from a freshly source-stable qualified command, unchanged owner source except receipts. This diagnostic compares the original unchanged test; no claim of universal or statistical speedup.'})
command=[str(binary),'curve::curve_fillet::tests::collapsed_selected_circle_fillet_reuses_constrained_contacts_and_support','--exact','--nocapture']
started=time.time()
with (record/'original-test.log').open('w') as log:
    p=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=checkout,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
    e.save_json(record/'active.json',{'pid':p.pid,'started_epoch':started,'command':command})
    try:code=p.wait(timeout=3600)
    except subprocess.TimeoutExpired:
        os.killpg(p.pid,signal.SIGKILL);p.wait();code='external_timeout'
after=e.source_snapshot()[0]
assert hashlib.sha256(binary.read_bytes()).hexdigest()==digest
result={'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'source_stable':source==after,'external_timeout_seconds':3600}
e.save_json(record/'result.json',result)
print(result,flush=True)
