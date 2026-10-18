"""Seal current-revision named certificate findings without admitting a repair."""
import ast, gzip, hashlib, json, os, re, shutil, subprocess, sys, tarfile
sys.dont_write_bytecode = True
from pathlib import Path
O = Path('/home/tim/Documents/GitHub/workspace/csgrs')
N = O.parent/'csgrs-properties-validation-2026-10-17-v2'
V = Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
W = N/'named-certificate-control-v1'
B = V/'named-certificate-validation-v1'
U = Path('/tmp/csgrs-named-certificate-20261018-v1')
X = B/'external-evidence'
E = O/'docs/evidence/2026-10-18-named-certificate-audit'
P = O/'docs/evidence/2026-10-18-scalar-graph-domains'
BASE = 'dbe99e3cc145e8ca58a53ade6e79fd46311972fb'
sys.path.insert(0,str(W))
from named_certificate_runner_v1 import sha, resources, reasons
sys.path.insert(0,str(O/'docs/evidence/2026-10-17-resume-integration'))
from load_expectations_v2 import load
GIT = ['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS'] = '0'
def git(*args): return subprocess.check_output(GIT+list(args),cwd=O)
def read(p): return json.loads(Path(p).read_text())
def dump(p,value):
    assert not p.exists(),p
    p.write_text(json.dumps(value,indent=2,sort_keys=True)+'\n')
def gzwrite(p,value):
    assert not p.exists(),p
    p.write_bytes(gzip.compress((json.dumps(value,sort_keys=True)+'\n').encode(),mtime=0))
def span(raw):
    start = re.search(rb'"current_work"\s*:\s*',raw).end()
    value,count = json.JSONDecoder().raw_decode(raw[start:].decode())
    return start,start+len(raw[start:].decode()[:count].encode()),value

assert git('rev-parse','HEAD').decode().strip() == BASE
assert not git('diff','HEAD','--name-only') and not reasons(resources())
protected = 'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert git('ls-files','--others','--exclude-standard').decode().splitlines() == [protected]
assert sha(O/protected) == '08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
previous = read(P/'checkpoint-v1.json')
assert all(sha(O/p) == h for p,h in previous['evidence_files_sha256'].items())
assert all(sha(p) == h for p,h in previous['external_evidence_files_sha256'].items())
inherited = previous['inherited_implementation_sha256'] | previous['implementation_sha256']
assert all(sha(O/p) == h for p,h in inherited.items())
pins = json.loads(gzip.decompress((W/'source-pins-v1.json.gz').read_bytes()))
assert len(pins) == 2662 and all(sha(O/p) == h for p,h in pins.items())
receipt = read(V/'certificate-ingress-final-v1/commit-verification-v1.json')
assert receipt['commit'] == BASE and receipt['verified_blob_count'] == 18
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest() == h for p,h in receipt['verified_committed_blobs_sha256'].items())
library = read(W/'baseline-library-v1.json')
assert library['revision'] == BASE and sha(library['library']) == library['sha256']
assert all(sha(p) == h for p,h in library['dependency_sha256'].items())
registry = json.loads(gzip.decompress((N/'lazy-proof-control-v1/registry-inputs-v1.json.gz').read_bytes()))
assert len(registry) == 48478 and all(sha(p) == h for p,h in registry.items())
def result(phase): return read(B/('named-certificate-'+phase)/'result-v1.json')
recipes,proof,invalid,acceptance = [result(p) for p in ['recipes-v1','proof-v1','invalid-v2','acceptance-v2']]
assert recipes['counts'] == proof['counts'] == {'family':22,'same':103,'different':9,'lazy':8,'opaque':56}
assert len(proof['proofs']) == 9
assert sum('Unknown { min_precision: -64 }' in row for row in proof['proofs']) == 8
assert len(invalid['observations']) == 72
assert invalid['child_failures'] == {'ln-zero-scale-1':134,'lnaffine-zero-base-scale-1':134}
assert sum(r['stdout'].count('\taccepted') for r in invalid['observations'].values()) == 142
assert sum(r['stdout'].count('\trejected\t') for r in invalid['observations'].values()) == 0
assert acceptance['baseline_failed_tests'] == 2 and acceptance['known_invalid_forms'] == 35
stderr = (B/'logs/named-certificate-acceptance-v2-run/stderr').read_text()
accepted = json.loads(re.search(r'invalid certificates published: (\[[^\n]+\])',stderr).group(1))
wrong_products = json.loads(re.search(r'wrong constant products: (\[[^\n]+\])',stderr).group(1))
assert len(accepted) == 105 and len(wrong_products) == 4
commands = {}
for folder in sorted((B/'logs').iterdir()):
    record = read(folder/'result.json')
    assert record['output_closed'] and not record['stops'],folder
    assert all(sha(folder/p) == h for p,h in record['output_sha256'].items())
    commands[folder.name] = record
