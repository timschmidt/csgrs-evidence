"""Seal the final named certificate repair after all declared checks pass."""
import ast, difflib, gzip, hashlib, json, os, re, shutil, statistics, subprocess, sys, tarfile
sys.dont_write_bytecode = True
from pathlib import Path
O = Path('/home/tim/Documents/GitHub/workspace/csgrs')
N = O.parent/'csgrs-properties-validation-2026-10-17-v2'
V = Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
W = N/'named-admission-control-v1'
B = V/'named-admission-validation-v1'
U = Path('/tmp/csgrs-named-admission-20261018-v1')
D = N/'named-admission-target-v1'
X = B/'external-evidence'
P = O/'docs/evidence/2026-10-18-named-certificate-audit'
E = O/'docs/evidence/2026-10-18-named-certificate-admission'
BASE = '6d88cb518bac7e83e8aa8d3ccb5ae3ad85718884'
sys.path.insert(0, str(W))
from named_admission_runner_v2 import sha, resources, reasons
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
def result(phase): return read(B/('named-admission-'+phase)/'result-v1.json')

assert git('rev-parse', 'HEAD').decode().strip() == BASE
assert not git('diff', '--cached', '--name-only') and not reasons(resources())
new = {'crates/hyperreal/tests/serde_named_certificates.rs', 'tests/scalar_certificate_failures.rs'}
paths = set(read(B/'final-candidate-v4.json')['candidate_paths'])
assert len(paths) == 16
implementation = {p: sha(O/p) for p in paths}
assert set(git('diff', 'HEAD', '--name-only').decode().splitlines()) == paths-new
protected = 'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected) == '08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files', '--others', '--exclude-standard').decode().splitlines()) == new|{protected}
previous = read(P/'checkpoint-v1.json')
assert all(sha(O/p) == digest for p, digest in previous['evidence_files_sha256'].items())
assert all(sha(p) == digest for p, digest in previous['external_evidence_files_sha256'].items())
inherited = {p: digest for p, digest in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in implementation}
assert all(sha(O/p) == digest for p, digest in inherited.items())
pins = json.loads(gzip.decompress((B/'source-pins-v5.json.gz').read_bytes()))
assert len(pins) == 2664 and all(sha(O/p) == digest for p, digest in pins.items())
receipt = read(V/'named-certificate-final-v1/commit-verification-v1.json')
assert receipt['commit'] == BASE and receipt['verified_blob_count'] == 12
assert all(hashlib.sha256(git('show', 'HEAD:'+p)).hexdigest() == digest for p, digest in receipt['verified_committed_blobs_sha256'].items())
baseline, focused, scalar, consumers, modeling, msrv, cost, proof, doc_fix, final_format = [result(phase) for phase in ['baseline-v1', 'focused-v3', 'scalar-v1', 'consumers-v1', 'modeling-v3', 'msrv-v1', 'cost-v1', 'proof-candidate-v1', 'root-doc-fix-v1', 'final-format-v1']]
assert baseline['baseline_failed_tests'] == 2
assert all(r['passed'] for r in [focused, scalar, consumers, modeling, msrv, cost, proof, doc_fix, final_format])
minimal_log = B/'logs/named-admission-modeling-v1-minimal-scalar_certificate_failures'
assert read(minimal_log/'result.json')['exit_code'] == 0
assert 'test result: ok. 1 passed; 0 failed; 0 ignored;' in (minimal_log/'stdout').read_text()
modeling_summaries = modeling['summaries']
assert modeling_summaries['minimal-scalar_certificate_failures'] == [['ok','1','0','0','0','0']]
assert modeling_summaries['fields-svg-scalar_certificate_failures'] == [['ok','4','0','0','0','0']]
root_changes = read(B/'final-candidate-v4.json')
amendment = read(W/'log-allowance-v2.json')
assert amendment['user_approval'] == 'Raise log allowance to 100 MiB'
assert amendment['new_cumulative_limit_bytes'] == 100*1024**2
old_root = git('show', 'HEAD:src/lib.rs')
assert old_root.replace(b'//! [`solid`] constructs and operates directly on [`TriangleMesh`], while\n//! [`curve`] constructs native `hypercurve::CurveRegion2`,', b'//! [`solid`] constructs and operates directly on [`TriangleMesh`]. With the\n//! `curve` feature, the `curve` module constructs native `hypercurve::CurveRegion2`,') == (O/'src/lib.rs').read_bytes()
assert scalar['packages']['default']['parent_tests_passed'] == 935
assert scalar['packages']['all']['parent_tests_passed'] == 1073
assert scalar['summaries']['debug-library'] == [['ok', '818', '0', '0', '0', '0']]
assert consumers['packages']['hyperlimit']['passed'] == 366
assert consumers['packages']['hypercircuit']['passed'] == 60
assert consumers['curve_tests'] == {'hypercurve_svg': [['ok','20','0','0','0','0']], 'svg_scalar_failures': [['ok','4','0','0','0','0']]}
assert cost['completed_outputs_and_layout_preserved']
assert len(proof['proofs']) == 9 and all('Unknown' not in row for row in proof['proofs'])
for manifest in sorted((U/'frozen').glob('*/executables-v1.json')):
    assert all(sha(row['copy']) == row['sha256'] for row in read(manifest).values())
