from pathlib import Path
import hashlib,json,time

here=Path(__file__).resolve().parent
record=here/'verus-preflight-1792989438739029823'
commands=json.loads((record/'commands.json').read_text())
assert len(commands)==4 and all(c['status']==0 for c in commands)
evidence=json.loads((here/'verus-preflight-evidence.json').read_text())
root=Path('/home/tim/Documents/GitHub/workspace/csgrs')
sources={'crates/hyperreal/'+name:digest for name,digest in evidence['sources'].items()}
assert all(hashlib.sha256((root/n).read_bytes()).hexdigest()==h for n,h in sources.items())
reuse={}
for index,row in enumerate(commands,1):
    log=record/(row['name']+'.log')
    reuse[f'hyperreal-verus-0-{index}']={'record':str(record),'command':' '.join(row['command']),'cwd':'crates/hyperreal',
        'log':str(log),'log_sha256':hashlib.sha256(log.read_bytes()).hexdigest(),'source_sha256':sources,
        'verus':evidence['verus'],'actual_elapsed_seconds':row['seconds'],
        'basis':'The official workflow commands already passed on identical proof/checker/production inputs with the workflow-pinned verifier and compiler. All 209 recorded inputs are rechecked before attribution; no default-stable compiler equivalence is assumed.'}
assert not (here/'verified-reuse.json').exists()
(here/'verified-reuse.json').write_text(json.dumps(reuse,indent=2)+'\n')
print('Recorded four completed Verus workflow steps with exact source and pinned-tool attribution.')
