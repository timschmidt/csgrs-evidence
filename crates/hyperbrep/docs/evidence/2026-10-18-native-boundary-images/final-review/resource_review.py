"""Record the manually reviewed feature-cost tradeoffs without hiding adverse rows."""
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, hashes
read = lambda n: json.loads((OUT/n).read_text())
r = read('resource-summary.json')
n = read('new-cost-summary.json')
source = hashes()
assert r['source'] == n['source'] == source
# This script records the specific adverse row reviewed during the full campaign.
# Any additional row needs its own review, rather than inheriting this decision.
assert [x['case'] for x in r['adverse_timing_rows']] == ['arc_structural_facts_replay']
a = r['adverse_timing_rows'][0]
alloc = r['increased_allocation_rows']
largest = max(alloc, key=lambda x: x['delta']['requested_bytes'])
call_percent = 100 * largest['delta']['calls'] / largest['baseline']['calls']
byte_percent = 100 * largest['delta']['requested_bytes'] / largest['baseline']['requested_bytes']
size_min = min(x['delta'] for x in r['executable_sizes'])
size_max = max(x['delta'] for x in r['executable_sizes'])
wasm_delta = r['wasm_size']['delta_bytes']
summary = (f"The one above-marker row measures {a['baseline_median_ns']:.5f} to "
    f"{a['candidate_median_ns']:.5f} ns, a {a['candidate_median_ns']-a['baseline_median_ns']:.5f} ns "
    'difference on a nanosecond-scale structural-fact replay. It remains an unfavorable observation; '
    'these shared-host trials do not establish a significant speed change or its cause. '
    f"The largest allocation-request increase is {largest['delta']['calls']:,.3f} calls "
    f"({call_percent:.6f}%) and {largest['delta']['requested_bytes']:,.3f} requested bytes "
    f"({byte_percent:.6f}%) in {largest['case']}. Native harness size deltas range from "
    f"{size_min:+,} to {size_max:+,} bytes; the unchanged 138-group WASM harness changes by "
    f"{wasm_delta:+,} bytes. These small observed costs are retained for the expanded exact native "
    'workflow. No performance-only optimization, significant speedup, retained-heap bound or '
    'distribution-size improvement is claimed; historical cost obligations remain open.')
decision = dict(source=source, decision='kept',
    reviewed_adverse_rows=[x['corpus']+'/'+x['case'] for x in r['adverse_timing_rows']],
    summary=summary, reason='Expanded exact construction/replay/composition with the complete previous domain and receipts preserved; the recorded local timing, allocation and size tradeoffs do not establish a significant supported-workflow regression.',
    scope='Review of this feature extension and complete matched corpus. The 10% marker is a review signal, not a claim of statistical significance or permission to alter a fixture.')
(OUT/'resource-decision.json').write_text(json.dumps(decision, indent=2)+'\n')
lines = ['# Resource review', '', summary, '',
    'The [matched campaign](cost-summary.json) retains 192 original case receipts in 132 fresh processes. '
    'All original inputs, iterations, materialization and independent assertions remain. '
    'The [full resource report](resource-summary.json) includes every process wall/CPU/RSS observation, '
    'all allocator rows and every harness size. Three alternating CPU-pinned pairs were run per corpus; '
    'no task builds or tests overlapped measurement. These are shared-host observations, not controlled-host significance tests.', '',
    '## Every increased allocation-request row', '',
    '| Corpus / case | Calls delta / iteration | Requested bytes delta / iteration |',
    '| --- | ---: | ---: |']
for x in alloc:
    lines.append(f"| {x['corpus']} / {x['case']} | {x['delta']['calls']:.3f} | {x['delta']['requested_bytes']:.3f} |")
lines += ['', '## New absolute complete-work observations', '',
    'Each of three fresh CPU-pinned processes runs each full regression group once as warmup, '
    'then three timed repetitions. All exact assertions, native materialization, cold model replay '
    'and supported continuation remain inside the operation. Four completion groups and two '
    'expected-rejection controls are separate below. Former unsupported work is not a speedup baseline.', '',
    '| Group | Outcome | Median ms / iteration | Allocation calls / iteration | Requested bytes / iteration |',
    '| --- | --- | ---: | ---: | ---: |']
for x in n['rows']:
    lines.append(f"| {x['case']} | {x['outcome']} | {x['median_ns']/1e6:.6f} | {x['allocation_calls']:.3f} | {x['requested_bytes']:.3f} |")
new = read('new-consumers.json')['binaries']
peaks = [x['resources']['maximum_rss_kib'] for x in n['trials']]
lines += ['', f"New full-consumer process peak RSS ranges from {min(peaks):,} to {max(peaks):,} KiB. "
    f"The new native harness is {new['native']['bytes']:,} bytes and the new 14-group WASM harness "
    f"is {new['wasm']['bytes']:,} bytes. Their different workloads are not comparable to the old "
    '138-group harness size as an optimization. Raw trials and timing boundaries remain in '
    '[new-cost-summary.json](new-cost-summary.json).', '',
    'Allocation counters sum allocation/reallocation requests; they do not measure live retained heap. '
    'Process RSS includes runtime and allocator state. Warmup does not clear OS or shared scalar caches. '
    'No new persistent cache was added, and neither native-image proof nor profile XOR establishes '
    'an operation-wide total-work, heap-byte or cancellation bound. Tests and measurements have external '
    'timeouts; those do not create a production resource contract. Expression/coefficient growth, '
    'host-controlled statistical qualification, full resource accounting and delivery gates remain open.', '']
(OUT/'resource-review.md').write_text('\n'.join(lines))
assert hashes() == source
print(summary, flush=True)
