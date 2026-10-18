"""Apply the two reproduced frontier migrations after the initial driver finishes."""
import json, shutil
from pathlib import Path
OUT=Path(__file__).resolve().parents[1]
ROOT=OUT.parents[4]
initial=json.loads((OUT/'final-stages.json').read_text())
assert [(r['stage'],r['exit_code']) for r in initial['rows']]==[('qualify',1)]
assert all(r['source_unchanged'] for r in initial['rows'])
for name in ['final-stages','qualification-driver']:
 shutil.copy2(OUT/(name+'.json'),OUT/(name+'-initial.json'))
p=ROOT/'crates/hyperbrep/tests/support/measurement_admission.rs'
s=p.read_text();old='''            assert!(matches!(
                plane.planar_pcurve(&build(bowed)),
                Err(GeometryError::UnsupportedIntersection)
            ));'''
new='''            let bowed = build(bowed);
            assert!(plane.planar_pcurve(&bowed).unwrap().is_none());
            // Only the endpoints vanish: the positive interior Bernstein/B-spline
            // coefficient has positive basis support throughout the open domain.
            let CurveSurfaceIntersection::Points(contacts) =
                plane.intersect_curve(&bowed).unwrap()
            else {
                panic!("complete endpoint contacts");
            };
            assert_eq!(contacts.len(), 2);
            for (contact, endpoint, kind) in [
                (&contacts[0], bowed.domain().start(), CurveSurfaceContactKind::Simple),
                (&contacts[1], bowed.domain().end(), CurveSurfaceContactKind::Repeated),
            ] {
                assert_eq!(
                    contact.parameter.compare(&endpoint.clone().into()).unwrap(),
                    std::cmp::Ordering::Equal
                );
                assert_eq!(contact.kind, kind);
                assert_eq!(
                    contact.point.compare_linear_form(&Vector3::z(), &Real::zero()).unwrap(),
                    std::cmp::Ordering::Equal
                );
            }
            let middle = ((bowed.domain().start() + bowed.domain().end()) / Real::from(2))
                .unwrap();
            assert_eq!(
                bowed.point_at(&middle.into()).unwrap()
                    .compare_linear_form(&Vector3::z(), &Real::zero()).unwrap(),
                std::cmp::Ordering::Greater
            );'''
assert old in s;s=s.replace(old,new);p.write_text(s)
p=ROOT/'crates/hyperbrep/tests/support/parallel_profile_extrusion.rs';s=p.read_text();old='''    assert!(matches!(
        plane.intersect_curve(&image),
        Err(GeometryError::UnsupportedIntersection)
    ));''';new='''    // The entire finite planar image is now certified on its supporting plane.
    assert!(matches!(
        plane.intersect_curve(&image).unwrap(),
        CurveSurfaceIntersection::Contained
    ));
    assert!(plane.planar_pcurve(&image).unwrap().is_some());'''
assert old in s;s=s.replace(old,new);p.write_text(s)
p=ROOT/'crates/hyperbrep/README.md';s=p.read_text().replace('\n\n\nFinite curve/plane', '\n\nFinite curve/plane');p.write_text(s)
p=OUT/'analysis-recipes/qualify.py';s=p.read_text();line="    ('curve-subdivision', ['cargo', 'test', *C, '--release', '-p', 'hypercurve', '--all-features', '--lib', 'curve_subdivision::tests'], {}, 1800),\n";assert "('curve-subdivision'" not in s;s=s.replace("    ('curve-winding',",line+"    ('curve-winding',");p.write_text(s)
p=OUT/'analysis-recipes/archive_sources.py';s=p.read_text().replace('9b571e056aa87aa2c3fad6000c6fed282d4d511f','f88e9882b87a9c969237c5d54388d888a9c99f32');p.write_text(s)
p=OUT/'analysis-recipes/consumer_costs.py';s=p.read_text();s=s.replace("  item['matched_contract']=True\n  item['ratio']=item['candidate']['elapsed_ns']/item['baseline']['elapsed_ns']",'''  migrations = {
   ('measurement','planar_spline_incidence_does_not_require_low_degree_root_solving'): 'Baseline noncontained high-degree planar_pcurve rejected UnsupportedIntersection; candidate requires exact None, complete two endpoint contacts and independent positive interior witness.',
   ('planar','planar_image_limits_and_typed_frontiers_recover'): 'Baseline planar image/plane query rejected UnsupportedIntersection; candidate requires exact Contained and a complete planar pcurve. Other selected-domain and metric blockers remain.'
  }
  item['matched_contract']=(cohort,r['case']) not in migrations
  item['ratio']=item['candidate']['elapsed_ns']/item['baseline']['elapsed_ns'] if item['matched_contract'] else None
  if not item['matched_contract']:
   item['migration']=migrations[(cohort,r['case'])]''');s=s.replace('66 unchanged contracts; original full assertions, iterations, outcomes and materialization.', '64 unchanged contracts and two explicit capability migrations without ratios; original full fixtures, iterations and materialization.');p.write_text(s)
