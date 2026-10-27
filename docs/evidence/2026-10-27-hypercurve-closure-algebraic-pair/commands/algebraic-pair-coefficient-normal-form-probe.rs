use hyperreal::Real;
use hyperlimit::{compare_reals, PredicatePolicy};
use hypersolve::{BivariatePolynomial, bivariate_arithmetic::bivariate_compose};
fn main() {
    let s=Real::from(2).root_n(7).unwrap();
    let square=&s*&s; let fourth=&square*&square; let fifth=&fourth*&s;
    let world=BivariatePolynomial::new(vec![vec![Real::from(5)*&fifth, Real::from(5)*&fourth,0.into(),0.into(),0.into(),1.into()],vec![-fourth]]);
    let x=BivariatePolynomial::new(vec![vec![],vec![s.clone()]]);
    let y=BivariatePolynomial::new(vec![vec![0.into(),s]]);
    let p=bivariate_compose(&world,&x,&y);
    for (i,j,k) in [(0,0,5),(0,1,5),(0,5,1),(1,0,-1)] {
        let actual=&p.coefficients[i][j]; let expected=Real::from(k)*&fifth;
        eprintln!("coefficient {i},{j}: structural {}",actual==&expected);
        eprintln!("coefficient {i},{j}: quotient {:?}",(actual/&expected).map(|r| r.exact_rational_normal_form()));
        eprintln!("coefficient {i},{j}: comparison {:?}",compare_reals(actual,&expected,PredicatePolicy::STRICT));
    }
}
