from pathlib import Path
import hashlib,json,subprocess
s=Path(__file__).parent
base=json.loads((s/'BASELINE.json').read_text());final=[]
for row in base:
 p=Path('/mnt/development')/row['repo']
 def git(*args):return subprocess.check_output(['git',*args],cwd=p)
 actual=dict(repo=row['repo'],head=git('rev-parse','HEAD').decode().strip(),status=git('status','--porcelain=v1').decode(),staged_sha256=hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),unstaged_sha256=hashlib.sha256(git('diff','--binary')).hexdigest())
 assert actual==row,(actual,row)
 final.append(actual)
(s/'FINAL-REPOSITORIES.json').write_text(json.dumps(final,indent=2)+'\n')
assert json.loads((s/'isolated-tree-restored.json').read_text())['clean']
checks=json.loads((s/'restored-qualification.json').read_text());assert len(checks)==3 and all(r['returncode']==0 for r in checks)
assert json.loads((s/'provider-fixtures.json').read_text())['returncode']==0
assert all(r['matched'] for r in json.loads((s/'prior-stages-verification.json').read_text()))
repeat=json.loads((s/'repeat-comparison.json').read_text());sim=json.loads((s/'cache-model-summary.json').read_text())
old=json.loads(Path('/tmp/interval-refactor/dynamics-current-cost/all-profile-comparison.json').read_text())
old={r['case']:r for r in old}
for r in sim:
 assert r['instructions_identical']
 for v,c in r['simulated_events'].items():assert c['Ir']==old[r['case']]['instructions'][v]
summary=dict(disposition='unretained; no production changes',head=base[0]['head'],timing_cases=len(repeat),timing_sweeps=6,extraction_adverse=sum(r['extraction']['adverse_separated'] for r in repeat),provider_adverse=sum(r['provider-control']['adverse_separated'] for r in repeat),all_three_owner_binaries_reproduce=True,all_194_observer_results_and_allocations_match=True,simulated_profiles=18,simulation_instructions_match_previous=True,hardware_counters_available=False,frozen_stages_preserved=31,isolated_restored=True)
(s/'SUMMARY.json').write_text(json.dumps(summary,indent=2)+'\n')
status='''# Current dynamics layout diagnostic

Disposition: Phase 11 remains unretained. This record diagnoses its current cost
failures; no production source, benchmark workload, policy, compiler flag,
acceptance threshold or dependency was changed for retention. The fifteen-phase
goal remains active. Repeating measurements is not implementation progress.

## Current revision and completed workloads

Baseline 04286c458d15b356b305d5805bfe04be659ba246 plus exact staged extraction
SHA-256 676e5d602a1fbdcc3fc7ff0d15bfb62692ef03f69a5a62f957aa7c7b6697b359.
The earlier provider-owned error patch is a diagnostic control. Its implementation
applies unchanged; only obsolete CHANGELOG context is excluded. The actual patch
is retained. All three real owner executables exactly reproduce previous hashes
and sizes: 13,312,600 / 13,304,584 / 13,302,416 bytes, respectively. The observer
has the full identical 194-workload body and matching external dependencies.
All complete Debug results and allocation/deallocation/reallocation/bytes/peak/live
records agree across current variants. The observer is separate instrumentation,
not a canonical geometry serialization or independent mathematical oracle.

Six longer sweeps use baseline/extraction/provider/provider/extraction/baseline,
CPU0 affinity, process ASLR disabled, one executable path, two-second busy warmup,
one-second Criterion warmup, two-second measurement and thirty samples. No builds,
tests or profiles run during timing. All six cases were selected from prior
published failures before this run; this is not new full 194-case owner timing.
Every sample and favorable/adverse observation is retained. Adverse separation
means both candidate lower mean confidence bounds exceed both baseline upper
bounds; it is a screen, not family-wise significance or a permitted tolerance.

| Case | Extraction/baseline mean | Provider/baseline mean |
| --- | ---: | ---: |
'''
for r in repeat:status+=f"| `{r['case']}` | {r['extraction']['ratio']:.5f} | {r['provider-control']['ratio']:.5f} |\n"
status+='''
All six provider failures reproduce. Extraction retains adverse separation for
hodograph, pad clearance and the 256-record parser. Identical emitted instruction
counts and smaller binaries do not clear those failures.

## Diagnostic cache/branch model

Hardware counters are unavailable: perf is absent and the corrected 128-byte
perf_event_open request returns EACCES. The initial too-short attribute request
returned E2BIG; both outcomes are retained. Cache/branch simulation therefore
runs against the separate observer, not the real timing executable. It measures
32 completed callbacks including destruction after eight warmups, with collection
disabled outside the epoch. ASLR is disabled and the executable path is shared.
The explicit generic model uses 32 KiB eight-way I1/D1 and 8 MiB sixteen-way LL,
all with 64-byte lines. It does not model the sliced physical cache hierarchy,
TLBs, prefetchers, decoding or instruction scheduling. Instrumented elapsed time
is not performance evidence. Initial aggregate-physical LL settings were rejected
before program execution because their set count is not a power of two; logs
remain. The corrected model completed all 18 profiles.

All six instruction totals reproduce the earlier observations exactly across all
variants. Decoded profile hashes and all per-function event sums verify. Address-
sensitive cache/branch events differ even when instruction, data-read/write and
branch totals agree. Simulated first-level instruction misses per 32 callbacks:

| Case | Baseline | Extraction | Provider |
| --- | ---: | ---: | ---: |
'''
for r in sim:status+=f"| `{r['case']}` | "+' | '.join(str(r['simulated_events'][v]['I1mr']) for v in ['baseline','extraction','provider-control'])+' |\n'
status+='''
These events do not consistently explain real timing. For the parser, I1 misses
remain six and simulated conditional branch misses decrease from 370,371 to
362,085 / 365,636 while measured time increases. Offset and exact-import provider
controls also have fewer simulated I1 misses while taking longer. The pad case
has increased simulated I1 misses, but that does not uniquely identify the cause
of the hardware regression. The observer has different code generation from the
real benchmark. This record establishes neither a hardware cause nor a source
optimization justified by one. Do not turn this model into an acceptance waiver,
repeat arbitrary layout hints, or tune unrelated parser/geometry mathematics.

## Checks and restoration

The initial provider patch failed only on changed changelog context and made no
changes. Two accidentally launched builds consequently repeated extraction;
they are quarantined under preflight-mislabeled-builds and excluded from controls,
timing and profiles. The corrected implementation control was rebuilt and its
owner binary hash verified against the previous record before measurements.

Provider error fixtures pass both tests. The original extraction is restored and
passes three routing tests (fresh-process full reports and dispatch counts under
both policies), the axis migration test, workspace formatting and staged whitespace
checks. The isolated worktree is then restored clean at its baseline. All four
authoritative repositories match their starting HEAD/status/patch hashes, retaining
main's 41 staged paths and Interface's eight edits. All 31 prior frozen stages
verify unchanged. No new full Clippy/all-feature, downstream timing,
successive_operations, fuzz/sanitizer, WASM, packaging, HIL or pre-push campaign is
claimed. No push occurred. The unresolved extraction cost gate stays explicit;
further work needs a distinct supported hypothesis or another open plan task.
'''
(s/'STATUS.md').write_text(status)
print(json.dumps(summary,indent=2))
