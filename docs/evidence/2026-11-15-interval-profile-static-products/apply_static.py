from pathlib import Path
s=Path(__file__).parent;root=Path('/mnt/development/interval-profile-static');owner=root/'csgrs';interface=root/'alumina-interface'
p=owner/'crates/hyperinterval/src/rational/positive.rs';old=p.read_text();assert 'pub fn product(factors: &[&Self]) -> Self {' in old
p.write_text(old.replace('    pub fn product(factors: &[&Self]) -> Self {', '''    /// Array types retain their factor count at this generic API boundary;
    /// slices and vectors retain runtime-length support with the same arithmetic.
    pub fn product<'a>(factors: impl AsRef<[&'a Self]>) -> Self {
        let factors = factors.as_ref();'''))
p=interface/'crates/alumina-interface-core/src/machine_profile.rs';text=p.read_text();assert 'PositiveRationalInterval::product(&[' in text;p.write_text(text.replace('PositiveRationalInterval::product(&[','PositiveRationalInterval::product(['))
p=owner/'crates/hyperinterval/tests/positive_product_chain.rs';text=p.read_text().replace('PositiveRationalInterval::product(&[','PositiveRationalInterval::product([').replace('PositiveRationalInterval::product(&factors.each_ref())','PositiveRationalInterval::product(factors.each_ref())')
text=text.replace('assert!(side == "original" || side == "shared");','assert!(side == "original" || side == "shared" || side == "static");')
old='''                        PositiveRationalInterval::product(&factors.each_ref()[..4])
                            .quotient(&factors[4])
                            .into_bounds()'''
new='''                        let product = if side == "static" {
                            PositiveRationalInterval::product([
                                &factors[0], &factors[1], &factors[2], &factors[3],
                            ])
                        } else {
                            PositiveRationalInterval::product(&factors.each_ref()[..4])
                        };
                        product.quotient(&factors[4]).into_bounds()'''
assert old in text;text=text.replace(old,new).replace('    assert_eq!(shared, original);','    assert_eq!(shared, original);\n    assert_eq!(run("static"), original);')
text+='''
#[test]
fn static_and_runtime_lengths_keep_exact_products_without_factor_limits() {
    fn check<const N: usize>() {
        let factors: [_; N] = std::array::from_fn(|i| {
            RationalInterval::new(Rational::from(i + 1), Rational::from(i + 2))
                .unwrap().into_positive().unwrap()
        });
        let fixed = PositiveRationalInterval::product(factors.each_ref());
        let dynamic: Vec<_> = factors.iter().collect();
        assert_eq!(PositiveRationalInterval::product(dynamic.as_slice()), fixed);
        assert_eq!(PositiveRationalInterval::product(dynamic), fixed);
        // Independent integer endpoint products; no shared interval algorithm.
        let lower: u128 = (1..=N as u128).product();
        let upper: u128 = (2..=N as u128 + 1).product();
        assert_eq!(fixed.into_bounds(), (Rational::from(lower), Rational::from(upper)));
    }
    check::<0>(); check::<1>(); check::<2>(); check::<4>(); check::<8>(); check::<16>();
}
''';p.write_text(text)
