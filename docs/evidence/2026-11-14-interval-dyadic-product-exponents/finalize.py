from pathlib import Path
import subprocess,json,hashlib,re
s=Path('/tmp/interval-refactor/dyadic-product-exponents');r=Path('/mnt/development/csgrs')
base=json.loads((s/'BASELINE.json').read_text());source=json.loads((s/'SOURCE.json').read_text());proof=json.loads((s/'integration-proof.json').read_text())
checks=json.loads((s/'checks.json').read_text());main=json.loads((s/'main-checks.json').read_text())
assert len(checks)==9 and len(main)==7 and all(x['returncode']==0 for x in checks+main)
counts={}
for name in ['owner','lattice','solve','main-owner','main-lattice','main-solve']:
 rows=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;', (s/(name+'.log')).read_text())
 assert rows and all(int(x[1])==0 and int(x[2])==0 for x in rows)
 counts[name]={'passed_reports':sum(int(x[0]) for x in rows),'summaries':len(rows),'ignored_reports':sum(int(x[2]) for x in rows)}
assert counts['owner']['passed_reports']==226 and counts['lattice']['passed_reports']==90 and counts['solve']['passed_reports']==1520
assert counts['main-owner']['passed_reports']==18 and counts['main-lattice']['passed_reports']==1 and counts['main-solve']['passed_reports']==9
assert '2 failed' in (s/'baseline-failures.log').read_text()
assert 'two canonical products replayed and consumed' in (s/'fresh-process-replay.log').read_text()
states={}
for name,old in base.items():
 def git(*a):return subprocess.check_output(['git','-C',old['path'],*a])
 row={'path':old['path'],'head':git('rev-parse','HEAD').decode().strip(),'status':git('status','--porcelain').decode(),'staged_sha256':hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),'unstaged_sha256':hashlib.sha256(git('diff','--binary')).hexdigest()}
 expected=old|{'head':source['commit'],'staged_sha256':proof['preserved_pending_sha256']} if name=='csgrs' else old
 assert row==expected,name
 states[name]=row
for path,digest in json.loads((s/'qualified-source-hashes.json').read_text()).items():
 data=subprocess.check_output(['git','show','HEAD:'+path],cwd=r) if path=='Cargo.lock' else (r/path).read_bytes()
 assert hashlib.sha256(data).hexdigest()==digest,path
