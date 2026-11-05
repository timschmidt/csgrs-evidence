from pathlib import Path
import hashlib,json,os,signal,subprocess,time
OUT=Path(__file__).resolve().parent
ROOT=Path('/tmp/csgrs-tensor-source-projection-20261105')
rows=[json.loads(x) for x in (OUT/'build.jsonl').read_text().splitlines() if x.startswith('{')]
assert any(x.get('reason')=='build-finished' and x.get('success') for x in rows)
exe=next(x['executable'] for x in rows if x.get('reason')=='compiler-artifact' and x.get('target',{}).get('name')=='tensor_graph_solids' and x.get('executable'))
paths=subprocess.check_output(['git','ls-files','-z'],cwd=ROOT).decode().split('\0');inputs={p:hashlib.sha256((ROOT/p).read_bytes()).hexdigest() for p in paths if p}
(OUT/'source-inputs.json').write_text(json.dumps(inputs,indent=2)+'\n');(OUT/'candidate.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=ROOT))
command=[exe,'nonlinear_tensor_caps_support_transverse_recuts','--exact','--nocapture'];started=time.time();timed_out=False
with (OUT/'case.log').open('w') as stream:
    proc=subprocess.Popen(command,cwd=ROOT/'crates/hyperbrep',stdout=stream,stderr=subprocess.STDOUT,start_new_session=True)
    try:code=proc.wait(timeout=300)
    except subprocess.TimeoutExpired:
        timed_out=True;os.killpg(proc.pid,signal.SIGTERM)
        try:code=proc.wait(timeout=5)
        except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);code=proc.wait()
assert all(hashlib.sha256((ROOT/p).read_bytes()).hexdigest()==h for p,h in inputs.items())
result={'command':command,'parent_revision':subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip(),'uncommitted_source_patch':'candidate.patch','source_inputs':len(inputs),'source_unchanged':True,'started':started,'seconds':time.time()-started,'exit_code':code,'external_limit_seconds':300,'external_containment_reached':timed_out,'qualification':'Research only. Exact success requires all original assertions; timeout is external containment, not typed geometry exhaustion or success. Debug/full downstream qualification remains required.','log_sha256':hashlib.sha256((OUT/'case.log').read_bytes()).hexdigest()}
(OUT/'result.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result));raise SystemExit(bool(code))
