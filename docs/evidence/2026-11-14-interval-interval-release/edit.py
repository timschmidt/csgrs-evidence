from pathlib import Path
r=Path('/mnt/development/csgrs-interval-release')
p=r/'scripts/release-check.sh';t=p.read_text().replace('  hyperreal hyperlattice hyperlimit hypertri hypersolve hypercurve hypermesh','  hyperreal hyperinterval hyperlattice-interval hyperlattice hyperlimit hypertri\n  hypersolve hyperdynamics hypercurve hypermesh').replace('declare -A quickstart_features=([hypertri]="earcut")','declare -A quickstart_features=(\n  [hypertri]="earcut"\n  [hyperinterval]="fixed"\n  [hyperlattice-interval]="fixed"\n  [hyperdynamics]="field"\n)').replace('  readme="crates/${crate}/README.md"\n  [[ ${crate} == csgrs ]] && readme="readme.md"','  readme="${work}/packages/${crate}-${version[${crate}]}/README.md"\n  [[ ${crate} == csgrs ]] && readme="${work}/packages/csgrs-${version[csgrs]}/readme.md"');p.write_text(t)
p=r/'crates/hyperinterval/README.md';t=p.read_text();a=t.index('```rust\n');b=t.index('\n```',a)+len('\n```');t=t[:a]+'''<!-- quickstart:start -->
```rust
use hyperinterval::{FixedInterval, IntervalError, SignSet};

fn main() -> Result<(), IntervalError> {
    type Q30Bounds = FixedInterval<i32, 30>;
    let range = Q30Bounds::new(-(1 << 29), 1 << 29)?;
    assert_eq!(range.signs(), SignSet::Mixed);
    assert!(range.contains_point(0)); // possible zero is not a scalar equality proof
    assert_eq!(range.square()?.bounds(), Some((0, 1 << 28)));
    assert_eq!(Q30Bounds::new(1, 0), Err(IntervalError::ReversedBounds));
    Ok(())
}
```
<!-- quickstart:end -->'''+t[b:];p.write_text(t)
p=r/'crates/hyperlattice-interval/README.md';t=p.read_text();a=t.index('```rust\n');b=t.index('\n```',a)+len('\n```');t=t[:a]+'''<!-- quickstart:start -->
```rust
use hyperlattice_interval::{IntervalLatticeError, IntervalMatrix, IntervalVector};
use hyperlattice_interval::hyperinterval::FixedInterval;

fn main() -> Result<(), IntervalLatticeError> {
    type I = FixedInterval<i32, 0>;
    let matrix = IntervalMatrix::new([[I::point(2)?, I::point(-1)?]])?;
    let vector = IntervalVector::new([I::new(1, 3)?, I::new(4, 5)?])?;
    let image = matrix.mul_vector(&vector, &mut ())?;
    assert_eq!(image.lanes().unwrap()[0].bounds(), Some((-3, 2)));
    let scale = IntervalMatrix::new([[I::point(2)?]])?;
    let next = scale.mul_vector(&image, &mut ())?;
    assert_eq!(next.lanes().unwrap()[0].bounds(), Some((-6, 4)));
    Ok(())
}
```
<!-- quickstart:end -->'''+t[b:];p.write_text(t)
p=r/'crates/hyperdynamics/README.md';t=p.read_text();marker='Enable `field` for the sealed';assert t.count(marker)==1;t=t.replace(marker,'''With `field`, this example certifies `x'=2`, then consumes its endpoint in
another horizon. The example also uses Hyperinterval with `dyadic`, Hyperlattice
Interval with `dyadic`, and Hypersolve with `interval-program`.

<!-- quickstart:start -->
```rust
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    evolution::{EvolutionOptions, EvolutionRequest, EvolutionStatus},
};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::BoxN;
use hypersolve::{
    Expr, SymbolId,
    expression_program::{ExpressionBudget, ExpressionProgram},
};

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let time = SymbolId(0);
    let state = SymbolId(1);
    let source = ExpressionProgram::compile(
        &[Expr::int(2)], &[time, state],
        &mut ExpressionBudget::new(1000, 10000),
    )?;
    let mut budget = EnclosureBudget::new(EnclosurePolicy::default());
    let field = ExpressionField::<1>::from_definition(
        FieldDefinition { source: source.definition().clone(), time, state: vec![state] },
        &mut budget,
    )?;
    let point = |n: i64| DyadicInterval::point(n.into(), 0);
    let mut initial = BoxN::new([point(0)?])?;
    for start in 0..2 {
        let report = field.integrate(
            EvolutionRequest { start: point(start)?, end: point(start + 1)?, initial },
            EvolutionOptions::default(), &mut budget,
        );
        assert!(matches!(report.status(), EvolutionStatus::Completed));
        assert_eq!(report.identity(), field.identity());
        initial = report.end_enclosure().expect("completed horizon").clone();
        assert_eq!(initial.lanes(), Some(&[point(2 * (start + 1))?]));
    }
    Ok(())
}
```
<!-- quickstart:end -->

'''+marker);p.write_text(t)
p=r/'docs/RELEASE.md';t=p.read_text().replace('| `hyperlattice` | 0.7.0', '| `hyperinterval` | 0.1.0 | not verified | first coordinated interval release |\n| `hyperlattice-interval` | 0.1.0 | not verified | first coordinated interval release |\n| `hyperdynamics` | 0.1.0 | not verified | first coordinated interval release |\n| `hyperlattice` | 0.7.0').replace('`hyperreal`, `hyperlattice`, `hyperlimit`, `hypertri`, `hypersolve`,\n`hypercurve`','`hyperreal`, `hyperinterval`, `hyperlattice-interval`, `hyperlattice`,\n`hyperlimit`, `hypertri`, `hypersolve`, `hyperdynamics`, `hypercurve`').replace('- every README quick start, extracted from its `quickstart` markers;','- every packaged README quick start, extracted from its `quickstart` markers;\n     the interval examples check typed scalar rejection, Cartesian composition\n     and a certified flow endpoint consumed by a subsequent horizon;').replace('1. `hyperreal`, `hyperlattice`, `hyperlimit`, `hypertri`, `hypersolve`,','1. `hyperreal`, `hyperinterval`, `hyperlattice-interval`, `hyperlattice`,\n   `hyperlimit`, `hypertri`, `hypersolve`, `hyperdynamics`,');p.write_text(t)
