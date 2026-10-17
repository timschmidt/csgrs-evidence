"""Close modeling and circuit evidence; do not admit the cache candidate."""
import ast
import gzip
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tarfile
sys.dont_write_bytecode = True
ORIGIN = Path('/home/tim/Documents/GitHub/workspace/csgrs')
V = Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
D = V / 'paper-worktree-v1'
C = V / 'checkout-candidate-v1'
W = Path(__file__).resolve().parent
P = D / 'docs/evidence/2026-10-17-scientific-manuscript'
E = D / 'docs/evidence/2026-10-17-circle-support-cargo'
PREFIX = str(E.relative_to(D)) + '/'
BASE = 'fc23195a16f45fb396a5dd731feb6c7310d8ce7c'
GIT = ['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS'] = '0'
sys.path.insert(0,str(ORIGIN/'docs/evidence/2026-10-16-physical-build-requalification'))
from load_expectations_v1 import load

def sha(path):
    with Path(path).open('rb') as stream:
        return hashlib.file_digest(stream,'sha256').hexdigest()

def read(path):
    return json.loads(Path(path).read_text())

def dump(path,value):
    Path(path).write_text(json.dumps(value,sort_keys=True,indent=2)+'\n')

def span(raw):
    start = re.search(rb'"current_work"\s*:\s*',raw).end()
    value,count = json.JSONDecoder().raw_decode(raw[start:].decode())
    return start,start+len(raw[start:].decode()[:count].encode()),value

def inherited_path(name):
    local = D/name
    return local if local.exists() else ORIGIN/name


P = D/'docs/evidence/2026-10-17-circle-support-native-cargo'
E = D/'docs/evidence/2026-10-17-circle-support-modeling-cargo'
PREFIX = str(E.relative_to(D))+'/'
BASE = 'dd22b292e7a4c28e772fe5483e6db64d55d85afc'
assert not E.exists()
assert shutil.disk_usage(D).free > 768*1024**2
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=D,text=True).strip()==BASE
assert not subprocess.check_output(GIT+['status','--porcelain','--untracked-files=all'],cwd=D)
previous=read(P/'checkpoint-v1.json')
assert all(sha(D/p)==h for p,h in previous['evidence_files_sha256'].items())
prior,missing=load(D/previous['artifact_expectations'],allow_unqualified=True)
assert len(prior)==1235755 and len(missing)==27093
inherited=previous['inherited_implementation_sha256'] | previous['implementation_sha256']
live=previous['restored_native_sha256'] | inherited
for pins in [live,previous['extra_unchanged_inputs_sha256'],previous['live_source_dependency_pins_sha256']]:
    assert all(sha(inherited_path(p))==h for p,h in pins.items())
assert sha(D/'docs/properties-status.json')==previous['ledger_after_sha256']
original_ledger=sha(ORIGIN/'docs/properties-status.json')
assert original_ledger=='b86be07fd3b288a1ca97665d5ddce3988eb07c5ef112e136c3eaca4c2904cde3'
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=ORIGIN,text=True).strip()=='7ed43501755fd64a01f54c3078d12229cbc0129d'
result=read(V/'modeling-downstream-result-v1.json')
protocol=read(V/'modeling-downstream-protocol-v1.json')
assert result['complete'] and result['source_unchanged']
assert result['root_ci_feature_configurations_passed'] and result['circuit_default_and_all_features_passed']
assert len(result['commands'])==10
assert sha(V/'control/modeling-downstream-v1/validate_v1.py')==protocol['helper_sha256']
assert sha(V/'control/modeling-downstream-v1/contract-v1.md')==protocol['contract_sha256']
assert sha(V/'control/validation_runner_v2.py')==protocol['runner_sha256']
assert sha(V/'candidate-source-inventory-v1.json.gz')==protocol['source_inventory_sha256']
inventory=json.loads(gzip.decompress((V/'candidate-source-inventory-v1.json.gz').read_bytes()))
source_pins={p:h for p,h in inventory.items() if not p.startswith('crates/comparisons/')}
assert all(sha(C/p)==h for p,h in source_pins.items())
selected_logs=[V/'logs'/name for name in sorted(result['commands'])]
summaries={}
for name,record in result['commands'].items():
    folder=V/'logs'/name
    raw_result=read(folder/'result.json')
    assert raw_result==record and record['output_closed'] and record['exit_code']==0 and not record['stops']
    assert all(sha(folder/n)==h for n,h in record['output_sha256'].items())
    if name in result['test_summaries']:
        text=(folder/'stdout').read_text()
        rows=re.findall(r'^test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out;',text,re.M)
        assert rows and all(row[0]=='ok' and row[2]==row[5]=='0' for row in rows)
        summary={'rows':[list(row) for row in rows],'passed':sum(int(row[1]) for row in rows),
            'failed':0,'ignored':sum(int(row[3]) for row in rows)}
        assert summary==result['test_summaries'][name]
        summaries[name]={k:x for k,x in summary.items() if k!='rows'} | {'terminal_groups':len(rows)}
