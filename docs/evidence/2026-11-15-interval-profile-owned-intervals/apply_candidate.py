from pathlib import Path
import subprocess,json,re
s=Path(__file__).parent;r=Path('/mnt/development/interval-profile-static/csgrs');a=r.parent/'alumina-interface'
assert json.loads((s/'missing-owner-storage.json').read_text())['exit_code']==101
assert 'E0432' in (s/'missing-owner-storage.log').read_text()
old=Path('/tmp/interval-refactor/profile-codegen-attribution')
for root,name in [(r,'csgrs-nonempty.patch'),(a,'alumina-interface-nonempty.patch')]:
 subprocess.run(['git','apply','--check',str(old/name)],cwd=root,check=True)
 subprocess.run(['git','apply',str(old/name)],cwd=root,check=True)
p=r/'crates/hyperreal/src/rational/mod.rs';p.write_text(p.read_text()+'\nmod positive;\npub use positive::PositiveRational;\n')
p=r/'crates/hyperreal/src/lib.rs';p.write_text(p.read_text().replace('ExactDyadicWideLinePoint2, Rational,','ExactDyadicWideLinePoint2, PositiveRational, Rational,'))
(r/'crates/hyperreal/src/rational/positive.rs').write_text('''use super::Rational;
use core::num::NonZeroU64;

/// An exact rational value with a retained strict-positivity proof.
///
/// Construction from a nonzero unsigned integer establishes positivity without
/// a scalar predicate. Borrowing and consumption preserve that exact value.
/// This witness has the same arbitrary-precision resource exclusions as Rational.
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct PositiveRational(Rational);

impl From<NonZeroU64> for PositiveRational {
    fn from(value: NonZeroU64) -> Self {
        Self(Rational::from(value.get()))
    }
}

impl PositiveRational {
    /// Borrow the positive exact value without revalidation.
    pub const fn as_rational(&self) -> &Rational {
        &self.0
    }

    /// Transfer the exact value without cloning or revalidation.
    pub fn into_rational(self) -> Rational {
        self.0
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn nonzero_integer_witness_preserves_full_width_canonical_components() {
        for n in [1, 2, 17, 1000, u32::MAX as u64, 1_u64 << 63, u64::MAX] {
            let value = PositiveRational::from(NonZeroU64::new(n).unwrap());
            assert_eq!(value.as_rational().numerator(), &num::BigUint::from(n));
            assert_eq!(value.as_rational().denominator(), &num::BigUint::from(1_u8));
            assert!(value.as_rational().is_positive());
            assert_eq!(value.clone().into_rational(), Rational::from(n));
            assert_eq!(value.as_rational().to_string(), n.to_string());
        }
    }
}
''')
p=r/'crates/hyperinterval/src/bounds.rs';text=p.read_text();needle='    pub(crate) fn endpoints(self) -> (T, T) {'
assert needle in text;text=text.replace(needle,'''    #[cfg(feature = "rational")]
    pub(crate) const fn endpoint_refs(&self) -> (&T, &T) {
        (&self.lower, &self.upper)
    }

'''+needle);p.write_text(text)
p=r/'crates/hyperinterval/src/rational/nonempty.rs';text=p.read_text().replace('pub fn bounds(&self) -> (&Rational, &Rational) {\n        self.bounds.as_refs().endpoints()','pub const fn bounds(&self) -> (&Rational, &Rational) {\n        self.bounds.endpoint_refs()')
needle='    /// Transfer both exact endpoints without cloning or revalidation.'
text=text.replace(needle,'''    /// Exact division by a positive scalar, retaining ordered nonempty bounds.
    ///
    /// The divisor carries its positivity proof. Lower then upper divisions use
    /// the same scalar value; no sign test, conversion or reciprocal is repeated.
    pub fn quotient_positive_scalar(&self, divisor: hyperreal::PositiveRational) -> Self {
        let (lower, upper) = self.bounds();
        Self {
            bounds: Bounds::ordered(
                lower / divisor.as_rational(),
                upper / divisor.into_rational(),
            ),
        }
    }

'''+needle);p.write_text(text)
p=r/'crates/hyperinterval/src/rational/positive.rs';text=p.read_text();needle='    /// Return the same set in the general interval carrier without revalidation.'
text=text.replace(needle,'''    /// Retain the same nonempty bounds while forgetting only strict positivity.
    pub fn into_nonempty(self) -> super::NonEmptyRationalInterval {
        super::NonEmptyRationalInterval { bounds: self.bounds }
    }

'''+needle);p.write_text(text)
p=a/'crates/alumina-interface-core/src/machine_profile.rs';text=p.read_text();text=text.replace('use hyperreal::{Problem, Rational, Real};','use hyperreal::{PositiveRational, Problem, Rational, Real};')
oldtext='''#[derive(Clone, Debug, Eq, PartialEq)]
pub struct ExactInterval {
    nominal: Rational,
    lower: Rational,
    upper: Rational,
}'''
newtext='''#[derive(Clone, Eq, PartialEq)]
pub struct ExactInterval {
    nominal: Rational,
    interval: NonEmptyRationalInterval,
}

impl fmt::Debug for ExactInterval {
    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
        formatter.debug_struct("ExactInterval")
            .field("nominal", &self.nominal)
            .field("lower", self.lower())
            .field("upper", self.upper())
            .finish()
    }
}'''
assert oldtext in text;text=text.replace(oldtext,newtext)
oldtext='''        let (lower, upper) = interval.into_bounds();
        Ok(Self {
            nominal,
            lower,
            upper,
        })''';assert oldtext in text;text=text.replace(oldtext,'''        Ok(Self { nominal, interval })''',1)
