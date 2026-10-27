from pathlib import Path
import hashlib,json,subprocess,time
root=Path(__file__).resolve().parent
workspace=Path('/home/tim/Documents/GitHub/workspace/csgrs')
durable=Path('/home/tim/Documents/GitHub/workspace/csgrs-evidence.git')
qualified=[]
for prefix in ['native-replay','parallel-replay','chord-replay']:
 record=json.loads((root/(prefix+'-persisted.json')).read_text())
 assert record['persisted'] and record['user_worktree_unchanged']
 for gitdir,commit in [(workspace/'.git',record['code']),(durable,record['evidence'])]:
  subprocess.run(['git','--git-dir='+str(gitdir),'cat-file','-e',commit+'^{commit}'],check=True)
 qualified.append(record)
records=[]
for p in sorted(root.iterdir()):
 if not (p.is_file() and p.name.startswith(('native-replay-','parallel-replay-','chord-replay-')) and p.suffix!='.o'):continue
 with p.open('rb') as f:
  if f.read(4)!=b'\x7fELF':continue
 record={'path':str(p),'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()}
 records.append(record)
 receipt={'scope':'Only rebuildable standalone probe executables from completed, durable Q/R/S increments. Keep all source, command, raw-log and evidence records, and every active T/U executable and build target. These probes are not running.', 'qualified':qualified,'records':records,'recorded_epoch':time.time()}
 (root/'point-replay-completed-probe-binary-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n')
 p.unlink();print('Reclaimed',record['bytes'],p.name,flush=True)
print('Total bytes',sum(x['bytes'] for x in records),flush=True)
