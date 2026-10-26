from pathlib import Path
import hashlib,json,sys,time
from runtime_manifest import runtime_sources
raw=Path(__file__).resolve().parent
root=Path('/tmp/csgrs-r19-trace')
variant=sys.argv[1];assert variant in ['baseline','candidate']
variants={v:runtime_sources(v) for v in ['baseline','candidate']}
changes=[]
for name,entry in variants[variant].items():
    path=root/name;before=hashlib.sha256(path.read_bytes()).hexdigest()
    assert before in {variants[v][name]['sha256'] for v in variants},name
    source=Path(entry['source']);assert hashlib.sha256(source.read_bytes()).hexdigest()==entry['sha256']
    changes.append((path,source,{'path':name,'before':before,'after':entry['sha256'],'source':str(source)}))
for path,source,_ in changes:path.write_bytes(source.read_bytes())
with (raw/'variant-changes.jsonl').open('a') as out:
    out.write(json.dumps({'created_ns':time.time_ns(),'variant':variant,'changes':[row for _,_,row in changes]})+'\n')
print('R19 PRIVATE VARIANT',variant,flush=True)
