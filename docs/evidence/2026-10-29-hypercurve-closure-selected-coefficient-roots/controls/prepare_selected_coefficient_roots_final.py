from pathlib import Path
import importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-coefficient-roots'
owner=json.loads((c/'selected-coefficient-roots-owners-1/complete.json').read_text());assert owner['all_passed'] and owner['groups']==3
focus=json.loads((c/'selected-coefficient-roots-fix2/complete.json').read_text());lint=json.loads((c/'selected-coefficient-roots-preflight-2/complete.json').read_text());assert focus['all_passed'] and lint['exit_code']==0 and lint['source_stable'];assert owner['source']==focus['source']==lint['source']
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e);assert e.source_snapshot()[0]==owner['source']
# The existing hard fixture and all prior regression files keep their assertions.
f=w/'crates/hypercurve/tests/selected_coefficient_roots.rs';s=f.read_text();assert 'fn selected_coefficient_roots_survive_restriction' not in s
extra=(c/'selected-coefficient-roots-final-tests.rs').read_text();extra=extra.replace('assert_eq!(replay.affine_form','assert!(replay.affine_form').replace('.coincides_with(&point).unwrap(), true);','.coincides_with(&point).unwrap());');f.write_text(s+extra)
f=w/'crates/hypercurve/tests/svg_point_replay.rs';s=f.read_text();extra=(c/'selected-coefficient-roots-svg-wire-tests.rs').read_text().replace('wire_real(&mut bytes, &lower);','wire_real(&mut bytes, lower);').replace('wire_real(&mut bytes, &upper);','wire_real(&mut bytes, upper);');assert 'fn selected_coefficient_root_records_validate' not in s;f.write_text(s+extra)
f=w/'crates/hypercurve/CHANGELOG.md';s=f.read_text();anchor='## [0.4.0] - Unreleased\n';assert s.count(anchor)==1;s=s.replace(anchor,anchor+'''
- Retain singleton polynomial roots whose coefficients are exact point queries,
  including independent selected fields, repeated factors and algebraic data.
  The generated point keeps every coefficient source and original denominator
  through further evaluation, rational derivatives and native replay.
- SVG point graphs and HyperBRep selected-parameter graphs preserve these
  coefficient dependencies. Replay validates selectors, references and guards;
  repeated coefficient constructions share archive records.
''');s=s.replace('### Breaking\n','''### Breaking

- `CurvePointDefinition2` gains `SelectedPolynomialRoot`; exhaustive matches
  must handle the new variant. SVG point tag 28 and the corresponding HyperBRep
  planar record require a reader with selected-coefficient root support.
''',1);f.write_text(s)
f=w/'crates/hypersolve/CHANGELOG.md';s=f.read_text();assert s.count(anchor)==1;s=s.replace(anchor,anchor+'''
- Evaluate polynomial coefficients from admitted selected fields at represented
  scalars without projecting their dependencies. Exact arithmetic reuses stored
  zero and unit identities after field alignment; division still validates its
  denominator before publishing an admitted value.
''');f.write_text(s)
f=w/'docs/MIGRATIONS.md';s=f.read_text();anchor='## Polynomial fibers over retained query parameters';assert s.count(anchor)==1;s=s.replace(anchor,'''## Polynomial roots with retained coefficient queries

`CurvePointDefinition2::SelectedPolynomialRoot` defines the point `(z, 0)`
from ascending `CurvePointRationalForm2` coefficients and a singleton root
selector. Exhaustive matches on the definition enum must handle this variant.
Keep each original query and its denominator, including zero coefficients;
extracting independent scalar coordinates is neither required nor equivalent.
A nonexact selector is an open interval containing exactly one distinct root.
An exact root must equal both bounds and satisfy a nonzero equation. The supplied
root-count field is not trusted. Invalid selectors and equations remain errors;
undecided predicates and reached resource limits remain typed blockers.

Native SVG path graph version 4 adds selected-coefficient point tag 28. Each
coefficient references a point definition and carries its original numerator
and denominator. HyperBRep format 14 adds `SelectedPolynomialRoot`, whose
coefficients reference checked rational-query records in the selected-parameter
graph. Older readers can reject these new variants; existing records keep their
meaning and encoding. Replay validates all references, original guards and the
root selection. Repeated coefficient sources use shared graph dependencies.

This extends exact points and their consumers. It does not establish general
implicit-region offsets, corner edits or a total work/memory bound.

'''+anchor);f.write_text(s)
f=w/'crates/hypercurve/FUTURE_WORK.md';s=f.read_text();assert '## Selected-coefficient root points' not in s;s+='''

## Selected-coefficient root points (P2/P18-P20/P26/P36)

The selected-coefficient root increment is in qualification. Hypercurve owns
source-bound coefficient recipes and selected point definitions; Hypersolve
owns common-field embeddings, exact polynomial evaluation and singleton root
selection. HyperBRep and SVG retain those definitions through native replay.
The admitted representation is `(z,0)` for a finite nonzero polynomial whose
coefficients are retained point queries. An open singleton isolator or a checked
represented exact root selects z. Original coefficient denominators remain
part of the source recipe, including zero and trailing coefficients. Repeated
factors are retained; no degree cap or independent coordinate projection is
introduced. Broader symbolic coefficients still require exact decisions.

The original missing-API witness combines independent positive selections
8a^2=1 and 17b^5=1, selects z^3+a*z-b=0, replays the definition, then consumes
it through y^2=x and y=x^2 and proves equality with z. The first draft exceeded
its 180-second external test cap. Progress-only diagnostics completed the same
assertions in 195.59 and 191.30 seconds, with the final equality dominating.
Reusing certified zero/unit values after field alignment made the unchanged
fixture complete in 15.62 seconds in the focused run. These are individual raw
measurements, not a universal performance claim. External timeout is not a
kernel resource-exhaustion result. Original unsuccessful records are retained.

Focused witnesses also cover repeated/opposite roots, degree seventeen,
nonmonic equations, exact and invalid selectors, roots separated by 10^-12,
original pole guards, exhausted-budget retry, and fresh-process SVG replay into
rational derivatives. Native HyperBRep witnesses check cold further geometry,
invalid graph references/selectors/guards, metadata limits and repeated shared
coefficient dependencies. Definition identity only accelerates serialization;
the encoder owns its memoized inputs until that one encoding finishes.

The current seven implicit-region offset/chamfer/fillet frontier fixtures remain
unsupported. Circle-section controls on the original polynomial boundaries do
succeed, including endpoints without a coordinate view. These observations
motivate the coefficient carrier; they do not complete those operations.
Promotion and root-refinement counters are not total work, coefficient growth,
expression size, retained/temporary memory or cancellation bounds. Broad
qualification, final evidence admission and full pre-push checks are separate
gates; this entry alone is not implementation evidence.
''';f.write_text(s)
f=w/'crates/hypercurve/qualification/capabilities.json';catalog=json.loads(f.read_text());assert len(catalog['fixtures'])==316
common={'owner':'Hypercurve selected coefficient point definitions and native graph replay; Hypersolve common fields, polynomial roots and exact arithmetic','properties':['P2','P14','P18','P19','P20','P26','P36'],'origins':['authored','generated','selected_implicit'],'families':['ImplicitPolynomial','RationalBezier'],'policies':['STRICT'],'semantics':'Retain the original source coefficient queries, denominator guards and singleton selection through subsequent exact operations. Named witnesses do not establish general implicit-region operations or a total resource bound.','timeout_seconds':180}
cases=[
('composition','selected_coefficient_root_preserves_its_equation_and_feeds_geometry','Independent positive a,b satisfy 8a^2=1 and 17b^5=1; z^3+a*z-b=0 in (1/2,3/4).','evaluation','exact_success','Definition replay, y^2=x and y=x^2 consume the selected root and recover z.','Original source equations, strict monotonicity of the cubic and exact equality with the original selected value.'),
('repeated','selected_coefficient_roots_keep_repeated_factors_and_opposite_selections','(z^2-a)^2 with 8a^2=1,a>0, opposite singleton selectors and a trailing zero.','representation','exact_success','Both distinct selected roots satisfy z^2=a, sum to zero and retain the original repeated relation.','Independent factorization; the broad interval containing both roots is invalid.'),
('degree17','selected_coefficient_roots_keep_degree_seventeen_and_nonmonic_relations','3z^17=a with selected a>0,8a^2=1 and z in (0,1).','evaluation','exact_success','The root satisfies the original nonmonic equation and feeds an exact affine point and inverse query.','Original relation and independently derived linear image identity 3X-2Y=5.'),
('selectors','selected_coefficient_roots_check_exact_roots_and_invalid_selectors','Selected coefficient a and a(z-1), including forged exact values/bounds, empty/zero/constant equations and absent roots.','representation','invalid','Only the exact root 1 with matching bounds succeeds; invalid singleton descriptions are rejected.','Independent exact value 1 and nonzero equation; interval/root/zero-equation counterexamples.'),
('near_roots','selected_coefficient_roots_distinguish_close_roots_without_tolerance','a(z-1)(z-1-10^-12), selected a>0 and disjoint rational isolators.','incidence_order','exact_success','The two points remain distinct and their difference is exactly 10^-12.','Independently factored polynomial and exact rational separation.'),
('guards_budget','selected_coefficient_roots_retain_zero_coefficient_guards_and_retry_after_exhaustion','z^2-1 with a zero coefficient guarded by y^2-1 at y=2; zero shared work budget and a later unrestricted retry.','resource_recovery','exhausted','The zero budget reports BudgetExhausted; retry succeeds and the retained original guard rejects y=1.','Original denominator, exact root 1 and a declared reached shared work limit.'),
('cold_replay','selected_coefficient_roots_replay_in_a_fresh_process_and_feed_derivatives','Positive z^4=1/8 obtained from z^2=a,8a^2=1, serialized as a retained line endpoint.','exact_replay','exact_success','Fresh-process replay proves the original fourth-power relation and feeds exact rational derivatives; depth limits reject early.','Independent fourth-power equation and derivative (1,2z); byte equality is checked separately.'),
('transforms','selected_coefficient_roots_survive_restriction_reversal_and_similarity','Selected z>0,z^4=1/8 used in C(t)=(t,t^2), restriction, reversal and a rotation with scale two.','transforms','exact_success','Source endpoints, transformed coordinates, definition replay and a further affine construction retain the same selected root with certified certainty.','Independent parabola equation and inverse similarity coordinates.'),
]
for id,test,domain,stage,outcome,assertion,oracle in cases:
 row={**common,'id':'selected_coefficient_'+id,'target':'selected_coefficient_roots','test':test,'domain':domain,'claims':[{'stage':stage,'outcome':outcome,'assertion':assertion}],'oracle':oracle}
 if id=='transforms':row['policies']=['STRICT','APPROXIMATE_512']
 catalog['fixtures'].append(row)
