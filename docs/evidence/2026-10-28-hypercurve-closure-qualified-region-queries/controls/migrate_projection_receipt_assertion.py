from pathlib import Path
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'

def snapshot(name):
    spec=importlib.util.spec_from_file_location('e_'+name.replace('-','_'),r/name/'scripts/successive-operations.py')
    e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
    return e.source_snapshot()

names=['empty-native-replay','qualified-region-queries','qualified-region-adapters']
before={name:snapshot(name) for name in names}
assert json.loads((c/'empty-native-replay-qualification-empty4/complete.json').read_text())['all_passed']
for name,attempt in [('qualified-region-queries','query5'),('qualified-region-adapters','adapter3')]:
    rows=json.loads((c/(name+'-qualification-'+attempt)/'results.json').read_text())
    assert rows[-1]['name']=='full-root' and rows[-1]['exit_code']==101
    assert before[name][0]==json.loads((c/(name+'-qualification-'+attempt)/'source-after.json').read_text())
baseline=c/'empty-projection-receipt-baseline1'
assert before[names[0]][0]==json.loads((baseline/'source-after.json').read_text())
assert json.loads((baseline/'results.json').read_text())[0]['exit_code']==101
old_files={name:(r/name/'src/curve/native.rs').read_text() for name in names}
assert old_files[names[0]]==old_files[names[1]]
assert old_files[names[1]].partition('#[cfg(test)]')[2]==old_files[names[2]].partition('#[cfg(test)]')[2]
old='''        let region = hypercurve::provisional(|| {
            CurveRegion2::try_from_boundary_paths(&[path], hypercurve::FillRule::EvenOdd)
        })
        .into_unverified()
        .unwrap();

        let strict = try_finite_profiles(&region, &GeometryContext::STRICT).unwrap();
        assert_eq!(strict.certainty, crate::GeometryCertainty::Certified);
        assert_eq!(strict.value.len(), 1);

        let permissive =
            try_finite_profiles(&region, &GeometryContext::APPROXIMATE_512).unwrap();
        assert_eq!(permissive.certainty, crate::GeometryCertainty::Certified);
        assert_eq!(permissive.value.len(), 1);'''
new='''        let constructed = hypercurve::provisional(|| {
            CurveRegion2::try_from_boundary_paths(&[path], hypercurve::FillRule::EvenOdd)
        });
        assert_eq!(constructed.certainty(), hypercurve::CurveCertainty::Approximate512Consumed);
        let region = constructed.into_unverified().unwrap();
        // Reuse the retained loop topology while preserving the consumed
        // closure receipt, including after an authorized warm-cache read.
        for context in [
            GeometryContext::STRICT,
            GeometryContext::APPROXIMATE_512,
            GeometryContext::STRICT,
            GeometryContext::APPROXIMATE_512,
            GeometryContext::STRICT,
        ] {
            let profiles = try_finite_profiles(&region, &context);
            if context == GeometryContext::STRICT {
                let error = profiles.unwrap_err();
                assert_eq!(error.kind(), crate::errors::ValidationErrorKind::Undecided);
                assert!(matches!(error,
                    ValidationError::ExactCurve(hypercurve::ExactCurveError::Blocked(reason))
                        if reason.reason() == hypercurve::UncertaintyReason::Predicate));
            } else {
                let profiles = profiles.unwrap();
                assert_eq!(profiles.certainty, crate::GeometryCertainty::Approximate512Consumed);
                assert_eq!(profiles.value.len(), 1);
                assert!(profiles.value[0].holes().is_empty());
                assert!(profiles.value[0].material().is_closed());
            }
        }'''
addition='''## Finite profile projection retains topology certainty

Both finite profile projection APIs and CSGRS `try_finite_profiles` validate
the input region's retained normalization policy before using an empty result
or cached loop topology. An approximate closure or normalization therefore
remains `Approximate512Consumed` under explicitly authorized projection;
strict reuse returns a typed `Predicate` blocker unless the source claim has
a strict proof. Reusing topology avoids recomputation but does not upgrade
its certainty. This applies to nonempty profiles as well as empty results.

The existing terminal-closure profile fixture keeps its original source and
single-profile expectation. It now checks the construction receipt, strict
rejection, authorized qualified readback and repeated policy transitions.
Projection remains a boundary product with its declared sampling and coordinate
loss model; its validity does not certify fidelity to the original source.

'''
for name in names:
    (c/(name+'-before-projection-migration.patch')).write_bytes(before[name][2])
    old_s=old_files[name];assert old_s.count(old)==1
    new_s=old_s.replace(old,new)
    assert new_s.partition('#[cfg(test)]')[0]==old_s.partition('#[cfg(test)]')[0]
    (r/name/'src/curve/native.rs').write_text(new_s)
    p=r/name/'docs/MIGRATIONS.md';s=p.read_text();needle='## Exact empty SVG documents\n';assert s.count(needle)==1 and addition not in s;p.write_text(s.replace(needle,addition+needle))
    subprocess.run(['cargo','+1.99.1','fmt','--all'],cwd=r/name,check=True)
    after,files,_=snapshot(name);old_map={x[0]:x[1:] for x in before[name][1]};changed=sorted(x[0] for x in files if old_map.get(x[0])!=x[1:]);assert changed==['docs/MIGRATIONS.md','src/curve/native.rs']
    assert (r/name/'src/curve/native.rs').read_text().partition('#[cfg(test)]')[0]==old_s.partition('#[cfg(test)]')[0]
    (c/(name+'-projection-migration-applied.json')).write_text(json.dumps({'before':before[name][0],'after':after,'changed_paths':changed,'production_bytes_unchanged':True,'epoch':time.time(),'reason':'An existing finite-profile assertion discarded approximate loop-closure history. The explicit migration preserves original source and one-profile geometry while requiring typed strict rejection and authorized inherited receipt, including warm-cache policy reentry.'},indent=2)+'\n')
    print(name,after,flush=True)
