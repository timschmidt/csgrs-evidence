from pathlib import Path
import json,os,subprocess,time,signal
r=Path(__file__).resolve().parent
rows=[json.loads(s) for s in (r/'algebraic-pair-solver-baseline3-build.jsonl').read_text().splitlines()]
args=['rustc','+1.98.1','--edition=2024','--crate-name','algebraic_pair_coefficient_normal_form_probe',str(r/'algebraic-pair-coefficient-normal-form-probe.rs'),'-o',str(r/'algebraic-pair-coefficient-normal-form-probe'),'-L','dependency=/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-rational-section-admission/release/deps']
for name in ['hyperreal','hyperlimit','hypersolve']:
    files={p for row in rows if row.get('reason')=='compiler-artifact' and row['target']['name']==name for p in row['filenames'] if p.endswith('.rlib')}
    assert len(files)==1,(name,files)
    args+=['--extern',name+'='+files.pop()]
with (r/'algebraic-pair-coefficient-normal-form-probe-build.log').open('w') as f:
    subprocess.run(args,stdout=f,stderr=subprocess.STDOUT,check=True)
start=time.time()
with (r/'algebraic-pair-coefficient-normal-form-probe.log').open('w') as f:
    child=subprocess.Popen([str(r/'algebraic-pair-coefficient-normal-form-probe')],stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
    outcome='completed'
    try:status=child.wait(timeout=30)
    except subprocess.TimeoutExpired:
        outcome='external_timeout';os.killpg(child.pid,signal.SIGTERM);status=child.wait()
result={'compile_command':args,'status':status,'outcome':outcome,'elapsed_seconds':time.time()-start}
(r/'algebraic-pair-coefficient-normal-form-probe.json').write_text(json.dumps(result,indent=2)+'\n');print(result)
