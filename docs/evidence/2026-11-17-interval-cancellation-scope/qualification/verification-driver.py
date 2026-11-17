from pathlib import Path
import hashlib,json,subprocess,time
s=Path('/tmp/interval-refactor/solver-cancellation-scope');deadline=json.loads((s/'continuation.json').read_text())['original_deadline_unix']
while not (s/'curve-clippy.json').exists():assert time.time()<deadline+30;time.sleep(5)
row=json.loads((s/'curve-clippy.json').read_text());assert row['exit_code']==0 and not row['timeout'];script=s/'verify.py';start=time.monotonic()
with (s/'verification.log').open('wb') as f:p=subprocess.run(['python3',str(script)],stdout=f,stderr=subprocess.STDOUT,timeout=300)
result=dict(exit_code=p.returncode,seconds=time.monotonic()-start,analysis_limit_seconds=300,script_sha256=hashlib.sha256(script.read_bytes()).hexdigest(),original_execution_deadline_unchanged=True);(s/'verification-command.json').write_text(json.dumps(result,indent=2)+'\n');assert p.returncode==0;print('Scope candidate independently verified')
