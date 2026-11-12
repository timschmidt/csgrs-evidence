import json,subprocess
from pathlib import Path
root=Path('/tmp/interval-refactor/tangent/coverage-1.95')
llvm=Path(subprocess.check_output(['rustc','+1.95.0','--print','sysroot'],text=True).strip())/'lib/rustlib/x86_64-unknown-linux-gnu/bin'
objects=[]
for line in (root/'build.jsonl').read_text().splitlines():
    try:r=json.loads(line)
    except ValueError:continue
    if r.get('reason')=='compiler-artifact' and r.get('executable') and r.get('profile',{}).get('test'):objects.append(r['executable'])
objects=list(dict.fromkeys(objects)); assert objects
subprocess.run([str(llvm/'llvm-profdata'),'merge','-sparse',*[str(p) for p in root.glob('*.profraw')],'-o',str(root/'coverage.profdata')],check=True)
args=[objects[0],*sum((['-object',p] for p in objects[1:]),[]),'-instr-profile='+str(root/'coverage.profdata'),'-ignore-filename-regex=/(.cargo|.rustup)/|/tests/|/hyperreal/|/conformance/|/rustc/|ieee_tests.rs']
for command,file in [('report','report.txt'),('export','report.json')]:
    with (root/file).open('w') as f:subprocess.run([str(llvm/'llvm-cov'),command,'-num-threads=1',*args],stdout=f,check=True,timeout=60)
print((root/'report.txt').read_text())
