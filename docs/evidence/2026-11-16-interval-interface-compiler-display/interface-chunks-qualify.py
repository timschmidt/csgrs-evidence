from pathlib import Path
import hashlib
import json
import subprocess
import sys
import time

s = Path(__file__).parent
root = Path('/mnt/development/interval-coordinated-stack/alumina-interface')
required = ['alumina-interface.baseline.artifacts', 'alumina-interface.chunks.owner-lints',
            'alumina-interface.build-and-deploy.18.chunks-candidate']
print('Waiting for baseline artifact retention and candidate owner checks', flush=True)
while not all((s / 'runs' / name / 'result.json').exists() for name in required):
    time.sleep(5)
for name in required:
    assert json.loads((s / 'runs' / name / 'result.json').read_text())['exit_code'] == 0, name
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=root, text=True).strip() == '32a59de0d69436427e5b97297c4929fd908bf326'
assert not subprocess.check_output(['git', 'status', '--porcelain'], cwd=root)
patch = s / 'interface-chunks-candidate.patch'
subprocess.run(['git', 'apply', '--check', str(patch)], cwd=root, check=True)
subprocess.run(['git', 'apply', str(patch)], cwd=root, check=True)
actual = subprocess.check_output(['git', 'diff', '--binary', 'HEAD'], cwd=root)
assert actual == patch.read_bytes()
(s / 'interface-chunks-preparation.json').write_text(json.dumps({
    'repository': str(root), 'head': '32a59de0d69436427e5b97297c4929fd908bf326',
    'patch_sha256': hashlib.sha256(actual).hexdigest(),
    'scope': 'Only three execution-block iterator expressions; applied after retained baseline artifacts.'
}, indent=2) + '\n')
manifest = s / 'interface-chunks-comparison-lane.json'
subprocess.run([sys.executable, str(s / 'run-lane.py'), str(manifest), 'interface-chunks-comparison-lane'], check=True)
for row in json.loads(manifest.read_text()):
    result = json.loads((s / 'runs' / row['id'] / 'result.json').read_text())
    assert result['exit_code'] == 0 and result['source_boundaries_unchanged'], row['id']
subprocess.run([sys.executable, str(s / 'run-lane.py'), str(s / 'interface-candidate-artifacts-lane.json'),
                'interface-candidate-artifacts-lane'], check=True)
assert json.loads((s / 'runs/alumina-interface.candidate.artifacts/result.json').read_text())['exit_code'] == 0
base = json.loads((s / 'interface-artifacts-baseline/report.json').read_text())
candidate = json.loads((s / 'interface-artifacts-candidate/report.json').read_text())
comparison = {}
for name, old in base['artifacts'].items():
    new = candidate['artifacts'][name]
    comparison[name] = {'before': old, 'after': new, 'byte_identical': old['sha256'] == new['sha256'],
                        'growth_bytes': new['bytes'] - old['bytes']}
for name in ['network-attended', 'cached-autonomous']:
    a = (s / 'interface-artifacts-baseline' / (name + '.stdout')).read_bytes()
    b = (s / 'interface-artifacts-candidate' / (name + '.stdout')).read_bytes()
    comparison[name] = {'byte_identical': a == b, 'before_sha256': hashlib.sha256(a).hexdigest(),
                        'after_sha256': hashlib.sha256(b).hexdigest()}
(s / 'interface-chunks-comparison.json').write_text(json.dumps(comparison, indent=2) + '\n')
print('Comparison complete; no automatic acceptance or commit:',
      {key: value['byte_identical'] for key, value in comparison.items()}, flush=True)
