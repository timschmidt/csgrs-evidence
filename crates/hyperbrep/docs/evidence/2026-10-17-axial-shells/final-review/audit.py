"""Audit the feature's exact inputs, complete consumers and retained observations."""
import ast,hashlib,importlib.util,json,re,subprocess,sys,tarfile
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,hashes
read=lambda p:json.loads(p.read_text())
sha=lambda data:hashlib.sha256(data).hexdigest()
digest=lambda p:sha(p.read_bytes())
git=lambda *args:subprocess.check_output(['git',*args],cwd=ROOT)
m=read(OUT/'manifest.json');source=hashes()
assert git('branch','--show-current').strip()==b'brep'
assert git('rev-parse','HEAD').decode().strip()==m['baseline']
assert subprocess.run(['git','merge-base','--is-ancestor',m['upstream'],'HEAD'],cwd=ROOT).returncode==0
assert not git('diff','--name-only','--diff-filter=U')
assert source==read(OUT/'final-source.json') and sha(json.dumps(source,sort_keys=True).encode())==m['source_identity']
q=read(OUT/'qualification-summary.json');assert q['source']==source
assert {k:v['passed'] for k,v in q['tests'].items()}=={'native-release':600,'native-minimal':592,'axial-debug':26,'axial-proof-debug':5,'axial-chart-debug':2}
assert not q['upstream_debug_blocked'] and all(v['exit_code']==v['failed']==0 for v in q['tests'].values())
assert q['wasm']['groups']==138 and q['wasm']['imports']==0 and q['new_complete_workflows']==8
attempts=read(OUT/'attempts.json');latest={r['label']:r for r in attempts}
assert all(r['source_unchanged'] for r in attempts)
assert q['failures']==[r for r in attempts if r['exit_code']]
for label in read(OUT/'qualification-driver.json')['executed']:
 row=latest[label];assert row['exit_code']==0 and read(OUT/row['source'])==source,label
for name in ['qualification-driver.json','finish-checks.json','cost-summary.json','resource-summary.json','continuation-admission.json','consumer-admission.json','previous-axial-admission.json','components-admission.json','old-path-control.json']:
 assert read(OUT/name)['source']==source,name
for name,h in m['evidence_files'].items():assert digest(OUT/name)==h,name
for name,h in m['documents'].items():assert digest(ROOT/name)==h,name
inputs={}
for name in ['external-inputs.json','continuation-inputs.json','components-inputs.json']:
 inputs.update(read(OUT/name))
for name,key in [('qualification-driver.json','external_inputs'),('finish-checks.json','inputs'),('previous-axial-admission.json','inputs'),('old-path-control.json','inputs'),('cost-summary.json','inputs')]:
 inputs.update(read(OUT/name)[key])
for path,h in inputs.items():assert digest(Path(path))==h,path
capture=read(OUT/'step-receipt-capture.json');equivalence=read(OUT/'step-receipt-equivalence.json')
assert capture['source']==equivalence['source']==source
assert digest(OUT/'final-review/step_migration_capture.py')==capture['recipe_sha256']
assert digest(OUT/'final-review/step_migration_review.py')==equivalence['recipe_sha256']
for path,h in capture['inputs'].items():assert digest(Path(path))==h,path
failed_capture=read(OUT/'step-receipt-capture-failed.json')
assert digest(OUT/failed_capture['recipe'])==failed_capture['recipe_sha256']
for path,h in failed_capture['inputs'].items():assert digest(Path(path))==h,path
assert len(equivalence['rows'])==4 and len(equivalence['readers'])==8
assert sum(len(r['changed_entities']) for r in equivalence['rows'])==7
assert all(r['valid'] and r['solids']==1 for r in equivalence['readers'])
for row in capture['rows']:
 for item in row['artifacts']:assert digest(OUT/item['path'])==item['sha256']
assert read(OUT/'continuation-frontier.json')['counts']==dict(native_result=81)
assert not read(OUT/'continuation-frontier.json')['changes']
prisms=read(OUT/'prism-frontier.json');assert len(prisms['rows'])==24 and len(prisms['changes'])==4 and prisms['counts']==dict(native_result=24)
b=read(OUT/'baseline.json');reproduction=read(OUT/'baseline-reproduction.json')
assert digest(ROOT/b['original_prism'])==reproduction['original_prism_sha256']
assert reproduction['old_source_verified'] and reproduction['all_old_artifacts_identical'] and len(reproduction['cases'])==24
artifacts=read(OUT/'artifact-comparison.json')['rows']
for row in artifacts:
 assert digest(OUT/row['path'])==row['candidate_sha256'] and digest(ROOT/row['baseline'])==row['baseline_sha256']
 assert row['unchanged']==(row['candidate_sha256']==row['baseline_sha256'])