assert len(commands) == 109
assert {name:r['exit_code'] for name,r in commands.items() if r['exit_code']} == {
    'named-certificate-invalid-v1-ln-zero-scale-1':134,
    'named-certificate-invalid-v2-ln-zero-scale-1':134,
    'named-certificate-invalid-v2-lnaffine-zero-base-scale-1':134,
    'named-certificate-acceptance-v1-run':101,
    'named-certificate-acceptance-v2-run':101,
}
for phase,filename in [('recipes-v1','recipes-v1'),('proof-v1','proof-v1'),('invalid-v2','invalid-v2'),('acceptance-v2','acceptance-v2')]:
    r = result(phase)
    assert sha(U/'probes'/filename) == r['binary_sha256']
    assert sha(U/'probes'/(filename+'.rs')) == r['source_sha256']
prior,missing = load(O/previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing)) == (1537623,921794)
roots = [U,W,B,V/'certificate-ingress-final-v1']
for pattern in ['prepare-named-certificate-*.py','named-certificate-*.py','named-certificate-*.rs','close-named-certificate-*.py','stage-named-certificate-*.py','verify-named-certificate-*.py']:
    roots += sorted(Path('/tmp').glob(pattern))
roots = sorted(set(roots))
selected = []
for root in roots:
    assert root.exists(),root
    selected.extend([root] if root.is_file() else [p for p in sorted(root.rglob('*')) if (p.is_file() or p.is_symlink()) and not p.is_relative_to(X)])
assert len(selected) == len(set(selected))
physical,states,members,excluded = {},{},{},{}
for p in selected:
    assert p.is_file() and not p.is_symlink() and str(p) not in prior,p
    before = p.stat();digest = sha(p);after = p.stat()
    state = after.st_size,after.st_mtime_ns,after.st_ctime_ns
    assert state == (before.st_size,before.st_mtime_ns,before.st_ctime_ns),p
    physical[str(p)] = digest;states[str(p)] = state
    with p.open('rb') as f: magic = f.read(8)
    name = ('disk-b/'+str(p.relative_to(V)) if p.is_relative_to(V) else str(p.relative_to(N)) if p.is_relative_to(N) else 'temporary/'+str(p.relative_to('/tmp')))
    row = {'physical_path':str(p),'sha256':digest,'bytes':after.st_size}
    if magic.startswith(b'\x7fELF') or magic == b'!<arch>\n':
        excluded[name] = row
    else: members[name] = row
assert not X.exists();X.mkdir()
archive = X/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz',dereference=True) as tf:
    for name,row in members.items(): tf.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as tf:
    assert set(tf.getnames()) == set(members)
    for name,row in members.items():
        with tf.extractfile(name) as f: assert hashlib.file_digest(f,'sha256').hexdigest() == row['sha256']
