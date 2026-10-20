"""Audit the pending merge, preserved failures, sources, artifacts and scope."""
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
assert git('rev-parse','MERGE_HEAD').decode().strip()==manifest['upstream']
assert not git('diff','--name-only','--diff-filter=U')
source=hashes()
assert source==read(OUT/'final-source.json')
assert sha(json.dumps(source,sort_keys=True).encode())==manifest['source_identity']
q=read(OUT/'qualification-summary.json')
assert q['source']==source
assert q['tests']['native-release']['passed']==552
assert q['tests']['native-minimal']['passed']==544
assert q['tests']['curve-release']['passed']==1755
assert q['tests']['curve-release']['ignored']==6
assert q['tests']['stroke-debug']['passed']==10
assert q['wasm']['groups']==111 and q['wasm']['imports']==0
assert not q['consumer']['original_driver_completed']
assert q['consumer']['complete_workflows']==q['consumer']['preserved_unsupported_workflows']==2
attempts=read(OUT/'attempts.json')
assert all(row['source_unchanged'] for row in attempts)
final_commands=set(read(OUT/'qualification-driver.json')['executed'])
for row in attempts:
    snapshot=read(OUT/row['source'])
    if row['label'] in final_commands:
        assert row['exit_code']==0 and snapshot==source,row['label']
    if row['label'].startswith('inherited-scalar'):
        assert row['exit_code']==101 and 'FACTORS > 0' in (OUT/row['log']).read_text()
for name in ['qualification-driver.json','supplement-driver.json','resource-observations.json','continuation-admission.json']:
    assert read(OUT/name)['source']==source
for relative,expected in manifest['evidence_files'].items():
    assert digest(OUT/relative)==expected,relative
for relative,expected in manifest['documents'].items():
    assert digest(ROOT/relative)==expected,relative
for name in ['consumer-inputs.json','wasm-inputs.json','frontier-inputs.json','continuation-inputs.json']:
    for relative,expected in read(OUT/name).items():
        assert digest(Path(relative))==expected,relative
assert read(OUT/'continuation-frontier.json')['counts']==dict(native_result=81)
assert not read(OUT/'continuation-frontier.json')['changes']
assert read(OUT/'prism-frontier.json')['counts']==dict(native_result=18,unsupported=6)
artifacts=read(OUT/'preserved-artifacts.json')
assert len(artifacts)==61
for row in artifacts:
    assert row['unchanged'] and digest(OUT/row['path'])==row['baseline_sha256']==row['candidate_sha256']
for row in read(OUT/'preserved-cone-artifacts.json'):
    assert digest(OUT/row['path'])==row['sha256']==digest(ROOT/row['baseline'])
for row in read(OUT/'consumer-artifact-comparison.json'):
    assert row['unchanged']
    assert digest(OUT/'baseline-artifacts'/row['name'])==digest(OUT/'candidate-artifacts'/row['name'])==row['baseline_sha256']==row['candidate_sha256']
binaries=[read(OUT/name) for name in ['baseline-consumer-binary.json','candidate-consumer-binary.json',
    'baseline-wasm-binary.json','candidate-wasm-binary.json']]
binaries+=list(read(OUT/'continuation-binaries.json').values())
binaries.append(read(OUT/'consumer-v1/binary.json'))
for row in binaries:
    path=Path(row['path'])
    assert path.stat().st_size==row['bytes'] and digest(path)==row['sha256'],row
for row in read(OUT/'resource-observations.json')['rows']:
    for artifact in row['artifacts']:
        assert digest(OUT/artifact['path'])==artifact['sha256']

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
        if relative in row['overlay_files']:
            data=contents[row['overlay_files'][relative]]
        else:
            if relative not in unchanged:
                unchanged[relative]=git('show',manifest['baseline']+':'+relative)
            data=unchanged[relative]
        assert sha(data)==expected,(row['snapshot'],relative)

for path in ['AGENTS.md','properties.md','docs/admission.md']:
    assert (ROOT/path).read_bytes()==git('show',manifest['baseline']+':'+path)==git('show',manifest['upstream']+':'+path)
