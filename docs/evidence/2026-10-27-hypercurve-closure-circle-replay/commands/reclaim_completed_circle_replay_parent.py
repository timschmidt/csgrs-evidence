from pathlib import Path
import json,os,shutil,subprocess,time
root=Path(__file__).resolve().parent
workspace=Path('/home/tim/Documents/GitHub/workspace/csgrs');target=workspace/'target';bare=Path('/tmp/csgrs-closure-evidence.git')
receipt=json.loads((root/'point-replay-persisted.json').read_text());assert receipt['persisted'] and receipt['code']=='83fd8c03b0bebcfc6d2b707acea69d85025cc8da'
rows=json.loads((root/'point-replay-final-results.json').read_text());assert len(rows)==18 and all(r['exit_code']==0 and r['source_stable'] for r in rows)
assert not subprocess.check_output(['git','-C','/tmp/hypercurve-closure-point-replay','status','--porcelain'],text=True).strip()
subprocess.run(['git','-C',str(workspace),'cat-file','-e',receipt['code']+'^{commit}'],check=True)
subprocess.run(['git','--git-dir=/home/tim/Documents/GitHub/workspace/csgrs-evidence.git','cat-file','-e',receipt['evidence']+'^{commit}'],check=True)
records=[]
report={'reason':'Reserve capacity for frozen U and V qualification. Completed T is committed, fully qualified and durably persisted; its unchanged-parent probe programs and closeout are complete. Remove only its three task-owned Cargo caches and the completed evidence staging index. Keep all source, raw logs, exact fixtures, evidence trees and active U/V caches.','records':records,'recorded_epoch':time.time()}
p=root/'circle-replay-completed-parent-cache-recovery.json';assert not p.exists()
for name in ['hypercurve-point-replay-admission','hypercurve-point-replay-admission-msrv','hypercurve-point-replay-admission-fuzz']:
 cache=target/name
 assert cache.is_dir() and not cache.is_symlink() and cache.resolve().parent==target.resolve()
 assert (cache/'CACHEDIR.TAG').is_file() and (cache/'.rustc_info.json').is_file()
 record={'path':str(cache),'allocated_bytes':int(subprocess.check_output(['du','-s','-B1',str(cache)],text=True).split()[0]),'code':receipt['code'],'evidence':receipt['evidence'],'removed':False};records.append(record);p.write_text(json.dumps(report,indent=2)+'\n')
 shutil.rmtree(cache);record['removed']=True;p.write_text(json.dumps(report,indent=2)+'\n');print('Removed completed cache',name,record['allocated_bytes'],flush=True)
index=Path('/tmp/hypercurve-point-replay-evidence.index');assert index.is_file()
command=['git','--git-dir='+str(bare)]
actual=subprocess.check_output(command+['write-tree'],env={**os.environ,'GIT_INDEX_FILE':str(index)},text=True).strip()
expected=subprocess.check_output(command+['rev-parse',receipt['evidence']+'^{tree}'],text=True).strip();assert actual==expected
record={'path':str(index),'allocated_bytes':index.stat().st_size,'qualified_tree':actual,'evidence':receipt['evidence'],'removed':False};records.append(record);p.write_text(json.dumps(report,indent=2)+'\n');index.unlink();record['removed']=True;p.write_text(json.dumps(report,indent=2)+'\n')
print('Removed completed index',record['allocated_bytes'],flush=True)
print(subprocess.check_output(['df','-h',str(target),'/tmp'],text=True),flush=True)
