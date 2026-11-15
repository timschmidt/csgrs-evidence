from pathlib import Path
p=Path('/mnt/development/interval-profile-static/alumina-interface/crates/alumina-interface-core/src/machine_profile.rs');s=p.read_text();a=s.index('fn scalar_interval(\n');b=s.index('fn convert_rational(',a)
s=s[:a]+'''fn scalar_interval(
    view: ConfigurationDocumentView<'_>,
    instance: u16,
    fact: ScalarFact,
) -> MachineProfileResult<ExactInterval> {
    construct_scalar_interval(view, instance, fact, |nominal, interval| {
        let (lower, upper) = interval.into_bounds();
        Ok(ExactInterval { nominal, lower, upper })
    })
}

fn positive_scalar_interval(
    view: ConfigurationDocumentView<'_>,
    instance: u16,
    fact: ScalarFact,
) -> MachineProfileResult<ExactInterval> {
    construct_positive_scalar_interval(view, instance, fact, |nominal, interval| {
        PositiveExactInterval { nominal, interval }.into_exact()
    })
}

fn positive_scalar_with_proof(
    view: ConfigurationDocumentView<'_>,
    instance: u16,
    fact: ScalarFact,
) -> MachineProfileResult<PositiveExactInterval> {
    construct_positive_scalar_interval(view, instance, fact, |nominal, interval| {
        PositiveExactInterval { nominal, interval }
    })
}

fn construct_positive_scalar_interval<T>(
    view: ConfigurationDocumentView<'_>,
    instance: u16,
    fact: ScalarFact,
    finish: impl FnOnce(Rational, PositiveRationalInterval) -> T,
) -> MachineProfileResult<T> {
    construct_scalar_interval(view, instance, fact, |nominal, interval| {
        let interval = interval
            .into_positive()
            .ok_or(MachineProfileError::NonPositiveLowerBound { instance, fact })?;
        Ok(finish(nominal, interval))
    })
}

fn construct_scalar_interval<T>(
    view: ConfigurationDocumentView<'_>,
    instance: u16,
    fact: ScalarFact,
    finish: impl FnOnce(Rational, NonEmptyRationalInterval) -> MachineProfileResult<T>,
) -> MachineProfileResult<T> {
    let scalar = required_scalar(view, instance, fact)?;
    let nominal = convert_rational(scalar.value)?;
    let denominator = core::num::NonZeroU64::new(scalar.uncertainty.denominator)
        .ok_or(MachineProfileError::Arithmetic(Problem::DivideByZero))?;
    let numerator = u64::try_from(scalar.uncertainty.numerator)
        .map_err(|_| MachineProfileError::Configuration(ConfigurationError::Scalar))?;
    let interval = NonEmptyRationalInterval::from_nominal_unsigned_uncertainty(
        &nominal,
        numerator,
        denominator,
    )?;
    finish(nominal, interval)
}

'''+s[b:];p.write_text(s)
