from pathlib import Path
import subprocess,json,hashlib,re,os
s=Path('/tmp/interval-refactor/dyadic-quotient-sharing');r=Path('/mnt/development/csgrs')
b=json.loads((s/'BASELINE.json').read_text());source=json.loads((s/'SOURCE.json').read_text())
checks=json.loads((s/'checks.json').read_text());main=json.loads((s/'main-checks.json').read_text());assert len(checks)==len(main)==5 and all(x['returncode']==0 for x in checks+main)
assert 'test result: ok. 3 passed; 0 failed;' in (s/'main-focused.log').read_text()
restoration=json.loads((s/'production-restoration.json').read_text());assert restoration['owner_passed_reports']==229 and restoration['all_production_bodies_byte_identical']
assert json.loads((s/'pinned-restoration.json').read_text())['byte_identical_to_baseline']
assert json.loads((s/'external-restoration.json').read_text())['byte_identical_to_baseline']
for name in ['baseline-focused','candidate-focused','magnitude-focused']:assert 'test result: ok. 2 passed; 0 failed;' in (s/(name+'.log')).read_text()
allocations={}
for prefix in ['external','pinned']:
 base=[line.split('\t') for line in (s/(prefix+'-baseline-transcript.tsv')).read_text().splitlines()]
 candidate=[line.split('\t') for line in (s/(prefix+'-magnitude-transcript.tsv')).read_text().splitlines()]
 assert len(base)==len(candidate)==15
 rows=[]
 for a,c in zip(base,candidate):
  assert a[:2]==c[:2] and a[3:5]==c[3:5] and a[7:]==c[7:]
  assert int(c[5])<=int(a[5]) and int(c[6])<=int(a[6])
  rows.append({'case':a[1],'canonical_output_and_domain_match':True,'work_match':True,'baseline_allocations':int(a[5]),'candidate_allocations':int(c[5]),'baseline_requested_bytes':int(a[6]),'candidate_requested_bytes':int(c[6])})
 allocations[prefix]=rows
(s/'output-allocation-comparison.json').write_text(json.dumps(allocations,indent=2)+'\n')
states={}
for name,old in b.items():
 def g(*a):return subprocess.check_output(['git','-C',old['path'],*a])
 row={'path':old['path'],'head':g('rev-parse','HEAD').decode().strip(),'status':g('status','--porcelain').decode(),'staged_sha256':hashlib.sha256(g('diff','--cached','--binary')).hexdigest(),'unstaged_sha256':hashlib.sha256(g('diff','--binary')).hexdigest()}
 assert row==(old|{'head':source['commit']} if name=='csgrs' else old),name
 states[name]=row
