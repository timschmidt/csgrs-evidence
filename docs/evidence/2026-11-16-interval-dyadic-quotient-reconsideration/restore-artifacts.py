from pathlib import Path
import subprocess,json,shutil,sys
s=Path(__file__).parent
for lock in ['pinned','external']:
 shutil.copyfile(s/(lock+'-Cargo.lock'),s/'probe/Cargo.lock')
 subprocess.run([sys.executable,str(s/'build-probe.py'),'restored',lock],check=True)
 for mode in ['allocation','trace','stack']:
  a=json.loads((s/f'baseline-{lock}-{mode}-build.json').read_text());b=json.loads((s/f'restored-{lock}-{mode}-build.json').read_text());assert a['sha256']==b['sha256'],(lock,mode)
subprocess.run([sys.executable,str(s/'build-owner-artifacts.py'),'restored'],check=True)
a={r['name']:r['size']['sha256'] for r in json.loads((s/'baseline-owner-artifacts.json').read_text())['artifacts']};b={r['name']:r['size']['sha256'] for r in json.loads((s/'restored-owner-artifacts.json').read_text())['artifacts']};assert a==b
shutil.copyfile(s/'pinned-Cargo.lock',s/'probe/Cargo.lock')
(s/'restored-artifact-verification.json').write_text(json.dumps({'probe_artifacts':6,'owner_artifacts':15,'all21byte_identical_to_current_baseline':True},indent=2)+'\n')
print('All21 restored final artifacts reproduce baseline SHA256',flush=True)
