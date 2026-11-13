from pathlib import Path
import subprocess,json,time,os
p=Path(__file__).parent;r='/mnt/development/csgrs-coordinates';manifest='crates/hyperdynamics/fuzz/Cargo.toml';corpus=p/'fuzz-corpus';corpus.mkdir(exist_ok=True)
for i,data in enumerate([bytes(8),bytes([255]*8),bytes(range(8)),bytes([8,8,8,8,8,8,8,8])]):(corpus/f'seed-{i}').write_bytes(data)
commands=[
('check',['cargo','+1.95.0','check','--locked','--offline','--manifest-path',manifest,'--bins'],{}),
('clippy',['cargo','+1.95.0','clippy','--locked','--offline','--manifest-path',manifest,'--bins','--','-D','warnings'],{}),
('fmt',['rustfmt','+1.95.0','--edition','2024','--check','crates/hyperdynamics/fuzz/fuzz_targets/coordinate_change.rs'],{}),
('build',['/tmp/interval-refactor/tools/bin/cargo-fuzz','fuzz','build','coordinate_change','--fuzz-dir','crates/hyperdynamics/fuzz'],{'RUSTUP_TOOLCHAIN':'nightly'}),
('run',['timeout','180','/tmp/interval-refactor/tools/bin/cargo-fuzz','fuzz','run','coordinate_change',str(corpus),'--fuzz-dir','crates/hyperdynamics/fuzz','--','-runs=10000','-max_len=8','-max_total_time=60','-seed=20261113'],{'RUSTUP_TOOLCHAIN':'nightly'})]
rows=[]
for name,cmd,extra in commands:
 start=time.monotonic()
 with (p/('fuzz-'+name+'.log')).open('w') as f:result=subprocess.run(cmd,cwd=r,env={**os.environ,'CARGO_TARGET_DIR':'/tmp/interval-refactor/coordinates-fuzz-target',**extra},stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,cwd=r,environment=extra,returncode=result.returncode,seconds=time.monotonic()-start));(p/'fuzz-status.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,result.returncode,flush=True)
 if result.returncode:break
