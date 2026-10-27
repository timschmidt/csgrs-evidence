from pathlib import Path
import hashlib,json,os,subprocess,time
root=Path(__file__).resolve().parent
bare=Path('/tmp/csgrs-closure-evidence.git')
durable=Path('/home/tim/Documents/GitHub/workspace/csgrs-evidence.git')
commits={}
for line in subprocess.check_output(['git','--git-dir='+str(durable),'log','--all','--format=%H %T'],text=True).splitlines():
 commit,tree=line.split();commits.setdefault(tree,commit)
records=[]
for name in ['hypercurve-chord-replay-evidence.index','hypercurve-polynomial-component-evidence.index','hypercurve-algebraic-line-evidence.index','hypercurve-voxel-write-oracle-evidence.index']:
 p=Path('/tmp')/name
 assert p.is_file() and not Path(str(p)+'.lock').exists()
 tree=subprocess.check_output(['git','--git-dir='+str(bare),'write-tree'],env={**os.environ,'GIT_INDEX_FILE':str(p)},text=True).strip()
 assert tree in commits,(name,tree)
 commit=commits[tree]
 assert subprocess.check_output(['git','--git-dir='+str(bare),'rev-parse',commit+'^{tree}'],text=True).strip()==tree
 record={'path':str(p),'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'commit':commit,'tree':tree,'durable_repository':str(durable),'index_tree_matches_durable_commit':True}
 records.append(record)
 (root/'circle-replay-completed-index-recovery.json').write_text(json.dumps({'records':records,'recorded_epoch':time.time(),'scope':'Only completed, rebuildable task evidence indexes with identical durable committed trees. The completed S archive is durable. Active T source, archive objects and raw logs are untouched.'},indent=2)+'\n')
 p.unlink();print('Reclaimed',record['bytes'],'bytes:',name,'at',commit,flush=True)
print('Total',sum(r['bytes'] for r in records),'bytes',flush=True)
