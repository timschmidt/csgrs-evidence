from pathlib import Path
import json,hashlib,re,subprocess
p=Path(__file__).parent
control=Path('/tmp/interval-refactor/program-derivatives/successive-final.log');candidate=p/'qualification-07.log'
def rows(f):return [[v.strip() for v in s.strip('|').split('|')] for s in f.read_text().splitlines() if s.startswith('|')][2:]
a,b=rows(control),rows(candidate);assert len(a)==len(b)==200
structural=[i for i,(x,y) in enumerate(zip(a,b)) if x[:10]!=y[:10]];allocations=[i for i,(x,y) in enumerate(zip(a,b)) if x[-1]!=y[-1]];memory=[i for i,(x,y) in enumerate(zip(a,b)) if x[13:16]!=y[13:16]]
assert not structural and not allocations and not memory
(p/'successive-comparison.json').write_text(json.dumps(dict(control=str(control),control_sha256=hashlib.sha256(control.read_bytes()).hexdigest(),rows=200,structural_differences=structural,allocator_call_differences=allocations,displayed_memory_column_differences=memory,timing_scope='Smoke validation; these timings are not a matched performance comparison.'),indent=2)+'\n')
checks=json.loads((p/'qualification.json').read_text());assert len(checks)==11 and all(r['exit']==0 for r in checks)
counts={}
for name,log in [('owner','qualification-00.log'),('interface','qualification-05.log')]:
 matches=re.findall(r'test result: ok\. (\d+) passed', (p/log).read_text());counts[name]=sum(map(int,matches))
assert counts=={'owner':496,'interface':201}
replay=json.loads((p/'fresh-replay.json').read_text());assert len(replay)==6 and all(r['exit']==0 and r['report_and_trace_lines']==92 for r in replay)
(p/'validation-summary.json').write_text(json.dumps(dict(groups=11,passed=11,tests=counts,fresh_process_transcripts=6,rows_per_transcript=92,canonical_interface_golden=dict(bytes=41795,sha256='df893df83e90e6b53452e18586ffcaa2524a021631a395d4a6523be16263669c',authority='Existing passing machine_profile test asserts this frozen transcript length/digest alongside exact geometry, limits, bottlenecks and certification checks; hash alone is not geometry proof.'),successive_rows=200,full_pre_push_matrix=False,pushed=False),indent=2)+'\n')
(p/'RESULTS.md').write_text((p/'RESULTS.md').read_text()+'''\n## Final restored-candidate validation\n\nAll eleven affected validation groups pass: 496 owner tests, 201 Interface tests,\nstrict owner/downstream Clippy, owner docs, WASM compilation, all 194 benchmark\nsmoke cases, 200 successive rows, both formatting checks and diff whitespace.\nSix fresh-process transcripts (legacy/direct/compatibility under STRICT and\nAPPROXIMATE_512) match within each policy, with 92 report/trace lines each. Fixed\ndispatch assertions are unchanged. The existing Interface golden asserts 41,795\nbytes and SHA-256 df893df83e90e6b53452e18586ffcaa2524a021631a395d4a6523be16263669c\nalongside exact limits, bottlenecks and lowering checks. Successive structural,\nallocator-count and displayed memory columns match the retained 200-row control;\nits elapsed times are smoke observations, not a matched performance comparison.\nThis correctness evidence does not clear the separately failing timing gate.\n''')
print(json.dumps(counts), '200 successive rows and six transcripts match')
