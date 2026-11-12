from pathlib import Path
import re,json,hashlib,sys,shutil
revision=sys.argv[1];root=Path('/tmp/interval-refactor/interface-measurements')
paths=list(Path('/mnt/development/csgrs/crates/hyperinterval/conformance/alumina-measurements/target/release/deps').glob('probe-*.ll'));assert paths
path=max(paths,key=lambda p:p.stat().st_mtime_ns);data=path.read_bytes();shutil.copy2(path,Path('/tmp/interval-refactor/interface-measurement-binaries')/(revision+'-probe.ll'))
rows=[];active=None
for line in data.decode().splitlines():
 if line.startswith('define '):
  assert active is None
  active={'name':re.search(r'@("[^"]+"|[^ (]+)\(',line).group(1),'body_lines':0}
 elif active is not None:
  if line=='}':rows.append(active);active=None
  elif line.strip() and not line.lstrip().startswith(';'):active['body_lines']+=1
assert active is None
out={'sha256':hashlib.sha256(data).hexdigest(),'bytes':len(data),'definitions':len(rows),'body_lines':sum(r['body_lines'] for r in rows),'measurement':'post-LTO emitted LLVM definitions, nonblank/noncomment body lines, same full probe and release profile; not machine bytes','functions':rows}
(root/(revision+'-ir.json')).write_text(json.dumps(out,indent=2)+'\n');print({k:v for k,v in out.items() if k!='functions'})
