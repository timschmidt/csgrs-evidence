fn pivot_free_determinant(matrix: &[Vec<Real>]) -> BareissDeterminantReport {
    let n = matrix.len();
    if n == 0 {
        return BareissDeterminantReport {
            determinant: Real::one(),
            swaps: 0,
            pivots: Vec::new(),
            method: BareissDeterminantMethod::PivotFreeFaddeevLeverrier,
        };
    }

    // Faddeev-LeVerrier constructs the characteristic coefficients without a
    // data-dependent division. Its only scale is the exact rational -1/k, so
    // an unresolved matrix pivot cannot block determinant construction.
    let mut coefficient_matrix = vec![vec![Real::zero(); n]; n];
    for (index, row) in coefficient_matrix.iter_mut().enumerate() {
        row[index] = Real::one();
    }

    for step in 1..=n {
        let mut product = vec![vec![Real::zero(); n]; n];
        for (row_index, row) in product.iter_mut().enumerate() {
            for (column, value) in row.iter_mut().enumerate() {
                *value = (0..n).fold(Real::zero(), |sum, inner| {
                    sum + &matrix[row_index][inner] * &coefficient_matrix[inner][column]
                });
            }
        }
        let trace = (0..n).fold(Real::zero(), |sum, index| sum + &product[index][index]);
        let denominator = u64::try_from(step).expect("an allocated matrix dimension fits u64");
        let scale = Real::from(
            Rational::fraction(-1, denominator).expect("Faddeev-LeVerrier step is nonzero"),
        );
        let coefficient = trace * scale;
        if step == n {
            let determinant = if n.is_multiple_of(2) {
                coefficient
            } else {
                -coefficient
            };
            return BareissDeterminantReport {
                determinant,
                swaps: 0,
                pivots: Vec::new(),
                method: BareissDeterminantMethod::PivotFreeFaddeevLeverrier,
            };
        }
        for (index, row) in product.iter_mut().enumerate() {
            row[index] += coefficient.clone();
        }
        coefficient_matrix = product;
    }

    unreachable!("a nonempty determinant construction executes at least one step")
}
