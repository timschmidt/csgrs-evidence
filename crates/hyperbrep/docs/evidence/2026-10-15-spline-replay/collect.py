from pathlib import Path
import hashlib, json, platform, shutil, subprocess
root=Path('/mnt/development/csgrs')
source=Path('/tmp/hyperbrep-spline-replay-evidence')
out=root/'crates/hyperbrep/docs/evidence/2026-10-15-spline-replay'
for path in source.iterdir():
    target=out/path.name
    if path.is_dir(): shutil.copytree(path,target,dirs_exist_ok=True)
    else: shutil.copy2(path,target)
for name, target in [('qualify_spline_replay.py','qualification.py'), ('recheck_spline_replay.py','recheck.py'), ('benchmark_spline_replay.py','benchmark.py'), ('controls_spline_replay.py','controls.py'), ('hyperbrep_measure.c','measure.c'), ('collect_spline_replay.py','collect.py')]:
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
manifest=dict(schema_version=1,date='2026-10-15',baseline_revision='7091576d8a663f1705af0e76519f01b37968cddd',decision='Keep independently replayed native and selected spline trims with strict complete-image injectivity certificates; all work-package gates remain open.',qualification='README.md defines coverage and limits; commands, native/feature receipts and four restored deliberate faults are checked by verify.py.',environment=dict(rustc=subprocess.check_output(['/home/tim/.cargo/bin/rustc','--version'],text=True).strip(),cargo=subprocess.check_output(['/home/tim/.cargo/bin/cargo','--version'],text=True).strip(),platform=platform.platform(),benchmark_cpu_affinity=[0],cargo_home='/tmp/hyperbrep-review-cargo',cargo_target_dir='/tmp/hyperbrep-review-target'),source_sha256={str(p.relative_to(root)):sha(p) for p in sorted(set(files))},artifact_sha256={str(p.relative_to(out)):sha(p) for p in sorted(out.rglob('*')) if p.is_file() and p.name!='manifest.json'})
(out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
