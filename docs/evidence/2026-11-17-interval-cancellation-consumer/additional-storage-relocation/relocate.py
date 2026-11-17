from pathlib import Path
import hashlib,json,os,shutil,subprocess
s=Path(__file__).parent;e=Path('/mnt/development/csgrs-evidence');record='docs/evidence/2026-11-17-interval-residual-certainty-packaged';ram=Path('/dev/shm/interval-residual-packaged-artifacts-20261117');sha=lambda b:hashlib.sha256(b).hexdigest()
revision=subprocess.check_output(['git','rev-parse','HEAD'],cwd=e,text=True).strip();get=lambda p:subprocess.check_output(['git','show',revision+':'+record+'/'+p],cwd=e)
entries=json.loads(get('origins.json'));rows=[x for x in entries if x['source'].startswith('/mnt/development/.interval-refactor-build/residual-certainty-artifacts/v2-packaged-')];assert len(rows)==12
queue=Path('/tmp/interval-refactor/coordinated-ci/quiet-workflow-executed-plan.json');before=queue.read_bytes();assert sha(before)=='1674343e351f5abe53f9c7bfdc9a5414f514ae15f38f3b328b1652ef6fb981b4';assert b'residual-certainty-artifacts' not in before
assert not ram.exists();ram.mkdir();mapping=[];free=shutil.disk_usage(e).free
for row in rows:
 assert row['encoding']=='identity';data=get(row['destination']);assert sha(data)==row['stored_sha256']==row['source_sha256'] and len(data)==row['source_bytes']
 source=Path(row['source']);assert source.is_file() and not source.is_symlink();assert sha(source.read_bytes())==row['source_sha256']
 for proc in Path('/proc').glob('[0-9]*'):
  try:assert (proc/'exe').resolve()!=source
  except (FileNotFoundError,PermissionError,ProcessLookupError):pass
 dest=ram/source.name;shutil.copy2(source,dest);assert sha(dest.read_bytes())==row['source_sha256']
 mapping.append(dict(original_path=str(source),ram_path=str(dest),archive_revision=revision,archive_path=record+'/'+row['destination'],sha256=row['source_sha256'],bytes=row['source_bytes'],mode=source.stat().st_mode&0o777))
(s/'map.json').write_text(json.dumps(mapping,indent=2)+'\n')
for row in mapping:
 source=Path(row['original_path']);tmp=source.with_name(source.name+'.relocate-link');assert not tmp.exists();tmp.symlink_to(row['ram_path']);os.replace(tmp,source);assert sha(source.read_bytes())==row['sha256']
assert queue.read_bytes()==before
result=dict(files=len(mapping),bytes=sum(x['bytes'] for x in mapping),free_before=free,free_after=shutil.disk_usage(e).free,committed_archive_and_copies_verified=True,original_paths_byte_identical=True,queue_unchanged=True)
(s/'completion.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
