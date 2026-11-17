from pathlib import Path
import json,os,subprocess,time
s=Path(__file__).parent;r=Path('/dev/shm/interval-cancellation-boundary/csgrs');env=os.environ|{'CARGO_TARGET_DIR':'/dev/shm/interval-cancellation-boundary/target','CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'}
started=json.loads((s/'started.json').read_text())['time'];assert time.time()-started<1800
cmd=['cargo','+1.95.0','test','--release','--locked','--offline','-p','hypersolve','--lib','--no-default-features','cancellation_publication_','--','--test-threads=1']
with (s/'baseline-tests.log').open('w') as log:p=subprocess.run(cmd,cwd=r,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=min(600,1800-(time.time()-started)))
result=dict(command=cmd,exit_code=p.returncode,expected=101,seconds_since_campaign_start=time.time()-started);(s/'baseline-tests.json').write_text(json.dumps(result,indent=2)+'\n');assert p.returncode==101
raw=(s/'baseline-tests.log').read_text();assert '3 passed; 5 failed;' in raw,raw[-2000:];assert 'error[E' not in raw
print('Owner baseline: three controls pass, five new publication-contract witnesses fail as expected.')
