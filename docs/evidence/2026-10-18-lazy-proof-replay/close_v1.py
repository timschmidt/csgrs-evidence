"""Close the lazy-query/proof-replay experiment with external raw retention."""
import ast,difflib,gzip,hashlib,json,os,re,shutil,statistics,subprocess,sys,tarfile
sys.dont_write_bytecode=True
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2';W=N/'lazy-proof-control-v1'
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
B=V/'lazy-proof-validation-v1';U=Path('/tmp/csgrs-lazy-proof-20261018-v1');X=B/'external-evidence'
P=O/'docs/evidence/2026-10-18-owned-symbolic-folding';E=O/'docs/evidence/2026-10-18-lazy-proof-replay'
BASE='fb62da439e0fcb4e292032488a7596ec2107dd18'
sys.path.insert(0,str(W))
from lazy_proof_runner_v1 import sha,resources,reasons
sys.path.insert(0,str(O/'docs/evidence/2026-10-17-resume-integration'))
from load_expectations_v2 import load
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0'];os.environ['GIT_OPTIONAL_LOCKS']='0'
def git(*a):return subprocess.check_output(GIT+list(a),cwd=O)
def read(p):return json.loads(Path(p).read_text())
def dump(p,value):
    assert not p.exists(),p
    p.write_text(json.dumps(value,indent=2,sort_keys=True)+'\n')
def gzwrite(p,value):
    assert not p.exists(),p
    p.write_bytes(gzip.compress((json.dumps(value,sort_keys=True)+'\n').encode(),mtime=0))
def span(raw):
    start=re.search(rb'"current_work"\s*:\s*',raw).end();value,length=json.JSONDecoder().raw_decode(raw[start:].decode());return start,start+len(raw[start:].decode()[:length].encode()),value
assert git('rev-parse','HEAD').decode().strip()==BASE and not git('diff','--cached','--name-only') and not reasons(resources())
new={'crates/hyperreal/src/computable/node/trig_range_proof_tests.rs','crates/hyperreal/tests/serde_lazy_certificates.rs','crates/hyperreal/tests/trig_certificate_composition.rs','crates/hyperlimit/tests/lazy_scalar_certificates.rs'}
changed={'crates/hyperreal/src/computable/node.rs','crates/hyperreal/src/computable/node/structural_analysis.rs','crates/hyperreal/src/computable/node/primitive_constructors.rs','crates/hyperreal/src/computable/node/representation.rs','crates/hyperreal/src/real/arithmetic/representation.rs','crates/hyperreal/src/real/arithmetic/quadratic_tower_sign.rs'}
implementation={p:sha(O/p) for p in changed|new}
assert set(git('diff','HEAD','--name-only').decode().splitlines())==changed
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())==new|{protected}
previous=read(P/'checkpoint-v1.json');assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in implementation}
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((B/'source-pins-v6.json.gz').read_bytes()));assert len(pins)==2661 and all(sha(O/p)==h for p,h in pins.items())
receipt=read(N/'owned-fold-final-commit-verification-v1.json');assert receipt['commit']==BASE and receipt['verified_blob_count']==18
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
def result(phase):return read(B/('lazy-proof-'+phase)/'result-v1.json')
baseline=result('baseline-v2');focused=result('focused-v2');scalar=result('scalar-complete-v1');consumers=result('consumers-v3');msrv=result('msrv-v3');cost=result('cost-v1')
assert baseline['production_behavior_changed'] is False
assert baseline['summaries']['serde_lazy_certificates']==[['FAILED','1','3','0','0','0']]
assert baseline['summaries']['trig_certificate_composition']==[['FAILED','0','1','0','0','0']]
assert baseline['summaries']['hyperlimit']==[['FAILED','0','1','0','0','0']]
assert all(r['passed'] for r in [focused,scalar,consumers,msrv,cost])
assert scalar['packages']['default']['parent_tests_passed']==934 and scalar['packages']['all']['parent_tests_passed']==1062
assert scalar['summaries']['debug-library']==[['ok','817','0','0','0','0']]
assert consumers['packages']['hyperlimit']['passed']==366 and consumers['packages']['hypercircuit']['passed']==60
assert consumers['curve_tests']=={'hypercurve_svg':[['ok','20','0','0','0','0']],'svg_scalar_failures':[['ok','1','0','0','0','0']]}
assert cost['same_layout_allocation_counts_and_completed_outputs']
for manifest in sorted((U/'frozen').glob('*/executables-v1.json')):
    assert all(sha(v['copy'])==v['sha256'] for v in read(manifest).values())
