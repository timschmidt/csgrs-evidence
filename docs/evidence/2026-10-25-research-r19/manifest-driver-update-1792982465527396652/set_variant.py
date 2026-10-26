from pathlib import Path
import hashlib
import json
import sys
import time

raw=Path(__file__).resolve().parent
root=Path('/tmp/csgrs-r19-trace')
variant=sys.argv[1];assert variant in ['baseline','candidate']
prototype=raw/'domain-replay-prototype-1792977115683792550'
candidate=Path(json.loads((raw/'latest-candidate-runtime.json').read_text())['source'])
source=prototype/'before.rs' if variant=='baseline' else candidate
path=root/'crates/hyperreal/src/computable/node/representation.rs'
known={hashlib.sha256((prototype/n).read_bytes()).hexdigest() for n in ['before.rs','after.rs']}
known.add(hashlib.sha256(candidate.read_bytes()).hexdigest())
before=hashlib.sha256(path.read_bytes()).hexdigest();assert before in known
path.write_bytes(source.read_bytes())
with (raw/'variant-changes.jsonl').open('a') as out:
    out.write(json.dumps({'created_ns':time.time_ns(),'variant':variant,'before':before,'after':hashlib.sha256(path.read_bytes()).hexdigest(),'source':str(source)})+'\n')
print('R19 PRIVATE VARIANT',variant,flush=True)