assert len(summaries)==4
assert summaries['modeling-tests-default-v1']['passed']==440
assert summaries['modeling-tests-all-v1']['passed']==458 and summaries['modeling-tests-all-v1']['ignored']==1
ignored_lines=[line for line in (V/'logs/modeling-tests-all-v1/stdout').read_text().splitlines() if ' ... ignored' in line]
assert len(ignored_lines)==1 and 'generated_readme_pngs_match_checked_in_baselines' in ignored_lines[0]
assert sha(C/'tests/readme_render_regression.rs')==sha(V/'checkout-baseline-v1/tests/readme_render_regression.rs')
review={'status':'complete modeling and circuit consumer configurations passed; cache admission remains open',
    'rust_baseline_revision':'7ed43501755fd64a01f54c3078d12229cbc0129d','documentation_base_revision':BASE,
    'source_inventory_sha256':protocol['source_inventory_sha256'],'source_pin_count':len(source_pins),
    'command_count':len(result['commands']),'test_summaries':summaries,
    'existing_ignored_test_lines':ignored_lines,'ignored_test_source_matches_baseline':True,
    'root_minimal_default_all_feature_checks_passed':True,'root_all_feature_clippy_passed':True,
    'root_all_feature_docs_passed':True,'circuit_all_feature_clippy_passed':True,
    'original_fixtures_profiles_policies_preserved':True,'test_workers':2,
    'external_wall_limit_seconds_per_command':1800,'source_unchanged':True,'performance_comparison':False,
    'original_35_file_bundle_disposition':'rejected; independently retained smaller fixes unchanged',
    'cache_index_admitted':False,'all_workspace_ci_qualified':False,'all_bindings_qualified':False,
    'external_distribution_complete':False,'full_plan_complete':False,
    'remaining_gates':['real native binding consumers','Hypercurve demo','clean installed distribution'],
    'original_worktree_integration_pending':True}
dump(W/'review-v1.json',review)
subprocess.run(GIT+['sparse-checkout','add',str(E.relative_to(D))],cwd=D,check=True,stdout=subprocess.DEVNULL)
E.mkdir(parents=True)
for name in ['contract-v1.md','close_v1.py','review-v1.json']:
    shutil.copy2(W/name,E/name)
closed_roots=[W,V/'control/modeling-downstream-v1',*selected_logs,*[V/'scratch'/p.name for p in selected_logs]]
selected=[V/('modeling-downstream-'+name+'-v1.json') for name in ['protocol','progress','result']]
for name in ['curve-cargo-stage-verification-v1.json','curve-cargo-stage-whitespace-v1.stdout',
    'curve-cargo-stage-whitespace-v1.stderr','curve-cargo-commit-verification-v1.json',
    'native-cargo-stage-verification-v1.json','native-cargo-stage-whitespace-v1.stdout',
    'native-cargo-stage-whitespace-v1.stderr','native-cargo-commit-verification-v1.json',
    'continuation-after-native-qualification-v1.json','continuation-after-native-qualification-v2.json']:
    selected.append(V/name)
for root in closed_roots:
    selected.extend(p for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink())