registry=json.loads(gzip.decompress((W/'registry-inputs-v1.json.gz').read_bytes()));assert len(registry)==48478 and all(sha(p)==h for p,h in registry.items())
commands={}
for root in [N/'logs',B/'logs']:
    for folder in sorted(root.glob('lazy-proof-*')):
        r=read(folder/'result.json');assert r['output_closed'],folder
        if r['stops']:
            assert folder.name=='lazy-proof-scalar-v2-debug-library' and r['exit_code']==-15 and r['stops']==['root_volume_net_consumption_16_gib'],folder
        assert all(sha(folder/p)==h for p,h in r['output_sha256'].items());commands[folder.name]=r
failures={k for k,v in commands.items() if v['exit_code']}
expected_failures={'lazy-proof-baseline-v1-hyperreal-build','lazy-proof-baseline-v2-hyperreal','lazy-proof-baseline-v2-serde_lazy_certificates','lazy-proof-baseline-v2-trig_certificate_composition','lazy-proof-baseline-v2-hyperlimit','lazy-proof-focused-v1-trig_certificate_composition','lazy-proof-focused-diagnostic-v2-serde_lazy_certificates','lazy-proof-scalar-v1-default-clippy','lazy-proof-scalar-v2-debug-library'}
assert failures==expected_failures,(failures,expected_failures)
assert all(v['exit_code']==(-15 if k=='lazy-proof-scalar-v2-debug-library' else 101) for k,v in commands.items() if k in failures)
print('Verified final-source suites, consumers, cost controls and all command outputs.',flush=True)
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True);assert (len(prior),len(missing))==(1505084,921794)
roots=[U,W,B,N/'lazy-proof-diagnostic-v1']+sorted(N.glob('owned-fold-final-*'))
for kind in ['logs','scratch']:roots+=sorted((N/kind).glob('lazy-proof-*'))
for pattern in ['prepare-lazy-proof-*.py','lazy-proof-*.py','lazy-proof-*.rs','relocate-lazy-proof-*.py','close-lazy-proof-*.py','prepare-lazy-proof-commit-*.py','stage-lazy-proof-*.py','verify-lazy-proof-*.py','stage-owned-fold-v1.py','verify-owned-fold-commit-v1.py']:
    roots+=sorted(Path('/tmp').glob(pattern))
roots=sorted(set(roots));selected=[]
for root in roots:
    assert root.exists(),root
    selected.extend([root] if root.is_file() else (p for p in sorted(root.rglob('*')) if (p.is_file() or p.is_symlink()) and not p.is_relative_to(X)))
assert len(selected)==len(set(selected))
relocation=read(B/'inventory-relocation-v1.json');alias=Path(relocation['source_alias']);assert alias.is_symlink() and str(alias.resolve())==relocation['physical_target'] and sha(alias)==relocation['sha256']
physical={};stats={};members={};excluded={}
for path in selected:
    assert path.is_file() and (not path.is_symlink() or path==alias),path
    before=path.stat();digest=sha(path);after=path.stat();state=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    assert state==(before.st_size,before.st_mtime_ns,before.st_ctime_ns) and str(path) not in prior,path
    physical[str(path)]=digest;stats[str(path)]=state
    with path.open('rb') as f:magic=f.read(8)
    generated=any(path.is_relative_to(U/name) for name in ['target','target-msrv-v3'])
    compiled=magic.startswith(b'\x7fELF') or magic==b'!<arch>\n'
    name=('disk-b/'+str(path.relative_to(B))) if path.is_relative_to(B) else (str(path.relative_to(N)) if path.is_relative_to(N) else 'temporary/'+str(path.relative_to('/tmp')))
    row={'physical_path':str(path),'sha256':digest,'bytes':after.st_size}
    if path==alias:row['preserved_symlink_target']=str(path.resolve())
    if generated or compiled:
        row['archive_exclusion_reason']='Generated Cargo output' if generated else 'Compiled binary or library';excluded[name]=row
    else:members[name]=row
