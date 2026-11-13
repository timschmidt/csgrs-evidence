from pathlib import Path
import subprocess,shutil,json
out=Path('/tmp/interval-refactor/dynamics-axis')
rows=[]
for label in ['baseline','candidate']:
 p=Path('/tmp/interval-refactor/dynamics-axis-probe-'+label)
 c=['cargo','+1.95.0','rustc','--locked','--release','--manifest-path',str(p/'Cargo.toml'),'--','--emit=llvm-ir']
 with (out/(label+'-llvm-build.log')).open('w') as f:subprocess.run(c,stdout=f,stderr=subprocess.STDOUT,check=True)
 files=list((p/'target/release/deps').glob('axis_probe*.ll'));assert len(files)==1
 data=files[0].read_bytes();shutil.copy(files[0],out/(label+'-probe.ll'))
 rows.append(dict(label=label,command=c,ir_bytes=len(data),definitions=sum(line.startswith(b'define ') for line in data.splitlines())))
(out/'llvm-summary.json').write_text(json.dumps(rows,indent=2)+'\n')
