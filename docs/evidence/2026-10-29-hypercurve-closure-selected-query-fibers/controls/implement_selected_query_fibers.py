from pathlib import Path
import json, subprocess
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
w = r / 'selected-query-fibers'
baseline = json.loads((c / 'selected-query-fibers-baseline2/complete.json').read_text())
assert baseline['statuses'] == [0, 0, 0, 101]
assert 'reason: Unsupported' in (c / 'selected-query-fibers-baseline2/polynomial_branch_consumes_a_nested_selected_fiber_query.log').read_text()
assert not subprocess.check_output(['git', 'status', '--porcelain'], cwd=w).strip()
def edit(name, old, new):
    p = w / name
    s = p.read_text()
    assert s.count(old) == 1, (name, old[:100], s.count(old))
    p.write_text(s.replace(old, new, 1))

edit('crates/hypercurve/src/curve_point/definition.rs',
'''    /// first parameter and the exact second-coordinate isolator together.
    /// Replay checks the equation and singleton; root-count flags are untrusted.
    PolynomialFiber {
        equation: hypersolve::BivariatePolynomial,
        parameter: BezierParameter2,''',
'''    /// first parameter and the exact second-coordinate isolator together.
    /// The parameter may retain a rational query over selected point fields;
    /// its source relations and denominator guards remain authoritative.
    /// Replay checks the equation and singleton; root-count flags are untrusted.
    PolynomialFiber {
        equation: hypersolve::BivariatePolynomial,
        parameter: CurveParameter2,''')
edit('crates/hypercurve/src/curve_point/definition.rs',
'crate::polynomial_point::PolynomialPoint2::from_fiber(\n                    equation,\n                    parameter,\n                    &[root],\n                )?',
'crate::polynomial_point::PolynomialPoint2::from_parameter_fiber(\n                    equation,\n                    parameter,\n                    &[root],\n                    policy,\n                )?')
edit('crates/hypercurve/src/polynomial_point.rs', 'mod joint;\n', 'mod joint;\nmod selected_fiber;\n')
edit('crates/hypercurve/src/polynomial_point.rs', 'parameter: base.clone(),\n                    root: fiber.root().clone(),', 'parameter: base.clone().into(),\n                    root: fiber.root().clone(),')
edit('crates/hypercurve/src/polynomial_point/joint.rs',
'''    sources: [PointFormSource2; 2],
    values: [Value; 2],''',
'''    definition: crate::CurvePointDefinition2,
    values: [Value; 2],''')
edit('crates/hypercurve/src/polynomial_point/joint.rs',
'''        crate::CurvePointDefinition2::RationalQueryPair {
            sources: self.sources.each_ref().map(|query| query.source.clone()),
            numerators: self.sources.each_ref().map(|query| query.numerator.clone()),
            denominators: self
                .sources
                .each_ref()
                .map(|query| query.denominator.clone()),
        }''',
'''        self.definition.clone()''')
edit('crates/hypercurve/src/polynomial_point/joint.rs',
'''            Ok(CurvePoint2(CurvePointData2::Polynomial(Arc::new(Self {
                authority: PolynomialPointAuthority2::Queries(Arc::new(JointQueries2 {
                    sources,
                    values,
                })),
                maps: Vec::new(),
            }))))''',
'''            let definition = crate::CurvePointDefinition2::RationalQueryPair {
                sources: sources.each_ref().map(|query| query.source.clone()),
                numerators: sources.each_ref().map(|query| query.numerator.clone()),
                denominators: sources.each_ref().map(|query| query.denominator.clone()),
            };
            Ok(Self::from_joint_values(definition, values))''')
edit('crates/hypercurve/src/polynomial_point/joint.rs',
'impl PolynomialPoint2 {\n',
'''impl PolynomialPoint2 {
    pub(super) fn from_joint_values(
        definition: crate::CurvePointDefinition2,
        values: [Value; 2],
    ) -> CurvePoint2 {
        CurvePoint2(CurvePointData2::Polynomial(Arc::new(Self {
            authority: PolynomialPointAuthority2::Queries(Arc::new(JointQueries2 {
                definition,
                values,
            })),
            maps: Vec::new(),
        })))
    }

''')
edit('crates/hypercurve/src/polynomial_curve_abscissa.rs',
'''            parameter,
            univariate(&source.numerator)?,''',
'''            parameter.as_bezier_parameter()
                .ok_or_else(|| blocked(UncertaintyReason::Unsupported))?.clone(),
            univariate(&source.numerator)?,''')
