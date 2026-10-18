"""Prepare circle-envelope semantic controls and correct the broad profile label."""
import collections,gzip,hashlib,json,re,sys
from pathlib import Path
sys.dont_write_bytecode=True
W=Path(__file__).resolve().parent;N=W.parent;O=N.parent/'csgrs';S=N/'point-rational-native-facts-source-v1'
def sha(p):
    with Path(p).open('rb') as f:return hashlib.file_digest(f,'sha256').hexdigest()
def dump(p,value):
    assert not p.exists();p.write_text(json.dumps(value,indent=2,sort_keys=True)+'\n')
prev=json.loads((N/'exact-track-inline-control-v1/preparation-v1.json').read_text());observed=json.loads((N/'exact-track-inline-profile-v2/observations-v1.json').read_text());stacks=N/'logs/exact-track-inline-profile2-stacks-v1/stdout';assert sha(stacks)==observed['stacks_sha256']
groups={
 'actual_subdivision':['<hypercurve::bezier_split::BezierSubcurve2>::subcurve_between_exact','<hypercurve::rational_bezier::RationalQuadraticBezier2>::subcurve_between_exact_native'],
 'support_bounds':['hypercurve::curve_support::subcurve_certified_outer_bounds'],
 'contact_relation':['hypercurve::bezier_region::point_location::subcurve_relation_to_line_with_contacts'],
 'line_image_recognition':['hypercurve::curve_region_boolean::subcurve_is_strict_line_image'],
 'point_hull_filters':['hypercurve::bezier_region::point_location::subcurve_control_hull_strict_order','hypercurve::bezier_region::point_location::subcurve_control_hull_contains_point','hypercurve::bezier_region::point_location::subcurve_control_hull_may_be_ahead'],
 'subcurve_containment':['hypercurve::bezier_region::point_location::subcurve_contains_point']}
weights=collections.Counter();overlaps=collections.Counter();total=0
blocks=stacks.read_text().strip().split('\n\n')
for b in blocks:
 lines=b.splitlines();m=re.match(r'^\S+\s+\d+/\d+\s+[0-9.]+:\s+(\d+) cycles:u:',lines[0]);assert m;period=int(m[1]);total+=period
 frames={re.match(r'\s+[a-f0-9]+ (.*?) \((.*)\)$',line)[1] for line in lines[1:]}
 for name,symbols in groups.items():
  if frames.intersection(symbols):
   weights[name]+=period
   if any('pi_laurent_polynomial' in f for f in frames):overlaps[name]+=period