gzwrite(X/'archive-members-v1.json.gz',{'members':members,'excluded_compiled_artifacts_physically_preserved':excluded,'every_path_hashed_independently':True,'all_archive_members_verified':True,'archive_sha256':sha(archive)})
expectations = X/'artifact-expectations-v1.json.gz'
gzwrite(expectations,{'schema_version':3,'kind':'named-certificate admission diagnostic','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable = load(expectations,allow_unqualified=True)
assert loaded == prior|physical and unavailable == missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external = {str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'path_count':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})
review = {
    'decision':'Retain current-revision failures and reject direct structural payload comparison as an admission strategy. No runtime repair is admitted here.',
    'source_parent_revision':BASE,
    'owner':'Hyperreal Class parameter certificates, Class::pi_power_computable identity, and native Computable equality evidence before Real publication.',
    'properties':['P1','P2','P3','P4','P5','P6','P18','P19','P20','P26','P27','P35','P36','P37','P39'],
    'input_domain':'All 21 named class families plus opaque control through existing public recipes and eight compositions; 36 fixed malformed/counterexample tuples, zero/nonzero scales, JSON/CBOR, fact queries and selected downstream translation.',
    'public_recipe_census':recipes['counts'],
    'public_recipe_count':176,'named_round_trips_exercised':120,'opaque_results_classified_without_round_trip':56,
    'mismatched_payloads':recipes['mismatches'],
    'existing_equality_replay':proof['proofs'],
    'equality_limit':'Both class tags are removed before comparing native graphs. Existing exact normalization proves one of nine differing recipes; eight remain Unknown even after a -64 refinement request. Unknown is not evidence of inequality. Direct shape rejection would exclude valid public values.',
    'invalid_matrix_cases':72,
    'observed_format_acceptances':142,
    'observed_format_rejections':0,
    'aborted_children':invalid['child_failures'],
    'format_observation_limit':'Each child tries JSON then CBOR. Two JSON fact queries abort the process, so their subsequent CBOR branches are not observed in that diagnostic. The separate acceptance regression executes JSON and CBOR imports for every fixed invalid tuple without fact queries.',
    'missing_acceptance_tests':{'failed':2,'invalid_forms':35,'scales':[0,1,-3],'formats':['JSON','CBOR'],'invalid_tuple_scales_accepted':len(accepted),'zero_pi_power_value_failures':len(wrong_products),'both_formats_evaluated_before_combining_assertions':True},
    'new_findings':['Ln(0) and LnAffine(base=0) decode, then a fact query aborts with stack overflow. Ordinary domain errors must fail before this path.','Sqrt(4), Exp(0), logarithms of exact base powers, and integer power tags can assert false irrationality. Positive sign alone is insufficient.','ConstProduct(pi_power=0, exp_power=q) is mathematically valid, but lazy reconstruction starts the zero-power product at pi. For q=1 its interval represents pi*e while translation uses e+1. Rejecting this valid record is not the required repair.','A positive rational payload of 2 contradicts the Pi class even though its sign matches. Parameter checks and sign checks cannot establish payload equality.'],
    'strategies_rejected':['Require serialized graph equality with the reconstructed recipe: excludes nine valid public outputs.','Use current bounded equality as a complete importer gate: leaves eight valid differing outputs undecided.','Reject all zero pi powers: hides the valid ConstProduct identity defect instead of restoring its value.'],
    'adverse_results':['The first malformed-case driver stopped after the first ordinary child abort. Version 2 retains both aborts and completes the isolated matrix; both versions remain.','Acceptance v1 short-circuited the second format after a first-format failure and stopped the value test at its first mismatch. Version 2 evaluates both formats and all four zero-power cases before asserting; all original sources and failures remain.'],
    'resource_contract':{'root_gib':16,'disk_b_gib':72,'tmp_gib':40,'logs_mib':96,'original_baselines_unchanged':True,'child_address_space_gib':8,'jobs':2,'focused_seconds':60,'compile_full_seconds':1800},
    'command_records_verified':len(commands),'source_paths_verified':len(pins),'registry_paths_verified':len(registry),'dependency_paths_verified':len(library['dependency_sha256']),
    'production_changes':False,'new_runtime_admitted':False,'main_runtime_tests_rerun':False,'full_native_workloads_rerun':False,'full_ci_or_push_validation_run':False,'performance_claimed':False,
    'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,
    'remaining_limitations':['All reproduced named-certificate failures remain unfixed at this checkpoint.','The finite census is not a proof over all public constructor compositions.','Non-leaf graph domains, private kernel ranges, quantile seeds and imported resource bounds remain open.','Earlier missing artifacts were neither reaudited nor recovered. Compiled probes and raw archives require retained external paths.'],
    'next':'Repair invalid named parameter claims before lazy reconstruction, restore the zero pi-power identity at its owning helper, and extend native equality evidence for valid payload variants. Preserve unknown proof outcomes as distinct from invalid input; do not weaken the valid public/lazy corpus to make an importer gate pass. Then run affected local/downstream acceptance and cost checks before runtime admission.',
}
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{name:{k:r[k] for k in ['exit_code','elapsed_seconds','stops']} for name,r in commands.items()})
for src,name in [(W/'contract-v1.md','contract-v1.md'),(W/'source-pins-v1.json.gz','source-pins-v1.json.gz'),(Path('/tmp/named-certificate-acceptance-v2.rs'),'acceptance-baseline-v2.rs'),(Path(__file__),'close_v1.py')]:
    shutil.copy2(src,E/name)
