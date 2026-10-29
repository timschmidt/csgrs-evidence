
#[path = "support/selected_polynomial_replay.rs"]
mod codec;

fn cube_is(value: &SelectedPolynomialValue, expected: i64) {
    assert_eq!(
        value.multiply(value).unwrap().multiply(value).unwrap()
            .subtract(&value.field().constant(real(expected)).unwrap()).unwrap()
            .sign(&TestContext::strict()).unwrap(),
        Classification::Decided(hyperreal::RealSign::Zero)
    );
}

#[test]
fn repeated_joins_reuse_both_original_operands_without_promotion() {
    use hypersolve::work_budget::{WorkBudget, with_budget};
    for context in [TestContext::strict(), TestContext::approximate(), TestContext::strict()] {
        let a = root(2);
        let b = root(3);
        let ab = value(a.joined_with(&b, &context).unwrap());
        let original = ab.field().clone();
        let mut current = original.clone();
        for _ in 0..8 {
            for source in [&a, &b] {
                let reused = with_budget(WorkBudget { refinements: 4096, promotions: 0 },
                    || current.joined_with(source, &context).unwrap());
                let join = value(reused.result.unwrap());
                assert_eq!(reused.usage.promotions, 0);
                assert_eq!(depth(join.field()), 2);
                assert!(join.field().shares_authority(&original));
                cube_is(&join.embed(&a.generator().unwrap()).unwrap(), 2);
                // Each join only promises embeddings of its own operands;
                // the original second source is consumed on its own turn.
                if source.shares_authority(&b) {
                    cube_is(&join.embed(&b.generator().unwrap()).unwrap(), 3);
                }
                current = join.field().clone();
            }
        }
        assert_eq!(context.approximations(), 0);
    }
}

#[test]
fn diamond_joins_share_transported_generators_and_keep_independent_selections() {
    let context = TestContext::strict();
    let a = root(2);
    let b = root(3);
    let c = root(5);
    let ab = value(a.joined_with(&b, &context).unwrap());
    let ac = value(a.joined_with(&c, &context).unwrap());
    let bc = value(b.joined_with(&c, &context).unwrap());
    let abc = value(ab.field().joined_with(ac.field(), &context).unwrap());
    assert_eq!(depth(abc.field()), 3);
    let reunited = value(abc.field().joined_with(bc.field(), &context).unwrap());
    assert_eq!(depth(reunited.field()), 3);
    assert!(reunited.field().shares_authority(abc.field()));
    cube_is(&reunited.embed(&bc.embed(&b.generator().unwrap()).unwrap()).unwrap(), 3);
    cube_is(&reunited.embed(&bc.embed(&c.generator().unwrap()).unwrap()).unwrap(), 5);
    // A newly selected equal root has its own selection authority. It cannot
    // acquire an origin link merely from the same polynomial or interval.
    let independent_b = root(3);
    let independent = value(abc.field().joined_with(&independent_b, &context).unwrap());
    assert_eq!(depth(independent.field()), 4);
    cube_is(&independent.embed(&independent_b.generator().unwrap()).unwrap(), 3);
}

fn join_graph() -> SelectedPolynomialDefinition {
    let a = root(2);
    let b = root(3);
    let join = value(a.joined_with(&b, &TestContext::strict()).unwrap());
    let outputs = [
        join.embed(&a.generator().unwrap()).unwrap(),
        join.embed(&b.generator().unwrap()).unwrap(),
        a.generator().unwrap(),
        b.generator().unwrap(),
    ];
    SelectedPolynomialDefinition::from_values(&outputs, 10000).unwrap()
}

fn verify_replayed_join(graph: &SelectedPolynomialDefinition) -> Vec<SelectedPolynomialValue> {
    let context = TestContext::strict();
    let values = value(graph.replay(graph.nodes.len(), &context).unwrap());
    assert_eq!(values.len(), 4);
    for (v, expected) in values.iter().zip([2, 3, 2, 3]) { cube_is(v, expected); }
    let mut field = values[0].field().clone();
    for original in [&values[2], &values[3]] {
        let joined = value(field.joined_with(original.field(), &context).unwrap());
        assert_eq!(depth(joined.field()), 2);
        assert_eq!(
            joined.embed(original).unwrap()
                .subtract(&joined.embed(if original.field().shares_authority(values[2].field()) { &values[0] } else { &values[1] }).unwrap()).unwrap()
                .sign(&context).unwrap(),
            Classification::Decided(hyperreal::RealSign::Zero)
        );
        field = joined.field().clone();
    }
    values
}

#[test]
fn join_correspondences_survive_fresh_process_replay_and_further_joins() {
    const INPUT: &str = "HYPERSOLVE_JOIN_CORRESPONDENCE_INPUT";
    if let Some(path) = std::env::var_os(INPUT) {
        let graph = codec::decode(&std::fs::read_to_string(path).unwrap());
        let values = verify_replayed_join(&graph);
        let next = SelectedPolynomialDefinition::from_values(&values, 10000).unwrap();
        assert_eq!(codec::encode(&next), codec::encode(&graph));
        verify_replayed_join(&next);
        return;
    }
    let graph = join_graph();
    assert!(graph.nodes.iter().any(|node| matches!(node,
        SelectedPolynomialDefinitionNode::JoinedField { .. })));
    let wire = codec::encode(&graph);
    assert_eq!(wire, codec::encode(&codec::decode(&wire)));
    let path = std::env::temp_dir().join(format!("hypersolve-join-correspondence-{}-{}.json",
        std::process::id(), std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH).unwrap().as_nanos()));
    std::fs::write(&path, wire).unwrap();
    let child = std::process::Command::new(std::env::current_exe().unwrap())
        .args(["--exact", "join_correspondences_survive_fresh_process_replay_and_further_joins", "--nocapture"])
        .env(INPUT, &path).output();
    std::fs::remove_file(path).unwrap();
    let child = child.unwrap();
    assert!(child.status.success(), "cold replay failed: {}{}",
        String::from_utf8_lossy(&child.stdout), String::from_utf8_lossy(&child.stderr));
}

