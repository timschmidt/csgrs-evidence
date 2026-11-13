from pathlib import Path
import subprocess,shutil
out=Path('/tmp/interval-refactor/dynamics-axis')
for label,root,package in [('baseline','/tmp/interval-refactor/dynamics-axis-baseline','hyperpath'),('candidate','/mnt/development/csgrs','hyperdynamics')]:
 p=Path('/tmp/interval-refactor/dynamics-axis-probe-'+label);p.mkdir(exist_ok=True)
 (p/'Cargo.toml').write_text('[package]\nname="axis-probe"\nversion="0.0.0"\nedition="2024"\n[workspace]\n[dependencies]\nprojection={package="'+package+'",path="'+root+'/crates/'+package+'"}\nhyperreal={path="'+root+'/crates/hyperreal"}\nhyperlimit={path="'+root+'/crates/hyperlimit"}\n[[bin]]\nname="axis-probe"\npath="main.rs"\n')
 shutil.copy(out/'probe.rs',p/'main.rs');shutil.copy(root+'/Cargo.lock',p/'Cargo.lock')
 with (out/(label+'-probe-build.log')).open('w') as f:subprocess.run(['cargo','+1.95.0','build','--release','--manifest-path',str(p/'Cargo.toml')],stdout=f,stderr=subprocess.STDOUT,check=True)
 shutil.copy(p/'Cargo.lock',out/(label+'-probe-Cargo.lock'))
