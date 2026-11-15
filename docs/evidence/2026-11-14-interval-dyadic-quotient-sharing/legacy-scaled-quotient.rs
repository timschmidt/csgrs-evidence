fn legacy_scaled_quotient(
    n: &BigInt,
    d: &BigInt,
    shift: i64,
    budget: &mut DyadicBudget,
) -> Result<(BigInt, BigInt), IntervalError> {
    if d.is_zero() {
        return Err(IntervalError::ContainsZero);
    }
    let n_bits = n
        .bits()
        .saturating_add(if shift >= 0 { shift as u64 } else { 0 });
    let d_bits = d
        .bits()
        .saturating_add(if shift < 0 { shift.unsigned_abs() } else { 0 });
    budget.reserve(n_bits.max(d_bits).saturating_add(1), 4, true)?;
    let amount = usize::try_from(shift.unsigned_abs()).map_err(|_| IntervalError::Overflow)?;
    let (n, d) = if shift >= 0 {
        (n << amount, d.clone())
    } else {
        (n.clone(), d << amount)
    };
    Ok((n.div_floor(&d), n.div_ceil(&d)))
}
