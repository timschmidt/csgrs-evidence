from pathlib import Path
import shutil
s=Path(__file__).parent;root=Path('/mnt/development/interval-profile-static');owner=root/'csgrs'
shutil.copy2(s/'nonempty.rs',owner/'crates/hyperinterval/src/rational/nonempty.rs')
p=owner/'crates/hyperinterval/src/rational.rs';text=p.read_text().replace('mod positive;','mod nonempty;\npub use nonempty::NonEmptyRationalInterval;\n\nmod positive;')
a=text.index('        let uncertainty = if let Ok(numerator)',text.index('pub fn from_nominal_unsigned_uncertainty'));b=text.index('\n    }',a)
text=text[:a]+'''        NonEmptyRationalInterval::from_nominal_unsigned_uncertainty(nominal, numerator, denominator)
            .map(NonEmptyRationalInterval::into_interval)'''+text[b:]
text=text.replace('Self::ordered(nominal - uncertainty, nominal + uncertainty)', 'NonEmptyRationalInterval::centered(nominal, uncertainty).into_interval()');p.write_text(text)
p=owner/'crates/hyperinterval/src/lib.rs';text=p.read_text().replace('pub use rational::{PositiveRationalInterval, RationalInterval};','pub use rational::{NonEmptyRationalInterval, PositiveRationalInterval, RationalInterval};');p.write_text(text)
p=owner/'crates/hyperinterval/src/rational/positive.rs';text=p.read_text();old='''        if bounds.as_refs().endpoints().0 <= &Rational::zero() {
            return Err(IntervalError::NonPositiveLowerBound);
        }
        Ok(PositiveRationalInterval { bounds })''';assert old in text;text=text.replace(old,'''        PositiveRationalInterval::from_bounds(bounds).ok_or(IntervalError::NonPositiveLowerBound)''');text=text.replace('impl PositiveRationalInterval {','''impl PositiveRationalInterval {
    pub(super) fn from_bounds(bounds: Bounds<Rational>) -> Option<Self> {
        if bounds.as_refs().endpoints().0 <= &Rational::zero() {
            return None;
        }
        Some(Self { bounds })
    }
''');p.write_text(text)
p=root/'alumina-interface/crates/alumina-interface-core/src/machine_profile.rs';text=p.read_text();text=text.replace('use hyperinterval::{IntervalError, PositiveRationalInterval, RationalInterval};','use hyperinterval::{NonEmptyRationalInterval, PositiveRationalInterval};');text=text.replace('interval.into_bounds().expect("nominal uncertainty is nonempty")','interval.into_bounds()');text=text.replace('''interval
            .into_bounds()
            .expect("nominal uncertainty is nonempty")''','interval.into_bounds()')
a=text.index('    let interval = match interval.into_positive()');b=text.index('\n    Ok(PositiveExactInterval',a);text=text[:a]+'''    let interval = interval.into_positive().ok_or(
        MachineProfileError::NonPositiveLowerBound { instance, fact },
    )?;'''+text[b:];text=text.replace('MachineProfileResult<(Rational, RationalInterval)>','MachineProfileResult<(Rational, NonEmptyRationalInterval)>').replace('RationalInterval::from_nominal_unsigned_uncertainty','NonEmptyRationalInterval::from_nominal_unsigned_uncertainty');p.write_text(text)
