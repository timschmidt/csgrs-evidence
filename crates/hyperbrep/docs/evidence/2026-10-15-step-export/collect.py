"""Bind final checks and costs to the current source and recorded unchanged core."""
import hashlib,json,subprocess,tomllib
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent
baseline=subprocess.check_output(['git','rev-parse','25a48c202'],cwd=root,text=True).strip()
core=['crates/'+name+'/src' for name in ['hyperreal','hyperlattice','hyperlimit','hypersolve','hypercurve','hyperbrep']]
core+=['crates/'+name+'/Cargo.toml' for name in ['hyperreal','hyperlattice','hyperlimit','hypersolve','hypercurve','hyperbrep']]
core+=['crates/hyperreal/vendor','Cargo.toml']
subprocess.run(['git','diff','--exit-code',baseline,'--',*core],cwd=root,check=True,stdout=subprocess.DEVNULL)
assert not subprocess.check_output(['git','ls-files','--others','--exclude-standard','--',*core],cwd=root,text=True)
before=tomllib.loads(subprocess.check_output(['git','show',baseline+':Cargo.lock'],cwd=root,text=True))
after=tomllib.loads((root/'Cargo.lock').read_text())
key=lambda p:(p['name'],p['version'],p.get('source'),p.get('checksum'))
assert {key(p) for p in before['package']}=={key(p) for p in after['package']}
changed=[p['name'] for p,q in zip(before['package'],after['package']) if p!=q]
assert changed==['hyperbrep-io'],changed
(out/'dependency-audit.json').write_text(json.dumps(dict(baseline=baseline,changed_lock_entries=changed,package_versions_sources_checksums_unchanged=True,core_paths_unchanged=core),indent=2)+'\n')
files=[root/'Cargo.toml',root/'Cargo.lock',root/'properties.md',root/'crates/hyperbrep/tools/benchmark_receipt.py',root/'crates/hyperbrep/docs/ALGORITHM_RESEARCH.md',root/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json',root/'docs/properties-status.json',out.parent/'2026-10-15-step-faceted/measure.c',out.parent/'2026-10-15-step-faceted/faceted-executable.json']
files += [p for p in (root/'crates/hyperbrep-io').rglob('*') if p.is_file()]
def record(path,base):return dict(path=str(path.relative_to(base)),bytes=path.stat().st_size,sha256=hashlib.sha256(path.read_bytes()).hexdigest())
sources=[record(p,root) for p in sorted(set(files))]
artifacts=[record(p,out) for p in sorted(out.rglob('*')) if p.is_file() and p.name not in ['manifest.json','verification.json'] and '__pycache__' not in p.parts]
(out/'manifest.json').write_text(json.dumps(dict(schema_version=1,baseline_revision=baseline,scope='Partial WP14a: exact selected native faceted export; all work-package gates open',sources=sources,artifacts=artifacts),indent=2)+'\n')
print(len(sources),'sources;',len(artifacts),'artifacts')