assert not subprocess.check_output(['git','status','--porcelain'],cwd='/mnt/development/csgrs-dyadic-quotient-sharing')
prior=json.loads((s/'prior-frozen-check.json').read_text());assert len(prior)==51 and all(x['matched'] for x in prior)
original=subprocess.check_output(['git','show',source['parent']+':crates/hyperinterval/src/dyadic.rs'],cwd=r)
assert (r/'crates/hyperinterval/src/dyadic.rs').read_bytes()==original+restoration['only_added_source_text'].encode()
(s/'INTEGRATED-REPOSITORIES.json').write_text(json.dumps(states,indent=2)+'\n')
q={'disposition':'rejected production refactor; retained independent acceptance tests','source_commit':source['commit'],'candidate_algorithms':2,'dependency_locks':2,'production_bodies_changed':False,'independent_small_integer_cases':11390,'large_limb_cases':880,'owner_passed_reports':229,'owner_harness_summaries':42,'owner_ignored_reports':0,'new_focused_tests':3,'integrated_checks':5,'all_feature_all_target_clippy':True,'default_feature_test_run':True,'restored_native_artifacts_byte_identical':2,'prior_frozen_records_unchanged':51,'pending_paths_preserved_byte_for_byte':41,'completed_timing_campaign':False,'downstream_successive_operations_run':False,'new_fuzz_or_coverage_campaign':False,'full_pre_push_matrix':False,'push_or_publication':False}
(s/'QUALIFICATION.json').write_text(json.dumps(q,indent=2)+'\n')
(s/'COMMANDS.json').write_text(json.dumps({'isolated_checks':checks,'main_checks':main,'focused_candidate_command':['cargo','+1.95.0','test','--locked','-p','hyperinterval','--features','dyadic','--lib','quotient_tests'],'focused_candidate_logs':['baseline-focused.log','candidate-focused.log','magnitude-focused.log'],'release_build':'cargo +1.95.0 build --release --manifest-path /tmp/interval-refactor/dyadic-quotient-sharing/probe/Cargo.toml; --locked after each lock resolution; source snapshots and both resolved locks retained','probe_runs':'each saved native binary receives argument witness, producing the named transcript; these are single completed-output probes, not paired statistical timing qualification','target_directories':{'owner':'/mnt/development/.interval-refactor-build/dyadic-quotient-sharing','probe':'/mnt/development/.interval-refactor-build/dyadic-quotient-probe'},'environment':{'CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true',**{k:os.environ.get(k) for k in ['RUSTFLAGS','CARGO_ENCODED_RUSTFLAGS','CARGO_INCREMENTAL','CARGO_PROFILE_RELEASE_LTO','CARGO_PROFILE_RELEASE_CODEGEN_UNITS']}},'rustc':subprocess.check_output(['rustc','+1.95.0','-vV'],text=True)},indent=2)+'\n')
(s/'STATUS.md').write_text(f'''# Dyadic quotient sharing rejected; independent regressions retained

Source {source['commit']} retains three private-kernel acceptance tests and a
scoped performance disposition. No production arithmetic is changed. The only
addition to dyadic.rs is cfg(test) inclusion of the new test module. Original
production bodies are byte-identical; both restored release probe executables
are byte-identical to their corresponding baselines.

Two single-division implementations were tested after baseline witnesses passed.
The first used signed truncating quotient/remainder, then corrected one endpoint.
The second kept unsigned magnitudes until constructing directed outputs, following
the backend's existing floor/ceiling method. Both pass the frozen differential
result/error/work corpus and independent small integer controls. The initial test
harness needed explicit BigInt type annotations; its compiler diagnostic is kept.
No numerical counterexample was found in this finite corpus.

The signed candidate grows native size by 432 bytes under the workspace-derived
lock (num-bigint 0.4.6), and by 1,008 under the external resolution (0.4.8). The
magnitude candidate shrinks the pinned executable by 1,224 bytes and function
address union by 446, but grows the external executable by 104 bytes and function
address union by 254. Both algorithms therefore fail the unchanged refactoring
gates across the demonstrated dependency contracts. No dependency range or size
criterion is narrowed to accept the favorable pinned result.

Fifteen completed public-operation probes per lock cover signed/large/exact
quotients, rational conversion, roots, exp/log/atan/sin/cos/tan, rational powers
and split division. The magnitude candidate matches exact serialized output,
domain qualification and remaining work in all of them; allocation requests do
not increase. These single probes are not a completed timing campaign, owner
benchmark matrix, cross-policy solver report or downstream successive_operations
qualification. Those later cost gates were not run after decisive size rejection.
All favorable and adverse artifacts/sources/locks are retained without binaries.

The permanent tests use 11,390 small signed integer cases and 880 large-limb
multiplication inequalities, exact resource thresholds and error precedence,
huge-shift refusal before allocation, retry, and a zero Real-dispatch assertion.
The frozen duplicated legacy implementation stays only in this evidence stage,
not production or permanent tests. Full owner all-feature tests/doctests report
229 passes in 42 summaries, zero ignored. Strict all-target/all-feature Clippy,
no-default-feature tests, formatting and diffs pass. Main focused tests report
three passes; formatting, staged/unstaged diffs and retention budget also pass.
No new fuzz, coverage, platform, MCU or whole-application cost claim is made.

All 41 pending extraction paths retain their exact original patch. Interface's
eight pending paths and firmware remain unchanged. All 51 prior frozen records
verify unchanged. The whole interval plan remains active: this evidence rejects
one optimization boundary and strengthens future acceptance, but does not complete
scalar migration, downstream integration, performance or release requirements.
No push or publication occurred.
''')
print('rejection, independent regression qualification and restoration evidence recorded')
