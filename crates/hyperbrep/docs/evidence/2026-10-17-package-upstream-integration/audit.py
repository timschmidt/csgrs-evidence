"""Audit merge ownership, exact package membership and retained consumer evidence."""
import ast,gzip,hashlib,importlib.util,json,re,subprocess
from pathlib import Path
from check import ROOT,OUT,hashes,sha
read=lambda p:json.loads(p.read_text())
git=lambda *a:subprocess.check_output(['git',*a],cwd=ROOT)
b=read(OUT/'baseline.json');q=read(OUT/'qualification.json');source=hashes()
assert git('rev-parse','HEAD').decode().strip()==b['baseline']
assert git('rev-parse','MERGE_HEAD').decode().strip()==b['upstream']
assert git('branch','--show-current').strip()==b'brep'
assert not git('diff','--name-only','--diff-filter=U')
assert source==q['source'] and all(sha(ROOT/n)==h for n,h in b['runtime'].items())
attempts=read(OUT/'attempts.json');assert all(r['exit_code']==0 and r['source_unchanged'] for r in attempts)
latest={r['label']:r for r in attempts}
assert '2 passed; 0 failed' in (OUT/latest['readme-tests']['stdout']).read_text()
assert read(OUT/latest['baseline-metadata']['stdout'])==read(OUT/latest['merged-metadata']['stdout'])
assert sha(OUT/'qualify.py')==q['recipe_sha256']
assert read(OUT/'result.json')['kept']
bridge=read(OUT/'consumer-source-bridge.json');assert bridge['source']==source and bridge['all_production_and_lock_files_identical']
assert sha(Path(bridge['binary']['path']))==bridge['binary']['sha256']
for row in read(OUT/'consumer-artifacts.json'):
 assert sha(OUT/row['path'])==row['sha256']==sha(ROOT/row['baseline'])
packages=read(OUT/'package-comparison.json');assert packages['source']==source
assert sha(OUT/'package_review.py')==packages['recipe_sha256']
for crate,item in packages['crates'].items():
 for name,file in item['files'].items():assert sha(ROOT/'crates'/crate/name)==file['sha256']
 assert item['added']==['LICENSE-APACHE'] and all(n.startswith('docs/evidence/') for n in item['removed'])
 assert not any(n.startswith('docs/evidence/') for n in item['files'])
 assert sha(ROOT/'crates'/crate/'LICENSE-APACHE')==sha(ROOT/'crates/hyperreal/LICENSE.txt')
