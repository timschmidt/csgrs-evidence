"""Remove a final-check overlay only after proving its archived bytes identical."""
import hashlib,json,shutil,sys,tarfile
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,hashes
source=hashes();paths=sorted(OUT.glob('overlay-*'));rows=[]
assert [p.name for p in paths]==['overlay-8bcfb73dcee3d62ddce79fce43016c796e6bf0dc2655e92cdcbe58b128e19d7c']
with tarfile.open(OUT/'source-overlays.tar.gz','r:gz') as packed:
 for directory in paths:
  for path in sorted(directory.rglob('*')):
   if not path.is_file():continue
   name=str(path.relative_to(OUT));data=path.read_bytes()
   assert packed.extractfile(name).read()==data,name
   rows.append(dict(path=name,sha256=hashlib.sha256(data).hexdigest(),bytes=len(data)))
for directory in paths:shutil.rmtree(directory)
assert hashes()==source
(OUT/'overlay-cleanup.json').write_text(json.dumps(dict(source=source,rows=rows,recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),reason='Archiving overlapped the final read-only formatting/diff checks, which recreated the identical last source overlay. Both checks completed successfully. Every residual file was verified byte-for-byte against its already retained archive member before deleting this duplicate only; no source evidence was discarded.'),indent=2)+'\n')
print('Verified and removed',len(rows),'duplicate overlay files.',flush=True)
