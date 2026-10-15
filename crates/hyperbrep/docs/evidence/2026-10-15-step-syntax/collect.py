from pathlib import Path
import hashlib,json,platform,subprocess,shutil
root=Path('/mnt/development/csgrs');source=Path('/tmp/hyperbrep-step-syntax-evidence');out=root/'crates/hyperbrep/docs/evidence/2026-10-15-step-syntax';out.mkdir(exist_ok=True)
for path in source.iterdir():
 target=out/path.name
 if path.is_dir():shutil.copytree(path,target,dirs_exist_ok=True)
 else:shutil.copy2(path,target)
for name,target in [('qualify_step_syntax.py','qualification.py'),('recheck_step_syntax.py','recheck.py'),('benchmark_step_syntax.py','benchmark.py'),('controls_step_syntax.py','controls.py'),('collect_step_syntax.py','collect.py'),('verify_step_syntax.py','verify.py'),('hyperbrep_measure.c','measure.c')]:
 shutil.copy2(Path('/tmp')/name,out/target)
files=list((root/'crates/hyperbrep-io').rglob('*.rs'))+list((root/'crates/hyperbrep-io').rglob('*.md'))+[root/'crates/hyperbrep-io/Cargo.toml']
files += [root/name for name in ['Cargo.toml','Cargo.lock','readme.md','AGENTS.md','properties.md','docs/properties-status.json','crates/hyperbrep/README.md','crates/hyperbrep/docs/ARCHITECTURE.md','crates/hyperbrep/docs/SUPPORT_MATRIX.md','crates/hyperbrep/docs/REPOSITORY_AUDIT.md','crates/hyperbrep/docs/DEVELOPMENT_PLAN.md','crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json','crates/hyperbrep/tools/benchmark_receipt.py']]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
manifest=dict(schema_version=1,date='2026-10-15',baseline_revision=subprocess.check_output(['git','rev-parse','f03367c7c'],cwd=root,text=True).strip(),decision='Keep bounded exact-lexeme STEP syntax and shared parser/writer frame buffers; no geometry-exchange or complete work-package claim.',environment=dict(rustc=subprocess.check_output(['/home/tim/.cargo/bin/rustc','--version'],text=True).strip(),platform=platform.platform(),benchmark_cpu_affinity=[0],wasm_runtime='Wasmtime Python 38.0.0'),source_sha256={str(p.relative_to(root)):sha(p) for p in sorted(set(files))},artifact_sha256={str(p.relative_to(out)):sha(p) for p in sorted(out.rglob('*')) if p.is_file() and p.name!='manifest.json'})
(out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
