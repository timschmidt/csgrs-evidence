"""Losslessly encode large owned review logs; retain original bytes outside staging."""
from pathlib import Path
import gzip
import hashlib
import json
import shutil

ROOT = Path(__file__).resolve().parents[2]
RECORD = ROOT/'target/evidence-closeout-staging-20261105/docs/evidence/2026-11-05-integration-review'
manifest = json.loads((RECORD/'retained-files.json').read_text())
changes = []
for entry in manifest['files']:
    if entry.get('bytes',0) < 64*1024*1024:
        continue
    original = RECORD/entry['path']
    assert original.suffix == '.log', original
    destination = original.with_suffix(original.suffix+'.gz')
    assert not destination.exists()
    with original.open('rb') as source, destination.open('wb') as output:
        with gzip.GzipFile(filename='',mode='wb',fileobj=output,mtime=0,compresslevel=9) as encoded:
            shutil.copyfileobj(source,encoded,1024*1024)
    digest=hashlib.sha256()
    with gzip.open(destination,'rb') as source:
        for block in iter(lambda:source.read(1024*1024),b''):
            digest.update(block)
    assert digest.hexdigest()==entry['sha256']
    assert destination.stat().st_size < 100*1024*1024
    changes.append({'original_path':entry['path'],'original_bytes':entry['bytes'],'original_sha256':entry['sha256'],'archived_path':str(destination.relative_to(RECORD)),'archived_bytes':destination.stat().st_size,'archived_sha256':hashlib.sha256(destination.read_bytes()).hexdigest(),'encoding':'gzip; decompressed bytes verified identical; original target log remains untouched'})
    entry.update(path=str(destination.relative_to(RECORD)),bytes=destination.stat().st_size,sha256=hashlib.sha256(destination.read_bytes()).hexdigest(),encoding='gzip',uncompressed_bytes=entry['bytes'],uncompressed_sha256=entry['sha256'])
    original.unlink()
assert changes
(RECORD/'lossless-log-encoding.json').write_text(json.dumps(changes,indent=2)+'\n')
(RECORD/'retained-files.json').write_text(json.dumps(manifest,indent=2)+'\n')
shutil.copy2(__file__,RECORD/'lossless-log-encoding.py')
p=RECORD/'README.md'
s=p.read_text().replace('No fixture or assertion\nwas ignored or weakened','No existing conformance fixture or assertion\nwas ignored or weakened')
s += '\nThe rejected Debug expansion log is losslessly gzip-encoded for retention.\nThe encoding manifest records the original byte count and SHA-256 and the\ncompressed digest; decompressed content was verified identical. The original\ntarget log was left untouched. This is archive encoding, not data reduction.\n'
p.write_text(s)
print(json.dumps(changes))
