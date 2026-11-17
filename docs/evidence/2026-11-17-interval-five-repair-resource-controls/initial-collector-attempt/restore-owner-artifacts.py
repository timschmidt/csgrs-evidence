"""Restore missing RAM-backed owner binaries from their immutable Git archive."""
from pathlib import Path
import gzip,hashlib,json,os,subprocess
s=Path(__file__).parent;e=Path('/mnt/development/csgrs-evidence')
for row in json.loads((s/'relocation-map.json').read_text()):
 target=Path(row['ram_path']);source=Path(row['original_path'])
 assert source.is_symlink() and str(source.readlink())==str(target)
 if target.exists():
  assert hashlib.sha256(target.read_bytes()).hexdigest()==row['sha256'];continue
 data=gzip.decompress(subprocess.check_output(['git','-C',str(e),'show',row['archive_revision']+':'+row['archive_path']]))
 assert len(data)==row['bytes'] and hashlib.sha256(data).hexdigest()==row['sha256']
 target.parent.mkdir(parents=True,exist_ok=True);temporary=target.with_name(target.name+'.restoring');assert not temporary.exists()
 temporary.write_bytes(data);temporary.chmod(int(row['mode'],8));os.replace(temporary,target)
 assert hashlib.sha256(source.read_bytes()).hexdigest()==row['sha256']
print('All 35 stable artifact paths resolve to verified original bytes.')
