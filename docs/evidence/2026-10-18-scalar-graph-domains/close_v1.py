"""Seal exact-leaf domain admission and preserve the broader ingress frontier."""
import ast, difflib, gzip, hashlib, json, os, re, shutil, statistics, subprocess, sys, tarfile
sys.dont_write_bytecode = True
from pathlib import Path
O = Path('/home/tim/Documents/GitHub/workspace/csgrs')
N = O.parent/'csgrs-properties-validation-2026-10-17-v2'
W = N/'certificate-ingress-control-v1'
V = Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
B = V/'certificate-ingress-validation-v1'
U = Path('/tmp/csgrs-certificate-ingress-20261018-v1')
X = B/'external-evidence'
P = O/'docs/evidence/2026-10-18-lazy-proof-replay'
E = O/'docs/evidence/2026-10-18-scalar-graph-domains'
BASE = '339e4b4393e6211930d3b6abdf69be3b002441c5'
sys.path.insert(0, str(W))
from certificate_ingress_runner_v1 import sha, resources, reasons
sys.path.insert(0, str(O/'docs/evidence/2026-10-17-resume-integration'))
from load_expectations_v2 import load
GIT = ['git', '-c', 'core.splitIndex=true', '-c', 'index.version=4', '-c', 'maintenance.auto=false', '-c', 'gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS'] = '0'
def git(*args): return subprocess.check_output(GIT+list(args), cwd=O)
def read(p): return json.loads(Path(p).read_text())
def dump(p, value):
    assert not p.exists(), p
    p.write_text(json.dumps(value, indent=2, sort_keys=True)+'\n')
def gzwrite(p, value):
    assert not p.exists(), p
    p.write_bytes(gzip.compress((json.dumps(value, sort_keys=True)+'\n').encode(), mtime=0))
def span(raw):
    start = re.search(rb'"current_work"\s*:\s*', raw).end()
    value, count = json.JSONDecoder().raw_decode(raw[start:].decode())
    return start, start+len(raw[start:].decode()[:count].encode()), value

assert git('rev-parse', 'HEAD').decode().strip() == BASE
assert not git('diff', '--cached', '--name-only') and not reasons(resources())
new = {'crates/hyperreal/tests/serde_graph_domains.rs'}
changed = {'crates/hyperreal/src/computable/node/representation.rs', 'crates/hypercurve/tests/svg_scalar_failures.rs'}
implementation = {p: sha(O/p) for p in new|changed}
assert set(git('diff', 'HEAD', '--name-only').decode().splitlines()) == changed
protected = 'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected) == '08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files', '--others', '--exclude-standard').decode().splitlines()) == new|{protected}
previous = read(P/'checkpoint-v1.json')
assert all(sha(O/p) == h for p, h in previous['evidence_files_sha256'].items())
assert all(sha(p) == h for p, h in previous['external_evidence_files_sha256'].items())
inherited = {p: h for p, h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in implementation}
assert all(sha(O/p) == h for p, h in inherited.items())
pins = json.loads(gzip.decompress((B/'source-pins-v5.json.gz').read_bytes()))
assert len(pins) == 2662 and all(sha(O/p) == h for p, h in pins.items())
receipt = read(V/'lazy-proof-final-v1/commit-verification-v1.json')
assert receipt['commit'] == BASE and receipt['verified_blob_count'] == 25
assert all(hashlib.sha256(git('show', 'HEAD:'+p)).hexdigest() == h for p, h in receipt['verified_committed_blobs_sha256'].items())
def result(phase): return read(B/('certificate-ingress-'+phase)/'result-v1.json')
baseline = result('domain-baseline-v3')
svg_baseline = result('svg-baseline-v1')
scalar = result('scalar-v4')
consumers = result('consumers-v4')
msrv = result('msrv-v3')
cost = result('cost-v3')
diagnostic = result('diagnostic-candidate-v3')
reconstruction = result('baseline-recovery-v3')
assert reconstruction['passed'] and reconstruction['all_reconstructed_binary_hashes_match_original_receipts']
for row in reconstruction['reconstructed_versions'].values():
    assert sha(row['physical_path']) == row['sha256']
