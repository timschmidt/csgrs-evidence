"""Reproduce and retain the failed scalar gate; never count it as a passing check."""
import json
from check import OUT, run

for label, flags in [('inherited-zero-factor', []),
                     ('inherited-zero-factor-all-features', ['--all-features'])]:
    command = ['cargo', 'test', '--offline', '--locked', '-p', 'hyperreal', *flags,
               '--test', 'determinant_product_cancellation',
               'other_arities_keep_their_mathematical_values', '--', '--exact']
    status = run(label, command, 900)
    row = [r for r in json.loads((OUT / 'attempts.json').read_text()) if r['label'] == label][-1]
    text = (OUT / row['log']).read_text()
    assert status == 101 and 'assertion failed: FACTORS > 0' in text, row
    assert '0 passed; 1 failed;' in text, row
    print(label, 'remains FAILED on the merged source; no full-scalar or pre-push admission')
