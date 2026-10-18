"""Audit the merged-source integration before creating the merge commit."""
import ast,hashlib,importlib.util,json,re,subprocess,sys,tarfile
from pathlib import Path
OUT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(OUT))
from check import ROOT,hashes
read=lambda n:json.loads((OUT/n).read_text())
sha=lambda b:hashlib.sha256(b).hexdigest()
digest=lambda p:sha(Path(p).read_bytes())
git=lambda *a:subprocess.check_output(['git',*a],cwd=ROOT)
m=read('manifest.json');source=hashes();previous=OUT.parent/'2026-10-18-measurement-admission'
assert git('branch','--show-current').strip()==b'brep'
assert git('rev-parse','HEAD').decode().strip()==m['baseline']
assert git('rev-parse','MERGE_HEAD').decode().strip()==m['upstream']
assert not git('diff','--name-only','--diff-filter=U')
assert not git('diff','HEAD','--name-only','--','crates/hyperbrep/src','crates/hyperbrep-io/src')
assert source==read('final-source.json')==read('qualification-driver.json')['source']
assert sha(json.dumps(source,sort_keys=True).encode())==m['source_identity']
for n,h in m['evidence_files'].items():assert digest(OUT/n)==h,n
for n,h in m['documents'].items():assert digest(ROOT/n)==h,n
qualification=read('qualification-driver.json');assert not qualification['failures']
latest={r['label']:r for r in read('attempts.json')}
for label in qualification['executed']:
 row=latest[label];assert row['source_unchanged'] and read(row['source'])==source,label
 if label not in qualification['upstream_debug_blocked']:assert row['exit_code']==0,label
for label,count in [('scalar-equality',7),('scalar-equality-doc',1),('point-contract',3),('point-group',14),('native-release',625),('native-minimal',617),('curve-tests',96),('curve-winding',4),('curve-successors',62)]:
 results=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored',(OUT/latest[label]['log']).read_text())
 assert sum(int(r[0]) for r in results)==count and all(r[1:]==('0','0') for r in results),(label,results)
for label in ['qualify-stage','consumers-stage','artifacts-stage','preserve-stage']:
 assert latest[label]['exit_code']==0 and latest[label]['source_unchanged'] and read(latest[label]['source'])==source
recovery=read('harness-recovery.json');assert recovery['recovered'] and recovery['source']==source and recovery['preserved_files']==211
for r in recovery['restored_inputs']:assert digest(OUT/r['path'])==digest(r['baseline'])==r['sha256']
assert 'FileNotFoundError' in (OUT/recovery['failed_attempt']).read_text()
consumers=read('consumers.json');assert consumers['source']==source
assert consumers['groups']==dict(new=7,spline=9,images=14,original=138)
for label,count in consumers['groups'].items():
 r=latest[label+'-wasm-runtime'];v=json.loads((OUT/r['log']).read_text());assert v.get('groups',v.get('probe_groups'))==count and v['imports']==0
for p,h in consumers['inputs'].items():assert digest(p)==h,p
for b in consumers['binaries'].values():assert digest(b['path'])==b['sha256'] and Path(b['path']).stat().st_size==b['bytes']
assert read('original-profiles.json')['counts']==dict(native_result=2,unsupported=5)
a=read('artifacts.json');b=read('artifact-comparison.json')
assert a['source']==b['source']==source and a['new']==12 and a['preserved']==66 and len(a['rows'])==78 and len(b['rows'])==211
for r in a['rows']:
 assert digest(OUT/r['path'])==digest(OUT/r['repeat'])==digest(previous/r['path'])==r['sha256'],r['path']
for r in b['rows']:
 assert digest(OUT/r['path'])==digest(previous/r['path'])==r['sha256'],r['path']
assert read('continuation-admission.json')['passed'] and read('continuation-admission.json')['source']==source
assert read('artifact-preservation.json')['preserved_files']==289
oracle=json.loads((previous/'quintic-occt.json').read_text());assert len(oracle['rows'])==8 and not oracle['failed']
for r in oracle['rows']:assert digest(OUT/'measurement-artifacts'/r['file'])==r['sha256']
cost=read('consumer-costs.json');assert cost['source']==source and len(cost['rows'])==22 and len(cost['trials'])==18
for cohorts in cost['binaries'].values():
 for b in cohorts.values():assert digest(b['path'])==b['sha256']
for p,h in cost['inputs'].items():assert digest(p)==h,p
for r in cost['trials']:assert r['exit_code']==r['resource']['exit_code']==0
archive=read('source-reconstruction.json');assert archive['baseline']==m['baseline'] and digest(OUT/archive['archive'])==archive['archive_sha256']
with tarfile.open(OUT/archive['archive'],'r:gz') as packed:contents={r.name:packed.extractfile(r).read() for r in packed.getmembers()}
assert {n:sha(v) for n,v in contents.items()}==archive['members']
cache={}
for r in archive['sources']:
 assert r['completely_reconstructible'] and not r['missing_files']
 snapshot=read(r['snapshot']);assert set(snapshot)==set(r['baseline_files'])|set(r['overlay_files'])
 for n,h in snapshot.items():
  if n in r['overlay_files']:data=contents[r['overlay_files'][n]]
  else:
   if n not in cache:cache[n]=git('show',m['baseline']+':'+n)
   data=cache[n]
  assert sha(data)==h,(r['snapshot'],n)
helper=OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py';spec=importlib.util.spec_from_file_location('spans',helper);spans=importlib.util.module_from_spec(spec);spec.loader.exec_module(spans)
current=(ROOT/'docs/properties-status.json').read_text();upstream=git('show',m['upstream']+':docs/properties-status.json').decode();leaf=json.loads(current)['current_work']['hyperbrep']
assert current==spans.replace_brep(upstream,leaf) and leaf['upstream_revision']==m['upstream']
status=json.loads((ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text());assert not status['complete'] and len(status['work_packages'])==28 and all(r['status']in['open','in-progress'] for r in status['work_packages'])
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1','b00958cb640fedbe041c46581327df3e64deacf5'}<=set(git('stash','list','--format=%H').decode().splitlines())
for p in [ROOT/n for n in m['documents'] if n.endswith('.md')]+list(OUT.glob('*.md')):
 for _,target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)',p.read_text()):
  if '://' not in target and not target.startswith('#'):
   destination=p.parent/target.split('#')[0];assert destination.exists() or destination==OUT/'audit.json',(p,target)
for p in OUT.rglob('*.json'):json.loads(p.read_text())
for p in [*(OUT/'analysis-recipes').glob('*.py'),*(OUT/'final-review').glob('*.py')]:ast.parse(p.read_text(),filename=str(p))
(OUT/'audit.json').write_text(json.dumps(dict(passed=True,source_identity=m['source_identity'],manifest_sha256=digest(OUT/'manifest.json'),scope='Pending merge parents, unchanged BRep/IO production, exact scalar/point tests, affected native and WASM consumers, 289 preserved artifacts, all original frontiers, 22 repeated consumer cost groups, source reconstruction, protected stashes, work-package and ledger ownership. Distribution and pre-push gates remain open.'),indent=2)+'\n')
print('Upstream equality integration audit passed')
