from pathlib import Path
import hashlib,json,os,shutil,time
source=Path('/home/tim/.cargo/registry/cache');destination=Path('/mnt/development/.interval-refactor-build/cargo-download-cache-20261117');backup=source.with_name('cache.interval-relocation-backup')
assert source.is_dir() and not source.is_symlink() and not destination.exists() and not backup.exists()
def listing(root):
 result={}
 for path in sorted(root.rglob('*')):
  if path.is_file():
   assert not path.is_symlink();result[str(path.relative_to(root))]=dict(size=path.stat().st_size,sha256=hashlib.sha256(path.read_bytes()).hexdigest())
 return result
before=listing(source);required=sum(r['size'] for r in before.values());assert shutil.disk_usage(destination.parent).free-required>20*1024**3
shutil.copytree(source,destination);assert listing(destination)==before and listing(source)==before
source.rename(backup)
try:source.symlink_to(destination,target_is_directory=True)
except BaseException:
 backup.rename(source);raise
assert listing(source)==before
shutil.rmtree(backup)
record=dict(time=time.time(),source=str(source),destination=str(destination),files=len(before),bytes=required,per_file=before,verification='Source unchanged through copy; every regular file size/SHA256 identical before replacing directory with durable SSD symlink. Only verified duplicate backup removed. No crate source or evidence deleted.',root_free=shutil.disk_usage('/').free,development_free=shutil.disk_usage(destination).free)
Path('/tmp/interval-refactor/cargo-download-cache-relocation.json').write_text(json.dumps(record,indent=2)+'\n');print({k:v for k,v in record.items() if k!='per_file'})
