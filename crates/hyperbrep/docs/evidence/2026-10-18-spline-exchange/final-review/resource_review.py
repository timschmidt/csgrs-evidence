"""Bind the manually reviewed costs to all raw adverse rows and feature scope."""
import hashlib,json,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,hashes
read=lambda n:json.loads((OUT/n).read_text())
r=read('resource-summary.json'); n=read('new-cost-summary.json'); p=read('prior-native-cost-summary.json'); notes=read('resource-review-notes.json'); source=hashes()
assert all(x['source']==source for x in [r,n,p])
assert notes['source_identity']==hashlib.sha256(json.dumps(source,sort_keys=True).encode()).hexdigest()
assert notes['decision']=='kept'
adverse=[x['corpus']+'/'+x['case'] for x in r['adverse_timing_rows']]
assert notes['reviewed_adverse_rows']==adverse
assert notes['reviewed_prior_rows']==[x['case'] for x in p['rows']]
alloc=r['increased_allocation_rows']; sizes=r['executable_sizes']
summary=(notes['timing_review']+' '+notes['prior_review']+' '+notes['resource_review']+
 ' These are shared-host local observations. No performance-only optimization, significant speedup, '
 'retained-heap bound or distribution-size improvement is claimed; historical cost obligations remain open.')
decision=dict(source=source,decision='kept',reviewed_adverse_rows=adverse,reviewed_prior_rows=notes['reviewed_prior_rows'],summary=summary,reason=notes['reason'],notes_sha256=hashlib.sha256((OUT/'resource-review-notes.json').read_bytes()).hexdigest(),scope='Reviewed feature-extension tradeoffs with all old receipts preserved. The 10% marker requires review; it does not establish statistical significance or permit changing fixtures.')
(OUT/'resource-decision.json').write_text(json.dumps(decision,indent=2)+'\n')
lines=['# Resource review','',summary,'',notes['reason'],'',
 'All 192 original case receipts remain across 132 fresh processes, plus six preceding native groups in '
 'three alternating pairs. Full fixtures, iterations, exact assertions and materialization remain inside '
 'the original boundaries. No task builds/tests overlap measurements. CPU pinning does not isolate '
 'shared-host load. Every row and sample remains in the linked JSON reports.','',
 '## Every timing row above the review marker','','| Corpus / case | Baseline ms | Candidate ms | Ratio |','| --- | ---: | ---: | ---: |']
for x in r['adverse_timing_rows']:
 lines.append(f"| {x['corpus']} / {x['case']} | {x['baseline_median_ns']/1e6:.9f} | {x['candidate_median_ns']/1e6:.9f} | {x['ratio']:.6f} |")
if not adverse:lines.append('| None | | | |')
lines+=['','## Increased allocation requests','','| Corpus / case | Calls delta / iteration | Bytes delta / iteration |','| --- | ---: | ---: |']
for x in alloc:lines.append(f"| {x['corpus']} / {x['case']} | {x['delta']['calls']:.3f} | {x['delta']['requested_bytes']:.3f} |")
if not alloc:lines.append('| None | | |')
lines+=['','## Preserved six native groups','','| Group | Outcome | Baseline ms | Candidate ms | Ratio |','| --- | --- | ---: | ---: | ---: |']
for x in p['rows']:lines.append(f"| {x['case']} | {x['outcome']} | {x['baseline']['elapsed_ns']/1e6:.6f} | {x['candidate']['elapsed_ns']/1e6:.6f} | {x['ratio']:.6f} |")
lines+=['','## New absolute acceptance costs','',
 'Each fresh process warms each full group once, then runs three timed repetitions. Native geometry '
 'proof groups, successful exchange workflows and expected typed controls retain every assertion. '
 'The groups are intentionally distinct and not individually relabeled as successful solid workflows. '
 'Former unsupported work is not a speedup baseline.','',
 '| Group | Outcome | Median ms / iteration | Calls / iteration | Requested bytes / iteration |','| --- | --- | ---: | ---: | ---: |']
for x in n['rows']:lines.append(f"| {x['case']} | {x['outcome']} | {x['median_ns']/1e6:.6f} | {x['allocation_calls']:.3f} | {x['requested_bytes']:.3f} |")
new=read('new-consumers.json')['binaries']; peaks=[x['resources']['maximum_rss_kib'] for x in n['trials']]
lines+=['',f"New full-consumer peak RSS: {min(peaks):,}–{max(peaks):,} KiB. New native harness: {new['native']['bytes']:,} bytes; nine-group WASM: {new['wasm']['bytes']:,} bytes. Different harnesses are not a size optimization comparison.",'',
 'Allocation counters sum allocation/reallocation requests, not live retained heap. RSS includes runtime '
 'and allocator state. Expanded knot cardinality is bounded before allocation, but this does not bound '
 'all native arithmetic, coefficient growth, total work, heap bytes or cancellation latency. External '
 'timeouts contain qualification processes; they are not a production resource contract.','',
 '[Matched raw costs](cost-summary.json), [resources and sizes](resource-summary.json), '
 '[prior native comparisons](prior-native-cost-summary.json), [new absolute costs](new-cost-summary.json)'
 ', [faceted timing follow-up](faceted-followup.json) and [manual review notes](resource-review-notes.json) retain all observations.','']
(OUT/'resource-review.md').write_text('\n'.join(lines)); assert hashes()==source
print(summary,flush=True)
