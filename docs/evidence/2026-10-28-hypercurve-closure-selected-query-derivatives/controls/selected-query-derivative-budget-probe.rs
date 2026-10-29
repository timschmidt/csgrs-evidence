
#[test]
fn derivative_budget_probe() {
    use hypersolve::work_budget::{with_budget, WorkBudget};
    let (curve, parameter) = selected_query_derivative_source();
    let form = parameter.rational_form_source().unwrap();
    let definition = form.source().definition().unwrap();
    let attempt = || {
        let point = definition.clone().into_point()?;
        let parameter = point.rational_form(form.numerator().clone(),form.denominator().clone())?.parameter()?;
        curve.derivatives_at(&parameter,3).map(|v| v.len())
    };
    for limit in [0,1024,0,1024] {
        let result = with_budget(WorkBudget {refinements:4096,promotions:limit},attempt);
        eprintln!("fresh replay limit={limit}: {result:?}");
    }
    let reuse = with_budget(WorkBudget{refinements:4096,promotions:0},||curve.derivatives_at(&parameter,3).map(|v|v.len()));
    eprintln!("reuse: {reuse:?}");
    let point=joint();
    let half=constant(&point,1).scaled(&q(1,2)).unwrap().parameter().unwrap();
    let pole:Curve2=RationalBezier2::try_new(vec![Point2::from_values(0,0),Point2::from_values(1,1)],vec![1.into(),(-1).into()]).unwrap().into();
    for order in [0,3] {eprintln!("pole order={order}: {:?}",pole.derivatives_at(&half,order).map(|v|v.len()));}
}
