"""Bind qualification artifacts to a source snapshot; run only after qualification."""
import hashlib,json,subprocess,tomllib
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent
baseline='cd1cc8d42c35c7204ba5331118ecfaaee4096741'
core=['crates/'+name+'/src' for name in ['hyperreal','hyperlattice','hyperlimit','hypersolve','hypercurve','hyperbrep']]
subprocess.run(['git','diff','--exit-code',baseline,'--',*core],cwd=root,check=True,stdout=subprocess.DEVNULL)
before=tomllib.loads(subprocess.check_output(['git','show',baseline+':Cargo.lock'],cwd=root,text=True))
after=tomllib.loads((root/'Cargo.lock').read_text())
key=lambda p:(p['name'],p['version'],p.get('source'),p.get('checksum'))
assert {key(p) for p in before['package']}=={key(p) for p in after['package']}
changed=[p['name'] for p,q in zip(before['package'],after['package']) if p!=q]
assert changed==['hyperbrep-io'],changed
(out/'dependency-audit.json').write_text(json.dumps(dict(baseline=baseline,changed_lock_entries=changed,package_versions_sources_checksums_unchanged=True,core_source_roots_unchanged=core),indent=2)+'\n')
files=[root/'Cargo.toml',root/'Cargo.lock',root/'properties.md',root/'crates/hyperbrep/tools/benchmark_receipt.py']
files += [p for p in (root/'crates/hyperbrep-io').rglob('*') if p.is_file()]
def record(path,base):return dict(path=str(path.relative_to(base)),bytes=path.stat().st_size,sha256=hashlib.sha256(path.read_bytes()).hexdigest())
sources=[record(p,root) for p in sorted(set(files))]
artifacts=[record(p,out) for p in sorted(out.rglob('*')) if p.is_file() and p.name not in ['manifest.json','verification.json'] and '__pycache__' not in p.parts]
manifest=dict(schema_version=1,baseline_revision=baseline,scope='Partial WP14a: exact selected faceted import; every work-package gate remains open',sources=sources,artifacts=artifacts)
(out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
print(len(sources),'sources;',len(artifacts),'artifacts')