start=text.index('    fn divided_by_positive_integer(');end=text.index('    /// Exact nominal value.',start)
text=text[:start]+'''    fn divided_by_positive_integer(&self, divisor: core::num::NonZeroU64) -> Self {
        let divisor = PositiveRational::from(divisor);
        let nominal = &self.nominal / divisor.as_rational();
        let interval = self.interval.quotient_positive_scalar(divisor);
        Self { nominal, interval }
    }

'''+text[end:]
text=text.replace('        &self.lower\n','        self.interval.bounds().0\n').replace('        &self.upper\n','        self.interval.bounds().1\n')
oldtext='''        let (lower, upper) = self.interval.into_bounds();
        ExactInterval {
            nominal: self.nominal,
            lower,
            upper,
        }''';newtext='''        ExactInterval {
            nominal: self.nominal,
            interval: self.interval.into_nonempty(),
        }''';assert oldtext in text;text=text.replace(oldtext,newtext)
oldtext='''        let (lower, upper) = numerator
            .quotient(&travel_metres_per_output_turn.interval)
            .into_bounds();
        let command_density_steps_per_metre = ExactInterval {
            nominal,
            lower,
            upper,
        };''';newtext='''        let interval = numerator
            .quotient(&travel_metres_per_output_turn.interval)
            .into_nonempty();
        let command_density_steps_per_metre = ExactInterval { nominal, interval };''';assert oldtext in text;text=text.replace(oldtext,newtext)
text=text.replace('.divided_by_positive_integer(1_000)', '.divided_by_positive_integer(core::num::NonZeroU64::new(1_000).unwrap())')
# These are direct reads of private ExactInterval endpoints. Getters borrow the
# retained exact bounds. Strip the old explicit borrow to retain operand types.
text=re.sub(r'&(\w+)\.(lower|upper)\b(?!\()',r'\1.\2()',text)
text=re.sub(r'\b(\w+)\.(lower|upper)\b(?!\()',r'\1.\2()',text)
# The temporary positive state now transfers a shared carrier into the public wrapper.
text=text.replace('// ExactInterval layout, nominal value and physical-fact provenance.','// ExactInterval nominal value and physical-fact provenance.')
p.write_text(text)
print('retained-owner candidate applied')
