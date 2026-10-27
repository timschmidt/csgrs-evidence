from pathlib import Path
import json
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-fiber-point-order')
(root/'fiber-point-order-direction-replay-contract.json').write_text(json.dumps({
'owner':'Retained chord unit-direction evidence and HCP4 replay',
'properties':['P19','P20','P27','P29'],
'baseline':'Prototype3 all geometric assertions, negative denominators/poles and budget retry pass; reflected oblique circle complete SVG determinism fails. Exact metadata and viewBox are identical. The recorded projection probe shows stable repeated source output, changed cold replay, and unchanged cold/warm replay after query.',
'cause':'Native writer omits every represented-endpoint direction. Reflected (3,4) frame transported by sqrt(2) retains the rational unit vector(-3/5,4/5), while ordinary endpoint normalization re-establishes an equal but expanded radical expression. Reader also returns its old vector upon value equality, discarding the checked input representation.',
'fix_contract':'Omit a stored direction only when the ordinary owner reconstructs the same serialized scalar definition. Semantic equality remains the proof of direction; byte identity is used only to decide whether encoding can safely omit a definition. Retain the validated incoming components on read even if an existing vector is equal in value. Reuse existing exact unit-length, parallelism and orientation checks.',
'acceptance':'Keep the original complete SVG assertion, all prior replay fixtures including the alternative chord chart, and wrong/nonunit/reversed unit-direction rejections. No new wire tag or geometric approximation.'},indent=2)+'\n')
p=checkout/'crates/hypercurve/src/bezier_offset/algebraic_chord/replay.rs';s=p.read_text()
a=s.index('        if self.start().coordinates().is_some()');b=s.index('\n    }',a)
s=s[:a]+'''        let tangent = self.data.certified_unit_tangent.as_deref()?;
        if self.start().coordinates().is_some()
            && self.end().coordinates().is_some()
            && let Some((x, y)) = strict_common_retained_line_unit_tangent(
                self.start(), self.end(), self.data.parameter_axis, &CurveContext::STRICT,
            )
            && x.to_bytes() == tangent[0].to_bytes()
            && y.to_bytes() == tangent[1].to_bytes()
        {
            // Definition equality is an encoding optimization only. Equal
            // values can use different exact expressions and project through
            // different finite enclosures, so value equality cannot omit the
            // transported definition needed for deterministic replay.
            return None;
        }
        Some(tangent.clone())'''+s[b:]
a=s.index('        if let Some((known_x, known_y)) = self.certified_unit_tangent()');b=s.index('        let mut chord = self.clone();',a)
s=s[:a]+'''        let already_proved = self.certified_unit_tangent().is_some_and(|(known_x, known_y)| {
            compare_reals(x, &known_x, policy) == Some(std::cmp::Ordering::Equal)
                && compare_reals(y, &known_y, policy) == Some(std::cmp::Ordering::Equal)
        });
        if !already_proved {
            for (a, b, expected) in [
                (-y.clone(), x.clone(), std::cmp::Ordering::Equal),
                (x.clone(), y.clone(), std::cmp::Ordering::Less),
            ] {
                match algebraic_chord_points_linear_order(self.start(), self.end(), &a, &b, policy)? {
                    Classification::Decided(order) if order == expected => {}
                    Classification::Decided(_) => return Err(CurveError::InvalidCurveParameter),
                    Classification::Uncertain(reason) => return Ok(Classification::Uncertain(reason)),
                }
            }
        }
'''+s[b:];p.write_text(s)
