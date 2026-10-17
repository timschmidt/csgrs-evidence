"""Resume unchanged-source consumers after strengthening the old reader's file domain."""
from collections import Counter
import hashlib,json,re,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,ENV,hashes,run
read=lambda n:json.loads((OUT/n).read_text())
source=hashes()
assert source==read('qualification-driver.json')['source'] and not read('qualification-driver.json')['failures']
OLD=OUT.parent/'2026-10-17-cone-continuation'
before=read('continuation-inputs.json')
digests=lambda:{p:hashlib.sha256(Path(p).read_bytes()).hexdigest() for p in before}
assert digests()==before
executables=read('continuation-binaries.json')
for x in executables.values():assert hashlib.sha256(Path(x['path']).read_bytes()).hexdigest()==x['sha256']
def checked(label,command,seconds=900,extra=None):
    result=run(label,command,seconds,extra)
    assert hashes()==source and digests()==before
    assert result==0,label
checked('prism-occt',['python3',str(OUT/'final-review/prism_occt.py'),str(OUT/'final-prism-artifacts'),str(OUT/'prism-occt.json')],300)
checked('torus-growth',[executables['torus_growth']['path'],str(OUT/'growth-artifacts')],300)
checked('frontier-extension',[executables['frontier_extension']['path'],str(OUT/'frontier-extension-artifacts')],600)
checked('reconstruction-continuation',[executables['reconstruction_diagnostic']['path'],str(OUT/'reconstruction-candidate-artifacts')],600)
for mode in ['restore','swapped','band']:
    checked('cone-continuation-'+mode,[executables['cone_workflow']['path'],mode],600,dict(HYPERBREP_CONE_ARTIFACTS=str(OUT/'cone-candidate-artifacts'/mode)))

artifacts = []
for directory in ['exports','faceted-exports','advanced-exports','scaled-exports','torus-exports','final-prism-artifacts']:
    a,b = sorted((OLD/directory).glob('*')),sorted((OUT/directory).glob('*'))
    assert set(p.name for p in a) <= set(p.name for p in b),directory
    for x in a:
        y=OUT/directory/x.name
        artifacts.append(dict(path=str(y.relative_to(OUT)),baseline_sha256=hashlib.sha256(x.read_bytes()).hexdigest(),
            candidate_sha256=hashlib.sha256(y.read_bytes()).hexdigest(),bytes=y.stat().st_size,unchanged=x.read_bytes()==y.read_bytes()))
(OUT/'preserved-artifacts.json').write_text(json.dumps(artifacts,indent=2)+'\n')
assert all(r['unchanged'] for r in artifacts),'exact artifact changes require separate review'

attempts = json.loads((OUT/'attempts.json').read_text())
rows=[]; changes=[]
for old in json.loads((OUT.parent/'2026-10-17-region-extrusion/continuation-frontier.json').read_text())['rows']:
    label=f"final-{old['family']}-{old['rotation']}"
    record=next(r for r in reversed(attempts) if r['label']==label)
    data=(OUT/record['log']).read_text(); operation=old['operation']
    bodies=dict(re.findall(r'^(\S+): bodies=(\d+)$',data,re.M))
    errors=dict(re.findall(r'^(\S+): error=(.*)$',data,re.M))
    replays=dict(re.findall(r'^(\S+): replay=(.*)$',data,re.M))
    row={k:old[k] for k in ['family','rotation','operation']};row['log']=record['log']
    if operation in bodies:
        assert replays[operation].startswith('Ok(')
        row.update(outcome='native_result',bodies=int(bodies[operation]),replay=replays[operation])
    else:
        error=errors[operation]
        outcome='resource_exhaustion' if 'Exhausted' in error else 'undecided' if any(s in error for s in ['PredicateUnresolved','RealSign']) else 'unsupported'
        row.update(outcome=outcome,error=error)
    if old['outcome']=='native_result':
        assert (row['outcome'],row.get('bodies'),row.get('replay'))==(old['outcome'],old['bodies'],old['replay']), (old,row)
    if row['outcome']!=old['outcome']:changes.append(dict(family=row['family'],rotation=row['rotation'],operation=operation,before=old['outcome'],after=row['outcome']))
    rows.append(row)
(OUT/'continuation-frontier.json').write_text(json.dumps(dict(rows=rows,counts=dict(Counter(r['outcome'] for r in rows)),changes=changes,
    scope='Complete original 81-slot diagnostic inventory. Native results/replay alone are diagnostics; cone continuation has separate independent full-size tests; the axial prerequisite preserves this preceding diagnostic domain.'),indent=2)+'\n')
assert len(rows)==81
assert changes==[]
(OUT/'continuation-admission.json').write_text(json.dumps(dict(passed=True,source=source,inputs=before,artifacts=len(artifacts),scope='Unchanged full inputs and all old successful outcomes retained; all 81 preceding native outcomes remain unchanged; conical exchange retains its preceding independent acceptance; the original 24-slot prism corpus is retained with two newly completed and separately tested touching/disjoint differences; genuinely partial-depth shells remain unsupported.'),indent=2)+'\n')
print('continuation:',Counter(r['outcome'] for r in rows),'preserved artifacts:',len(artifacts),flush=True)

for name in ['axial_occt','components_occt','occt_cones','torus_occt','occt_read']:
    args=[str(OUT/'cone-exports'),str(OUT/'cone-occt.json')] if name=='occt_cones' else []
    checked(name.replace('_','-'),['python3',str(OUT/'final-review'/(name+'.py')),*args],300)
assert hashes()==source
(OUT/'finish-checks.json').write_text(json.dumps(dict(passed=True,source=source,recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),original_driver_sha256=hashlib.sha256((OUT/'final-review/finish_checks.py').read_bytes()).hexdigest(),resumed=True,scope='Same qualified source and frozen binaries. Original fourteen-file reader failure retained. All fourteen preceding files plus the two complete new cylinder differences are now required by exact filename and independent expected measures.'),indent=2)+'\n')
