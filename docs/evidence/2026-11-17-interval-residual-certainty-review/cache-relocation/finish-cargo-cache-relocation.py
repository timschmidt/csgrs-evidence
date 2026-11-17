from pathlib import Path
import hashlib,json,shutil,time
source=Path('/home/tim/.cargo/registry/cache');dest=Path('/mnt/development/.interval-refactor-build/cargo-download-cache-20261117');backup=source.with_name('cache.interval-relocation-backup')
def listing(root):
 rows={}
 for p in sorted(root.rglob('*')):
  if p.is_file():
   assert not p.is_symlink();rows[str(p.relative_to(root))]=dict(bytes=p.stat().st_size,sha256=hashlib.sha256(p.read_bytes()).hexdigest())
 return rows
assert source.is_dir() and not source.is_symlink() and dest.is_dir() and not backup.exists()
original=listing(source);assert listing(dest)==original
largest=max(original,key=lambda p:original[p]['bytes']);assert original[largest]['bytes']>1024*1024
# Its identical durable copy has been verified. Free one cache archive to let
# the full filesystem allocate the replacement symlink's metadata.
(source/largest).unlink()
try:
 source.rename(backup)
 try:source.symlink_to(dest,target_is_directory=True)
 except BaseException:
  backup.rename(source);raise
except BaseException:
 shutil.copy2(dest/largest,source/largest);raise
assert listing(source)==original
shutil.rmtree(backup)
record=dict(time=time.time(),source=str(source),destination=str(dest),files=len(original),bytes=sum(r['bytes'] for r in original.values()),per_file=original,initial_attempt='Symlink creation failed ENOSPC; source rename was rolled back without data loss. Durable copy verified again, then one largest duplicate archive removed to free metadata space before completing relocation.',first_duplicate_removed=largest,root_free_bytes=shutil.disk_usage('/').free,development_free_bytes=shutil.disk_usage(dest).free)
Path('/tmp/interval-refactor/cargo-download-cache-relocation.json').write_text(json.dumps(record,indent=2)+'\n');print({k:v for k,v in record.items() if k!='per_file'})