assert baseline['expected_reproduction'] and baseline['valid_controls_passed'] == 2 and baseline['invalid_ingress_tests_failed'] == 2
assert baseline['test_sha256'] == implementation['crates/hyperreal/tests/serde_graph_domains.rs']
assert svg_baseline['expected_reproduction'] and svg_baseline['test_sha256'] == implementation['crates/hypercurve/tests/svg_scalar_failures.rs']
assert all(r['passed'] for r in [scalar, consumers, msrv, cost])
assert scalar['packages']['default']['parent_tests_passed'] == 934
assert scalar['packages']['all']['parent_tests_passed'] == 1066
assert scalar['summaries']['debug-library'] == [['ok', '817', '0', '0', '0', '0']]
assert consumers['packages']['hyperlimit']['passed'] == 366 and consumers['packages']['hypercircuit']['passed'] == 60
assert consumers['curve_tests'] == {'hypercurve_svg': [['ok','20','0','0','0','0']], 'svg_scalar_failures': [['ok','2','0','0','0','0']]}
assert cost['completed_outputs_and_layout_preserved']
assert len(diagnostic['observations']) == 32
for label, observation in diagnostic['observations'].items():
    if label.startswith('opaque-'):
        assert observation['stdout'].count('rejected\tParseError') == 2 and not observation['stderr'], label
    else:
        assert observation['stdout'].count('\taccepted') == 2, label
for manifest in sorted((U/'frozen').glob('*/executables-v1.json')):
    assert all(sha(row['copy']) == row['sha256'] for row in read(manifest).values())
registry = json.loads(gzip.decompress((N/'lazy-proof-control-v1/registry-inputs-v1.json.gz').read_bytes()))
assert len(registry) == 48478 and all(sha(p) == h for p, h in registry.items())
commands = {}
for folder in sorted((B/'logs').iterdir()):
    r = read(folder/'result.json')
    assert r['output_closed'] and not r['stops'], folder
    assert all(sha(folder/p) == h for p, h in r['output_sha256'].items())
    commands[folder.name] = r
failures = {k for k, r in commands.items() if r['exit_code']}
expected_failures = {
    'certificate-ingress-domain-baseline-v1-run',
    'certificate-ingress-domain-baseline-v2-run',
    'certificate-ingress-domain-baseline-v3-run',
    'certificate-ingress-scalar-v3-all-clippy',
    'certificate-ingress-svg-baseline-v1-run',
    'certificate-ingress-baseline-recovery-v1-v1-compile',
    'certificate-ingress-baseline-recovery-v2-v1-compile',
    'certificate-ingress-baseline-recovery-v3-v1-run',
    'certificate-ingress-baseline-recovery-v3-v2-run',
    'certificate-ingress-scalar-v2-all-test-22-hyperreal',
}
assert failures == expected_failures, failures
assert all(commands[k]['exit_code'] == (1 if k in {'certificate-ingress-baseline-recovery-v1-v1-compile', 'certificate-ingress-baseline-recovery-v2-v1-compile'} else 101) for k in failures)
print('Verified final-source checks, parent reproductions and every command output.', flush=True)
prior, missing = load(O/previous['artifact_expectations'], allow_unqualified=True)
assert (len(prior), len(missing)) == (1520934, 921794)
roots = [U, W, B, V/'lazy-proof-final-v1']
for pattern in ['prepare-certificate-ingress-*.py', 'certificate-ingress-*.py', 'certificate-ingress-*.rs', 'certificate-ingress-*.md', 'close-certificate-ingress-*.py', 'stage-certificate-ingress-*.py', 'verify-certificate-ingress-*.py']:
    roots += sorted(Path('/tmp').glob(pattern))
roots = sorted(set(roots))
selected = []
for root in roots:
    assert root.exists(), root
    selected.extend([root] if root.is_file() else (p for p in sorted(root.rglob('*')) if (p.is_file() or p.is_symlink()) and not p.is_relative_to(X)))