edit('crates/hypercurve/src/polynomial_curve.rs',
'''        let (base, equation, map) = if let Some(base) = value.as_bezier_parameter() {''',
'''        if value.as_polynomial_query().is_some() {
            return self.query_fiber_point(value, policy);
        }
        let (base, equation, map) = if let Some(base) = value.as_bezier_parameter() {''')
edit('crates/hypercurve/src/polynomial_curve.rs',
'''    fn map_point(
''',
'''    fn query_fiber_point(
        &self,
        value: &CurveParameter2,
        policy: &CurveContext,
    ) -> ExactCurveResult<CurvePoint2> {
        let equation = self.topology().equation();
        let report = PolynomialPoint2::query_fiber_roots(
            equation, value, &self.topology().domain().second,
            self.source.fiber_config.refinement_steps, policy,
        )?;
        // The source topology proves this census and ordinal on the open slab.
        // Reject a contradictory fiber instead of choosing another branch.
        if report.len() != self.topology().slabs()[self.slab].arcs().len() {
            return Err(invalid(CurveError::InvalidBezierAlgebraicParameter));
        }
        let mut points = PolynomialPoint2::from_parameter_fiber(
            equation.clone(), value.clone(), &report[self.root..=self.root], policy,
        )?;
        points.pop().ok_or_else(|| invalid(CurveError::InvalidBezierAlgebraicParameter))
    }

    fn map_point(
''')

edit('crates/hypercurve/src/svg/exact/graph/points.rs',
'''                            | CurvePointDefinition2::Parallel { parameter, .. } => parameter''',
'''                            | CurvePointDefinition2::Parallel { parameter, .. }
                            | CurvePointDefinition2::PolynomialFiber { parameter, .. } => parameter''')
edit('crates/hypercurve/src/svg/exact/graph/points.rs',
'''                    let parameter = self.parameter(&parameter)?;
                    let index = self.begin(POLYNOMIAL_FIBER)?;''',
'''                    let parameter = self.scalar_parameter(&parameter)?;
                    depth = next_depth(self.point_depths[parameter as usize], self.max_point_depth)?;
                    let index = self.begin(POLYNOMIAL_FIBER)?;''')
edit('crates/hypercurve/src/svg/exact/graph/points.rs',
'''        POLYNOMIAL_FIBER => {
            let parameter = parameter_reference(definitions, reader.read_len()?)?.clone();''',
'''        POLYNOMIAL_FIBER => {
            let index = reader.read_len()?;
            let parameter = scalar_parameter_reference(definitions, index)?;
            depth = next_depth(point_depths[index], max_point_depth)?;''')
edit('crates/hyperbrep/src/persistence/planar_points.rs',
'''            } => RawPlanarPoint::PolynomialFiber {
                equation: equation.coefficients,
                parameter: self.curve_parameter(&parameter.into())?,''',
'''            } => RawPlanarPoint::PolynomialFiber {
                equation: equation.coefficients,
                parameter: self.curve_parameter(&parameter)?,''')
edit('crates/hyperbrep/src/persistence/planar_points.rs',
'''            } => CurvePointDefinition2::PolynomialFiber {
                equation: hypersolve::BivariatePolynomial::new(equation),
                parameter: self.bezier_parameter(parameter)?,''',
'''            } => CurvePointDefinition2::PolynomialFiber {
                equation: hypersolve::BivariatePolynomial::new(equation),
                parameter: self.curve_parameter(parameter)?,''')

(w/'crates/hypercurve/src/polynomial_point/selected_fiber.rs').write_bytes((c/'selected_query_fiber_implementation.rs').read_bytes())
(w/'crates/hypercurve/tests/polynomial_query_fibers.rs').write_bytes((c/'polynomial_query_fibers_tests.rs').read_bytes())
subprocess.run(['git','add','-N','crates/hypercurve/src/polynomial_point/selected_fiber.rs','crates/hypercurve/tests/polynomial_query_fibers.rs'],cwd=w,check=True)
