"""Audit this increment's sources, completed contracts, retained failures and scope."""
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
from check import OUT,ROOT,hashes
read=lambda path:json.loads(path.read_text())
sha=lambda data:hashlib.sha256(data).hexdigest()
digest=lambda path:sha(path.read_bytes())
git=lambda *args:subprocess.check_output(['git',*args],cwd=ROOT)
m=read(OUT/'manifest.json')
assert git('branch','--show-current').strip()==b'brep'
assert git('rev-parse','HEAD').decode().strip()==m['baseline']
assert subprocess.run(['git','merge-base','--is-ancestor',m['upstream'],'HEAD'],cwd=ROOT).returncode==0
assert not git('diff','--name-only','--diff-filter=U')
source=hashes()
assert source==read(OUT/'final-source.json')
assert sha(json.dumps(source,sort_keys=True).encode())==m['source_identity']
q=read(OUT/'qualification-summary.json')
assert q['source']==source
assert {k:v['passed'] for k,v in q['tests'].items()}==dict(**{'native-release':573,'native-minimal':565,'axial-debug':8,'axial-geometry-debug':3,'axial-cover-debug':2})
assert q['wasm']['groups']==127 and q['wasm']['imports']==0
assert q['new_complete_workflows']==4
attempts=read(OUT/'attempts.json');latest={row['label']:row for row in attempts}
assert all(row['source_unchanged'] for row in attempts)
assert q['failures']==[row for row in attempts if row['exit_code']]
for label in read(OUT/'qualification-driver.json')['executed']:
    row=latest[label]
    assert row['exit_code']==0 and read(OUT/row['source'])==source,label
assert read(OUT/'qualification-v1.json')['failures']
for name in ['qualification-driver.json','finish-checks.json','cost-summary.json','continuation-admission.json','consumer-final.json','components-admission.json','old-path-control.json']:
    assert read(OUT/name)['source']==source,name
for name,expected in m['evidence_files'].items():assert digest(OUT/name)==expected,name
for name,expected in m['documents'].items():assert digest(ROOT/name)==expected,name
input_hashes={}
for name in ['consumer-final-inputs.json','wasm-inputs.json','diagnostic-final-inputs.json','continuation-inputs.json','components-inputs.json']:
    for path,expected in read(OUT/name).items():
        assert digest(Path(path))==expected,path
        input_hashes[path]=expected
for path,expected in read(OUT/'old-path-control.json')['inputs'].items():assert digest(Path(path))==expected
assert read(OUT/'continuation-frontier.json')['counts']==dict(native_result=81)
assert not read(OUT/'continuation-frontier.json')['changes']
prisms=read(OUT/'prism-frontier.json')
assert len(prisms['rows'])==24 and len(prisms['changes'])==2
assert prisms['counts']==dict(native_result=20,unsupported=4)
original=read(OUT/'baseline.json')
assert digest(ROOT/original['original_prism'])==original['original_sha256']
artifacts=read(OUT/'preserved-artifacts.json');assert len(artifacts)==61
for row in artifacts:assert row['unchanged'] and digest(OUT/row['path'])==row['baseline_sha256']==row['candidate_sha256']
extra=read(OUT/'preserved-additional-artifacts.json');assert len(extra)==22
for row in extra:assert digest(OUT/row['path'])==row['sha256']==digest(ROOT/row['baseline'])
for row in read(OUT/'old-path-control.json')['artifacts']:assert digest(OUT/row['path'])==row['sha256']==digest(Path(row['baseline']))
new=read(OUT/'new-artifacts.json');assert len(new)==8
for row in new:assert digest(OUT/row['path'])==row['sha256']
cost=read(OUT/'cost-summary.json')
assert cost['receipt_admitted'] and not cost['migrations']
assert (cost['preserved_cases'],cost['new_cases'],cost['commands'])==(180,4,123)
for path,expected in cost['inputs'].items():assert digest(Path(path))==expected
commands=read(OUT/'costs/commands.json');assert len(commands)==123
for row in commands:assert row['exit_code']==row['resource']['exit_code']==0
binaries=[read(OUT/name) for name in ['wasm-binary.json','components-binary.json','axial-benchmark-binary.json']]
binaries+=[read(OUT/name)['binary'] for name in ['consumer-final.json','old-path-control.json']]
binaries+=list(read(OUT/'continuation-binaries.json').values())
binaries+=list(cost['baseline'].values())+list(cost['candidate'].values())
binaries={row['path']:row for row in binaries}
for path,row in binaries.items():assert Path(path).stat().st_size==row['bytes'] and digest(Path(path))==row['sha256'],path
assert len(read(OUT/'axial-occt.json')['rows'])==4

