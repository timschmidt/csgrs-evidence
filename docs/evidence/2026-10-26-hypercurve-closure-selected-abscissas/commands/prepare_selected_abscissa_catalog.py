from pathlib import Path
import json
checkout=Path('/tmp/hypercurve-closure-selected-abscissas')
p=checkout/'crates/hypercurve/qualification/capabilities.json'
catalog=json.loads(p.read_text())
assert len(catalog['fixtures'])==56

def claim(stage,assertion,outcome='exact_success'):
 return {'stage':stage,'outcome':outcome,'assertion':assertion}
rows=[
('cubic_control','polynomial_branch_consumes_retained_rational_abscissa','C(t)=(t^3,t^2), selected at y=1/2, evaluated on the positive polynomial branch y^3=x^2.',[claim('evaluation','The unmaterialized source point and branch evaluation coincide after original sources are dropped; y remains exactly 1/2.')],'Independent cubic relation and selected ordinate.'),
('fifth_degree_control','polynomial_branch_consumes_fifth_degree_rational_abscissa','C(t)=(t^2,t^5), selected at y=1/2, evaluated on the positive branch y^2=x^5.',[claim('evaluation','The branch consumes the retained source X, satisfies 4x^5=1 and retains y=1/2 after source drop.')],'Independent fifth-degree equation, exact ordinate and shared-point comparison.'),
('generic_quintic','polynomial_branch_consumes_generic_quintic_abscissa_without_projection','C(t)=(t^2,-t), with t selected by t^5+t^2+5t-5=0 on [0,1], and branch y^5+5y+5-x=0.',[claim('representation','The exact source point has no represented coordinates and its X has no ordinary Bezier parameter view.'),claim('evaluation','The polynomial branch evaluates that retained X to the original point after sources are dropped.')],'Original independent quintic and parabola equations plus the representation assertion.'),
('repeated_coordinate','selected_abscissa_reuses_its_output_coordinate','The generic quintic evaluated through four successive extractions of its output X, with checked in-memory point-definition replay in each iteration.',[claim('evaluation','Every new coordinate is consumed without changing the selected point or its quintic relation.')],'Repeated reuse and replay of defining relations; this is not native archive replay.'),
('denominator_guards','selected_abscissa_preserves_rational_denominators','A lower circular point with rational coordinates (1-t^2,-2t)/(1+t^2) at the selected generic quintic parameter, under either sign of the common weight.',[claim('evaluation','Both denominator signs yield the selected negative circular branch and survive checked point replay.'),claim('representation','A denominator vanishing at the selected parameter remains invalid even with matching removable numerator factors.','invalid')],'Independent unit-circle equation, negative Y, same-point comparison and typed pole rejection.'),
('branch_order','selected_abscissa_keeps_the_ordered_branch','Both selected branches of y^2=x at the generic source X=t^2.',[claim('evaluation','Ordered negative and positive fibers stay distinct; their ordinates are exactly -t and t.')],'Parabola equation, exact opposite ordinate relation and selected signs.'),
('restrictions_transforms','selected_abscissa_keeps_restrictions_and_transforms','The generic quintic restricted to [1/4,3/4], reversed and mapped by (x,y)->(3-y,4+x).',[claim('restriction_reconstruction','Restriction and reversal preserve evaluation at the retained abscissa.'),claim('transforms','The mapped evaluation satisfies an independently expanded world quintic.'),claim('evaluation','Both represented and retained parameters outside the active interval remain invalid.','invalid')],'Independent transformed equation, exact point transformation and explicit interval exclusions.'),
('retry','selected_abscissa_retries_after_exhaustion','The generic retained-X branch query under zero counted work, a 100000-refinement/100000-promotion retry, then STRICT/APPROXIMATE_512/STRICT.',[claim('evaluation','A reached zero allowance returns BudgetExhausted.','exhausted'),claim('resource_recovery','The larger retry succeeds; all policy transitions retain Certified results satisfying the quintic.')],'Reached counters, typed error, defining relation and certainty receipts.'),
('zero_distance','selected_abscissa_consumes_zero_distance_source_definition','A retained zero-distance quadratic parallel C(t)=(t^2,-t) at the generic quintic parameter.',[claim('representation','The source remains a Parallel point definition with no ordinary X parameter view.'),claim('evaluation','The original quintic branch consumes its exact rational-source coordinate.')],'Representation assertion, quintic and parabola equations and exact point identity.'),
('changed_nearby','selected_abscissa_distinguishes_changed_sources_and_nearby_values','Two source selections from t^5+t^2+5t-5 and t^5+t^2+5t-4, plus an exact 2^-80 shift in the first selected X.',[claim('evaluation','The negative parabola branch preserves both distinct base selections and the positive tiny coordinate separation.')],'Independent parabola equation, original-source equality, exact ordering and noncoincidence.')]
for suffix,test,domain,claims,oracle in rows:
 catalog['fixtures'].append({'id':'implicit_selected_abscissa_'+suffix,'target':'polynomial_selected_abscissas','test':test,'owner':'Hypercurve polynomial branch fibers and retained scalar charts; Hypersolve exact polynomial substitution','properties':['P15','P18','P19','P20'],'domain':domain,'origins':['authored','selected_implicit','generated'],'families':['ImplicitPolynomial','QuadraticBezier','CubicBezier','RationalBezier','AnalyticParallel'],'policies':['STRICT','APPROXIMATE_512'] if suffix=='retry' else ['STRICT'],'semantics':'A rational abscissa over one selected base is pulled back before fiber isolation. Its original denominator remains guarded and the original slab owns the ordered branch selection. These are named fixtures, not general nested-fiber, filled-region or native archive closure. Counted work and external timeouts do not bound all arithmetic or memory.','claims':claims,'oracle':oracle,'timeout_seconds':300})
assert len(catalog['fixtures'])==66
p.write_text(json.dumps(catalog,indent=2)+'\n')
p=checkout/'crates/hypercurve/qualification/README.md'
s=p.read_text(); marker="The driver obtains executables from Cargo's artifact messages"
assert marker in s
paragraph='''The selected-abscissa witnesses require polynomial branches to consume retained
rational coordinates over one selected algebraic parameter. They preserve the
generic quintic failure alongside radical and fifth-root controls. Output X
coordinates are repeatedly consumed, with branch order, both denominator signs,
original pole guards, restrictions, transforms, distinct selections and exact
nearby values checked separately. Zero counted allowance and a larger retry keep
explicit outcomes. General dependent-fiber charts, filled-region operations and
fresh-process generated archive replay remain unqualified.

'''
p.write_text(s.replace(marker,paragraph+marker,1))
print('Added ten selected-abscissa witnesses; total 66.')
