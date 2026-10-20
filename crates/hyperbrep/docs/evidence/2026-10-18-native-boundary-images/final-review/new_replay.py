"""Compare the eight new native artifacts in a second fresh consumer process."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,hashes,run
source=hashes()
qualified=json.loads((OUT/'new-consumers.json').read_text())
assert qualified['source']==source
binary=qualified['binaries']['native']
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
assert sha(binary['path'])==binary['sha256']
assert run('new-artifact-repeat',[binary['path'],'artifacts',str(OUT/'new-native-repeat')],600)==0
rows=[]
first=sorted((OUT/'new-native-artifacts').glob('*.json'))
second=sorted((OUT/'new-native-repeat').glob('*.json'))
assert len(first)==len(second)==8
for a,b in zip(first,second):
    assert a.name==b.name and a.read_bytes()==b.read_bytes()
    rows.append(dict(first=str(a.relative_to(OUT)),second=str(b.relative_to(OUT)),sha256=sha(a),bytes=a.stat().st_size))
assert hashes()==source and sha(binary['path'])==binary['sha256']
(OUT/'new-artifact-comparison.json').write_text(json.dumps(dict(source=source,rows=rows,unchanged=8,
    scope='Two fresh external processes run all independent geometry assertions and cold replay for all eight new native profiles. Byte equality is separate from semantic and topology assertions.'),indent=2)+'\n')
