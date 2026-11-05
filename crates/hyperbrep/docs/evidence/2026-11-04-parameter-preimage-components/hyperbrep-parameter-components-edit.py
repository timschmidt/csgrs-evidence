from pathlib import Path
p=Path('crates/hypercurve/src/curve_intersection.rs')
s=p.read_text().replace('mod curve_rational_map_location;','mod curve_rational_map_location;\n#[path = "curve_point_components.rs"]\nmod curve_point_components;')
s=s.replace('    Locations(Vec<CurveLocation2>),\n}', '''    Locations(Vec<CurveLocation2>),
    /// Complete preimages containing proper continuous components. Components
    /// retain source span charts and endpoint inclusion; adjacent charts need
    /// not be merged. Isolated visits remain explicit `Single` components.
    Components(Vec<CurveLocationComponent2>),
}''',1)
pos=s.index('/// One exact top-level curve contact')
s=s[:pos]+'''/// One connected parameter component in an original source span chart.
///
/// Open interval ends preserve original denominator exclusions. Different
/// one-sided source charts at a discontinuous knot remain distinct.
#[derive(Clone, Debug, PartialEq)]
pub struct CurveLocationComponent2 {
    span_index: usize,
    span_range: CurveSpanRange2,
    parameters: CurveParameterSet2,
    endpoint_inclusion: [bool; 2],
}

'''+s[pos:]
p.write_text(s)
p=Path('crates/hypercurve/src/lib.rs');s=p.read_text().replace('CurveIntersectionResult2, CurveIntersectionTopology2, CurveLocation2,','CurveIntersectionResult2, CurveIntersectionTopology2, CurveLocation2, CurveLocationComponent2,');p.write_text(s)
p=Path('crates/hypercurve/src/curve_rational_location.rs');s=p.read_text()
s=s.replace('use crate::{CurveFamily2, CurveParameterRange2};','use crate::{CurveFamily2, CurveParameterRange2, CurveParameterSet2};\n\npub(super) type SpanPreimages = Vec<(CurveParameterSet2, [bool; 2])>;')
s=s.replace('ExactCurveResult<Option<Vec<CurveParameter2>>>','ExactCurveResult<SpanPreimages>')
a=s.index('    let Some(candidates) = candidates else {');b=s.index('    let mut parameters = Vec::new();',a)
s=s[:a]+'''    let Some(candidates) = candidates else {
        // Identically vanishing equations describe the entire defined domain,
        // including all punctures of the ORIGINAL source and map guards.
        let mut holes: Vec<CurveParameter2> = Vec::new();
        for guard in [Some(basis.weight.as_slice()), map.map(|_| weight)]
            .into_iter().flatten()
        {
            if crate::curve::polynomial_is_zero(guard, policy)? {
                return if guard == basis.weight.as_slice() {
                    Err(invalid(CurveError::ZeroRationalPointDenominator))
                } else { Ok(Vec::new()) };
            }
            let coefficients = guard.iter().map(|c| {
                point.rational_form(BivariatePolynomial::new(vec![vec![c.clone()]]),
                    BivariatePolynomial::new(vec![vec![Real::one()]]))
            }).collect::<ExactCurveResult<Vec<_>>>()?;
            let roots = PolynomialPoint2::selected_root_candidates(coefficients,
                [bounds[0].clone(), bounds[1].clone()],
                hypersolve::AlgebraicFiberRootIsolationConfig::default(), policy)?
                .expect("a nonzero guard has isolated roots");
            for root in roots {
                let parameter = decide(crate::bezier_offset::point_affine_form_parameter(
                    &root, &[Real::one(),Real::zero(),Real::zero()], policy).map_err(invalid)?)?;
                if !decide(CurveParameterDomain2::new(range,None)
                    .contains_finite_parameter(&parameter,policy).map_err(invalid)?)? {continue;}
                let mut index=0;
                while index<holes.len() && decide(holes[index].cmp_by_refinement(&parameter,policy).map_err(invalid)?)?.is_lt() {index+=1;}
                if index==holes.len() || !decide(holes[index].cmp_by_refinement(&parameter,policy).map_err(invalid)?)?.is_eq() {holes.insert(index,parameter);}
            }
        }
        let [start,end]=decide(range.ordered_endpoints(policy).map_err(invalid)?)?;
        let mut previous=start.clone();
        let mut included=true;
        let mut components=Vec::new();
        for hole in holes {
            if !decide(previous.cmp_by_refinement(&hole,policy).map_err(invalid)?)?.is_eq() {
                components.push((CurveParameterSet2::Range(CurveParameterRange2::new_validated(previous,hole.clone())),[included,false]));
            }
            previous=hole;
            included=false;
        }
        if !decide(previous.cmp_by_refinement(end,policy).map_err(invalid)?)?.is_eq() {
            components.push((CurveParameterSet2::Range(CurveParameterRange2::new_validated(previous,end.clone())),[included,true]));
        }
        return Ok(components);
    };
'''+s[b:]
s=s.replace('    Ok(Some(parameters))','    Ok(parameters.into_iter().map(|p| (CurveParameterSet2::Single(p),[true,true])).collect())')
p.write_text(s)
