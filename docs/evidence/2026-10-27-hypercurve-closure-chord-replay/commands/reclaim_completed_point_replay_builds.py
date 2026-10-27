from pathlib import Path
import json,shutil,subprocess,time
root=Path(__file__).resolve().parent
workspace=Path('/home/tim/Documents/GitHub/workspace/csgrs')
target=workspace/'target'
receipt=json.loads((root/'native-replay-persisted.json').read_text())
assert receipt['persisted'] and receipt['code']=='8eea456ceec297833e727212183581e3cd43527b'
rows=json.loads((root/'native-replay-final-results.json').read_text());assert len(rows)==17 and all(r['exit_code']==0 and r['source_stable'] for r in rows)
subprocess.run(['git','-C',str(workspace),'cat-file','-e',receipt['code']+'^{commit}'],check=True)
subprocess.run(['git','--git-dir=/home/tim/Documents/GitHub/workspace/csgrs-evidence.git','cat-file','-e',receipt['evidence']+'^{commit}'],check=True)
records=[]
for name in ['hypercurve-algebraic-similarity-admission','hypercurve-algebraic-similarity-admission-msrv']:
 p=target/name
 assert p.is_dir() and not p.is_symlink() and p.resolve().parent==target.resolve()
 assert (p/'CACHEDIR.TAG').is_file() and (p/'.rustc_info.json').is_file()
 record={'path':str(p),'allocated_bytes':int(subprocess.check_output(['du','-s','-B1',str(p)],text=True).split()[0]),'top_level_entries':sorted(x.name for x in p.iterdir()),'qualified_code':receipt['code'],'qualified_evidence':receipt['evidence'],'removed':False}
 records.append(record)
 report={'reason':'Repository filesystem exhausted during dependency compilation, affecting S downstream hypercircuit and T MSRV probe. These two Cargo caches belong to completed Q/N task increments; code/evidence are durably committed. S and T active targets and source checkouts remain untouched.','records':records,'recorded_epoch':time.time()}
 (root/'point-replay-build-cache-recovery.json').write_text(json.dumps(report,indent=2)+'\n')
 shutil.rmtree(p)
 record['removed']=True
 (root/'point-replay-build-cache-recovery.json').write_text(json.dumps(report,indent=2)+'\n')
 print('Removed completed Cargo cache',name,record['allocated_bytes'],'bytes',flush=True)
print(subprocess.check_output(['df','-h',str(target)],text=True),flush=True)
