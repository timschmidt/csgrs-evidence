from pathlib import Path
import hashlib
import json
import subprocess
import time

root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-selected-integration')
assert not checkout.exists()
j = json.loads((root / 'polynomial-region-final-commit.json').read_text())
k = json.loads((root / 'horizontal-boundary-final-commit.json').read_text())
for prefix, count in [('polynomial-region', 15), ('horizontal-boundary', 16)]:
    results = json.loads((root / (prefix + '-final-results.json')).read_text())
    assert len(results) == count and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
    assert json.loads((root / (prefix + '-persisted.json')).read_text())['persisted']
contract = {
    'recorded_epoch': time.time(), 'parents': [j['commit'], k['commit']],
    'owner': 'Existing Hypersolve selected polynomial topology and Hypercurve shared region arrangement',
    'properties': ['P12', 'P13', 'P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Previously qualified rational polynomial graph slabs on closed rectangles, now combining simple horizontal boundary components with retained filled-region fragments. The separate algebraic-similarity increment will be merged only after its own qualification and commit.',
    'missing_acceptance': [
        'A filled rectangle bounded by the two selected components of y(y-1)=0 on the exact closed source rectangle, under both fill rules and traversal directions, followed by Boolean clipping, reconstruction and further operation.',
        'After the algebraic-similarity increment is included: a guarded rational similarity definition followed by an algebraic explicit similarity must retain both definitions through line intersection, split and replay.',
    ],
    'evidence': 'Parent qualification establishes the individual increments. Combined acceptance remains pending and will not be inferred from those separate runs.',
    'resource_contract': 'Use unchanged exact policies and existing counted curve-work outcomes; fixture timeouts provide external containment, not a native total-work or memory bound.',
    'publication': 'No remote push is authorized by a partial integration check; the full pre-push contract still applies.',
}
(root / 'selected-integration-contract.json').write_text(json.dumps(contract, indent=2) + '\n')
subprocess.run(['git', 'clone', '--shared', '--branch', j['branch'],
                '/tmp/hypercurve-closure-polynomial-regions', str(checkout)], check=True)
subprocess.run(['git', 'checkout', '-b', 'hypercurve-selected-branch-integration'], cwd=checkout, check=True)
subprocess.run(['git', 'fetch', '/tmp/hypercurve-closure-horizontal-boundaries', k['branch']], cwd=checkout, check=True)
result = subprocess.run(['git', 'merge', '--no-ff', '--no-commit', k['commit']], cwd=checkout,
                        text=True, capture_output=True)
(root / 'selected-integration-jk-merge.log').write_text(result.stdout + result.stderr)
assert result.returncode in [0, 1]
conflicts = subprocess.check_output(['git', 'diff', '--name-only', '--diff-filter=U'], cwd=checkout, text=True).splitlines()
status = {'checkout': str(checkout), 'parents': contract['parents'], 'merge_returncode': result.returncode,
          'conflicts': conflicts, 'recorded_epoch': time.time()}
(root / 'selected-integration-jk-start.json').write_text(json.dumps(status, indent=2) + '\n')
print(json.dumps(status), flush=True)
