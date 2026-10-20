"""Audit the feature's source, artifacts, failed controls and ownership scope."""
import ast
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import subprocess
import sys
import tarfile

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

read=lambda path:json.loads(path.read_text())
sha=lambda data:hashlib.sha256(data).hexdigest()
digest=lambda path:sha(path.read_bytes())
git=lambda *args:subprocess.check_output(['git',*args],cwd=ROOT)
manifest=read(OUT/'manifest.json')
assert git('branch','--show-current').strip()==b'brep'
assert git('rev-parse','HEAD').decode().strip()==manifest['baseline']
assert subprocess.run(['git','merge-base','--is-ancestor',manifest['upstream'],'HEAD'],cwd=ROOT).returncode==0
assert not git('diff','--name-only','--diff-filter=U')
source=hashes()
assert source==read(OUT/'final-source.json')
assert sha(json.dumps(source,sort_keys=True).encode())==manifest['source_identity']
q=read(OUT/'qualification-summary.json')
assert q['source']==source
assert q['tests']['native-release']['passed']==560
assert q['tests']['native-minimal']['passed']==552
assert q['tests']['region-debug']['passed']==8
assert q['wasm']['groups']==119 and q['wasm']['imports']==0
assert q['new_complete_workflows']==dict(stroke=4,multiple_components=2)
assert not q['old_path']['original_four_case_contract_complete']
attempts=read(OUT/'attempts.json')
assert all(row['source_unchanged'] for row in attempts)
final_commands=set(read(OUT/'qualification-driver.json')['executed'])
for row in attempts:
    snapshot=read(OUT/row['source'])
    if row['label'] in final_commands:
        assert row['exit_code']==0 and snapshot==source,row['label']
assert len(q['failures'])==17
assert q['failures']==[row for row in attempts if row['exit_code']]
for name in ['qualification-driver.json','finish-checks.json','resource-observations.json',
             'continuation-admission.json','consumer-final.json','components-admission.json','old-path-control.json']:
    assert read(OUT/name)['source']==source
for relative,expected in manifest['evidence_files'].items():assert digest(OUT/relative)==expected,relative
for relative,expected in manifest['documents'].items():assert digest(ROOT/relative)==expected,relative
for name in ['consumer-inputs.json','wasm-inputs.json','continuation-inputs.json','components-inputs.json']:
    for relative,expected in read(OUT/name).items():assert digest(Path(relative))==expected,relative
for relative,expected in read(OUT/'old-path-control.json')['inputs'].items():assert digest(Path(relative))==expected
assert read(OUT/'continuation-frontier.json')['counts']==dict(native_result=81)
assert not read(OUT/'continuation-frontier.json')['changes']
assert read(OUT/'prism-frontier.json')['counts']==dict(native_result=18,unsupported=6)
artifacts=read(OUT/'preserved-artifacts.json')
assert len(artifacts)==61
for row in artifacts:assert row['unchanged'] and digest(OUT/row['path'])==row['baseline_sha256']==row['candidate_sha256']
for row in read(OUT/'preserved-cone-artifacts.json'):assert digest(OUT/row['path'])==row['sha256']==digest(ROOT/row['baseline'])
assert len(read(OUT/'preserved-cone-artifacts.json'))==10
for row in read(OUT/'old-path-control.json')['artifacts']:assert digest(OUT/row['path'])==row['sha256']==digest(Path(row['baseline']))
assert len(read(OUT/'new-artifacts.json'))==12
for row in read(OUT/'new-artifacts.json'):
    assert digest(OUT/row['path'])==row['sha256']
    for other in row.get('agrees_with',[]):assert (OUT/row['path']).read_bytes()==(OUT/other).read_bytes()
binaries=[read(OUT/name) for name in ['wasm-binary.json','components-binary.json']]
binaries+=[read(OUT/name)['binary'] for name in ['consumer-v1.json','consumer-final.json','old-path-control.json']]
binaries+=list(read(OUT/'continuation-binaries.json').values())
binaries+=list(read(OUT/'resource-binaries.json').values())
binaries={row['path']:row for row in binaries}
for path,row in binaries.items():assert Path(path).stat().st_size==row['bytes'] and digest(Path(path))==row['sha256'],path
resources=read(OUT/'resource-observations.json')
assert len(resources['rows'])==30
for row in resources['rows']:
    assert row['metrics']['exit_code']==row['command']['exit_code']
    for artifact in row.get('artifacts',[]):assert digest(OUT/artifact['path'])==artifact['sha256']
for row in resources['preserved_old_path']:
    assert ('wall_ratio' in row)==row['completed']
assert len(read(OUT/'region-occt.json')['rows'])==4
assert len(read(OUT/'components-occt.json')['rows'])==2

archive=read(OUT/'source-reconstruction.json')
assert archive['baseline']==manifest['baseline']
assert digest(OUT/archive['archive'])==archive['archive_sha256']
with tarfile.open(OUT/archive['archive'],'r:gz') as packed:
    contents={item.name:packed.extractfile(item).read() for item in packed.getmembers()}