registry = json.loads(gzip.decompress((N/'lazy-proof-control-v1/registry-inputs-v1.json.gz').read_bytes()))
assert len(registry) == 48478 and all(sha(p) == digest for p, digest in registry.items())
commands = {}
for folder in sorted((B/'logs').iterdir()):
    record = read(folder/'result.json')
    assert record['output_closed'] and not record['stops'], folder
    assert all(sha(folder/p) == digest for p, digest in record['output_sha256'].items())
    commands[folder.name] = record
expected_failures = {'named-admission-baseline-v1-run', 'named-admission-focused-v1-serde_named_certificates', 'named-admission-cache-diagnostic-v1-baseline-run', 'named-admission-cache-diagnostic-v1-candidate-run', 'named-admission-modeling-v1-minimal-docs', 'named-admission-modeling-v2-fields-svg-build'}
assert {k for k, r in commands.items() if r['exit_code']} == expected_failures
assert all(commands[k]['exit_code'] == 101 for k in expected_failures)
print('Verified final-source checks, baseline failures and all command outputs.', flush=True)
prior, missing = load(O/previous['artifact_expectations'], allow_unqualified=True)
assert (len(prior), len(missing)) == (1538234, 921794)
roots = [U, W, B, D, V/'named-certificate-final-v1']
for pattern in ['prepare-named-admission-*.py', 'named-admission-*.py', 'close-named-admission-*.py', 'stage-named-admission-*.py', 'verify-named-admission-*.py']:
    roots += sorted(Path('/tmp').glob(pattern))
roots = sorted(set(roots))
selected = []
for root in roots:
    assert root.exists(), root
    selected.extend([root] if root.is_file() else [p for p in sorted(root.rglob('*')) if (p.is_file() or p.is_symlink()) and not p.is_relative_to(X)])
assert len(selected) == len(set(selected))
physical, states, members, excluded = {}, {}, {}, {}
for p in selected:
    assert p.is_file() and not p.is_symlink() and str(p) not in prior, p
    before = p.stat(); digest = sha(p); after = p.stat()
    state = (after.st_size, after.st_mtime_ns, after.st_ctime_ns)
    assert state == (before.st_size, before.st_mtime_ns, before.st_ctime_ns), p
    physical[str(p)] = digest; states[str(p)] = state
    with p.open('rb') as f: magic = f.read(8)
    generated = p.is_relative_to(D) or p.is_relative_to(U/'target-msrv-v1') or p.is_relative_to(U/'target-modeling-v2')
    compiled = magic.startswith(b'\x7fELF') or magic == b'!<arch>\n'
    name = ('disk-b/'+str(p.relative_to(V)) if p.is_relative_to(V) else str(p.relative_to(N)) if p.is_relative_to(N) else 'temporary/'+str(p.relative_to('/tmp')))
    row = {'physical_path': str(p), 'sha256': digest, 'bytes': after.st_size}
    if generated or compiled:
        row['archive_exclusion_reason'] = 'Generated Cargo output' if generated else 'Compiled binary or library'
        excluded[name] = row
    else: members[name] = row