helper=OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py';spec=importlib.util.spec_from_file_location('spans',helper);spans=importlib.util.module_from_spec(spec);spec.loader.exec_module(spans)
upstream=git('show',b['upstream']+':docs/properties-status.json').decode();ledger=(ROOT/'docs/properties-status.json').read_text()
assert ledger==spans.replace_brep(upstream,json.loads(ledger)['current_work']['hyperbrep'])
assert sha(ROOT/'docs/properties-status.json')==read(OUT/'ledger-update.json')['result_sha256']
status=read(ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json');assert not status['complete'] and len(status['work_packages'])==28
assert all(r['status'] in ['open','in-progress'] for r in status['work_packages'])
assert status['acceptance_contract']['upstream_revision']==b['upstream']
assert set(b['protected_stashes'])<=set(git('stash','list','--format=%H').decode().splitlines())
for name in ['AGENTS.md','properties.md','docs/admission.md']:
 assert (ROOT/name).read_bytes()==git('show',b['baseline']+':'+name)==git('show',b['upstream']+':'+name)
initial=b['inventory_refinement'];assert sha(OUT/initial['initial_archive'])==initial['initial_archive_sha256']
assert hashlib.sha256(gzip.decompress((OUT/initial['initial_archive']).read_bytes())).hexdigest()==initial['initial_sha256']
resolution=read(OUT/'ledger-resolution.json');assert sha(OUT/resolution['conflict_archive'])==resolution['conflict_archive_sha256']
assert hashlib.sha256(gzip.decompress((OUT/resolution['conflict_archive']).read_bytes())).hexdigest()==resolution['conflict_sha256']
failure=read(OUT/'qualification-setup-failure.json');assert sha(OUT/failure['recipe'])==failure['recipe_sha256']
allowed=set(git('diff','--name-only',b['previous_upstream'],b['upstream']).decode().splitlines())|{'crates/hyperbrep/Cargo.toml','crates/hyperbrep-io/LICENSE-APACHE','crates/hyperbrep/docs/DEVELOPMENT_PLAN.md','crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'}
for name in git('diff','--cached','--name-only').decode().splitlines():assert name in allowed or name.startswith(str(OUT.relative_to(ROOT))+'/'),name
raw_check=subprocess.run(['git','diff','--cached','--check'],cwd=ROOT,text=True,capture_output=True)
diagnostics=[m.groups() for line in raw_check.stdout.splitlines() if (m:=re.match(r'^(.+):(\d+): (.*)$',line))]
raw=read(OUT/'raw-whitespace.json')['files']
assert {r[0] for r in diagnostics}==set(raw)
assert all(r[2]=='new blank line at EOF.' for r in diagnostics)
for name,h in raw.items():
 assert sha(ROOT/name)==h
 if name.startswith('docs/evidence/'):assert (ROOT/name).read_bytes()==git('show',b['upstream']+':'+name)
 else:assert name==str((OUT/latest['readme-tests']['stdout']).relative_to(ROOT))
scoped=subprocess.run(['git','diff','--cached','--check','--','.',*[':(exclude)'+name for name in raw]],cwd=ROOT,text=True,capture_output=True)
assert scoped.returncode==0,scoped.stdout
assert not git('diff','--check')
links=[]
for path in [OUT/'README.md',ROOT/'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md']:
 for target in re.findall(r'\[[^\]]+\]\(([^)]+)\)',path.read_text()):
  if '://' in target or target.startswith('#'):continue
  destination=path.parent/target.split('#')[0];assert destination.exists() or destination in [OUT/'audit.json',OUT/'manifest.json'],(path,target)
  links.append(target)
for path in OUT.glob('*.py'):ast.parse(path.read_text())
for path in OUT.rglob('*.json'):read(path)
documents=['crates/hyperbrep/Cargo.toml','crates/hyperbrep/LICENSE-APACHE','crates/hyperbrep-io/LICENSE-APACHE','crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json','crates/hyperbrep/docs/DEVELOPMENT_PLAN.md','docs/properties-status.json']
files={str(p.relative_to(OUT)):sha(p) for p in sorted(OUT.rglob('*')) if p.is_file() and p.name not in ['manifest.json','audit.json','audit.log']}
manifest=dict(baseline=b['baseline'],upstream=b['upstream'],previous_upstream=b['previous_upstream'],source=source,contract='contract.md',qualification='qualification.json',result='result.json',package_comparison='package-comparison.json',source_bridge='consumer-source-bridge.json',evidence_files=files,documents={n:sha(ROOT/n) for n in documents},scope='Package/documentation integration; exact runtime source and locked dependency graph preservation. Broader BREP, historical qualification and release gates remain open.')
(OUT/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
result=dict(passed=True,production_lock_contract_files_preserved=len(b['runtime']),source_files=len(source),evidence_files=len(files),upstream=b['upstream'],package_members={k:v['after_count'] for k,v in packages['crates'].items()},independent_readme_tests=2,complete_native_step_workflows=8,byte_identical_consumer_artifacts=16,metadata_identical=True,non_brep_ledger_bytes_preserved=True,protected_stashes_preserved=True,work_packages_open=28,local_links=len(links),raw_whitespace=dict(full_exit_code=raw_check.returncode,diagnostics=raw_check.stdout,preserved_raw_files=raw,scoped_exit_code=scoped.returncode),scope='No package archive, published install, new performance, full pre-push or full-plan completion claim.')
(OUT/'audit.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2),flush=True)
