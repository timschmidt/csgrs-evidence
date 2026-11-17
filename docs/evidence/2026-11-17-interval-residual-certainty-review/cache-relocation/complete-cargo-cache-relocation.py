from pathlib import Path
import hashlib,json,shutil,time
s=Path('/home/tim/.cargo/registry/cache');d=Path('/mnt/development/.interval-refactor-build/cargo-download-cache-20261117');b=s.with_name('cache.interval-relocation-backup')
def listing(root):
 return {str(p.relative_to(root)):dict(bytes=p.stat().st_size,sha256=hashlib.sha256(p.read_bytes()).hexdigest()) for p in sorted(root.rglob('*')) if p.is_file()}
assert s.is_dir() and not s.is_symlink() and not b.exists()
expected=listing(d);actual=listing(s);assert set(actual)==set(expected)
mismatches=[p for p in actual if actual[p]!=expected[p]]
assert mismatches==['index.crates.io-1949cf8c6b5b557f/windows-0.54.0.crate'] and actual[mismatches[0]]['bytes']==0
record=dict(time=time.time(),source=str(s),destination=str(d),files=len(expected),bytes=sum(x['bytes'] for x in expected.values()),per_file=expected,prior_failures='Original symlink ENOSPC rolled back. Freeing one verified11MBduplicate still did not clear reserved-block threshold; attempted rollback left zero-byte cache stub. All complete archives remain verified on SSD; all other source files match. Removing verified duplicate directory now frees369MB before replacing symlink.',repaired_stub=mismatches)
r=Path('/tmp/interval-refactor/cargo-download-cache-relocation.json');r.write_text(json.dumps(record,indent=2)+'\n')
s.rename(b);shutil.rmtree(b);s.symlink_to(d,target_is_directory=True)
assert listing(s)==expected
record.update(completed=True,root_free_bytes=shutil.disk_usage('/').free,development_free_bytes=shutil.disk_usage(d).free)
r.write_text(json.dumps(record,indent=2)+'\n');print({k:v for k,v in record.items() if k!='per_file'})
