from pathlib import Path
import json,subprocess,shutil
s=Path(__file__).parent;old=s/'before-wording-artifacts';old.mkdir()
for name in ['new-cost-builds.json','candidate-control.json']:
 shutil.copy2(s/name,old/name)
for p in list(s.glob('new-*-build.*'))+list(s.glob('candidate-control-build.*')):
 if p.is_file():shutil.copy2(p,old/p.name)
subprocess.run(['python3',str(s/'build-new-cost.py')],check=True)
subprocess.run(['python3',str(s/'build-control.py'),'candidate'],check=True)
before=json.loads((old/'new-cost-builds.json').read_text());after=json.loads((s/'new-cost-builds.json').read_text())
assert [[p['sha256'] for p in row['artifacts']] for row in before]==[[p['sha256'] for p in row['artifacts']] for row in after]
assert json.loads((old/'candidate-control.json').read_text())['sha256']==json.loads((s/'candidate-control.json').read_text())['sha256']
(s/'final-artifact-equality.json').write_text(json.dumps({'all_measured_artifacts_byte_identical_after_final_doc_edit':True},indent=2)+'\n')
print('Final source reproduces every measured executable byte for byte.',flush=True)
