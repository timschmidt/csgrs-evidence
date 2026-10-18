"""Bind executed native STEP boundary checks to their shared acceptance source."""
import json
from pathlib import Path
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import hashes

source = hashes()
latest = {r['label']: r for r in json.loads((OUT/'attempts.json').read_text())}
consumers = json.loads((OUT/'consumers.json').read_text())
assert consumers['source'] == source
checks = [latest[name] for name in ['new-consumer-step', 'contacts-consumer-step']]
assert all(row['exit_code'] == 0 and json.loads((OUT/row['source']).read_text()) == source
           for row in checks)
contact_rows = [line for line in (OUT/checks[1]['log']).read_text().splitlines()
                if line.startswith('plane_contact_step_case=')]
assert contact_rows == [f'plane_contact_step_case={case} replay={replay} outcome={kind} body=true entity=true native_recovery=true'
                        for case, kind in [('cube', 'UnmaterializedPoint'), ('parallel_cap', 'NonRational')]
                        for replay in ['false', 'true']]
report = dict(source=source, checks=checks, retained_contact_rows=contact_rows,
              new_binary=consumers['binaries']['new_native'],
              acceptance_source='crates/hyperbrep-io/tests/support/selected_procedural_profiles.rs',
              scope='The new shared native/WASM acceptance rejects UnsupportedCurve(PlanarImage) '
              'at body 0 and an attributed edge before/after cold replay, then verifies native '
              'classification and deterministic replay. Prior contact/cube controls retain their '
              'distinct NonRational/UnmaterializedPoint diagnostics. No new STEP encoding claim.')
(OUT/'step-review.json').write_text(json.dumps(report, indent=2)+'\n')
