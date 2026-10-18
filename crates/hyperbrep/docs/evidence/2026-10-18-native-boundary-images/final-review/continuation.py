"""Retain every full-size diagnostic, archive and independent continuation."""
import ast
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import shutil
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, hashes, run

OLD = OUT.parent/'2026-10-17-cone-continuation'
BASE = OUT.parent/'2026-10-17-prism-admission-cost'
PRISM = OUT.parent/'2026-10-16-prism-continuation'
PROJECT = Path('/tmp/hyperbrep-cone-continuation-probe')
source = hashes()
inputs = [Path(__file__), BASE/'continuation-frontier.json', PRISM/'reproduce.py', OUT/'final-review/prism_occt.py']
for directory in ['exports', 'faceted-exports', 'advanced-exports', 'scaled-exports', 'torus-exports', 'final-prism-artifacts']:
    inputs += list((BASE/directory).glob('*'))
for name in ['Cargo.toml', 'Cargo.lock']:
    assert (PROJECT/name).read_bytes() == (OLD/'diagnostic-project'/name).read_bytes()
    inputs.append(PROJECT/name)
probes = dict(frontier='frontier.rs.txt', preceding_frontier='preceding-frontier.rs.txt',
              prism='prism-frontier.rs.txt', torus_growth='growth.rs.txt',
              frontier_extension='frontier_extension.rs.txt', reconstruction_diagnostic='reconstruction_diagnostic.rs.txt',cone_workflow='final-review/cone_workflow.rs.txt')
for binary, name in probes.items():
    assert (PROJECT/'src/bin'/f'{binary}.rs').read_bytes() == (OLD/name).read_bytes()
    inputs += [PROJECT/'src/bin'/f'{binary}.rs', OLD/name]
digests = lambda: {str(p): hashlib.sha256(p.read_bytes()).hexdigest() for p in inputs if p.is_file()}
before = digests()
(OUT/'continuation-inputs.json').write_text(json.dumps(before, indent=2)+'\n')
def checked(label, command, seconds=900, extra=None):
    result = run(label, command, seconds, extra)
    assert hashes() == source and digests() == before
    assert result == 0, label

command = ['cargo','build','--offline','--locked','--release','--manifest-path',str(PROJECT/'Cargo.toml')]
for binary in probes: command += ['--bin',binary]
checked('continuation-build', command)
executables = {}
for binary in probes:
    path = Path('/tmp')/f'hyperbrep-native-images-final-{binary}'
    assert not path.exists()
    shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release'/binary, path)
    executables[binary] = dict(path=str(path), bytes=path.stat().st_size, sha256=hashlib.sha256(path.read_bytes()).hexdigest())
(OUT/'continuation-binaries.json').write_text(json.dumps(executables, indent=2)+'\n')
for family in ['cylinder','cone','torus']:
    for rotation in ['identity','diagonal','rational']:
        checked(f'final-{family}-{rotation}', [executables['frontier']['path'],family,rotation],600)
checked('preceding-frontier', [executables['preceding_frontier']['path']])
tree = ast.parse((PRISM/'reproduce.py').read_text())
assignment = next(n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='CASES' for t in n.targets))
namespace = {}
exec(compile(ast.Module(body=[assignment],type_ignores=[]),str(PRISM/'reproduce.py'),'exec'),namespace)
cases = namespace['CASES']; assert len(cases)==24
exports = OUT/'final-prism-artifacts'; exports.mkdir(exist_ok=True)
for case in cases:
    checked('final-prism-'+'-'.join(case),[executables['prism']['path'],*case,str(exports)],240)
checked('prism-occt',['python3',str(OUT/'final-review/prism_occt.py'),str(exports),str(OUT/'prism-occt.json')],300)
checked('torus-growth',[executables['torus_growth']['path'],str(OUT/'growth-artifacts')],300)
checked('frontier-extension',[executables['frontier_extension']['path'],str(OUT/'frontier-extension-artifacts')],600)
checked('reconstruction-continuation',[executables['reconstruction_diagnostic']['path'],str(OUT/'reconstruction-candidate-artifacts')],600)
for mode in ['restore','swapped','band']:
    checked('cone-continuation-'+mode,[executables['cone_workflow']['path'],mode],600,dict(HYPERBREP_CONE_ARTIFACTS=str(OUT/'cone-candidate-artifacts'/mode)))

artifacts = []
for directory in ['exports','faceted-exports','advanced-exports','scaled-exports','torus-exports','final-prism-artifacts']:
    a,b = sorted((BASE/directory).glob('*')),sorted((OUT/directory).glob('*'))
    assert set(p.name for p in a) <= set(p.name for p in b),directory
    for x in a:
        y=OUT/directory/x.name
        artifacts.append(dict(path=str(y.relative_to(OUT)),baseline_sha256=hashlib.sha256(x.read_bytes()).hexdigest(),
            candidate_sha256=hashlib.sha256(y.read_bytes()).hexdigest(),bytes=y.stat().st_size,unchanged=x.read_bytes()==y.read_bytes()))
(OUT/'preserved-artifacts.json').write_text(json.dumps(artifacts,indent=2)+'\n')
assert all(row['unchanged'] for row in artifacts)

attempts = json.loads((OUT/'attempts.json').read_text())
rows=[]; changes=[]
for old in json.loads((BASE/'continuation-frontier.json').read_text())['rows']:
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
    scope='Complete original 81-slot diagnostic inventory. Native results/replay alone are diagnostics; complete workflows have separate independent full-size tests.'),indent=2)+'\n')
assert len(rows)==81
assert changes==[]
(OUT/'continuation-admission.json').write_text(json.dumps(dict(passed=True,source=source,inputs=before,artifacts=len(artifacts),scope='Unchanged full inputs and all old successful outcomes retained; all 81 preceding native outcomes remain unchanged; conical exchange retains its preceding independent acceptance. All 24 original prism results and all final artifacts must remain unchanged.'),indent=2)+'\n')
print('continuation:',Counter(r['outcome'] for r in rows),'preserved artifacts:',len(artifacts),flush=True)