assert {name:sha(data) for name,data in contents.items()}==archive['members']
unchanged={}
for row in archive['sources']:
    assert row['completely_reconstructible'] and not row['missing_files']
    snapshot=read(OUT/row['snapshot'])
    assert set(snapshot)==set(row['baseline_files'])|set(row['overlay_files'])
    for relative,expected in snapshot.items():
        if relative in row['overlay_files']:data=contents[row['overlay_files'][relative]]
        else:
            if relative not in unchanged:unchanged[relative]=git('show',manifest['baseline']+':'+relative)
            data=unchanged[relative]
        assert sha(data)==expected,(row['snapshot'],relative)

for path in ['AGENTS.md','properties.md','docs/admission.md']:
    assert (ROOT/path).read_bytes()==git('show',manifest['baseline']+':'+path)==git('show',manifest['upstream']+':'+path)
helper=OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec=importlib.util.spec_from_file_location('spans',helper)
spans=importlib.util.module_from_spec(spec);spec.loader.exec_module(spans)
baseline_ledger=git('show',manifest['baseline']+':docs/properties-status.json').decode()
current=(ROOT/'docs/properties-status.json').read_text()
assert current==spans.replace_brep(baseline_ledger,json.loads(current)['current_work']['hyperbrep'])
assert digest(ROOT/'docs/properties-status.json')==read(OUT/'ledger-update.json')['after_sha256']
status=read(ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
assert not status['complete'] and len(status['work_packages'])==28
assert all(row['status'] in ['open','in-progress'] for row in status['work_packages'])
brep=json.loads(current)['current_work']['hyperbrep']
assert status['acceptance_contract']['implementation_ownership']==brep['implementation_ownership']
assert status['acceptance_contract']['upstream_revision']==manifest['upstream']
stashes=git('stash','list','--format=%H').decode().splitlines()
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1','b00958cb640fedbe041c46581327df3e64deacf5'}<=set(stashes)
# No shared implementation was changed. The sole production body is a public
# strict wrapper; its private constructor and Boolean callers stay byte-identical.
runtime=[name for name in source if '/src/' in name and name.endswith('.rs') and '/docs/' not in name]
for name in runtime:
    if name!='crates/hyperbrep/src/ownership/builder.rs':
        assert (ROOT/name).read_bytes()==git('show',manifest['baseline']+':'+name),name
name='crates/hyperbrep/src/ownership/builder.rs'
old=git('show',manifest['baseline']+':'+name).decode()
new=(ROOT/name).read_text()
start=new.index('/// Extrudes a regularized [`CurveRegion2`]')
end=new.index('/// Revolves one exact simple radial/axial polygon',start)
restored=(new[:start]+new[end:]).replace('use hypercurve::{Contour2, CurvePath2, CurveRegion2};','use hypercurve::{Contour2, CurvePath2};')
assert restored==old
changes=git('diff','HEAD','--name-only').decode().splitlines()
for name in changes:
    assert name=='docs/properties-status.json' or name.startswith(('crates/hyperbrep/','crates/hyperbrep-io/')),name
links=[]
for path in [ROOT/name for name in manifest['documents'] if name.endswith('.md')]+list(OUT.glob('*.md')):
    for _,target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)',path.read_text()):
        if '://' in target or target.startswith('#'):continue
        destination=path.parent/target.split('#')[0]
        assert destination.exists() or destination==OUT/'audit.json',(path,target)
        links.append((str(path.relative_to(ROOT)),target))
for path in OUT.rglob('*.json'):read(path)
for path in (OUT/'final-review').glob('*.py'):ast.parse(path.read_text(),filename=str(path))
command=['git','diff','--cached','--check']
check=subprocess.run(command,cwd=ROOT,text=True,capture_output=True)
diagnostics=[match.groups() for line in check.stdout.splitlines() if (match:=re.match(r'^(.+):(\d+): (.*)$',line))]
raw=sorted({row[0] for row in diagnostics})
input_hashes={}
for name in ['consumer-inputs.json','components-inputs.json','wasm-inputs.json']:input_hashes.update(read(OUT/name))
for name in raw:
    path=ROOT/name
    assert path.is_relative_to(OUT),name
    if path.suffix=='.log':continue
    assert path.name=='Cargo.toml' and str(path) in input_hashes,name
    assert digest(path)==input_hashes[str(path)]
    assert {row[2] for row in diagnostics if row[0]==name}=={'new blank line at EOF.'}
scoped=subprocess.run([*command,'--','.',*[':(exclude)'+name for name in raw]],cwd=ROOT,text=True,capture_output=True)
assert scoped.returncode==0,scoped.stdout
assert not git('diff','--check')
assert hashes()==source
result=dict(source_identity=manifest['source_identity'],baseline=manifest['baseline'],
    evidence_files=len(manifest['evidence_files']),source_snapshots=len(archive['sources']),overlay_members=len(contents),
    frozen_binaries=len(binaries),preserved_step_artifacts=71,new_step_native_artifacts=12,local_links=len(links),
    non_brep_ledger_bytes_preserved=True,shared_runtime_unchanged=True,protected_stashes_preserved=True,work_packages_open=28,
    raw_whitespace=dict(command=command,exit_code=check.returncode,diagnostics=check.stdout,
        retained_raw_files=raw,scoped_exit_code=scoped.returncode),passed=True,
    scope='Local feature admission audit; unchanged unsupported workflows and inherited scalar failures remain separate. No push, package, coverage or work-package completion claim.')
(OUT/'audit.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='raw_whitespace'},indent=2),flush=True)
