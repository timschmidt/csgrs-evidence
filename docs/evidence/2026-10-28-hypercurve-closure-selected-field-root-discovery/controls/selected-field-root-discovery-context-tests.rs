
struct LimitedRemainder<F>(F);

impl<C, F: hypersolve::OrderedFieldPolynomialContext<C>> hypersolve::OrderedFieldPolynomialContext<C>
    for LimitedRemainder<F>
{
    type Error = F::Error;
    fn constant(&mut self, value: &Real) -> Result<C, Self::Error> { self.0.constant(value) }
    fn add(&mut self, a: &C, b: &C) -> Result<C, Self::Error> { self.0.add(a, b) }
    fn multiply(&mut self, a: &C, b: &C) -> Result<C, Self::Error> { self.0.multiply(a, b) }
    fn scale(&mut self, value: &C, scale: &Real) -> Result<C, Self::Error> { self.0.scale(value, scale) }
    fn normalize_positive_scale(&mut self, values: &mut [C]) { self.0.normalize_positive_scale(values); }
    fn sign(&mut self, value: &C) -> Result<std::cmp::Ordering, Self::Error> { self.0.sign(value) }
    fn sign_if_separated(&mut self, value: &C) -> Result<Option<std::cmp::Ordering>, Self::Error> { self.0.sign_if_separated(value) }
    fn remainder_elimination_budget(&self) -> Option<usize> { Some(0) }
}

#[test]
fn complete_discovery_retains_context_fallback_without_inventing_exhaustion() {
    let q = base();
    let policy = TestContext::strict();
    let mut context = LimitedRemainder(hypersolve::selected_polynomial_field::SelectedPolynomialContext { field: q.clone(), policy: &policy });
    let result = with_budget(WorkBudget::ZERO, || {
        hypersolve::isolate_ordered_field_polynomial_roots_complete(coefficients(&q, &[-2, 0, 0, 1]), &real(1), &real(2), 4, &mut context).unwrap()
    });
    let report = result.result.expect("no subdivision or promotion was attempted");
    assert_eq!(report.status, hypersolve::OrderedFieldRootIsolationStatus::CompleteFallbackRequired);
    assert!(report.intervals.is_empty());
    assert_eq!(result.usage.refinements, 0);
    assert_eq!(result.usage.promotions, 0);
    let retry = discover(&q, coefficients(&q, &[-2, 0, 0, 1]), &real(1), &real(2), 4, &policy);
    assert_eq!(retry.status, hypersolve::OrderedFieldRootIsolationStatus::Isolated);
    assert_eq!(retry.intervals.len(), 1);
}

#[test]
fn complete_discovery_admits_degree_seventeen_over_an_algebraic_field() {
    let q = base();
    let a = discovered_root(&q.constant(real(2)).unwrap(), 3);
    let value = discovered_root(&a, 17);
    is_zero(&power(&value, 17).subtract(&value.field().lift(&a).unwrap()).unwrap());
    is_zero(&power(&value, 51).subtract(&value.field().constant(real(2)).unwrap()).unwrap());
    assert!(value.field().parent().unwrap().shares_authority(a.field()));
}
