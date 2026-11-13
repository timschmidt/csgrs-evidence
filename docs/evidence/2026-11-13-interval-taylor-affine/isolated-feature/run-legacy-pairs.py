from pathlib import Path
import subprocess,json,time,shutil,hashlib
p=Path(__file__).parent;common=Path('/tmp/interval-refactor/taylor-affine-legacy-executable');rows=[]
# Fixed twelve paired comparisons, alternating order. Preserve all trials and
# prior four-run observations; do not stop early or select favorable cases.
for pair in range(12):
 for variant in (['final','baseline'] if pair%2==0 else ['baseline','final']):
  source=(Path('/tmp/interval-refactor/taylor-affine-binaries/baseline-old-native-cost') if variant=='baseline' else Path('/tmp/interval-refactor/taylor-affine-binaries/isolated-old-native-cost'));shutil.copy2(source,common)
  cmd=['setarch','x86_64','-R','taskset','-c','0','python3',str(p/'warm-exec.py'),str(common)];start=time.monotonic()
  with (p/f'legacy-pair-{pair:02}-{variant}.log').open('w') as log:r=subprocess.run(cmd,cwd='/tmp/interval-refactor',stdout=log,stderr=subprocess.STDOUT)
  rows.append(dict(pair=pair,variant=variant,command=cmd,cwd='/tmp/interval-refactor',returncode=r.returncode,seconds=time.monotonic()-start,sha256=hashlib.sha256(source.read_bytes()).hexdigest()));(p/'legacy-pair-runs.json').write_text(json.dumps(rows,indent=2)+'\n');assert r.returncode==0
 print('pair',pair,flush=True)
