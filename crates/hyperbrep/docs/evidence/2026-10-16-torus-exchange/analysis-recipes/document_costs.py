"""Publish the reviewed complete costs without changing historical records."""
import hashlib
import json
from pathlib import Path

OUT = Path(__file__).resolve().parents[1]
ROOT = OUT.parents[4]
read = lambda name: json.loads((OUT / name).read_text())
digest = lambda name: hashlib.sha256((OUT / name).read_bytes()).hexdigest()
b = read('benchmark-summary.json')
d = read('dependency-costs-v1/summary.json')
decision = read('retention-decision.json')
assert decision['decision'] == 'kept'
assert decision['reviewed_benchmark_sha256'] == digest('benchmark-summary.json')
assert decision['reviewed_dependency_cost_sha256'] == digest('dependency-costs-v1/summary.json')
assert b['matched_cases'] == 167 and b['new_cases'] == 3 and b['processes'] == 105
assert b['unchanged_receipts'] == 162 and b['reviewed_receipt_migrations'] == 5
assert b['all_receipts_accounted_for']

heading = '\n\n## Exact ring-torus exchange (2026-10-17)\n\n'
summary = (
    f"The complete {b['processes']}-process campaign compares 167 preserved cases "
    "in seventeen corpora and records three new completed torus workflows "
    "separately. 162 old exact receipts are unchanged; five archive receipts "
    "have explicitly reviewed exact representation migrations. Their complete "
    "artifact comparison is linked in the admission record. The original "
    "no-migration gate remains failed. All 54 separately retained STEP/archive "
    "artifacts agree byte-for-byte. "
    f"The maximum preserved-case median latency ratio is {b['maximum_case_ratio']:.6f}; "
    f"{len(b['adverse_timing_rows'])} rows exceed 10%. "
    f"{len(b['changed_allocation_rows'])} rows change allocation observations, including "
    f"{len(b['increased_allocation_rows'])} increases in calls or requested bytes. "
    "All raw samples, unfavorable results, allocation requests, process resources "
    "and executable sizes remain in the evidence. These shared-host observations "
    "do not establish a general speedup or close earlier cost gates.\n\n"
)
sizes = [row['delta_bytes'] for row in b['binary_sizes']]
resources = (
    f"Native harness size changes range from {min(sizes):,} to {max(sizes):,} bytes. "
    f"The WASM harness changes by {b['wasm']['delta_bytes']:,} bytes and now includes "
    "90 probe groups; this is not a matched package-size comparison. "
    "Cumulative allocator requests and process RSS do not bound retained heap "
    "or total work. Four native subdivision/reload cycles grow the archive "
    "from 91,506 to 142,937 bytes and serialized Computable occurrences from "
    "780 to 2,089. Their maximum serialized depth rises from 16 to 18. "
    "These five states establish no arbitrary-depth or cancellation guarantee.\n\n"
)
supplement = (
    f"The separate dependency microcost supplement records {d['cases']} cases "
    f"in {d['processes']} processes, with {len(d['adverse_timing_rows'])} median ratios "
    f"above 1.10 and maximum {d['maximum_case_ratio']:.6f}. "
    "Its scalar baseline was reconstructed after the blocker was discovered; "
    "it was not frozen prospectively. Criterion alone supplies no geometric "
    "completion or allocation receipt. The four complete dependency library "
    "suites preserve all 3,514 named outcomes (3,508 passed, six ignored); "
    "the separately reproduced inherited zero-factor debug failures remain.\n\n"
)
adverse = (
    "Every preserved-workflow median ratio above 10%:\n\n"
    "| Corpus / case | Candidate / baseline |\n"
    "| --- | ---: |\n"
    + ''.join(f"| `{r['corpus']}/{r['case']}` | {r['ratio']:.6f} |\n"
              for r in b['adverse_timing_rows']) + '\n'
)
new = [r for r in b['costs'] if 'ratio' not in r]
absolute = (
    "New workflows include exact assertions and full output materialization "
    "inside timing. Formerly unsupported operations are not speedup baselines.\n\n"
    "| New workflow | Median milliseconds per iteration |\n"
    "| --- | ---: |\n"
    + ''.join(f"| `{r['case']}` | {r['candidate_median_ns']/1e6:.6f} |\n" for r in new)
    + '\n'
)
native = (
    "The [source-bound admission record](docs/evidence/2026-10-16-torus-exchange/README.md) "
    "retains the original exchange/replay failures, shared scalar proof, native "
    "contact/image facts, rejected alternatives and explicit capability migrations.\n\n"
    + summary + decision['rationale'] + '\n\n' + adverse + absolute + resources + supplement
    + "The [follow-up experiment](docs/evidence/2026-10-16-torus-exchange/future-angle-costs.md) "
    "targets repeated proof work while preserving every successful workflow. "
    "No individual helper's contribution has yet been isolated. Prior archive, "
    "spline, cached-arc, pcurve, provenance and prism cost observations remain "
    "open. All broader work-package, resource and delivery gates remain open.\n"
)
io = (
    "The [complete admission record](../hyperbrep/docs/evidence/2026-10-16-torus-exchange/README.md) "
    "qualifies exact selected torus support, both angular maps, seams and repeated "
    "native composition. The [native performance record](../hyperbrep/PERFORMANCE.md#exact-ring-torus-exchange-2026-10-17) "
    "lists every adverse timing row and the supporting scalar observations.\n\n"
    + summary + absolute + resources
    + "Retain this as an exact feature extension with the disclosed adverse costs, "
    "not an optimization. Whole-image admission, finite-decimal encoding and "
    "typed failures remain authoritative. Optional OCCT checks and source-path "
    "WASM execution do not close the shipped-package, MSRV or language-binding "
    "gates. The original successful geometry, policies, byte contracts and "
    "full-size hard cases remain the baseline for further cost work.\n"
)
for path, section in [(ROOT/'crates/hyperbrep/PERFORMANCE.md', native),
                      (ROOT/'crates/hyperbrep-io/PERFORMANCE.md', io)]:
    old = path.read_text()
    path.write_text(old.split(heading)[0].rstrip() + heading + section)
print('published complete reviewed cost record in both BREP performance documents')
