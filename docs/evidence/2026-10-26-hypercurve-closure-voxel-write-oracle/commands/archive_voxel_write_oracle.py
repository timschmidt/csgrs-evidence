from pathlib import Path
import hashlib,importlib.util,json,os,re,subprocess,time
root=Path(__file__).resolve().parent; checkout=Path('/tmp/hypercurve-closure-publish-904e')
base='904e5408e128a4f4b35ed0ce028f176023d7eadd'; parent='2550c23fd100d06fb2343323ae8273ea97a70164'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==base
results=json.loads((root/'voxel-write-oracle-final-results.json').read_text());assert len(results)==7 and all(r['exit_code']==0 and r['source_stable'] for r in results)
for n,d in json.loads((root/'voxel-write-oracle-final-files.json').read_text()).items():assert hashlib.sha256((checkout/n).read_bytes()).hexdigest()==d,n
def counts(name):
 rows=re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', (root/name).read_text())
 assert rows and all(x[0]=='ok' and x[2]=='0' for x in rows)
 return {'passed':sum(int(x[1]) for x in rows),'ignored':sum(int(x[3]) for x in rows),'suites':len(rows)}
assert counts('voxel-write-oracle-final-test.log')['passed']==116
assert counts('voxel-write-oracle-final-consumer.log')['passed']==78
record='docs/evidence/2026-10-26-hypercurve-closure-voxel-write-oracle'; staging=Path('/tmp/hypercurve-voxel-write-oracle-evidence');out=staging/record;out.mkdir(parents=True,exist_ok=False)
files=[]
def copy(p,name):
 data=p.read_bytes();dest=out/name;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(data);files.append({'path':str(name),'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()})
for p in sorted(root.glob('voxel-write-oracle-*')):
 if p.is_file() and p.suffix in ['.log','.json','.rs','.patch']:copy(p,Path('commands')/p.name)
copy(root/'run_voxel_write_oracle_qualification.py',Path('commands/run_voxel_write_oracle_qualification.py'));copy(Path(__file__),Path('commands')/Path(__file__).name)
fail=Path('/tmp/hypercurve-closure-prepush-904e/validation-workflow-1793043797075278051')
for name in ['workspace-hypervoxel-0-4.log','revision.json'] :copy(fail/name,Path('original-failure')/name)
(out/'source.json').write_text(json.dumps({'base':base,'owner':'voxelis random-write acceptance oracle','properties':['P35','P37'],'recorded_epoch':time.time(),'finding':'The full pre-push run at unchanged 904e failed when a random write repeated the same position and value. The existing test_set_behaviour establishes that VoxTree::set returns false for unchanged data. Seed 17 reproduces the invalid always-true assertion at write 384, (14,14,27), value 188.','change':'Each write now checks the change result against the independent dense array, checks the dirty flag, and verifies root and reference count preservation on a no-op. The complete original unseeded 1000-write and 32^3-readback workload remains. A second full workload uses the failing deterministic seed, with an assertion that it actually exercises unchanged writes. No production code changes.','nested_workspace':counts('voxel-write-oracle-final-test.log'),'hypervoxel_consumer':counts('voxel-write-oracle-final-consumer.log'),'commands':results,'limitations':['The 904e pre-push attempt is blocked; this targeted qualification does not authorize a push. The complete validation set must run against the corrected revision.','No geometry completion or performance improvement is claimed.']},indent=2)+'\n')
(out/'retained-files.json').write_text(json.dumps(files,indent=2)+'\n')
repo=Path('/tmp/csgrs-closure-evidence.git');branch='refs/heads/hypercurve-voxel-write-oracle-evidence-2026-10-26'
assert subprocess.run(['git','--git-dir='+str(repo),'show-ref','--verify','--quiet',branch]).returncode==1
env={**os.environ,'GIT_INDEX_FILE':'/tmp/hypercurve-voxel-write-oracle-evidence.index'};cmd=['git','--git-dir='+str(repo),'--work-tree='+str(staging)]
subprocess.run(cmd+['read-tree',parent],env=env,check=True);subprocess.run(cmd+['add','--',record],env=env,check=True)
tree=subprocess.check_output(cmd+['write-tree'],env=env,text=True).strip();commit=subprocess.check_output(cmd+['commit-tree',tree,'-p',parent,'-m','Record voxel repeated-write oracle regression and qualification'],env=env,text=True).strip();subprocess.run(cmd+['update-ref',branch,commit,'0'*40],check=True)
spec=importlib.util.spec_from_file_location('archive',checkout/'scripts/evidence_archive.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);module.ROOTS={record:False};rows=module.manifest(str(repo),commit);assert len(rows)==2
result={'commit':commit,'parent':parent,'branch':branch,'record':record,'manifest_row':rows[1]};(root/'voxel-write-oracle-evidence-archive.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
