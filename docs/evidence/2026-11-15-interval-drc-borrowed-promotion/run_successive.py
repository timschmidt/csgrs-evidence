from pathlib import Path
import subprocess,json,hashlib,time
s=Path(__file__).parent;b=s/'boundary-controls';r=Path('/mnt/development/interval-promotion-boundaries/csgrs')
assert json.loads((s/'boundary-controls-complete.json').read_text())['success']
assert json.loads((s/'downstream-tests.json').read_text())['exit_code']==0
assert all(x['exit_code']==0 for x in json.loads((s/'qualification.json').read_text()))
assert (s/'owner-benchmarks-round0.json').exists(), 'Do not overlap performance runs'
assert json.loads((s/'owner-runtime-qualification.json').read_text())['all_completed_successfully']
assert all(x['exit_code']==0 for x in json.loads((s/'arc-controlled-repeats'/'complete.json').read_text())), 'Finish controlled arc measurements before successive runtime work'
output_root=s/'successive-runs';output_root.mkdir(exist_ok=False)
rows=[]
for mode,order in [('validated',['baseline','candidate']),('untouched',['candidate','baseline'])]:
 for label in order:
  info=json.loads((b/f'{label}-successive-binary.json').read_text());binary=Path(info['path']);assert hashlib.sha256(binary.read_bytes()).hexdigest()==info['sha256']
  output=output_root/f'{mode}-{label}-0'
  command=['python3','scripts/successive-operations.py','run','--binary',str(binary),'--output',str(output),'--timeout','3600']
  if mode=='untouched':command.extend(['--','--untouched'])
  row={'mode':mode,'label':label,'command':command,'cwd':str(r),'output':str(output),'binary_sha256':info['sha256'],'scope':'complete unfiltered 21-chain long corpus; first paired pass per validation mode'}
  (s/'successive-run-phase.json').write_text(json.dumps(row,indent=2)+'\n');start=time.monotonic()
  with (output_root/f'{mode}-{label}-driver.log').open('w') as log:result=subprocess.run(command,cwd=r,stdout=log,stderr=subprocess.STDOUT)
  row.update(exit_code=result.returncode,seconds=time.monotonic()-start);rows.append(row);(s/'successive-runs-progress.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True)
(s/'successive-runs-complete.json').write_text(json.dumps(rows,indent=2)+'\n')
raise SystemExit(int(any(x['exit_code']!=0 for x in rows)))