new=read(OUT/'new-artifacts.json');assert len(new)==16
for row in new:assert digest(OUT/row['path'])==row['sha256']
cost=read(OUT/'cost-summary.json');assert (cost['preserved_cases'],cost['new_cases'],cost['commands'])==(184,8,129)
assert len(cost['baseline'])==21 and len(cost['candidate'])==22
assert cost['receipt_preserved']==(not cost['migrations']) and cost['representation_migration']
commands=read(OUT/'costs/commands.json');assert len(commands)==129
for row in commands:assert row['exit_code']==row['resource']['exit_code']==0
migration=read(OUT/'migration-review.json');assert migration['all_changes_reviewed']
assert migration['artifact_paths']==[r['path'] for r in artifacts if not r['unchanged']]
assert migration['receipt_cases']==[[r['corpus'],r['case']] for r in cost['migrations']]
assert migration['source']==source
binaries=[read(OUT/name) for name in ['wasm-binary.json','consumer-binary.json','components-binary.json']]
binaries += [read(OUT/name)['binary'] for name in ['previous-axial-admission.json','old-path-control.json']]
binaries += list(read(OUT/'continuation-binaries.json').values())+list(cost['baseline'].values())+list(cost['candidate'].values())
binaries += [r['binary'] for r in capture['rows']]
binaries={r['path']:r for r in binaries}
for path,row in binaries.items():assert Path(path).stat().st_size==row['bytes'] and digest(Path(path))==row['sha256'],path
assert len(read(OUT/'axial-shell-occt.json')['rows'])==8
assert read(OUT/'prism-occt.json')['failed']==0 and len(read(OUT/'prism-occt.json')['fixtures'])==20
archive=read(OUT/'source-reconstruction.json');assert archive['baseline']==m['baseline'] and digest(OUT/archive['archive'])==archive['archive_sha256']
with tarfile.open(OUT/archive['archive'],'r:gz') as packed:contents={item.name:packed.extractfile(item).read() for item in packed.getmembers()}
assert {name:sha(data) for name,data in contents.items()}==archive['members']
unchanged={}
for row in archive['sources']:
 assert row['completely_reconstructible'] and not row['missing_files']
 snapshot=read(OUT/row['snapshot']);assert set(snapshot)==set(row['baseline_files'])|set(row['overlay_files'])
 for name,h in snapshot.items():
  if name in row['overlay_files']:data=contents[row['overlay_files'][name]]
  else:
   if name not in unchanged:unchanged[name]=git('show',m['baseline']+':'+name)
   data=unchanged[name]
  assert sha(data)==h,(row['snapshot'],name)
for name in ['AGENTS.md','properties.md','docs/admission.md']:
 assert (ROOT/name).read_bytes()==git('show',m['baseline']+':'+name)==git('show',m['upstream']+':'+name)
helper=OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec=importlib.util.spec_from_file_location('spans',helper);spans=importlib.util.module_from_spec(spec);spec.loader.exec_module(spans)
old_ledger=git('show',m['baseline']+':docs/properties-status.json').decode();current=(ROOT/'docs/properties-status.json').read_text()
assert current==spans.replace_brep(old_ledger,json.loads(current)['current_work']['hyperbrep'])
assert digest(ROOT/'docs/properties-status.json')==read(OUT/'ledger-update.json')['after_sha256']
status=read(ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
assert not status['complete'] and len(status['work_packages'])==28 and all(r['status'] in ['open','in-progress'] for r in status['work_packages'])
assert status['acceptance_contract']['implementation_ownership']==json.loads(current)['current_work']['hyperbrep']['implementation_ownership']
assert status['acceptance_contract']['upstream_revision']==m['upstream']
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1','b00958cb640fedbe041c46581327df3e64deacf5'}<=set(git('stash','list','--format=%H').decode().splitlines())
for name in source:
 if '/src/' in name and name.endswith('.rs') and '/docs/' not in name and not name.startswith('crates/hyperbrep/'):
  assert (ROOT/name).read_bytes()==git('show',m['baseline']+':'+name),name
for name in git('diff','HEAD','--name-only').decode().splitlines():
 assert name=='docs/properties-status.json' or name.startswith(('crates/hyperbrep/','crates/hyperbrep-io/')),name
links=[]
for path in [ROOT/name for name in m['documents'] if name.endswith('.md')]+list(OUT.glob('*.md')):
 for _,target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)',path.read_text()):
  if '://' in target or target.startswith('#'):continue
  destination=path.parent/target.split('#')[0]
  assert destination.exists() or destination==OUT/'audit.json',(path,target)
  links.append((str(path.relative_to(ROOT)),target))
for path in OUT.rglob('*.json'):read(path)
for path in (OUT/'final-review').glob('*.py'):ast.parse(path.read_text(),filename=str(path))
command=['git','diff','--cached','--check'];check=subprocess.run(command,cwd=ROOT,text=True,capture_output=True)
diagnostics=[match.groups() for line in check.stdout.splitlines() if (match:=re.match(r'^(.+):(\d+): (.*)$',line))]
raw=sorted({r[0] for r in diagnostics})
for name in raw:
 path=ROOT/name;assert path.is_relative_to(OUT),name
 if path.suffix=='.log':continue
 assert path.name=='Cargo.toml',name
 expected=inputs.get(str(path),source.get(str(path.relative_to(ROOT))))
 assert expected is not None and digest(path)==expected
 assert {r[2] for r in diagnostics if r[0]==name}=={'new blank line at EOF.'}
scoped=subprocess.run([*command,'--','.',*[':(exclude)'+name for name in raw]],cwd=ROOT,text=True,capture_output=True)
assert scoped.returncode==0,scoped.stdout
assert not git('diff','--check') and hashes()==source
result=dict(source_identity=m['source_identity'],baseline=m['baseline'],evidence_files=len(m['evidence_files']),source_snapshots=len(archive['sources']),overlay_members=len(contents),frozen_binaries=len(binaries),preceding_artifact_counts=q['preceding_artifact_counts'],new_native_step_artifacts=16,original_prism_cases=24,new_complete_workflows=8,wasm_groups=138,local_links=len(links),non_brep_ledger_bytes_preserved=True,supporting_runtime_unchanged=True,protected_stashes_preserved=True,work_packages_open=28,raw_whitespace=dict(command=command,exit_code=check.returncode,diagnostics=check.stdout,retained_raw_files=raw,scoped_exit_code=scoped.returncode),passed=True,scope='Local axial-shell admission and explicit representation migration. General geometry, source qualification, resources, package and full pre-push gates remain open. No push or whole-project completion claim.')
(OUT/'audit.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k!='raw_whitespace'},indent=2),flush=True)
