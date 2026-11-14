        for degree in 2..=count {
            budget.graph.charge(1)?;
            let previous = stages.last().expect("first coefficient exists");
            let mut requests = Vec::new();
            for &output in &previous.outputs {
                for variable in std::iter::once(self.data.identity.time())
                    .chain(self.data.identity.state().iter().copied())
                {
                    budget.graph.charge(2)?;
                    requests.push(CoefficientRequest {
                        output,
                        powers: vec![(variable, 1)],
                    });
                }
            }
            let derivatives = previous
                .program
                .coefficients(&requests, &mut budget.graph)
                .map_err(FlowTaylorError::Coefficient)?;
            let source = derivatives.program().definition();
            let added_nodes = N
                .checked_mul(
                    N.checked_mul(2)
                        .and_then(|v| v.checked_add(1))
                        .ok_or(ExpressionError::SizeExhausted)?,
                )
                .and_then(|v| v.checked_add(1))
                .ok_or(ExpressionError::SizeExhausted)?;
            let nodes = source
                .nodes
                .len()
                .checked_add(added_nodes)
                .ok_or(ExpressionError::SizeExhausted)?;
            let outputs = source
                .outputs
                .len()
                .checked_add(N)
                .ok_or(ExpressionError::SizeExhausted)?;
            budget.graph.check_entries(&[
                count,
                source.variables.len(),
                nodes,
                outputs,
                requests_len,
                requests_len,
                N,
            ])?;
            budget.graph.charge(source.variables.len())?;
            budget.graph.charge(source.nodes.len())?;
            budget.graph.charge(source.outputs.len())?;
            // No public graph builder exists. This is only the ODE recurrence:
            // differentiation, validation and scalar evaluation stay in Hypersolve.
            let mut definition = source.clone();
            budget.graph.charge(1)?;
            let denominator = definition.nodes.len();
            definition
                .nodes
                .push(ExpressionNode::Constant(Real::from(degree as u128)));
            let first = definition.outputs.len();
            for row in 0..N {
                budget.graph.charge(1)?;
                let partial = |column: usize| {
                    source.outputs[derivatives
                        .coefficient_output(row * columns + column)
                        .expect("requested partial")]
                };
                let mut sum = partial(0);
                for state in 0..N {
                    budget.graph.charge(2)?;
                    let product = definition.nodes.len();
                    definition.nodes.push(ExpressionNode::Binary {
                        operation: BinaryOperation::Mul,
                        left: partial(state + 1),
                        right: source.outputs[state],
                    });
                    let next = definition.nodes.len();
                    definition.nodes.push(ExpressionNode::Binary {
                        operation: BinaryOperation::Add,
                        left: sum,
                        right: product,
                    });
                    sum = next;
                }
                budget.graph.charge(2)?;
                let value = definition.nodes.len();
                definition.nodes.push(ExpressionNode::Binary {
                    operation: BinaryOperation::Div,
                    left: sum,
                    right: denominator,
                });
                definition.outputs.push(value);
            }
            let program = ExpressionProgram::from_definition(definition, &mut budget.graph)?;
            budget.graph.charge(N)?;
            stages.push(FlowTaylorStage {
                degree,
                derivatives: Some(derivatives),
                program,
                outputs: std::array::from_fn(|i| first + i),
            });
        }
