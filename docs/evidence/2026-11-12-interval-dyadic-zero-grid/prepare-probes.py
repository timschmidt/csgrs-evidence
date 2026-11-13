from pathlib import Path
import shutil,subprocess,json
out=Path('/tmp/interval-refactor/dyadic-zero-grid')
for label,root in [('baseline','/tmp/interval-refactor/dyadic-zero-grid-baseline'),('candidate','/mnt/development/csgrs')]:
 p=Path('/tmp/interval-refactor/dyadic-zero-grid-probe-'+label);p.mkdir(exist_ok=True)
 (p/'Cargo.toml').write_text('[package]\nname="zero-grid-probe"\nversion="0.0.0"\nedition="2024"\n[workspace]\n[dependencies]\nhyperinterval={path="'+root+'/crates/hyperinterval",features=["dyadic","serde"]}\nserde_json="1.0"\n[[bin]]\nname="zero-grid-probe"\npath="main.rs"\n')
 shutil.copy(out/'probe.rs',p/'main.rs')
 shutil.copy('/mnt/development/csgrs/Cargo.lock',p/'Cargo.lock')
 with (out/(label+'-build.log')).open('w') as f:
  subprocess.run(['cargo','+1.95.0','build','--release','--manifest-path',str(p/'Cargo.toml')],stdout=f,stderr=subprocess.STDOUT,check=True)
 shutil.copy(p/'Cargo.lock',out/(label+'-Cargo.lock'))