(E/'README.md').write_text('''# Named scalar certificate admission: reproduced failures

This checkpoint records failures on dbe99e3cc and preserves the acceptance
fixtures. It does not change production code or admit an importer repair.

The 176-case public-recipe census covers all 21 named classes and an opaque
control. Among the results, 103 materialized payloads match the class recipe,
9 differ structurally, 8 are lazy, and 56 use the opaque carrier. All recorded
named JSON/CBOR round trips (120 values) preserve bytes and signs. The 56
opaque results are classified only. This is a finite census,
not a universal equivalence proof.

The nine differing payloads are legitimate inverse-product and cached-root
representations. Removing both class tags before asking the existing native
reducers proves one equivalence; eight remain Unknown at refinement -64.
Rejecting graph differences or interpreting Unknown as inequality would lose
supported public values. Those proposed import gates are rejected.

The malformed/counterexample matrix has 36 tuples at scales zero and one.
It records 142 format acceptances and no rejections. Two JSON fact queries,
Ln(0) and LnAffine(base=0), abort isolated children with stack overflow before
their CBOR branches run. These are retained failures, not successful checks.
Other cases assert false positivity, nonzero status or irrationality, including
Sqrt(4) and Exp(0). A Pi class with a positive payload of 2 also contradicts
its claimed value, so sign agreement cannot validate payload consistency.

One case requires preserving a valid value: ConstProduct(pi_power=0,
exp_power=q) means exp(q). The current reconstruction introduces an extra pi;
for q=1 its interval represents pi*e, while adding one produces e+1. Restore
the zero-exponent identity in the owning scalar helper rather than rejecting
this valid parameter tuple.

The retained acceptance-baseline-v2.rs has two failing tests: 35 invalid
certificate forms at scales 0, 1 and -3 through both import formats, and four
independent zero-power value checks. Both formats are always evaluated, and
all value cases are collected before asserting. The original weaker baseline
driver is retained too. These tests are evidence of missing behavior and are
not installed as passing main-suite regressions.

All 109 command records and their outputs were verified. The five nonzero
commands are the original/repeated scalar aborts and the two expected failing
acceptance runs. No resource stop occurred. Compiler invocations use -D warnings;
no new full-suite, Clippy, release, distribution or performance result is claimed.
All 2,662 pinned source paths remain unchanged. Raw protocols, sources and logs
are archived on Disk B; exact locations and hashes are in external-evidence-v1.json.
Each physical path is hashed independently, and compiled probes remain retained.
Root/Disk B/tmp limits remain 16/72/40 GiB and cumulative logs 96 MiB.

Next: establish named-parameter claims before lazy reconstruction, repair the
zero-exponent identity, and provide native equality evidence for valid payload
variants. An unproved equality must stay distinct from malformed input. Full
graph admission, strict workloads and shipped distribution remain open.
Hypervoxel remains excluded; the complete properties plan remains active.
''')
ledger = O/'docs/properties-status.json';raw = ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest() == previous['ledger_after_sha256']
reference = git('show','9025de62:docs/properties-status.json')
s,e,current = span(raw);rs,re_,_ = span(reference)
assert (raw[:s],raw[e:]) == (reference[:rs],reference[re_:])
assert 'named_certificate_audit' not in current
prefix = str(E.relative_to(O))+'/'
current['updated_on'] = '2026-10-18'
current['named_certificate_audit'] = {'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':str(expectations),'public_recipe_census':recipes['counts'],'child_failures':invalid['child_failures'],'missing_acceptance_tests':review['missing_acceptance_tests'],'runtime_admitted':False,'source_changes_applied':False,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'remaining_limitations':review['remaining_limitations'],'next':review['next']}
updated = raw[:s]+json.dumps(current,indent=2).encode()+raw[e:]
us,ue,_ = span(updated);assert (updated[:us],updated[ue:]) == (reference[:rs],reference[re_:])
ledger.write_bytes(updated)
for p in E.iterdir():
    if p.suffix in ['.md','.py','.json','.rs']:
        value = p.read_text();assert all(line == line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'),p
        if p.suffix == '.py': ast.parse(value)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked = subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode == 0
record = {'status':review['decision'],'checkpoint_kind':'named-certificate baseline and admission-strategy audit','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':sum(prior.get(p)==h for p,h in registry.items()),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{},'restored_native_sha256':previous['restored_native_sha256'],'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','main_runtime_tests_rerun':False,'source_changes_applied':False,'production_rust_sources_unchanged':True,'new_implementation_admission':False,'runtime_admitted':False,'explicit_subtraction_candidate_admitted':False,'lazy_cache_candidate_admitted':False,'required_opaque_payload_admitted':True,'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':18,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':40,'disk_b_allowance_gib':72,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for p,state in states.items():
    st = Path(p).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns) == state,p
assert all(sha(O/p) == h for p,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':False,'full_plan_complete':False}),flush=True)
