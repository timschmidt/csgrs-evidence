from pathlib import Path
import json,shutil,subprocess,time
root=Path(__file__).resolve().parent
workspace=Path('/home/tim/Documents/GitHub/workspace/csgrs')
target=workspace/'target'
receipt=json.loads((root/'parallel-replay-persisted.json').read_text())
assert receipt['persisted'] and receipt['code']=='2eb55c5dd5a17dd7b9fb5731ea02b0ac62b38431'
rows=json.loads((root/'parallel-replay-final-results.json').read_text());assert len(rows)==17 and all(r['exit_code']==0 and r['source_stable'] for r in rows)
subprocess.run(['git','-C',str(workspace),'cat-file','-e',receipt['code']+'^{commit}'],check=True)
subprocess.run(['git','--git-dir=/home/tim/Documents/GitHub/workspace/csgrs-evidence.git','cat-file','-e',receipt['evidence']+'^{commit}'],check=True)
records=[]
for name in ['hypercurve-parallel-replay-admission','hypercurve-parallel-replay-admission-msrv']:
 p=target/name
 assert p.is_dir() and not p.is_symlink() and p.resolve().parent==target.resolve()
 assert (p/'CACHEDIR.TAG').is_file() and (p/'.rustc_info.json').is_file()
 record={'path':str(p),'allocated_bytes':int(subprocess.check_output(['du','-s','-B1',str(p)],text=True).split()[0]),'top_level_entries':sorted(x.name for x in p.iterdir()),'qualified_code':receipt['code'],'qualified_evidence':receipt['evidence'],'removed':False}
 records.append(record)
 report={'reason':'Reserve space for T qualification and U implementation without repeating the prior disk exhaustion. These two Cargo caches belong to completed R; code and evidence are durably committed, and committed-parent probes have finished. S and T targets, source checkouts, all source/evidence objects and raw logs remain untouched.','records':records,'recorded_epoch':time.time()}
 (root/'circle-replay-build-cache-recovery.json').write_text(json.dumps(report,indent=2)+'\n')
 shutil.rmtree(p)
 record['removed']=True
 (root/'circle-replay-build-cache-recovery.json').write_text(json.dumps(report,indent=2)+'\n')
 print('Removed completed Cargo cache',name,record['allocated_bytes'],'bytes',flush=True)
print(subprocess.check_output(['df','-h',str(target)],text=True),flush=True)