helper=OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec=importlib.util.spec_from_file_location('spans',helper)
spans=importlib.util.module_from_spec(spec);spec.loader.exec_module(spans)
upstream=git('show',manifest['upstream']+':docs/properties-status.json').decode()
current=(ROOT/'docs/properties-status.json').read_text()
assert current==spans.replace_brep(upstream,json.loads(current)['current_work']['hyperbrep'])
assert digest(ROOT/'docs/properties-status.json')==read(OUT/'ledger-update.json')['after_sha256']
status=read(ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
assert not status['complete'] and len(status['work_packages'])==28
assert all(row['status'] in ['open','in-progress'] for row in status['work_packages'])
stashes=git('stash','list','--format=%H').decode().splitlines()
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1','b00958cb640fedbe041c46581327df3e64deacf5'} <= set(stashes)
# Native BREP/STEP runtime, test, fixture and example bytes stay at the cone parent.
for relative in source:
    if relative.startswith(('crates/hyperbrep/','crates/hyperbrep-io/')) and '/docs/' not in relative:
        assert (ROOT/relative).read_bytes()==git('show',manifest['baseline']+':'+relative),relative
changes=git('diff','HEAD','--name-only').decode().splitlines()
allowed={'docs/properties-status.json','crates/hyperbrep/docs/DEVELOPMENT_PLAN.md',
    'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json','crates/hypercurve/README.md'}
for relative in changes:
    if relative in allowed or relative.startswith(str(OUT.relative_to(ROOT))+'/'):
        continue
    assert (ROOT/relative).read_bytes()==git('show',manifest['upstream']+':'+relative),relative
links=[]
for path in [ROOT/'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md',*OUT.glob('*.md')]:
    for _,target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)',path.read_text()):
        if '://' in target or target.startswith('#'):continue
        destination=path.parent/target.split('#')[0]
        assert destination.exists() or destination==OUT/'audit.json',(path,target)
        links.append((str(path.relative_to(ROOT)),target))
for path in OUT.rglob('*.json'):read(path)
for path in (OUT/'final-review').glob('*.py'):ast.parse(path.read_text(),filename=str(path))
command=['git','diff','--cached','--check']
check=subprocess.run(command,cwd=ROOT,text=True,capture_output=True)
diagnostics=[match.groups() for line in check.stdout.splitlines()
    if (match:=re.match(r'^(.+):(\d+): (.*)$',line))]
raw=sorted({row[0] for row in diagnostics})
for path in raw:
    if (ROOT/path).is_relative_to(OUT):
        if ROOT/path==OUT/'diagnostic-project/Cargo.toml':
            assert {row[2] for row in diagnostics if row[0]==path}=={'new blank line at EOF.'}
            assert digest(ROOT/path)==read(OUT/'consumer-inputs.json')[str(ROOT/path)]
        else:
            assert Path(path).suffix=='.log' or Path(path).name=='properties-status-conflict.txt',path
    else:
        assert (ROOT/path).read_bytes()==git('show',manifest['upstream']+':'+path),path
scoped=subprocess.run([*command,'--','.',*[':(exclude)'+p for p in raw]],cwd=ROOT,text=True,capture_output=True)
assert scoped.returncode==0,scoped.stdout
assert not git('diff','--check')
assert hashes()==source
result=dict(source_identity=manifest['source_identity'],parents=[manifest['baseline'],manifest['upstream']],
    evidence_files=len(manifest['evidence_files']),source_snapshots=len(archive['sources']),
    overlay_members=len(contents),frozen_binaries=len(binaries),exact_step_artifacts=71,
    stroke_artifacts=4,local_links=len(links),unrelated_upstream_bytes_preserved=True,
    protected_stashes_preserved=True,work_packages_open=28,
    raw_whitespace=dict(command=command,exit_code=check.returncode,diagnostics=check.stdout,
        excluded_raw_or_unchanged_upstream_files=raw,scoped_exit_code=scoped.returncode),
    passed=True,scope='Local integration audit; failed original workflows and inherited scalar failures remain failed. No push or work-package completion claim.')
(OUT/'audit.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='raw_whitespace'},indent=2),flush=True)
