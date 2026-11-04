from pathlib import Path
p=Path('crates/hypercurve/src/polynomial_curve.rs')
s=p.read_text()
s=s.replace('use hypersolve::bivariate_topology::BivariateCurveTopology;', '''use hypersolve::bivariate_topology::{
    BivariateCurveDomain, BivariateCurveTopology, BivariateTopologyError, decompose_bivariate_curve,
};''')
pos=s.index('/// One selected graph branch,')
s=s[:pos]+'''impl PolynomialCurveSource2 {
    // The original equation can vanish identically at a vertical event. The
    // solver's exact residual retains all defining powers of the point fibers.
    fn fiber_equation(&self) -> &hypersolve::BivariatePolynomial {
        self.topology.vertical_content().map_or_else(
            || self.topology.equation(),
            |content| content.residual_equation(),
        )
    }
}

'''+s[pos:]
a=s.index('        // Graph branches do not yet carry whole vertical intervals.')
b=s.index('        let source = Arc::new',a)
s=s[:a]+'''        if topology.vertical_components().is_empty() {
            return Self::import_graphs(topology, fiber_config);
        }
        // F(x,y) = p(x) R(x,y). The ordinary chart covers R; the
        // exchanged chart F(v,u) covers the missing p(v) components. Both
        // charts retain their full defining equation and checked multiplicity
        // evidence. The exact reflection transports points and traversal.
        let exchanged = hypersolve::bivariate_arithmetic::bivariate_swap_parameters(
            topology.equation(),
        );
        let domain = BivariateCurveDomain {
            first: topology.domain().second.clone(),
            second: topology.domain().first.clone(),
        };
        let exchanged = decompose_bivariate_curve(&exchanged, &domain, topology.config())
            .map_err(|error| blocked(match error {
                BivariateTopologyError::DegreeLimit
                | BivariateTopologyError::RefinementLimit
                | BivariateTopologyError::BudgetExhausted => UncertaintyReason::BudgetExhausted,
                BivariateTopologyError::UnsupportedCoefficient
                | BivariateTopologyError::VerticalComponent
                | BivariateTopologyError::RepeatedComponent
                | BivariateTopologyError::BoundaryComponent => UncertaintyReason::Unsupported,
                _ => UncertaintyReason::Predicate,
            }))?;
        let component = hypersolve::BivariatePolynomial::new(vec![
            topology.vertical_content().expect("vertical components retain their content")
                .factor().to_vec(),
        ]);
        let mut set = Self::import_graphs(topology, fiber_config)?;
        let exchanged = Self::import_graphs(exchanged, fiber_config)?;
        let reflection = Similarity2::try_from_real_affine(
            Real::zero(), Real::one(), Real::one(), Real::zero(), Real::zero(), Real::zero(),
        ).map_err(invalid)?;
        for curve in exchanged.curves {
            let branch = curve.polynomial_branch().expect("graph imports retain native branches");
            if branch.selects_component(&component, &CurveContext::STRICT)? {
                set.curves.push(curve.transform_similarity(&reflection)?);
            }
        }
        Ok(set)
    }

    // Private partial chart import. Only import_topology publishes a complete
    // collection: callers must assemble the vertical components before return.
    fn import_graphs(
        topology: BivariateCurveTopology,
        fiber_config: AlgebraicFiberRootIsolationConfig,
    ) -> ExactCurveResult<Self> {
'''+s[b:]
s=s.replace('source.topology.equation().clone(),','source.fiber_equation().clone(),')
a=s.index('        let mut curves = Vec::new();',s.index('fn import_graphs'))
s=s[:a]+'''        // Residual event points on whole columns are incident to those columns,
        // even when R alone has an isolated point there.
        for component in source.topology.vertical_components() {
            incident[component.event_index()].fill(true);
        }
'''+s[a:]
s=s.replace('    /// Borrows all native branches in projection-slab and root order.', '''    /// Borrows a branch in the source's original projection chart.
    ///
    /// Slab/root indices from a retained branch refer to its own source chart,
    /// not to the complete collection, which can also contain exchanged charts.
    pub fn graph_branch(&self, slab: usize, root: usize) -> Option<&Curve2> {
        let cell = self.topology().slabs().get(slab)?;
        cell.arcs().get(root)?;
        let offset: usize = self.topology().slabs()[..slab]
            .iter().map(|cell| cell.arcs().len()).sum();
        self.curves.get(offset + root)
    }

    /// Borrows original graph branches followed by exchanged-chart components.''')
a=s.index('    /// Controls for subsequent selected-fiber evaluation,')
s=s[:a]+'''    pub(crate) fn fiber_equation(&self) -> &hypersolve::BivariatePolynomial {
        self.source.fiber_equation()
    }

'''+s[a:]
s=s.replace('.geometric_equation()', '.graph_equation()')
s=s.replace('self.topology().equation()', 'self.fiber_equation()')
p.write_text(s)
# All selected graph consumers must exclude separate vertical components from
# their graph support. Original-equation serialization remains untouched.
for f in ['polynomial_curve_selected_chord.rs','polynomial_curve_rational.rs','polynomial_curve_pair.rs','polynomial_curve_projection.rs','polynomial_curve_differential.rs','polynomial_curve_selected_circle.rs']:
 p=Path('crates/hypercurve/src')/f
 s=p.read_text().replace('.geometric_equation()', '.graph_equation()')
 if f=='polynomial_curve_differential.rs':s=s.replace('self.topology().equation()', 'self.fiber_equation()')
 p.write_text(s)
p=Path('crates/hypercurve/src/svg/exact/graph/polynomial.rs')
s=p.read_text();a=s.index('    let curve = source\n');b=s.index('        .ok_or_else',a)
s=s[:a]+'''    let curve = source
        .graph_branch(slab, root)
'''+s[b:];p.write_text(s)
p=Path('crates/hyperbrep/src/persistence/polynomial.rs')
s=p.read_text();a=s.index('        // Native curves use projection-slab');b=s.index('        let [start, end]',a)
s=s[:a]+'''        let curve = source.graph_branch(self.slab, self.root).ok_or(
            PersistenceError::InvalidReference {
                kind: "polynomial branch",
                index: self.root,
            },
        )?;
'''+s[b:];p.write_text(s)
