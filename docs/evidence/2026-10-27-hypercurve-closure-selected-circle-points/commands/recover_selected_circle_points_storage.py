from pathlib import Path
import json,shutil,subprocess,time,hashlib
root=Path(__file__).resolve().parent
workspace=Path('/home/tim/Documents/GitHub/workspace/csgrs')
old=Path('/tmp/hypercurve-closure-prepush-expanded')
published=json.loads((old/'push-receipt.json').read_text())
validation=json.loads((old/'validation-status.json').read_text())
assert validation['execution_complete'] and validation['source_attribution_complete'] and validation['completed_successfully']==328
assert published['pushed'] and published['main']=='721ba97767040d7af4f7c8e93f7e0ca1573b3b5f'
assert not Path('/tmp/hypercurve-closure-prepush-replay/publication-source.json').exists()
cache=workspace/'target/research-closeout-builds/1.95.0-normal/release-check'
assert cache.is_dir() and not cache.is_symlink()
record={'reason':'Recover filesystem capacity using only completed task artifacts. The old publication pre-push campaign is complete and pushed; no new publication campaign is running. Remove its rebuildable MSRV release-check Cargo cache. Move three historical raw temporary-consumer captures intact to the workspace target directory, leaving their original paths as symlinks. Do not remove raw evidence or active U/V/W caches.','published':published,'recorded_epoch':time.time(),'actions':[]}
receipt=root/'selected-circle-points-storage-recovery.json'
allocated=int(subprocess.check_output(['du','-s','-B1',str(cache)],text=True).split()[0]);record['actions'].append({'path':str(cache),'allocated_bytes':allocated,'kind':'completed Cargo cache','state':'planned'});receipt.write_text(json.dumps(record,indent=2)+'\n')
shutil.rmtree(cache);record['actions'][-1]['state']='removed';receipt.write_text(json.dumps(record,indent=2)+'\n');print('Reclaimed cache',allocated,flush=True)
destination=workspace/'target/hypercurve-retained-completed-consumers';destination.mkdir(exist_ok=True)
for name in ['validation-release-1793018957642803095','validation-release-1793010957885653836','validation-release-1793015070781068012']:
 source=root/name/'temporary-consumers';target=destination/name
 assert source.is_dir() and not source.is_symlink() and not target.exists()
 def inventory(base):
  rows=[]
  for p in sorted(base.rglob('*')):
   if p.is_symlink(): rows.append((str(p.relative_to(base)),'symlink',str(p.readlink())))
   elif p.is_file():rows.append((str(p.relative_to(base)),p.stat().st_size,hashlib.sha256(p.read_bytes()).hexdigest()))
  return rows
 before=inventory(source)
 action={'source':str(source),'destination':str(target),'files':len(before),'bytes':sum(r[1] for r in before if isinstance(r[1],int)),'inventory_sha256':hashlib.sha256(json.dumps(before).encode()).hexdigest(),'state':'planned'};record['actions'].append(action);receipt.write_text(json.dumps(record,indent=2)+'\n')
 shutil.move(str(source),str(target));assert inventory(target)==before
 source.symlink_to(target,target_is_directory=True);action['state']='moved intact and original path linked';receipt.write_text(json.dumps(record,indent=2)+'\n');print('Moved',source,action['bytes'],flush=True)
record['free_home_bytes']=shutil.disk_usage(workspace).free;record['used_tmp_bytes']=shutil.disk_usage('/tmp').used;receipt.write_text(json.dumps(record,indent=2)+'\n');print('RECOVERY COMPLETE',flush=True)
