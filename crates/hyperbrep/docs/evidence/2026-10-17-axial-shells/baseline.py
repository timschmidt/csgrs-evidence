"""Reproduce the original full corpus on the committed prerequisite source."""
import ast,hashlib,json
from pathlib import Path
from check import OUT,ROOT,hashes,run
old=OUT.parent/'2026-10-17-partial-prism'
read=lambda p:json.loads(p.read_text())
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
prior=read(old/'final-source.json')
assert all(sha(ROOT/name)==value for name,value in prior.items())
bench=read(old/'candidate-benchmark-binaries.json')['executables']|{'axial_exchange':read(old/'axial-benchmark-binary.json')}
for b in bench.values():assert sha(Path(b['path']))==b['sha256']
(OUT/'baseline-benchmark-binaries.json').write_text(json.dumps(dict(executables=bench,source=hashes(),derivation=str(old/'manifest.json'),scope='Frozen preceding final binaries, exact source/input hashes rechecked on this baseline before edits.'),indent=2)+'\n')
prism=read(old/'continuation-binaries.json')['prism'];assert sha(Path(prism['path']))==prism['sha256']
original=OUT.parent/'2026-10-16-prism-continuation/reproduce.py'
tree=ast.parse(original.read_text());assignment=next(n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='CASES' for t in n.targets))
space={};exec(compile(ast.Module(body=[assignment],type_ignores=[]),str(original),'exec'),space)
cases=space['CASES'];assert len(cases)==24
artifacts=OUT/'baseline-artifacts';artifacts.mkdir()
for case in cases:assert run('baseline-'+'-'.join(case),[prism['path'],*case,str(artifacts)],240)==0
for previous in (old/'final-prism-artifacts').glob('*'):assert previous.read_bytes()==(artifacts/previous.name).read_bytes()
(OUT/'baseline-reproduction.json').write_text(json.dumps(dict(source=hashes(),binary=prism,cases=cases,original_prism_sha256=sha(OUT.parent/'2026-10-17-cone-continuation/prism-frontier.rs.txt'),old_source_verified=True,all_old_artifacts_identical=True),indent=2)+'\n')