#[test]
fn join_recipes_validate_original_selectors_references_and_resource_retries() {
    use hypersolve::work_budget::{WorkBudget, WorkKind, with_budget};
    use SelectedPolynomialDefinitionNode as Node;
    use SelectedPolynomialReplayError as ReplayError;
    let graph = join_graph();
    let joined_index = graph.nodes.iter().position(|node| matches!(node, Node::JoinedField { .. })).unwrap();
    let wrong_kind = graph.nodes[..joined_index].iter().position(|node| matches!(node, Node::NativeValue { .. } | Node::PolynomialValue { .. })).unwrap();
    for reference in [joined_index, usize::MAX, wrong_kind] {
        let mut bad = graph.clone();
        if let Node::JoinedField { second, .. } = &mut bad.nodes[joined_index] { *second = reference; }
        assert!(matches!(bad.replay(10000, &TestContext::strict()), Err(ReplayError::InvalidReference { .. })));
    }
    let mut bad = graph.clone();
    bad.nodes.push(Node::JoinedField { first: graph.roots[0], second: usize::MAX });
    assert!(matches!(bad.replay(10000, &TestContext::strict()), Err(ReplayError::InvalidReference { .. })));
    let mut bad = graph.clone();
    let original = match bad.nodes[joined_index] { Node::JoinedField { second, .. } => second, _ => unreachable!() };
    if let Node::PolynomialField { lower, upper, .. } = &mut bad.nodes[original] {
        *lower = real(3); *upper = real(4);
    } else { panic!("original selected source") }
    assert!(matches!(bad.replay(10000, &TestContext::strict()), Err(ReplayError::Field(SelectedPolynomialError::NoRoot))));
    assert!(matches!(graph.replay(graph.nodes.len()-1, &TestContext::strict()), Err(ReplayError::NodeLimit(_))));
    let refused = with_budget(WorkBudget::ZERO, || {
        let result = graph.replay(graph.nodes.len(), &TestContext::strict()).unwrap();
        assert!(matches!(result, Classification::Uncertain(hypersolve::classification::UncertaintyReason::BudgetExhausted)));
        result
    });
    assert_eq!(refused.result.unwrap_err().kind, WorkKind::AlgebraicPromotion);
    for _ in 0..2 {
        let retry = with_budget(WorkBudget { refinements: 4096, promotions: 64 },
            || verify_replayed_join(&graph));
        assert_eq!(retry.result.unwrap().len(), 4);
    }
}

#[test]
fn foreign_native_coefficient_maps_survive_generator_reuse_and_replay() {
    let context = TestContext::strict();
    let first_native = RecursiveQuadraticField::base(vec![cube_root_two()],
        constant_tensor(1, real(1)), constant_tensor(1, real(1))).unwrap();
    let a_native = first_native.retained_root_value(&cube_root_two()).unwrap();
    let first = SelectedPolynomialField::from_recursive(first_native);
    let a = first.import_recursive(&a_native).unwrap();
    let root_over = |value: &SelectedPolynomialValue| {
        let parent = value.field();
        value_from_selection(parent, vec![value.scale(&real(-1)).unwrap(),
            parent.constant(real(0)).unwrap(), parent.constant(real(0)).unwrap(),
            parent.constant(real(1)).unwrap()], &context)
    };
    let first_root = root_over(&a);
    let second_base = RecursiveQuadraticField::base(vec![sqrt_two_root()],
        constant_tensor(1, real(2)), constant_tensor(1, real(3))).unwrap();
    let s = second_base.retained_root_value(&sqrt_two_root()).unwrap();
    let radicand = s.add(&second_base.constant(real(1)).unwrap()).unwrap();
    let second_native = second_base.extension(radicand.clone()).unwrap();
    let radical = second_native.retained_positive_square_root(&radicand).unwrap();
    let second = SelectedPolynomialField::from_recursive(second_native);
    let radical = second.import_recursive(&radical).unwrap();
    let second_root = root_over(&radical);
    let joined = value(first_root.joined_with(&second_root, &context).unwrap());
    let reused = value(joined.field().joined_with(&second_root, &context).unwrap());
    assert_eq!(depth(reused.field()), depth(joined.field()));
    let x = reused.embed(&second_root.generator().unwrap()).unwrap();
    let r = reused.embed(&radical).unwrap();
    assert_eq!(x.multiply(&x).unwrap().multiply(&x).unwrap().subtract(&r).unwrap()
        .sign(&context).unwrap(), Classification::Decided(hyperreal::RealSign::Zero));
    let graph = SelectedPolynomialDefinition::from_values(
        &[x, second_root.generator().unwrap(), r], 10000).unwrap();
    let replayed = value(codec::decode(&codec::encode(&graph)).replay(10000, &context).unwrap());
    let original_depth = depth(replayed[0].field());
    let again = value(replayed[0].field().joined_with(replayed[1].field(), &context).unwrap());
    assert_eq!(depth(again.field()), original_depth);
    assert_eq!(again.embed(&replayed[0]).unwrap().subtract(&again.embed(&replayed[1]).unwrap()).unwrap()
        .sign(&context).unwrap(), Classification::Decided(hyperreal::RealSign::Zero));
}

fn value_from_selection(parent: &SelectedPolynomialField, coefficients: Vec<SelectedPolynomialValue>, context: &TestContext) -> SelectedPolynomialField {
    value(parent.select(coefficients, real(1), real(2), context).unwrap())
}
