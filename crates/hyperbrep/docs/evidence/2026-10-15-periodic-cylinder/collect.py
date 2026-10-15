"""Bind this kernel increment to its checks, costs, and unchanged dependency sources."""
import hashlib, json, subprocess
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent
baseline=subprocess.check_output(['git','rev-parse','51d41cc50'],cwd=root,text=True).strip()
dependencies=['hyperreal','hyperlattice','hyperlimit','hypersolve','hypercurve','hypertri','hyperbrep-io']
unchanged=['Cargo.toml','Cargo.lock','crates/hyperreal/vendor','crates/hyperbrep/benches/kernel.rs']
unchanged += [f'crates/{name}/{part}' for name in dependencies for part in ['src','Cargo.toml']]
subprocess.run(['git','diff','--exit-code',baseline,'--',*unchanged],cwd=root,check=True,stdout=subprocess.DEVNULL)
assert not subprocess.check_output(['git','ls-files','--others','--exclude-standard','--',*unchanged],cwd=root,text=True)
(out/'dependency-audit.json').write_text(json.dumps(dict(baseline=baseline,unchanged_paths=unchanged),indent=2)+'\n')
files=[root/p for p in ['Cargo.toml','Cargo.lock','properties.md','crates/hyperbrep/Cargo.toml','crates/hyperbrep/README.md','crates/hyperbrep/docs/ALGORITHM_RESEARCH.md','crates/hyperbrep/docs/SELECTED_ARCHIVE.md','crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json','docs/properties-status.json','crates/hyperbrep/tools/benchmark_receipt.py','crates/hyperbrep/docs/evidence/2026-10-15-step-faceted/measure.c']]
for part in ['src','tests','benches','fuzz']:
 files += [p for p in (root/'crates/hyperbrep'/part).rglob('*') if p.is_file() and 'target' not in p.parts]
def record(p,base):return dict(path=str(p.relative_to(base)),bytes=p.stat().st_size,sha256=hashlib.sha256(p.read_bytes()).hexdigest())
sources=[record(p,root) for p in sorted(set(files))]
artifacts=[record(p,out) for p in sorted(out.rglob('*')) if p.is_file() and p.name not in ['manifest.json','verification.json'] and '__pycache__' not in p.parts]
(out/'manifest.json').write_text(json.dumps(dict(schema_version=1,baseline_revision=baseline,scope='Periodic rectangular-cylinder certification prerequisite; every work-package gate remains open',sources=sources,artifacts=artifacts),indent=2)+'\n')
print(len(sources),'sources;',len(artifacts),'artifacts')
