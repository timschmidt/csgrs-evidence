from pathlib import Path
import subprocess,hashlib,json
root=Path('/tmp/csgrs-r14-candidate');record=Path(__file__).resolve().parent
path=root/'crates/hypercurve/src/bezier_parameter.rs';s=path.read_text()
def function(text,name):
 start=text.index('fn '+name+'(');end=text.index('\n}\n',start)+2
 return start,end,text[start:end]
_,_,bern=function(s,'rational_interval_strict_bernstein_sign')
_,_,horner=function(s,'rational_horner_interval_strict_sign')
bernbody=bern[bern.index('    let degree ='):bern.rindex('\n}')].replace('form.','self.').replace('let (leading, rest) = form\n','let (leading, rest) = self\n').replace('Some(strict_common_sign(&value))','strict_common_sign(&value)')
hornerbody=horner[horner.index('    let (leading, rest)'):horner.rindex('\n}')].replace('form.','self.')
start=s.index('/// An exact rational polynomial and bracket over common denominators:')
end=s.index('/// The sign shared by every entry',start)
new='''/// Fixed exact rational coefficients multiplied by one positive common
/// denominator. Preparation is local to one sign proof; it retains no query
/// result and does not normalize the polynomial's content.
struct IntegerPolynomial {
    coefficients: Vec<num::BigInt>,
}

impl IntegerPolynomial {
    fn new(coefficients: &[Real]) -> Option<Self> {
        use num::{BigUint, Integer, One};
        let rationals = coefficients
            .iter()
            .map(Real::exact_rational_ref)
            .collect::<Option<Vec<_>>>()?;
        if rationals.is_empty() {
            return None;
        }
        let mut common = BigUint::one();
        for value in &rationals {
            if !value.denominator().is_one() {
                common = common.lcm(value.denominator());
            }
        }
        Some(Self {
            coefficients: rationals
                .iter()
                .map(|value| scaled_rational_integer(value, &common))
                .collect(),
        })
    }

    /// Homogeneous Horner at p/q: the final integer is D*q^n*f(p/q).
    /// Both D and q are positive, including at negative points and exact roots.
    fn sign_at(&self, point: &Real) -> Option<RealSign> {
        use num::Signed;
        let point = point.exact_rational_ref()?;
        let magnitude = num::BigInt::from(point.numerator().clone());
        let numerator = if point.is_negative() { -magnitude } else { magnitude };
        let denominator = num::BigInt::from(point.denominator().clone());
        let (leading, rest) = self.coefficients.split_last()?;
        let mut value = leading.clone();
        let mut power = num::BigInt::from(1_u8);
        for coefficient in rest.iter().rev() {
            power *= &denominator;
            value = value * &numerator + coefficient * &power;
        }
        Some(if value.is_positive() {
            RealSign::Positive
        } else if value.is_negative() {
            RealSign::Negative
        } else {
            RealSign::Zero
        })
    }

    fn bracket(&self, lower: &Real, upper: &Real) -> Option<IntegerBracketPolynomial<'_>> {
        use num::Integer;
        let (lower, upper) = (lower.exact_rational_ref()?, upper.exact_rational_ref()?);
        let scale = lower.denominator().lcm(upper.denominator());
        Some(IntegerBracketPolynomial {
            coefficients: &self.coefficients,
            start: scaled_rational_integer(lower, &scale),
            end: scaled_rational_integer(upper, &scale),
            scale: num::BigInt::from(scale),
        })
    }
}

fn scaled_rational_integer(value: &HyperRational, scale: &num::BigUint) -> num::BigInt {
    let magnitude = num::BigInt::from(value.numerator() * (scale / value.denominator()));
    if value.is_negative() { -magnitude } else { magnitude }
}

/// An exact rational polynomial and bracket over common denominators:
/// `coefficients[i] = D c_i`, `lower = start / scale` and
/// `upper = end / scale`, with `D` and `scale` positive integers. Positive
/// scalings preserve every enclosure sign. Horner and Bernstein can share
/// the borrowed coefficients and bracket conversion within one proof attempt.
struct IntegerBracketPolynomial<'a> {
    coefficients: &'a [num::BigInt],
    start: num::BigInt,
    end: num::BigInt,
    scale: num::BigInt,
}

impl IntegerBracketPolynomial<'_> {
    fn bernstein_strict_sign(&self) -> Option<RealSign> {
        use num::{BigInt, One, Zero};
'''+''.join('    '+line+'\n' for line in bernbody.splitlines())+'''    }

    fn horner_strict_sign(&self) -> Option<RealSign> {
'''+''.join('    '+line+'\n' for line in hornerbody.splitlines())+'''    }
}

'''
s=s[:start]+new+s[end:]
for name,body in [('rational_interval_strict_bernstein_sign','    let prepared = IntegerPolynomial::new(coefficients)?;\n    Some(prepared.bracket(lower, upper)?.bernstein_strict_sign())'),('rational_horner_interval_strict_sign','    let prepared = IntegerPolynomial::new(coefficients)?;\n    prepared.bracket(lower, upper)?.horner_strict_sign()')]:
 start,end,old=function(s,name);sig=old[:old.index('{')+1];s=s[:start]+sig+'\n'+body+'\n}'+s[end:]
old='    let sign_at = |point: &Real| real_sign(&Real::eval_poly(defining, point), policy);'
assert s.count(old)==1
s=s.replace(old,'''    let prepared_defining = (interval.start().exact_rational_ref().is_some()
        && interval.end().exact_rational_ref().is_some())
        .then(|| IntegerPolynomial::new(defining))
        .flatten();
    let sign_at = |point: &Real| {
        prepared_defining
            .as_ref()
            .and_then(|prepared| prepared.sign_at(point))
            .or_else(|| real_sign(&Real::eval_poly(defining, point), policy))
    };''')
old='''    let enclosure_sign = |lower: &Real, upper: &Real| -> CurveResult<Option<RealSign>> {
        if let Some(sign) = rational_horner_interval_strict_sign(coefficients, lower, upper) {'''
assert s.count(old)==1
s=s.replace(old,'''    let prepared_filter = IntegerPolynomial::new(coefficients);
    let enclosure_sign = |lower: &Real, upper: &Real| -> CurveResult<Option<RealSign>> {
        if let Some(form) = prepared_filter
            .as_ref()
            .and_then(|prepared| prepared.bracket(lower, upper))
        {
            return Ok(form.horner_strict_sign().or_else(|| form.bernstein_strict_sign()));
        }
        if let Some(sign) = rational_horner_interval_strict_sign(coefficients, lower, upper) {''')
old='''                    return Ok(real_sign(&Real::eval_poly(coefficients, &midpoint), policy));'''
assert s.count(old)==1
s=s.replace(old,'''                    return Ok(prepared_filter
                        .as_ref()
                        .and_then(|prepared| prepared.sign_at(&midpoint))
                        .or_else(|| real_sign(&Real::eval_poly(coefficients, &midpoint), policy)));''')
path.write_text(s)
subprocess.run(['rustfmt','--edition','2024',str(path)],check=True)
patch=subprocess.check_output(['git','diff','--binary'],cwd=root);(record/'candidate-source.patch').write_bytes(patch)
(record/'candidate-source.json').write_text(json.dumps({'patch_sha256':hashlib.sha256(patch).hexdigest(),'scope':'private candidate, no main source edit; fixed preparation plus homogeneous rational point signs, unchanged Bernstein power table'},indent=2)+'\n')
print('Private R14 candidate prepared.')