assert len(selected) == len(set(selected))
physical, states, members, excluded = {}, {}, {}, {}
for p in selected:
    assert p.is_file() and not p.is_symlink(), p
    before = p.stat()
    digest = sha(p)
    after = p.stat()
    state = (after.st_size, after.st_mtime_ns, after.st_ctime_ns)
    assert state == (before.st_size, before.st_mtime_ns, before.st_ctime_ns) and str(p) not in prior, p
    physical[str(p)] = digest
    states[str(p)] = state
    with p.open('rb') as f: magic = f.read(8)
    generated = any(p.is_relative_to(U/name) for name in ['target', 'target-msrv-v3'])
    compiled = magic.startswith(b'\x7fELF') or magic == b'!<arch>\n'
    if p.is_relative_to(V): name = 'disk-b/'+str(p.relative_to(V))
    elif p.is_relative_to(N): name = str(p.relative_to(N))
    else: name = 'temporary/'+str(p.relative_to('/tmp'))
    row = {'physical_path': str(p), 'sha256': digest, 'bytes': after.st_size}
    if generated or compiled:
        row['archive_exclusion_reason'] = 'Generated Cargo output' if generated else 'Compiled binary or library'
        excluded[name] = row
    else: members[name] = row
print(json.dumps({'new_paths_hashed_independently': len(physical), 'archive_members': len(members), 'compiled_or_generated_retained': len(excluded)}), flush=True)
assert not X.exists()
X.mkdir()
archive = X/'raw-evidence-v1.tar.gz'
with tarfile.open(archive, 'w:gz', dereference=True) as tf:
    for name, row in members.items(): tf.add(row['physical_path'], arcname=name, recursive=False)
with tarfile.open(archive, 'r:gz') as tf:
    assert set(tf.getnames()) == set(members)
    for name, row in members.items():
        with tf.extractfile(name) as f: assert hashlib.file_digest(f, 'sha256').hexdigest() == row['sha256']