(s/'integrated-lockfile-scope.json').write_text(json.dumps({'isolated_and_committed_lock_sha256':hashlib.sha256(subprocess.check_output(['git','show','HEAD:Cargo.lock'],cwd=r)).hexdigest(),'integrated_pending_lock_sha256':hashlib.sha256((r/'Cargo.lock').read_bytes()).hexdigest(),'pending_lock_preservation_proved_by_original_tree_inverse':True},indent=2)+'\n')
assert not subprocess.check_output(['git','status','--porcelain'],cwd='/mnt/development/csgrs-dyadic-product-exponents')
prior=json.loads((s/'prior-frozen-check.json').read_text());assert len(prior)==50 and all(x['matched'] for x in prior)
(s/'INTEGRATED-REPOSITORIES.json').write_text(json.dumps(states,indent=2)+'\n')
cost=json.loads((s/'cost-summary.json').read_text())
q={'disposition':'retained capability extension','source_commit':source['commit'],'baseline_reproduced_failures':2,'independent_boundary_interval_pairs':12150,'boundary_operand_orders_per_pair':2,'ordinary_integer_pairs_and_scales':6075,'test_counts':counts,'strict_all_feature_all_target_clippy':True,'native_no_std_check':True,'wasm32_no_std_check':True,'strict_rustdoc':True,'fresh_process_replay_cases':2,'prior_frozen_records_unchanged':50,'preserved_pending_paths':41,'pending_patch_changed_only_blob_ids':True,'native_executable_delta_bytes':cost['binaries']['candidate']['bytes']-cost['binaries']['baseline']['bytes'],'cost_cases':{k:v for k,v in cost.items() if k not in ['environment','binaries']},'policy_dispatch':'native dyadic arithmetic has no policy; added zero Real-dispatch assertion','format_and_api_names_changed':False,'firmware_hot_path_changed':False,'full_pre_push_matrix':False,'push_or_publication':False}
(s/'QUALIFICATION.json').write_text(json.dumps(q,indent=2)+'\n')
(s/'COMMANDS.json').write_text(json.dumps({'isolated_checks':checks,'integrated_checks':main,'baseline_witness':{'command':'cargo +1.95.0 test --locked -p hyperinterval --features dyadic --test dyadic_product_exponents','returncode':101,'log':'baseline-failures.log','source':'baseline-witness.rs'},'focused_before_dispatch_test':{'command':'cargo +1.95.0 test --locked -p hyperinterval --features dyadic,serde --test dyadic_product_exponents --test dyadic','returncode':0,'log':'focused.log'},'probe_builds':'cargo +1.95.0 build --release --manifest-path /tmp/interval-refactor/dyadic-product-exponents/probe/Cargo.toml; dependency path changed from baseline main to isolated candidate between builds','probe_runs':'24 samples per binary; alternating baseline-native/candidate-native whole processes; argument is sample number','fresh_replay':'replay generate writes replay.json, a second replay process reads its stdin','environment':{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/dyadic-product-exponents','probe_target_dir':'/mnt/development/.interval-refactor-build/dyadic-product-probe','CARGO_BUILD_JOBS':'4 for workspace qualification','CARGO_NET_OFFLINE':'true'},'rustc':subprocess.check_output(['rustc','+1.95.0','-vV'],text=True)},indent=2)+'\n')
(s/'STATUS.md').write_text(f'''# Dyadic multiplication: representable exponent extremes retained

Source {source['commit']}. This is a capability extension, not a behavior-preserving
refactor or performance improvement. Two exact-success witnesses fail with Overflow
on unchanged baseline a7ea9382f. Multiplication now uses the existing square/power
normalizer only when checked exponent addition fails. The ordinary branch retains
its endpoint construction, four products, sign/predicate order and budget charge.

The exact interval product is the hull of four bilinear corner products. A common
exponent below MIN is representable exactly when both extrema have enough factors
of two; an exponent above MAX can be shifted into unbounded mantissas subject to
resource admission. No huge rational coordinates or float conversion are needed.
The existing upper-boundary hard case remains with its newly supported exact
expectation; a genuinely unrepresentable odd lower endpoint remains Overflow.
Migration documentation explicitly records the changed failure precedence and
possible SizeExhausted/WorkExhausted outcomes before representability is decided.

Independent integer expectations cover 12,150 boundary interval pairs in both
operand orders, plus 6,075 ordinary pairs/scales with exact work assertions. Tests
exercise precise normalization admission thresholds, genuine overflow, huge growth
rejection, retry, empty/zero identities, generated composition, canonical serde and
zero Real-dispatch counts. Two results survive fresh-process replay and subsequent
operations. New downstream tests exercise ExpressionProgram and vector dot/scale.
The full owner reports 226 passes in 42 summaries, Hyperlattice 90 in 24, and
Hypersolve 1,520 in 63, with no ignored reports. These counts are not universal
closure proofs. Strict all-feature/all-target Clippy for all three crates, native
and WASM no_std checks, strict owner rustdoc and formatting pass. Main integration
rechecks the affected tests (28 reported passes), formatting, diffs and budget.
Full isolated checks use the committed lockfile; main focused checks include the
preserved pending extraction lockfile. Both lockfile hashes are recorded.

The matched external native probe covers five ordinary completed workloads with
24 alternating samples each. Exact output, serialization, work accounting and
allocation requests agree. Observed median ratios are 1.0045–1.0295; the executable
grows 2,568 bytes and the mul symbol 81 bytes. This bounded measured cost buys new
exact support; no speed, whole-application, peak-memory, MCU or WASM cost claim is
made. See cost-contract.md for lockfile, workload and shared-host limitations.
No firmware hot path changes. No new cancellation or total-instruction bound is
claimed; DyadicBudget retains its explicit deterministic accounting contract.

Integration proves that applying the source inverse exactly recovers the original
pending tree, and that applying the original pending patch to the new source gives
the combined index. All 41 pending paths are preserved; migration overlap changes
only blob identifiers in that patch. Interface's eight pending paths and firmware
remain untouched. All 50 prior frozen stages verify unchanged. The broad interval
plan, staged dynamics acceptance, remaining migrations, platform/HIL and release
obligations remain open. No full pre-push matrix, push or publication occurred.
''')
print('qualification, coverage limits, cost and preservation evidence recorded')