print(json.dumps({'new_paths_hashed_independently':len(physical),'archive_members':len(members),'generated_outputs_retained':len(excluded)}),flush=True)
archive=X/'raw-evidence-v1.tar.gz';assert not archive.exists()
with tarfile.open(archive,'w:gz',dereference=True) as tf:
    for name,row in members.items():tf.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as tf:
    assert set(tf.getnames())==set(members)
    for name,row in members.items():
        with tf.extractfile(name) as f:assert hashlib.file_digest(f,'sha256').hexdigest()==row['sha256']
archive_map=X/'archive-members-v1.json.gz'
gzwrite(archive_map,{'members':members,'excluded_generated_and_compiled_artifacts_physically_preserved':excluded,'every_path_hashed_independently':True,'all_archive_members_verified':True,'archive_sha256':sha(archive),'inventory_symlink_alias_record':relocation})
expectations=X/'artifact-expectations-v1.json.gz'
gzwrite(expectations,{'schema_version':3,'kind':'lazy certificate access and native proof replay','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'inventory_alias_count':1,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'reason':'Raw archive and large path/command maps retained on approved Disk B to preserve the original root ceiling.','archive_bytes':archive.stat().st_size,'archive_members':len(members),'path_count':len(physical),'content_verified':True,'portable_distribution_evidence':False,'original_storage_baselines_unchanged':True})
ratios={}
for name in cost['samples']['baseline-0']:
    a=[cost['samples']['baseline-'+str(i)][name]['nanoseconds'] for i in range(5)];b=[cost['samples']['candidate-'+str(i)][name]['nanoseconds'] for i in range(5)]
    ratios[name]={'baseline_nanoseconds':a,'candidate_nanoseconds':b,'ratio_of_medians':statistics.median(b)/statistics.median(a),'baseline_complete_row':cost['samples']['baseline-0'][name],'candidate_complete_row':cost['samples']['candidate-0'][name]}
review={
 'decision':'Retain lazy borrowed certificate reconstruction and checked native sine/tangent proof replay.',
 'source_parent_revision':BASE,'owners':['Hyperreal optional named payload access','Computable reduced-pi sign proof, native trigonometric construction and transparent Node import'],
 'properties':['P1','P2','P3','P4','P5','P6','P18','P19','P20','P26','P27','P35','P36','P37','P39'],
 'input_domain':'Valid named Real certificates with absent/null payloads; native PrescaledSin/PrescaledTan graphs whose argument is a nonzero rational pi multiple of magnitude strictly below pi/2, recognized within the stated graph inspection bound.',
 'implementation':'Borrow existing graphs through Cow; reconstruct only absent named payloads. Share the same native checked pi-multiple proof at exact-sign query, sine/tangent construction and transparent Node import. Preserve existing imported metadata defaults and the constant-time immediate-sign/reducer contract.',
 'proof':'For -1/2 < q < 1/2 and q != 0, sin(pi*q) and tan(pi*q) have sign(q). Exact native rational binary magnitude proves the strict interval; negations and checked binary shifts preserve the relation. Zero, endpoints, other quadrants, unsupported/undefined graphs and overflow cannot inherit this witness.',
 'representation':'No public API, wire schema, authoritative expression, Real/Node/cache layout or allocation field changes. Round-trip bytes and null payloads remain unchanged. No serialized cache hint or Real class tag is treated as this new proof.',
 'baseline':baseline['summaries'],'focused':focused['summaries'],'final_source_scalar':scalar['packages'],'debug_units_passed':817,
 'acceptance_scope':{'restored_named_recipes':21,'lazy_formats':['JSON','CBOR'],'payload_states':['null','omitted'],'scales':[0,1,-3],'query_precision_sequence':[0,-128,0],'trig_compositions':['cold and warm','scale by 2 and -3','divide by 2','same-value addition','reciprocal product','CBOR reimport'],'extra_native_guards':['positive and negative range','zero and poles','wrong quadrants','offset i32::MIN','shift overflow','deep graph','undefined operand'],'cache_inspection_without_approximation':True},
 'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'consumer_features':consumers['feature_gate_matrix'],'compiler_floor':{'compiler':msrv['compiler'],'features':msrv['features'],'all_targets':True,'runtime_tests_rerun':False,'clippy_on_msrv_run':False},
 'strict_clippy_passed':['Hyperreal default/all features all targets','Hyperlimit all features all targets','Hypercurve svg all targets','Hypercircuit interchange all targets','Hypercircuit geometry/all curved_outline'],
 'docs_passed':['Hyperreal all features','Hyperlimit all features','Hypercurve svg','Hypercircuit interchange'],'format_passed':True,
 'cost_scope':cost['scope'],'cost_controls':ratios,'cost_layout_bytes':48,'cost_allocation_counts_and_outputs_match':True,'binary_bytes':{k:v['bytes'] for k,v in cost['binaries'].items()},'general_speedup_claimed':False,
 'cost_interpretation':'Functional correctness/completeness repair, not a performance optimization. In these instrumented controls the ratio of median candidate/parent times was about 1.159 for warm materialized pi signs, 1.146 for cold conversion and 1.059 for exact cloning; the trig-sign ratio was about 0.720. Warm conversion/clone ratios were about 0.971/0.976. All samples and the 3720-byte probe-executable growth are retained. These narrow results do not establish whole-workload performance.',
 'resource_contract':{'root_gib':16,'disk_b_gib':72,'tmp_gib':40,'logs_mib':96,'original_baselines_unchanged':True,'child_address_space_gib':8,'jobs':2,'focused_seconds':60,'compile_full_seconds':1800},
 'resource_limits':'The recognizer inspects at most 32 nodes, including leaf lookahead. This is not a bound on rational coefficient bytes or all import/refinement work. No arbitrary-graph internal total-work or heap bound is claimed; validation uses external containment. Retained native proofs use existing atomic fact storage.',
 'adverse_results':['Initial integration test used a private cache inspector; moved its graph assertions to unit tests, preserving the source and compiler failure.','Query-only proof candidate passed direct proofs but still failed bounded reciprocal composition and two lazy matrices; preserved source and all outcomes.','Root-ceiling setup stops launched no command; an open inventory was relocated with byte verification and a preserved path alias, without raising any ceiling.','The first final-source debug run was terminated by the 16 GiB root guard. External free-space recovery later allowed the identical frozen executable to complete under the original allowance; the proposed 17 GiB allowance was not applied.','Strict Clippy rejected an if-let return; an equivalent question-mark form passed the final complete checks.'],
 'remaining_limitations':['Malformed named-certificate consistency and arbitrary undefined graph domains remain open.','The earlier automatic reciprocal equality workflow remains open; this acceptance uses the previously declared explicit exact normal-form workflow.','The rejected boxed cache remains rejected and explicit affine subtraction remains withheld.','Full native workloads, all bindings, distribution/release and the complete pre-push workflow matrix were not rerun.','Raw evidence depends on the recorded Disk B retention location; historical missing artifacts were not reaudited or recovered.'],
 'command_records_verified':len(commands),'source_paths_verified':len(pins),'registry_paths_verified':len(registry),'new_runtime_admitted':True,'admitted_scope':'Lazy certificate queries and checked reduced-pi sine/tangent proof reuse through the tested compositions and interchange.','full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'all_adverse_results_retained':True,
 'next':'Validate named-certificate/graph consistency and undefined graph domains before reconsidering withheld affine cancellation; continue preserved strict workload and distribution acceptance.',
}
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{name:{k:r[k] for k in ['exit_code','elapsed_seconds','stops']} for name,r in commands.items()})
for src,name in [(W/'contract-v1.md','contract-v1.md'),(B/'proof-scope-v2.md','proof-scope-v2.md'),(W/'storage-placement-v1.md','storage-placement-v1.md'),(W/'tmp-contract-v3.json','tmp-contract-v3.json'),(B/'source-pins-v6.json.gz','source-pins-v1.json.gz'),(Path(__file__),'close_v1.py')]:shutil.copy2(src,E/name)
patch=[]
for path in sorted(implementation):
    before='' if path in new else git('show','HEAD:'+path).decode();patch.extend(difflib.unified_diff(before.splitlines(True),(O/path).read_text().splitlines(True),fromfile='a/'+path,tofile='b/'+path))
(E/'implementation.patch').write_text(''.join(patch))
(E/'README.md').write_text('''# Lazy certificate queries and native proof replay

Borrowed scalar queries now reconstruct an absent named payload while borrowing
existing graphs. Sine/tangent nodes retain a checked nonzero sign from a reduced
rational multiple of pi, and recover that proof on import. The shared proof is
also available to exact-sign queries. Bounded reducers can consume the retained
witness without an extra graph walk. No cache field or wire representation grew.

The reproduced lazy panics and cold reciprocal failures now pass the full
21-recipe JSON/CBOR matrices, signed scaling, cold/warm composition and reimport.
Independent range, pole, overflow, deep-graph and undefined-argument controls
verify conservative proof scope without numerical refinement. The original
query-only failure and test/lint setup errors remain in the evidence.

Final-source checks pass: 934 default and 1,062 all-feature scalar tests,
817 debug units, 24/29 scalar doctests, 366 predicate tests, 21 SVG tests,
60 circuit interchange tests and the recorded geometry/all-feature circuit
targets. Named strict Clippy, docs, formatting and Rust 1.95 checks pass.
Six matched scalar controls retain identical allocations, layout and
completed outputs. Their instrumented median times rise about 16% for warm
pi-sign queries, 15% for cold conversion and 6% for exact cloning; trig-sign
time falls about 28%. The probe executable grows by 3,720 bytes. All raw
samples remain available. This is a functional repair with measured costs,
and these narrow controls support no general speedup claim.

Raw logs, source versions and protocols are archived on Disk B; the large maps
and archive hashes are in external-evidence-v1.json. Every selected path is
hashed independently, including the explicitly recorded inventory alias.
Compiled outputs remain physically retained. Root/Disk B allowances remain
16/72 GiB; tmp is 40 GiB with its original baseline. Execution limits are
unchanged. Earlier missing files were neither reaudited nor recovered.

Malformed certificates, arbitrary undefined graph domains, automatic reciprocal
equality, full native workloads and the shipped distribution remain open.
The boxed cache remains rejected and affine subtraction withheld. Hypervoxel
is excluded. This is a bounded admission, not completion of the full plan or
the pre-push matrix; no push occurred.
''')
prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes();assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference);assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
assert 'lazy_certificate_proof_replay' not in current;current['updated_on']='2026-10-18'
current['lazy_certificate_proof_replay']={'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':str(expectations),'scalar_cargo':scalar['packages'],'debug_units_passed':817,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'compiler_floor':review['compiler_floor'],'runtime_admitted':True,'admitted_scope':review['admitted_scope'],'remaining_limitations':review['remaining_limitations'],'explicit_subtraction_candidate_admitted':False,'lazy_cache_candidate_admitted':False,'storage_baselines_reset':False,'disk_b_allowance_gib':72,'tmp_allowance_gib':40,'all_adverse_results_retained':True,'general_speedup_claimed':False,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'next':review['next']}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in {'.md','.py','.json'}:
        text=path.read_text();assert all(line==line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(text)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:r=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert r.returncode==0
record={'status':review['decision'],'checkpoint_kind':'lazy certificate query and native proof replay admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':sum(prior.get(p)==h for p,h in registry.items()),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':implementation,'restored_native_sha256':{p:h for p,h in previous['restored_native_sha256'].items() if p not in implementation},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'production_rust_sources_unchanged':False,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'explicit_subtraction_candidate_admitted':False,'lazy_cache_candidate_admitted':False,'required_opaque_payload_admitted':True,'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'external_evidence_sealed_separately':str(X),'inventory_path_alias':relocation,'prior_commit_verified_blobs':18,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':40,'disk_b_allowance_gib':72,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in stats.items():
    st=Path(path).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==state,path
assert all(sha(O/p)==h for p,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':True,'full_plan_complete':False}),flush=True)
