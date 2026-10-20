from pathlib import Path
import hashlib, json, platform, shutil, subprocess
root=Path('/mnt/development/csgrs')
source=Path('/tmp/hyperbrep-archive-admission-evidence')
out=root/'crates/hyperbrep/docs/evidence/2026-10-15-archive-admission'
for path in source.iterdir():
    target=out/path.name
    if path.is_dir(): shutil.copytree(path,target,dirs_exist_ok=True)
    else: shutil.copy2(path,target)
for name, target in [('qualify_archive_admission.py','qualification.py'), ('recheck_archive_admission.py','recheck.py'), ('benchmark_archive_admission.py','benchmark.py'), ('repeat_archive_admission.py','repeat.py'), ('paired_archive_admission.py','paired.py'), ('controls_archive_admission.py','controls.py'), ('hyperbrep_measure.c','measure.c'), ('collect_archive_admission.py','collect.py')]:
    shutil.copy2(Path('/tmp')/name,out/target)
files=[root/'Cargo.toml',root/'Cargo.lock',root/'AGENTS.md',root/'properties.md',root/'docs/properties-status.json']
crate=root/'crates/hyperbrep'
for path in [crate/'src',crate/'tests',crate/'benches',crate/'fuzz/fuzz_targets']:
    files.extend(path.rglob('*.rs'))
files.extend([crate/'Cargo.toml',crate/'README.md',crate/'PERFORMANCE.md',crate/'fuzz/Cargo.toml',crate/'fuzz/Cargo.lock',crate/'tools/benchmark_receipt.py'])
files.extend((crate/'docs').glob('*.md'))
files.extend((crate/'docs/architecture').glob('*.md'))
files.append(crate/'docs/IMPLEMENTATION_STATUS.json')
for name in ['src/bezier_parameter.rs','src/curve.rs','src/curve_subdivision.rs','src/curve_injectivity.rs','tests/parameter_charts.rs','tests/curve_injectivity.rs','README.md','PERFORMANCE.md']:
    files.append(root/'crates/hypercurve'/name)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
manifest=dict(schema_version=1,date='2026-10-15',baseline_revision='11078836bc94e730a0880ea6c03ad9dbae855b85',decision='Keep explicit allocation-free syntax admission with direct caller migration and an architectural cost exception; pooled native timing qualification remains unresolved; all work-package gates remain open.',qualification='README.md defines coverage and limits; commands, native, positive-replay and admission receipts and four restored deliberate faults are checked by verify.py.',environment=dict(rustc=subprocess.check_output(['/home/tim/.cargo/bin/rustc','--version'],text=True).strip(),cargo=subprocess.check_output(['/home/tim/.cargo/bin/cargo','--version'],text=True).strip(),platform=platform.platform(),benchmark_cpu_affinity=[0],cargo_home='/tmp/hyperbrep-review-cargo',cargo_target_dir='/tmp/hyperbrep-review-target'),source_sha256={str(p.relative_to(root)):sha(p) for p in sorted(set(files))},artifact_sha256={str(p.relative_to(out)):sha(p) for p in sorted(out.rglob('*')) if p.is_file() and p.name!='manifest.json'})
(out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