gzwrite(X/'archive-members-v1.json.gz', {'members': members, 'excluded_generated_and_compiled_artifacts_physically_preserved': excluded, 'every_path_hashed_independently': True, 'all_archive_members_verified': True, 'archive_sha256': sha(archive)})
expectations = X/'artifact-expectations-v1.json.gz'
gzwrite(expectations, {'schema_version': 3, 'kind': 'exact-leaf scalar graph domain rejection', 'parent_expectations': previous['artifact_expectations'], 'parent_expectations_sha256': previous['artifact_expectations_sha256'], 'added_physical_artifacts_sha256': physical, 'expected_artifact_paths': len(prior)+len(physical), 'inherited_expected_artifact_paths': len(prior), 'last_observed_missing_artifact_paths': len(missing), 'new_physical_artifacts_verified': len(physical), 'complete_artifact_audit_passed': False, 'historical_preservation_complete': False, 'old_history_reaudited': False, 'temporary_artifacts_volatile': True, 'required_loader': 'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded, unavailable = load(expectations, allow_unqualified=True)
assert loaded == prior|physical and unavailable == missing
dump(X/'command-results-v1.json', commands)
assert not E.exists()
E.mkdir()
external = {str(p): sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json', {'files_sha256': external, 'reason': 'Keep raw evidence and large maps on approved Disk B while preserving the root ceiling.', 'archive_bytes': archive.stat().st_size, 'archive_members': len(members), 'path_count': len(physical), 'content_verified': True, 'portable_distribution_evidence': False, 'original_storage_baselines_unchanged': True})
ratios = {}
for name in cost['samples']['baseline-0']:
    a = [cost['samples']['baseline-'+str(i)][name]['nanoseconds'] for i in range(5)]
    b = [cost['samples']['candidate-'+str(i)][name]['nanoseconds'] for i in range(5)]
    ratios[name] = {'baseline_nanoseconds': a, 'candidate_nanoseconds': b, 'ratio_of_medians': statistics.median(b)/statistics.median(a), 'baseline_complete_row': cost['samples']['baseline-0'][name], 'candidate_complete_row': cost['samples']['candidate-0'][name]}
review = {
    'decision': 'Retain exact-rational domain rejection during native graph decoding.',
    'source_parent_revision': BASE,
    'owner': 'Hyperreal Computable Node deserialization, before a decoded child can enter a parent expression.',
    'properties': ['P1','P2','P3','P4','P5','P6','P18','P19','P20','P26','P27','P35','P36','P37','P39'],
    'input_domain': 'Serialized Computable partial-function nodes with exact One/Int/Ratio operands or stored rational arguments; JSON/CBOR, native and Real wrappers, nested expressions, outer scales and SVG exact-coordinate interchange.',
    'proof': 'Exact rational comparisons establish out-of-domain inputs without approximation: reciprocal/cotangent zero; negative positive-root carrier input; ln(1+x) residual <= -1; inverse-trig/hyperbolic boundaries; zero IntegralAtan denominator; rational quantile p outside (0,1). Child decoding finishes before the parent is published.',
    'representation': 'No public signature, wire schema, expression or object-layout change. Valid opaque operands remain accepted when no exact leaf proof is available. This guard rejects demonstrably invalid inputs; it does not certify arbitrary imported graphs.',
    'acceptance_scope': {'invalid_native_cases': 44, 'native_formats': ['JSON','CBOR'], 'nested_forms': ['direct','zero product','addition','square'], 'outer_scales': [0,1,-3], 'public_failures': ['Problem::ParseError','SVG MalformedInput with ParseError detail'], 'valid_controls': ['ordinary roots, logs and inverse functions','inverse-trig endpoints','defined opaque operands','full negative and large public log1p residuals','native logarithm residual zero and both signs'], 'valid_serialized_values_preserved': True},
    'probe_reconstruction': reconstruction,
    'baseline': {'native_invalid_tests_failed': 2, 'valid_tests_passed': 2, 'svg_existing_test_passed': 1, 'svg_new_test_failed': 1, 'current_revision_diagnostic_cases': 32},
    'final_source_scalar': scalar['packages'],
    'debug_units_passed': 817,
    'consumers': consumers['packages'],
    'curve_tests': consumers['curve_tests'],
    'consumer_features': consumers['feature_gate_matrix'],
    'compiler_floor': {'packages': ['hyperreal','hyperlimit','hypercurve'], 'compiler': msrv['compiler'], 'features': msrv['features'], 'all_targets': True, 'runtime_tests_rerun': False, 'clippy_on_msrv_run': False},
    'strict_clippy_passed': ['Hyperreal default/all features all targets','Hyperlimit all features all targets','Hypercurve SVG all targets','Hypercircuit interchange all targets','Hypercircuit geometry/all curved_outline'],
    'docs_passed': ['Hyperreal all features','Hyperlimit all features','Hypercurve SVG','Hypercircuit interchange'],
    'format_passed': True,
    'cost_scope': cost['scope'],
    'cost_controls': ratios,
    'cost_layout_bytes': 48,
    'binary_bytes': {k: v['bytes'] for k, v in cost['binaries'].items()},
    'general_speedup_claimed': False,
    'cost_interpretation': 'Functional failure-boundary repair. Compare the same completed valid imports, with structural sign checking and object destruction. Report all latency, allocation and peak differences; no error-fast-path or general speedup claim. Timed imports use the protocol-recorded one-query warmup and identical input construction outside timing.',
    'resource_contract': {'root_gib':16,'disk_b_gib':72,'tmp_gib':40,'logs_mib':96,'original_baselines_unchanged':True,'child_address_space_gib':8,'jobs':2,'focused_seconds':60,'compile_full_seconds':1800},
    'resource_limits': 'The new guard performs a variant dispatch and exact leaf comparisons, without refinement, expression expansion or recursive proof search. Arbitrary coefficient length, import depth, total import work and graph domain validity are not internally bounded by this change; tests run under external containment.',
    'adverse_results': ['Two open-phase baseline probe versions reused one executable pathname. Sources and outputs were retained; both binaries were reconstructed at fresh paths and matched their original execution SHA-256 exactly, then replayed the expected failures. Two attempted nested namespaces failed before rustc launch because uid-map setup encountered the read-only proc mount; the existing single namespace succeeded. No closed artifact was changed, and physical continuity is not claimed for those two open-phase binaries.','Strict Clippy rejected the new test using unwrap_err after is_ok. Equivalent match destructuring preserves every assertion; all affected checks repeat after the final edit.','Initial diagnostic setup assumed one serde_json library in the retained target; no command launched. The corrected selector uses the recorded all-feature build artifacts.', 'The first candidate confused ln(1+x) residuals with ln inputs. The unchanged all-feature log1p serialization regression caught the rejection of valid inputs. The rejected source, original incorrectly classified zero cases, failing output and oracle correction are retained. Zero is now explicitly required to succeed; existing tests and full-scale residuals remain unchanged.', 'The original pre-rustfmt baseline test source was reconstructed by reversing only whitespace changes and verified against its pre/post-execution SHA-256 before retention. Final baseline tests were copied before execution.'],
    'remaining_limitations': ['Eleven named-certificate/payload diagnostic forms still decode; their contradictions and panics remain reproduced and unadmitted.', 'Non-leaf domain obligations, private series ranges and quantile seed validation remain open. No arbitrary graph admission claim.', 'Unchecked native constructors retain their documented caller domain obligations.', 'Automatic reciprocal equality, full strict native workloads, bindings, release/distribution and complete pre-push validation remain open.', 'The boxed cache stays rejected and affine subtraction stays withheld.', 'Raw archives require the recorded Disk B retention location; old missing artifacts were neither reaudited nor recovered.'],
    'command_records_verified': len(commands),
    'source_paths_verified': len(pins),
    'registry_paths_verified': len(registry),
    'new_runtime_admitted': True,
    'admitted_scope': 'Known exact-rational domain failures are rejected before native/Real/collection/SVG import success; original valid representations and tested compositions remain supported.',
    'full_plan_complete': False,
    'public_distribution_complete': False,
    'hypervoxel_deferred_by_user': True,
    'all_adverse_results_retained': True,
    'next': 'Enforce named Class parameter and payload consistency, then remaining graph domain obligations, before reconsidering affine cancellation; continue strict workloads and distribution acceptance.',
}
dump(E/'review-v1.json', review)
dump(E/'command-summary-v1.json', {name: {key:r[key] for key in ['exit_code','elapsed_seconds','stops']} for name,r in commands.items()})
for src, name in [(W/'contract-v1.md','contract-v1.md'),(W/'domain-scope-v1.md','domain-scope-v1.md'),(B/'logarithm-domain-correction-v1.md','logarithm-domain-correction-v1.md'),(W/'tmp-contract-v3.json','tmp-contract-v3.json'),(B/'source-pins-v5.json.gz','source-pins-v1.json.gz'),(Path(__file__),'close_v1.py')]:
    shutil.copy2(src, E/name)
patch = []
for path in sorted(implementation):
    before = '' if path in new else git('show','HEAD:'+path).decode()
    patch.extend(difflib.unified_diff(before.splitlines(True),(O/path).read_text().splitlines(True),fromfile='a/'+path,tofile='b/'+path))
(E/'implementation.patch').write_text(''.join(patch))
cost_lines = []
for name, row in ratios.items():
    base, candidate = row['baseline_complete_row'], row['candidate_complete_row']
    cost_lines.append(f"| {name} | {row['ratio_of_medians']:.4f} | {base['allocations']} / {candidate['allocations']} | {base['peak_extra_bytes']} / {candidate['peak_extra_bytes']} |")
readme = '''# Reject known undefined scalar graphs on import

Native Node decoding now rejects exact rational arguments outside the real
domain of the stored partial function. Children decode before their parents,
so zero products and outer scales cannot conceal a rejected child. The public
Real wrappers return ParseError, and SVG exact-coordinate import preserves a
typed MalformedInput diagnostic before publishing a path.

The final regression covers 44 invalid native forms in JSON and CBOR, direct
and nested graphs, three outer scales, enclosing collections and SVG import.
Valid representations retain their bytes, values and downstream composition.
Independent bounds and domain facts supplement wrapper agreement. The original
parent reproductions, first rejected logarithm guard and all failures remain.
Two open-phase probe binaries were reconstructed after a filename collision;
both match their original execution hashes exactly. Their sources, outputs
and reconstruction receipts are retained, without a physical-continuity claim.
The existing log1p regression caught an incorrect ln-versus-ln1p assumption;
the correction preserves zero and negative residuals above -1, with additional
success tests. No existing valid-input test or full-scale case was weakened.

Final-source checks passed: 934 default and 1,066 all-feature scalar tests,
817 debug units, 24/29 scalar doctests, 366 predicate tests, 22 SVG tests,
60 circuit interchange tests and the recorded geometry/all-feature circuit
targets. Selected strict Clippy, docs and formatting pass. Rust 1.95 checks
cover all targets of Hyperreal, Hyperlimit and Hypercurve with all features
and no default features; no runtime or Clippy run on Rust 1.95 is claimed.

The matched cost controls below each complete 100,000 valid imports, inspect
sign, consume and destroy the value. They use five alternating pairs with
allocator instrumentation; construction and round-trip byte checks are outside
timing. Ratios are candidate/parent medians, and all samples remain available.
This functional repair makes no general speedup claim. Layout remains 48 bytes
and all timed rows retain zero additional live bytes after completion.

| Import | Time ratio | Allocations parent / candidate | Peak bytes parent / candidate |
| --- | ---: | ---: | ---: |
'''+ '\n'.join(cost_lines)+f'''

Probe executable bytes: parent {cost['binaries']['baseline']['bytes']:,},
candidate {cost['binaries']['candidate']['bytes']:,}. Unfavorable rows are retained.

Raw logs and protocols are archived on Disk B, with their exact paths and hashes
in external-evidence-v1.json. Every selected physical path is hashed separately;
compiled outputs remain retained. Original root/Disk B/tmp limits remain
16/72/40 GiB, and cumulative logs remain limited to 96 MiB. No baseline reset,
old artifact deletion or historical recovery is claimed.

This is a known-domain rejection step. Named certificate parameters and payload
consistency, non-leaf domain obligations, series-range and quantile seed checks
remain open. The 32-case diagnostic explicitly retains those unrepaired named
certificate findings. Full strict workloads, bindings and shipped distribution
remain open; affine cancellation stays withheld. Hypervoxel is excluded.
No push or completion of the complete properties plan is claimed.
'''
(E/'README.md').write_text(readme)
prefix = str(E.relative_to(O))+'/'
ledger = O/'docs/properties-status.json'
raw = ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest() == previous['ledger_after_sha256']
reference = git('show','9025de62:docs/properties-status.json')
start, end, current = span(raw)
rs, re_, _ = span(reference)
assert (raw[:start], raw[end:]) == (reference[:rs], reference[re_:])
assert 'scalar_graph_rational_domains' not in current
current['updated_on'] = '2026-10-18'
current['scalar_graph_rational_domains'] = {'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':str(expectations),'scalar_cargo':scalar['packages'],'debug_units_passed':817,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'compiler_floor':review['compiler_floor'],'runtime_admitted':True,'admitted_scope':review['admitted_scope'],'remaining_limitations':review['remaining_limitations'],'explicit_subtraction_candidate_admitted':False,'lazy_cache_candidate_admitted':False,'storage_baselines_reset':False,'disk_b_allowance_gib':72,'tmp_allowance_gib':40,'all_adverse_results_retained':True,'general_speedup_claimed':False,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'next':review['next']}
updated = raw[:start]+json.dumps(current, indent=2).encode()+raw[end:]
us, ue, _ = span(updated)
assert (updated[:us], updated[ue:]) == (reference[:rs], reference[re_:])
ledger.write_bytes(updated)
for p in E.iterdir():
    if p.suffix in {'.md','.py','.json'}:
        value = p.read_text()
        assert all(line == line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'), p
        if p.suffix == '.py': ast.parse(value)
with (E/'whitespace.stdout').open('wb') as out, (E/'whitespace.stderr').open('wb') as err:
    checked = subprocess.run(GIT+['diff','--check'], cwd=O, stdout=out, stderr=err)
assert checked.returncode == 0
record = {'status':review['decision'],'checkpoint_kind':'exact-leaf scalar graph domain admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':sum(prior.get(p)==h for p,h in registry.items()),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':implementation,'restored_native_sha256':{p:h for p,h in previous['restored_native_sha256'].items() if p not in implementation},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'production_rust_sources_unchanged':False,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'explicit_subtraction_candidate_admitted':False,'lazy_cache_candidate_admitted':False,'required_opaque_payload_admitted':True,'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':25,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':40,'disk_b_allowance_gib':72,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json', record)
for p, state in states.items():
    st = Path(p).stat()
    assert (st.st_size, st.st_mtime_ns, st.st_ctime_ns) == state, p
assert all(sha(O/p) == h for p, h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':True,'full_plan_complete':False}), flush=True)