print(json.dumps({'new_paths_hashed_independently': len(physical), 'archive_members': len(members), 'generated_or_compiled_retained': len(excluded)}), flush=True)
assert not X.exists(); X.mkdir()
archive = X/'raw-evidence-v1.tar.gz'
with tarfile.open(archive, 'w:gz', dereference=True) as tf:
    for name, row in members.items(): tf.add(row['physical_path'], arcname=name, recursive=False)
with tarfile.open(archive, 'r:gz') as tf:
    assert set(tf.getnames()) == set(members)
    for name, row in members.items():
        with tf.extractfile(name) as f: assert hashlib.file_digest(f, 'sha256').hexdigest() == row['sha256']
gzwrite(X/'archive-members-v1.json.gz', {'members': members, 'excluded_generated_and_compiled_artifacts_physically_preserved': excluded, 'every_path_hashed_independently': True, 'all_archive_members_verified': True, 'archive_sha256': sha(archive)})
expectations = X/'artifact-expectations-v1.json.gz'
gzwrite(expectations, {'schema_version': 3, 'kind': 'named scalar certificate admission', 'parent_expectations': previous['artifact_expectations'], 'parent_expectations_sha256': previous['artifact_expectations_sha256'], 'added_physical_artifacts_sha256': physical, 'expected_artifact_paths': len(prior)+len(physical), 'inherited_expected_artifact_paths': len(prior), 'last_observed_missing_artifact_paths': len(missing), 'new_physical_artifacts_verified': len(physical), 'complete_artifact_audit_passed': False, 'historical_preservation_complete': False, 'old_history_reaudited': False, 'temporary_artifacts_volatile': True, 'required_loader': 'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded, unavailable = load(expectations, allow_unqualified=True)
assert loaded == prior|physical and unavailable == missing
dump(X/'command-results-v1.json', commands)
assert not E.exists(); E.mkdir()
external = {str(p): sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json', {'files_sha256': external, 'archive_bytes': archive.stat().st_size, 'archive_members': len(members), 'path_count': len(physical), 'content_verified': True, 'original_storage_baselines_unchanged': True, 'portable_distribution_evidence': False})
ratios = {}
for name in cost['samples']['baseline-0']:
    a = [cost['samples']['baseline-'+str(i)][name]['nanoseconds'] for i in range(5)]
    b = [cost['samples']['candidate-'+str(i)][name]['nanoseconds'] for i in range(5)]
    ratios[name] = {'baseline_nanoseconds': a, 'candidate_nanoseconds': b, 'ratio_of_medians': statistics.median(b)/statistics.median(a), 'baseline_complete_row': cost['samples']['baseline-0'][name], 'candidate_complete_row': cost['samples']['candidate-0'][name]}
review = {
    'decision': 'Retain named certificate validation, native positive-product proof replay, and zero pi-power reconstruction.',
    'source_parent_revision': BASE,
    'owners': ['Hyperreal Class parameter facts and zero-power identity', 'Native Computable relation proofs and untrusted-operand definedness', 'Real decoding before publication', 'Hypercurve SVG scalar diagnostic propagation', 'CSGRS modeling error classification and SVG adapter'],
    'properties': ['P1','P2','P3','P4','P5','P6','P18','P19','P20','P25','P26','P27','P30','P35','P36','P37','P39'],
    'input_domain': 'Named Real certificates in JSON/CBOR and CBOR Value conversions; positive certificate parameters, structural recipe agreement, or a defined positive-product proof within the native recognition domain. Opaque graphs retain the earlier partial domain guard.',
    'proof': 'Exact rational parameter checks precede lazy reconstruction. Trusted-parameter positive sums may refine through -256. Supplied payloads must match the native recipe structurally or through the shared log-of-positive-products proof; imported exponent atoms require definedness even under zero coefficients. No numeric refinement of an untrusted supplied payload and no discarded payload substitute for proof.',
    'migration': 'Previously trusted but unverified named claims now fail ParseError when disproved and UnknownCertificate when unproved. Generic Serde containers preserve the diagnostic in their format error. SVG adds Scalar(Problem), requiring exhaustive matches to handle the new variant. The Real wire layout and accepted payload bytes are preserved; pi^0 reconstructs as one. This is a correctness and admission contract change, not a performance-only patch.',
    'acceptance': {'known_invalid_forms': 35, 'scales': [0,1,-3], 'formats': ['JSON','CBOR'], 'both_formats_evaluated': True, 'public_families': 22, 'variants_per_family': 8, 'payload_shape_differences_preserved': 9, 'prior_undecided_native_equalities_now_proved': 8, 'cache_sequence': [-128,0,-256,0], 'cold_named_facts_preserved': True, 'zero_factors_cannot_hide_undefined_children': True},
    'scalar_cargo': scalar['packages'], 'debug_units_passed': 818,
    'consumers': consumers['packages'], 'curve_tests': consumers['curve_tests'], 'consumer_features': consumers['feature_gate_matrix'],
    'modeling': modeling_summaries,
    'final_root_changes_after_native_validation': root_changes,
    'native_validation_remains_current': 'All scalar, predicate, curve and circuit files are byte-identical to the passing native runs. Subsequent production edits touch two leading CSGRS documentation lines and the svg-io adapter only. The earlier circuit feature combinations do not enable svg-io; both minimal and fields/SVG CSGRS libraries and regression sources are checked after the final edit.',
    'modeling_method': 'Normal Cargo release library builds with no default features, then curve,sdf,metaballs,svg-io. The current integration sources are compiled against the resulting public libraries with rustc, avoiding unrelated competitive C++ dev dependencies. This is not a full Cargo root test matrix.',
    'compiler_floor': {'compiler': '1.95.0', 'all_targets': ['hyperreal','hyperlimit','hypercurve'], 'features': ['all','no-default'], 'modeling_library': ['no-default','curve,sdf,metaballs,svg-io'], 'runtime_or_clippy_on_floor_run': False},
    'strict_clippy_passed': ['Hyperreal default/all all-targets','Hyperlimit all all-targets','Hypercurve SVG all-targets','Hypercircuit interchange all-targets','Hypercircuit geometry/all curved_outline','CSGRS minimal and fields/SVG libraries'],
    'docs_and_format_passed': True,
    'cost_scope': cost['scope'], 'cost_controls': ratios, 'layout_bytes': 48,
    'binary_bytes': {k: v['bytes'] for k,v in cost['binaries'].items()},
    'cost_interpretation': 'All rows complete the same valid imports, sign inspections, consumption and destruction. Named-root imports add six allocations per operation and trigonometric imports add seven. The trigonometric peak rises by 328 bytes. These measured costs are accepted for the higher-priority correction of uncertified claims; this is not an optimization and no general speedup is claimed. Every timing and unfavorable result is retained.',
    'resource_contract': {'root_gib':16,'disk_b_gib':72,'tmp_gib':40,'logs_mib':100,'child_address_space_gib':8,'jobs':2,'focused_seconds':60,'compile_full_seconds':1800,'original_baselines_unchanged':True},
    'log_allowance_amendment': amendment,
    'resource_limitations': 'The native recognition proof uses 128 visits, 16 atoms and 1024-bit coefficients. These are proof-domain limits, not a total import work or heap-byte contract. Parameter arithmetic, graph decoding/construction and opaque domains remain incompletely bounded; hostile tests use external containment.',
    'adverse_results': ['The initial new round-trip assertion compared a warm opaque sign cache with a cold imported cache. Both baseline and candidate fail identically for (pi-3)^2. Keep immediate sign requirements for named values and require the independent mathematical sign with high/low refinement for all 176 values. No existing test, fixture or policy changed.', 'Focused driver v2 attempted to use the same test label for a library test and a CLI binary with the same Cargo target name; it stopped before the duplicate command launched. Version v3 selects test artifacts. All runner versions and outputs remain retained.', 'The root minimal-feature rustdoc check failed on an unchanged link to the disabled curve module. The failing file hash equals HEAD. A two-line leading-doc correction states the feature requirement. Affected documentation, Clippy and formatting repeat after that edit. Remaining modeling builds use approved /tmp space, preserving every previous output and all storage baselines.', 'The first SVG-enabled CSGRS build caught a missed exhaustive match after adding SvgError::Scalar. The final adapter uses the existing typed IoError::Construction carrier and a new regression exercises csgrs::io::svg::import_svg. Both final modeling feature configurations repeat after this fix.', 'The user explicitly raised the cumulative log allowance from 96 to 100 MiB; versioned runner and contract amendment retain the old controls and evidence. Workloads, time, memory and root/Disk B/tmp storage limits are unchanged.'],
    'remaining_limitations': ['Finite named-certificate and composition coverage does not prove admission of every public expression or arbitrary opaque graph.', 'Non-leaf opaque domains, private kernel ranges, quantile seed validation, total import work and retained-memory bounds remain open.', 'Full ordinary strict workloads, bindings and the clean shipped-distribution pipeline remain open; this is local affected-source qualification.', 'The boxed cache stays rejected and explicit affine subtraction stays withheld.', 'Historical missing artifacts were neither reaudited nor recovered; raw evidence and compiled artifacts require their retained external paths.'],
    'command_records_verified': len(commands), 'source_paths_verified': len(pins), 'registry_paths_verified': len(registry),
    'runtime_admitted': True, 'admitted_scope': 'The tested named parameter claims and payload relations are checked before scalar or SVG publication; undecided claims remain typed; all existing affected tests and the valid named/lazy corpus pass.',
    'full_plan_complete': False, 'public_distribution_complete': False, 'hypervoxel_deferred_by_user': True, 'all_adverse_results_retained': True, 'general_speedup_claimed': False,
    'next': 'Continue remaining native graph domain and resource obligations, then ordinary strict completion and complete external user-path/release validation under the preserved contracts.',
}
dump(E/'review-v1.json', review)
dump(E/'command-summary-v1.json', {name: {key:r[key] for key in ['exit_code','elapsed_seconds','stops']} for name,r in commands.items()})
for src, name in [(W/'contract-v1.md','contract-v1.md'), (W/'log-allowance-v2.json','log-allowance-v2.json'), (W/'tmp-contract-v3.json','tmp-contract-v3.json'), (B/'source-pins-v5.json.gz','source-pins-v1.json.gz'), (Path(__file__),'close_v1.py')]: shutil.copy2(src, E/name)
patch = []
for path in sorted(implementation):
    before = '' if path in new else git('show','HEAD:'+path).decode()
    patch.extend(difflib.unified_diff(before.splitlines(True), (O/path).read_text().splitlines(True), fromfile='a/'+path, tofile='b/'+path))
(E/'implementation.patch').write_text(''.join(patch))
cost_lines = []
for name, row in ratios.items():
    a, b = row['baseline_complete_row'], row['candidate_complete_row']
    cost_lines.append(f"| {name} | {row['ratio_of_medians']:.4f} | {a['allocations']} / {b['allocations']} | {a['peak_extra_bytes']} / {b['peak_extra_bytes']} |")
(E/'README.md').write_text('''# Named scalar certificate admission

Named Real imports now check their parameter claims and any supplied payload
before publishing a value. Invalid claims return ParseError; missing proofs
return UnknownCertificate. SVG preserves the undecided scalar cause, and
CSGRS classifies it as Undecided. Valid pi^0 products reconstruct as one.
The public migration and remaining import limitations are documented in the
Hyperreal README. Accepted payload graphs, wire bytes and Real layout remain.

The two retained failing acceptance tests now pass. Coverage includes 35
invalid forms, three outer scales, JSON and CBOR, typed Value conversions and
containers, all 176 shared public variants, lazy certificates, and undefined
children hidden behind zero factors. The native proof also resolves the eight
previously undecided equalities among the nine differing valid payload recipes.
Independent signs, exact domains and value bounds supplement wrapper agreement.
The initial cold/warm assertion fails on both revisions for an opaque value;
the corrected test preserves named facts and certifies every variant's sign
through high/low precision queries. Existing tests remain unchanged.

Runtime-source validation passes 935 default and 1,073 all-feature scalar tests,
818 debug units, 24/29 scalar doctests, 366 predicate tests, 24 SVG tests,
60 selected circuit tests and the geometry/all-feature circuit cases.
Modeling checks compile the public Cargo libraries and the actual integration
test sources directly, without unrelated competitive dev dependencies. The exact
commands and counts are in review-v1.json and command-summary-v1.json.
Affected strict Clippy, docs, formatting and Rust 1.95 checks pass. This does
not claim the complete pre-push matrix or a published distribution. An unchanged
minimal-feature rustdoc link failed. Its two leading comment lines now state
the feature requirement; affected docs, Clippy and formatting pass after that
edit. An SVG-enabled build caught a missed exhaustive error match. The adapter
now preserves the scalar cause through IoError::Construction; the public import
regression passes among four scalar-failure tests with SVG/fields enabled.
Both modeling feature configurations pass after the final edit. Native crate
sources remain unchanged from their passing scalar and consumer runs.

Each cost row completes 100,000 valid imports, checks sign, consumes and drops
the result. Five alternating instrumented pairs retain all raw measurements.
Construction and byte validation are outside timing. Ratios are candidate /
baseline medians. This correctness repair makes no general speedup claim.
Named-root validation adds six allocations per import; trigonometric validation
adds seven and raises peak temporary allocation by 328 bytes. The additional
cost is retained explicitly for the higher-priority certificate checks.

| Import | Time ratio | Allocations baseline / candidate | Peak bytes baseline / candidate |
| --- | ---: | ---: | ---: |
'''+ '\n'.join(cost_lines)+f'''

The probe executables contain {cost['binaries']['baseline']['bytes']:,} baseline
and {cost['binaries']['candidate']['bytes']:,} candidate bytes. Real remains
48 bytes; every cost row releases its additional live allocation bytes.

Raw evidence is archived on Disk B with independently verified member hashes.
Compiled outputs remain at their recorded physical paths. Original root,
Disk B and /tmp allowances remain 16/72/40 GiB; cumulative logs remain bounded
by the user-approved 100 MiB amendment to the original 96 MiB contract. No
baseline reset, artifact deletion or historical recovery is
claimed. Earlier missing artifacts remain qualified in the expectation chain.

Opaque graph domains, private kernel and quantile prerequisites, complete
import resource contracts, ordinary strict workflows and the shipped user
path remain open. Hypervoxel is excluded. No push or full-plan completion is
claimed. See review-v1.json for the exact admitted scope and next work.
''')
prefix = str(E.relative_to(O))+'/'
ledger = O/'docs/properties-status.json'
raw = ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest() == previous['ledger_after_sha256']
reference = git('show','9025de62:docs/properties-status.json')
start, end, current = span(raw); rs, re_, _ = span(reference)
assert (raw[:start],raw[end:]) == (reference[:rs],reference[re_:])
assert 'named_certificate_admission' not in current
current['updated_on'] = '2026-10-18'
current['named_certificate_admission'] = {'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':str(expectations),'scalar_cargo':scalar['packages'],'debug_units_passed':818,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'modeling':modeling_summaries,'compiler_floor':review['compiler_floor'],'runtime_admitted':True,'admitted_scope':review['admitted_scope'],'remaining_limitations':review['remaining_limitations'],'storage_baselines_reset':False,'disk_b_allowance_gib':72,'tmp_allowance_gib':40,'logs_allowance_mib':100,'all_adverse_results_retained':True,'general_speedup_claimed':False,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'next':review['next']}
updated = raw[:start]+json.dumps(current,indent=2).encode()+raw[end:]
us, ue, _ = span(updated)
assert (updated[:us],updated[ue:]) == (reference[:rs],reference[re_:])
ledger.write_bytes(updated)
for p in E.iterdir():
    if p.suffix in {'.md','.py','.json'}:
        value = p.read_text()
        assert all(line == line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'), p
        if p.suffix == '.py': ast.parse(value)
with (E/'whitespace.stdout').open('wb') as out, (E/'whitespace.stderr').open('wb') as err:
    checked = subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode == 0
record = {'status':review['decision'],'checkpoint_kind':'named scalar certificate admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':sum(prior.get(p)==digest for p,digest in registry.items()),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':implementation,'new_implementation_paths':sorted(new),'restored_native_sha256':{p:digest for p,digest in previous['restored_native_sha256'].items() if p not in implementation},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':12,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':40,'disk_b_allowance_gib':72,'logs_allowance_mib':100,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json', record)
for p, state in states.items():
    st = Path(p).stat()
    assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns) == state, p
assert all(sha(O/p) == digest for p,digest in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':True,'full_plan_complete':False}),flush=True)
