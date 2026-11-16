from pathlib import Path
import subprocess
c=Path('/mnt/development/interval-profile-static/csgrs'); i=c.with_name('alumina-interface')
ref='refs/interval-unaccepted/budget-radius-20261116'
def old(root,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=root,text=True)
for path in ['crates/hyperinterval/Cargo.toml','crates/hyperinterval/src/lib.rs','crates/hyperinterval/README.md','crates/hyperinterval/CHANGELOG.md']:
 (c/path).write_text(old(c,path).replace('RationalRadius','RationalRadiusRef'))
r=old(c,'crates/hyperinterval/src/radius.rs')
a=r.index('/// A nonnegative exact rational error radius.');b=r.index('/// A nonnegative exact Real error radius')
r=r[:a]+'''/// A borrowed proof that an exact rational error radius is nonnegative.
///
/// The caller retains the value and its storage. The witness neither allocates
/// nor copies the rational payload; validation performs an exact comparison.
/// Units, named error sources and provenance belong to the consumer. The
/// underlying arbitrary-precision arithmetic has no new resource bound.
///
/// The value cannot be mutated while its witness is subsequently used:
/// ```compile_fail
/// use hyperinterval::RationalRadiusRef;
/// use hyperreal::Rational;
/// let mut value = Rational::from(1);
/// let radius = RationalRadiusRef::new(&value).unwrap();
/// value = Rational::from(-1);
/// assert_eq!(radius.as_rational(), &value);
/// ```
/// Nor can the witness outlive its source:
/// ```compile_fail
/// use hyperinterval::RationalRadiusRef;
/// use hyperreal::Rational;
/// let radius = {
///     let value = Rational::from(1);
///     RationalRadiusRef::new(&value).unwrap()
/// };
/// let _ = radius.as_rational();
/// ```
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub struct RationalRadiusRef<'a>(&'a Rational);

impl<'a> RationalRadiusRef<'a> {
    /// Check nonnegativity without taking ownership of the value.
    ///
    /// This preserves an ordered comparison, rather than substituting a
    /// different structural sign query. Zero is a valid radius.
    pub fn new(value: &'a Rational) -> Result<Self, IntervalError> {
        if value < &Rational::zero() {
            Err(IntervalError::NegativeRadius)
        } else {
            Ok(Self(value))
        }
    }

    /// Borrow the original exact radius without a new decision or conversion.
    pub const fn as_rational(self) -> &'a Rational {
        self.0
    }
}

'''+r[b:]
r=r.replace('impl From<RationalRadius> for RealRadius','impl From<RationalRadiusRef<\'_>> for RealRadius').replace('fn from(value: RationalRadius)','fn from(value: RationalRadiusRef<\'_>)').replace('Self(Real::from(value.0))','Self(Real::from(value.0.clone()))')
r=r.replace('    #[inline]\n    fn from', '    /// Clone the borrowed exact value once, retaining the caller\'s ownership.\n    #[inline]\n    fn from')
(c/'crates/hyperinterval/src/radius.rs').write_text(r)
p=c/'crates/hyperinterval/tests/radius_composition.rs';p.write_text('#![cfg(feature = "real-radius")]\n'+p.read_text())
# Preserve the old complete migration except allocation ownership.
path='crates/alumina-interface-core/src/machine_profile.rs'; t=old(i,path).replace('RationalRadius','RationalRadiusRef')
start=t.index('    pub fn certify(');end=t.index('    /// Canonical configuration identity',start)
prefix=t[:start];q=t[start:end];suffix=t[end:]
q=q.replace('source_curve_allocation_mm: Rational,','source_curve_allocation_mm_exact: Rational,').replace('controller_interpolation_allocation_mm: Rational,','controller_interpolation_allocation_mm_exact: Rational,')
q=q.replace('RationalRadiusRef::new(source_curve_allocation_mm)','RationalRadiusRef::new(&source_curve_allocation_mm_exact)').replace('RationalRadiusRef::new(controller_interpolation_allocation_mm)','RationalRadiusRef::new(&controller_interpolation_allocation_mm_exact)')
q=q.replace('        let source_curve_allocation_mm_exact = source_curve_allocation_mm;\n','').replace('        let controller_interpolation_allocation_mm_exact = controller_interpolation_allocation_mm;\n','')
q=q.replace('RealRadius::from(source_curve_allocation_mm_exact.clone())','RealRadius::from(source_curve_allocation_mm)').replace('RealRadius::from(controller_interpolation_allocation_mm_exact.clone())','RealRadius::from(controller_interpolation_allocation_mm)')
q=q.replace('source_curve_allocation_mm_exact: source_curve_allocation_mm_exact.into_rational(),','source_curve_allocation_mm_exact,').replace('controller_interpolation_allocation_mm_exact:\n                    controller_interpolation_allocation_mm_exact.into_rational(),','controller_interpolation_allocation_mm_exact,')
(i/path).write_text(prefix+q+suffix)
(i/'Cargo.toml').write_text(old(i,'Cargo.toml'))
for root in [c,i]:subprocess.run(['cargo','+1.95.0','fmt','--all'],cwd=root,check=True)
