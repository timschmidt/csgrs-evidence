from pathlib import Path
import json,shutil,hashlib,subprocess
s=Path(__file__).parent

def unit_artifact(label,directory):
 candidates=[];core_test_flags=[]
 for line in (directory/'output.log').read_text().splitlines():
  if not line.startswith('{'):continue
  try:r=json.loads(line)
  except json.JSONDecodeError:continue
  if r.get('reason')!='compiler-artifact':continue
  if r['target']['name']=='alumina_interface_core':core_test_flags.append(r['profile']['test'])
  if r.get('executable') and r['target']['name']=='alumina_interface':candidates.append(Path(r['executable']))
 assert len(candidates)==1,candidates
 assert core_test_flags and not any(core_test_flags),core_test_flags
 out=s/('interface-ui-tests-'+label);out.mkdir();binary=out/'test-binary';shutil.copy2(candidates[0],binary)
 raw=binary.read_bytes();info={'bytes':len(raw),'sha256':hashlib.sha256(raw).hexdigest(),'core_dependency_cfg_test':False}
 temporary=out/'objcopy-temporary'
 subprocess.run(['objcopy','--dump-section','.text='+str(out/'text'),str(binary),str(temporary)],check=True);temporary.unlink()
 raw=(out/'text').read_bytes();info|={'text_bytes':len(raw),'text_sha256':hashlib.sha256(raw).hexdigest()}
 (out/'report.json').write_text(json.dumps(info,indent=2)+'\n');return binary