catalog['fixtures'].append({**common,'id':'selected_coefficient_native_validation','target':'svg_point_replay','test':'selected_coefficient_root_records_validate_source_guards_and_selection','domain':'Native tag28 with wrong-kind, self and forward point references, zero denominator, absent or multiple roots, and a valid positive square root.','claims':[{'stage':'exact_replay','outcome':'invalid','assertion':'Malformed references and invalid construction records are rejected even when unused; the valid selector proves z^2=2,z>0.'}],'oracle':'Independently encoded wire records and the original square-root equation.'})
f.write_text(json.dumps(catalog,indent=2)+'\n')
subprocess.run(['cargo','fmt','--all'],cwd=w,check=True)
for cmd in [['git','diff','--check'],['typos'],['scripts/check-repository-budget.sh'],['python3','crates/hypercurve/scripts/test_capability_matrix.py']]:
 result=subprocess.run(cmd,cwd=w,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
 (c/('selected-coefficient-roots-final-prep-'+cmd[0].replace('/','_')+'.log')).write_text(result.stdout)
 assert result.returncode==0,result.stdout
source,files,patch=e.source_snapshot();e.save_json(c/'selected-coefficient-roots-final-source.json',source)
e.save_json(c/'selected-coefficient-roots-final-preparation.json',{'source':source,'prior_focus_and_owners_passed':True,'capability_rows':len(catalog['fixtures']),'epoch':time.time()})
print(json.dumps(source,indent=2))
