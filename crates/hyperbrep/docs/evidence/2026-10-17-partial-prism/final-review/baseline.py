"""Reproduce every original prism slot and trace the current partial-depth failures."""
import ast
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, ENV, hashes, run

project=Path('/tmp/hyperbrep-partial-prism-probe')
assert run('baseline-lock',['cargo','generate-lockfile','--offline','--manifest-path',str(project/'Cargo.toml')])==0
shutil.copy2(project/'Cargo.lock',OUT/'diagnostic-project/Cargo.lock')
source=hashes()
paths=[project/'Cargo.toml',project/'Cargo.lock',project/'src/bin/graph.rs',project/'src/bin/prism.rs',
       *list((OUT/'diagnostic-project').glob('*'))]
digests=lambda:{str(path):hashlib.sha256(path.read_bytes()).hexdigest() for path in paths}
inputs=digests()
(OUT/'consumer-inputs.json').write_text(json.dumps(inputs,indent=2)+'\n')
assert run('baseline-build',['cargo','build','--offline','--locked','--release','--manifest-path',str(project/'Cargo.toml'),'--bins'],900)==0
binaries={}
for name in ['graph','prism']:
    target=Path('/tmp')/('hyperbrep-partial-prism-baseline-'+name)
    assert not target.exists()
    shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release'/name,target)
    binaries[name]=dict(path=str(target),bytes=target.stat().st_size,sha256=hashlib.sha256(target.read_bytes()).hexdigest())
(OUT/'baseline-binaries.json').write_text(json.dumps(binaries,indent=2)+'\n')
recipe=OUT.parent/'2026-10-16-prism-continuation/reproduce.py'
tree=ast.parse(recipe.read_text())
assignment=next(node for node in tree.body if isinstance(node,ast.Assign) and any(isinstance(target,ast.Name) and target.id=='CASES' for target in node.targets))
namespace={}
exec(compile(ast.Module(body=[assignment],type_ignores=[]),str(recipe),'exec'),namespace)
cases=namespace['CASES'];assert len(cases)==24
directory=OUT/'baseline-artifacts';directory.mkdir(exist_ok=True)
for case in cases:
    assert run('baseline-prism-'+'-'.join(case),[binaries['prism']['path'],*case,str(directory)],300)==0
for slab in ['cover','tiny_upper_gap','tiny_lower_gap','interior','touch','disjoint']:
    assert run('baseline-graph-'+slab,[binaries['graph']['path'],slab],300)==0
assert hashes()==source and digests()==inputs
(OUT/'baseline-admission.json').write_text(json.dumps(dict(source=source,inputs=inputs,binaries=binaries,
    original_prism_cases=24,graph_cases=6,scope='Diagnostic reproduction only. Actual typed failures are retained in stdout; process success is not modeling completion.'),indent=2)+'\n')