assert total==observed['total_sample_period'] and len(blocks)==observed['samples']
correction={'helper_sha256':sha(Path(__file__)),'source_profile_observations_sha256':sha(N/'exact-track-inline-profile-v2/observations-v1.json'),'source_stacks_sha256':sha(stacks),'samples':len(blocks),'total_sample_period':total,'supersedes':'E70 prose equating the ::subcurve substring with subdivision; raw counts and profile remain valid and unchanged','original_broad_substring':'::subcurve','original_broad_inclusive_percent':observed['groups']['native_subcurve']['inclusive_percent'],'groups':{n:{'exact_symbols':s,'period':weights[n],'inclusive_percent':100*weights[n]/total,'normal_form_overlap_period':overlaps[n],'normal_form_overlap_percent':100*overlaps[n]/total} for n,s in groups.items()},'limits':'Inclusive recovered-symbol groups overlap and omit inlined/missing frames. These are sampled cycle weights, not calls, allocations or predicted speedups.'}
dump(W/'attribution-correction-v1.json',correction)
path='crates/hypercurve/src/curve_support.rs';original=(O/path).read_text();assert sha(S/path)==sha(O/path)
tests='''

    #[test]
    fn retained_circle_envelopes_contain_independent_exact_points() {
        let q = |n, d| (Real::from(n) / Real::from(d)).unwrap();
        for radius in [
            Real::one(),
            q(1, 7),
            Real::from(3).sqrt().unwrap(),
            "1e-400".parse::<Real>().unwrap(),
            "1e400".parse::<Real>().unwrap(),
        ] {
            for center in [
                Point2::from_values(17, -23),
                Point2::new("1e20".parse().unwrap(), Real::pi()),
            ] {
                let right = Point2::new(center.x() + &radius, center.y().clone());
                let top = Point2::new(center.x().clone(), center.y() + &radius);
                for reversed in [false, true] {
                    let (start, end) = if reversed {
                        (top.clone(), right.clone())
                    } else {
                        (right.clone(), top.clone())
                    };
                    let arc = crate::CircularArc2::try_from_center(
                        start, end, center.clone(), reversed,
                    ).unwrap();
                    let decomposition = arc.rational_bezier_decomposition().unwrap();
                    assert_eq!(decomposition.spans().len(), 1);
                    let quadratic = decomposition.spans()[0].curve().clone();
                    let elevated = RationalBezier2::from(quadratic.clone())
                        .elevated_to_degree(5).unwrap();
                    for curve in [
                        BezierSubcurve2::RationalQuadratic(quadratic),
                        BezierSubcurve2::Rational(elevated),
                    ] {
                        assert!(retained_circular_support(&curve).is_some());
                        for (predicate, policy) in [
                            (crate::PredicatePolicy::STRICT, CurveContext::STRICT),
                            (crate::PredicatePolicy::APPROXIMATE_512, CurveContext::APPROXIMATE_512),
                            (crate::PredicatePolicy::STRICT, CurveContext::STRICT),
                        ] {
                            let evaluated = crate::evaluate_under(predicate, || {
                                CurveSupport2::Bezier(curve.clone()).certified_outer_bounds(
                                    &CurveParameterRange2::unit(), 0, &policy,
                                )
                            });
                            let bounds = decided(evaluated.certified().expect("certified envelope"));
                            // Independent Pythagorean triples specify points on the
                            // quarter circle, without evaluating the Bezier formula.
                            for (x, y, denominator) in [
                                (1, 0, 1), (0, 1, 1), (3, 4, 5), (4, 3, 5),
                                (5, 12, 13), (12, 5, 13),
                            ] {
                                let point = Point2::new(
                                    center.x() + &radius * q(x, denominator),
                                    center.y() + &radius * q(y, denominator),
                                );
                                assert_eq!(
                                    bounds.contains_point_with_policy(&point, &policy),
                                    Classification::Decided(true),
                                );
                            }
                        }
                    }
                }
            }
        }
    }

    #[test]
    fn generic_support_bounds_keep_their_non_circular_extent() {
        let curve = BezierSubcurve2::Quadratic(QuadraticBezier2::new(
            Point2::from_values(0, 0),
            Point2::from_values(2, 10),
            Point2::from_values(4, 0),
        ));
        assert!(retained_circular_support(&curve).is_none());
        for policy in [CurveContext::STRICT, CurveContext::APPROXIMATE_512] {
            let bounds = decided(CurveSupport2::Bezier(curve.clone()).certified_outer_bounds(
                &CurveParameterRange2::unit(), 0, &policy,
            ));
            for point in [Point2::from_values(0, 0), Point2::from_values(2, 5), Point2::from_values(4, 0)] {
                assert_eq!(bounds.contains_point_with_policy(&point, &policy), Classification::Decided(true));
            }
            assert_eq!(bounds.contains_point_with_policy(&Point2::from_values(5, 0), &policy), Classification::Decided(false));
        }
    }
'''
assert original.endswith('}\n');out=W/'baseline-overlay'/path;out.parent.mkdir(parents=True);out.write_text(original[:-2]+tests+'}\n')
meta={'helper_sha256':sha(Path(__file__)),'contract_sha256':sha(W/'contract-v1.md'),'baseline_revision':'8c361463f3b0bd745aa3bb1f32571ab49beca771','source_root':str(S),'source_inventory':str(N/'point-rational-native-facts-source-v1.json.gz'),'source_inventory_sha256':sha(N/'point-rational-native-facts-source-v1.json.gz'),'inherited_overlays':prev['overlays'],'baseline_overlay':{path:{'physical_path':str(out),'original_sha256':sha(O/path),'sha256_before_format':sha(out)}},'new_tests':2,'production_change_prepared':False,'attribution_correction_sha256':sha(W/'attribution-correction-v1.json')}
dump(W/'baseline-preparation-v1.json',meta)
print(json.dumps({'new_tests':2,'actual_subdivision_percent':correction['groups']['actual_subdivision']['inclusive_percent'],'actual_subdivision_normal_form_overlap_percent':correction['groups']['actual_subdivision']['normal_form_overlap_percent'],'support_bounds_percent':correction['groups']['support_bounds']['inclusive_percent'],'source':str(out)}))
