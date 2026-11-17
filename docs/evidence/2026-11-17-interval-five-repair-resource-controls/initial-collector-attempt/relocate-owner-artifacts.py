from pathlib import Path
import gzip,hashlib,json,os,shutil,signal,subprocess,time
s=Path(__file__).parent;e=Path('/mnt/development/csgrs-evidence');rev='1da0eebf99e52060d5f08dd1f7c80cf8e28def6d';record='docs/evidence/2026-11-17-interval-residual-certainty-owner'
root=Path('/mnt/development/.interval-refactor-build/residual-certainty-artifacts');target=Path('/dev/shm/interval-residual-owner-artifacts-20261117')
def sha(data):return hashlib.sha256(data).hexdigest()
def save(n,v):(s/n).write_text(json.dumps(v,indent=2)+'\n')
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
assert not (s/'relocation-completion.json').exists() and not target.exists()
plan=Path('/tmp/interval-refactor/coordinated-ci/quiet-workflow-executed-plan.json').read_bytes();assert sha(plan)=='1674343e351f5abe53f9c7bfdc9a5414f514ae15f38f3b328b1652ef6fb981b4' and b'owner-residual-' not in plan
origins=json.loads(subprocess.check_output(['git','-C',str(e),'show',rev+':'+record+'/origins.json']))
origins=[o for o in origins if Path(o['source']).parent==root];assert len(origins)==35
builds=json.loads(Path('/tmp/interval-refactor/residual-certainty-owner/owner-builds.json').read_text());expected={b['size']['path']:b['size']['sha256'] for b in builds}
assert set(expected)=={o['source'] for o in origins}
assert state(3416600,'45823480')=='S' and state(1621335,'38218939')=='T'
os.kill(3416600,signal.SIGSTOP);rows=[];before=shutil.disk_usage(root).free
try:
 for _ in range(20):
  if state(3416600,'45823480')=='T':break
  time.sleep(.05)
 assert state(3416600,'45823480')=='T';target.mkdir()
 for o in origins:
  source=Path(o['source']);assert source.is_file() and not source.is_symlink()
  raw=source.read_bytes();assert sha(raw)==o['source_sha256']==expected[str(source)] and len(raw)==o['source_bytes']
  archived=subprocess.check_output(['git','-C',str(e),'show',rev+':'+record+'/'+o['destination']]);assert sha(archived)==o['stored_sha256'] and gzip.decompress(archived)==raw
  dest=target/source.name;shutil.copy2(source,dest);assert dest.read_bytes()==raw and (dest.stat().st_mode&0o777)==(source.stat().st_mode&0o777)
  link=source.with_name(source.name+'.ram-link');assert not link.exists();link.symlink_to(dest);assert sha(source.read_bytes())==o['source_sha256'];os.replace(link,source)
  assert source.is_symlink() and sha(source.read_bytes())==o['source_sha256']
  rows.append(dict(original_path=str(source),ram_path=str(dest),bytes=len(raw),sha256=o['source_sha256'],mode=oct(dest.stat().st_mode&0o777),archive_revision=rev,archive_path=record+'/'+o['destination']))
  save('relocation-map.json',rows)
 total=sum(r['bytes'] for r in rows);assert len(rows)==35
 save('relocation-completion.json',dict(terminal=True,exit_code=0,files=len(rows),bytes=total,free_before=before,free_after=shutil.disk_usage(root).free,all_original_paths_preserved=True,all_archived_and_live_bytes_verified=True,queued_artifacts_untouched=True))
 print(json.dumps(dict(files=len(rows),bytes=total,free_before=before,free_after=shutil.disk_usage(root).free)))
except BaseException as ex:
 save('relocation-completion.json',dict(terminal=True,exit_code=1,error=repr(ex),completed_files=len(rows)));raise
finally:
 assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T';os.kill(3416600,signal.SIGCONT)
 save('relocation-release.json',dict(time_unix=time.time(),watcher_state=state(3416600,'45823480'),horizon_reset=False))