assert len(selected)==len(set(selected))
physical={};members={}
for path in selected:
    assert path.is_file() and not path.is_symlink(),path
    before=path.stat();digest=sha(path);after=path.stat()
    assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns)==(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    physical[str(path)]=digest
    members[str(path.relative_to(V))]={'physical_path':str(path),'sha256':digest,'bytes':before.st_size}
assert prior.keys().isdisjoint(physical)
archive=E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as output:
    for name,row in members.items():output.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as source:
    assert set(source.getnames())==set(members)
    for name,row in members.items():
        with source.extractfile(name) as stream:
            assert hashlib.file_digest(stream,'sha256').hexdigest()==row['sha256']
dump(E/'archive-members-v1.json',{'members':members,'archive_sha256':sha(archive),
    'archive_bytes':archive.stat().st_size,'all_members_content_verified':True})
lines=['# Modeling and circuit consumer qualification','',
    'The ten declared commands completed successfully against unchanged candidate',
    'source, fixtures and policies. Test totals were recomputed from terminal',
    'summaries and matched the frozen runner results.','',
    '| Configuration | Passed | Failed | Ignored | Terminal groups |',
    '| --- | ---: | ---: | ---: | ---: |']
for name,row in summaries.items():
    lines.append('| '+name+' | '+' | '.join(str(row[key]) for key in ['passed','failed','ignored','terminal_groups'])+' |')
lines.extend(['','Root minimal/default/all-feature checks, strict all-target/all-feature',
    'Clippy and warning-free all-feature documentation passed. Circuit default',
    'debug and all-feature release tests and strict all-feature Clippy passed.',
    'The root debug profiles and full-resolution workloads were preserved.',
    'Tests used two local workers under the predeclared external resource limits.',
    'This check does not establish the CI default worker scheduling or a speedup.','',
    'The one existing all-feature ignore is the expensive byte-for-byte README',
    'render regression. Its source matches the baseline unchanged; this checkpoint',
    'does not claim that ignored render workload passed.','',
    'The cache source remains separately uncommitted and unadmitted. Native',
    'binding consumers, the demo and clean installed distribution remain separate',
    'gates. The original 35-file bundle remains rejected. All-workspace CI and',
    'the full properties plan remain open.','',
    'The raw archive contains completed command logs, scratch contents and control',
    'files, with independently verified physical paths and archive members.',
    'General source, target and compiler-cache roots remain open. Historical',
    'missing paths remain 27,093 and are not requalified. Only current_work in',
    'the ledger changes. Original-repository integration remains pending.'])
(E/'README.md').write_text('\n'.join(lines)+'\n')
ledger=D/'docs/properties-status.json';raw=ledger.read_bytes()
reference=subprocess.check_output(GIT+['show','9025de62:docs/properties-status.json'],cwd=D)
start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
key='circle_support_modeling_qualification';assert key not in current
current[key]={'status':review['status'],'contract':PREFIX+'contract-v1.md','qualification':PREFIX+'review-v1.json',
    'checkpoint':PREFIX+'checkpoint-v1.json','artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'command_count':10,'test_summaries':summaries,'source_unchanged':True,'cache_index_admitted':False,
    'full_plan_complete':False,'isolated_worktree':str(D),'original_worktree_integration_pending':True}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:]
us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k!='current_work'}=={k:v for k,v in json.loads(reference).items() if k!='current_work'}
ledger.write_bytes(updated)
expectations={'schema_version':3,'kind':'modeling and circuit qualification',
    'parent_expectations':str(D/previous['artifact_expectations']),
    'parent_expectations_repository_relative':previous['artifact_expectations'],
    'parent_expectations_sha256':previous['artifact_expectations_sha256'],'parent_repository_during_closure':str(D),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'added_physical_artifacts_sha256':physical,'new_physical_artifacts_verified':len(physical),
    'expected_artifact_paths':len(prior)+len(physical),'physical_roots':[str(p) for p in closed_roots],
    'directory_inventory':[str(p) for p in closed_roots],'local_tool_symlink_targets':{},
    'inherited_artifacts_reverified':False,'complete_artifact_audit_passed':False,'historical_preservation_complete':False,
    'scope':'All newly closed modeling paths independently hashed; general source/cache/build roots remain open.'}
(E/'artifact-expectations-v1.json.gz').write_bytes(gzip.compress((json.dumps(expectations,sort_keys=True)+'\n').encode(),mtime=0))
for path in E.iterdir():
    if path.suffix in ['.py','.md','.json']:
        content=path.read_text()
        assert all(line==line.rstrip() for line in content.splitlines()) and not content.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(content)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check','--','docs/properties-status.json'],cwd=D,stdout=out,stderr=err)
assert checked.returncode==0
files={str(p.relative_to(D)):sha(p) for p in E.rglob('*') if p.is_file()}
record=dict(previous)
record.update({'status':review['status'],'checkpoint_kind':'modeling and circuit qualification',
    'previous_closure':str((P/'checkpoint-v1.json').relative_to(D)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),
    'evidence_files_sha256':files,'artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'new_physical_artifacts_verified':len(physical),'implementation_sha256':{},'inherited_implementation_sha256':inherited,
    'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),
    'only_current_work_changed':True,'source_changes_applied':False,'candidate_changes_separately_uncommitted':True,
    'production_prefixes_unchanged':True,'production_rust_sources_unchanged':True,
    'original_repository_updated':False,'isolated_worktree':str(D),'original_worktree_integration_pending':True,
    'evidence_parent_repository':str(D),'runtime_tests_rerun':True,'format_rerun':False,'format_exit_code':None,
    'whitespace_exit_code':0,'modeling_and_circuit_qualification_complete':True,
    'cache_index_admitted':False,'full_cargo_matrix_qualified':False,'release_qualification_complete':False,'full_plan_complete':False})
dump(E/'checkpoint-v1.json',record)
assert all(sha(p)==h for p,h in physical.items())
assert all(sha(C/p)==h for p,h in source_pins.items())
assert all(sha(inherited_path(p))==h for p,h in live.items())
assert sha(ORIGIN/'docs/properties-status.json')==original_ledger
print(json.dumps({'new_physical_paths':len(physical),'expected_physical_paths':len(prior)+len(physical),
    'archive_members':len(members),'archive_bytes':archive.stat().st_size,'evidence_files':len(files)+1,
    'ledger_sha256':sha(ledger),'cache_index_admitted':False,'original_repository_updated':False}),flush=True)