archive=read(OUT/'source-reconstruction.json')
assert archive['baseline']==m['baseline'] and digest(OUT/archive['archive'])==archive['archive_sha256']
with tarfile.open(OUT/archive['archive'],'r:gz') as packed:
    contents={item.name:packed.extractfile(item).read() for item in packed.getmembers()}
assert {name:sha(data) for name,data in contents.items()}==archive['members']
unchanged={}
for row in archive['sources']:
    assert row['completely_reconstructible'] and not row['missing_files']
    snapshot=read(OUT/row['snapshot'])
    assert set(snapshot)==set(row['baseline_files'])|set(row['overlay_files'])
    for name,expected in snapshot.items():
        if name in row['overlay_files']:data=contents[row['overlay_files'][name]]
        else:
            if name not in unchanged:unchanged[name]=git('show',m['baseline']+':'+name)
            data=unchanged[name]
        assert sha(data)==expected,(row['snapshot'],name)
for name in ['AGENTS.md','properties.md','docs/admission.md']:
    assert (ROOT/name).read_bytes()==git('show',m['baseline']+':'+name)==git('show',m['upstream']+':'+name)
helper=OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py'
spec=importlib.util.spec_from_file_location('spans',helper);spans=importlib.util.module_from_spec(spec);spec.loader.exec_module(spans)
old_ledger=git('show',m['baseline']+':docs/properties-status.json').decode()
current=(ROOT/'docs/properties-status.json').read_text()
assert current==spans.replace_brep(old_ledger,json.loads(current)['current_work']['hyperbrep'])
assert digest(ROOT/'docs/properties-status.json')==read(OUT/'ledger-update.json')['after_sha256']
status=read(ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
assert not status['complete'] and len(status['work_packages'])==28
assert all(row['status'] in ['open','in-progress'] for row in status['work_packages'])
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
command=['git','diff','--cached','--check']
check=subprocess.run(command,cwd=ROOT,text=True,capture_output=True)
diagnostics=[match.groups() for line in check.stdout.splitlines() if (match:=re.match(r'^(.+):(\d+): (.*)$',line))]
raw=sorted({row[0] for row in diagnostics})
for name in raw:
    path=ROOT/name;assert path.is_relative_to(OUT),name
    if path.suffix=='.log':continue
    assert path.name=='Cargo.toml' and str(path) in input_hashes,name
    assert digest(path)==input_hashes[str(path)]
    assert {row[2] for row in diagnostics if row[0]==name}=={'new blank line at EOF.'}
scoped=subprocess.run([*command,'--','.',*[':(exclude)'+name for name in raw]],cwd=ROOT,text=True,capture_output=True)
assert scoped.returncode==0,scoped.stdout
assert not git('diff','--check') and hashes()==source
result=dict(source_identity=m['source_identity'],baseline=m['baseline'],evidence_files=len(m['evidence_files']),
    source_snapshots=len(archive['sources']),overlay_members=len(contents),frozen_binaries=len(binaries),
    preserved_step_artifacts=71,preserved_region_native_step_artifacts=12,new_native_step_artifacts=8,
    original_prism_cases=24,new_complete_workflows=4,local_links=len(links),non_brep_ledger_bytes_preserved=True,
    supporting_runtime_unchanged=True,protected_stashes_preserved=True,work_packages_open=28,
    raw_whitespace=dict(command=command,exit_code=check.returncode,diagnostics=check.stdout,retained_raw_files=raw,scoped_exit_code=scoped.returncode),passed=True,
    scope='Local axial prerequisite admission. Genuine partial-depth shells and inherited upstream failures remain open. No push, package, coverage, resource-bound or work-package completion claim.')
(OUT/'audit.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='raw_whitespace'},indent=2),flush=True)
