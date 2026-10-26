fn stored_rational_bits(value: &Rational) -> u64 {
    value.numerator().bits() + value.denominator().bits()
}

impl Class {
    /// Largest rational parameter stored in this closed form.
    fn stored_rational_bits(&self) -> u64 {
        match self {
            One | Pi | PiPow(_) | PiInv | Irrational => 0,
            PiExp(r) | PiInvExp(r) | PiSqrt(r) | Sqrt(r) | Exp(r) | Ln(r) | Log10(r)
            | Log2(r) | Pow10(r) | Pow2(r) | SinPi(r) | TanPi(r) => stored_rational_bits(r),
            ConstProduct(product) => stored_rational_bits(&product.exp_power),
            ConstOffset(offset) => {
                stored_rational_bits(&offset.exp_power).max(stored_rational_bits(&offset.offset))
            }
            ConstProductSqrt(product) => stored_rational_bits(&product.exp_power)
                .max(stored_rational_bits(&product.radicand)),
            LnAffine(affine) => {
                stored_rational_bits(&affine.offset).max(stored_rational_bits(&affine.base))
            }
            LnProduct(product) => {
                stored_rational_bits(&product.left).max(stored_rational_bits(&product.right))
            }
        }
    }
}

impl Real {
    /// Report the size of the exact representation this value stores.
    ///
    /// An exact rational has no expression nodes, and a recognized closed
    /// form such as `sqrt(2)` or `sin(pi/16)` counts as one. Any other value
    /// counts the distinct nodes of its expression graph, visiting at most
    /// `node_limit` of them; [`RepresentationSize::complete`] reports whether
    /// the limit stopped the traversal. The rational scale and every stored
    /// rational parameter or leaf contribute to `max_rational_bits`.
    ///
    /// This reads stored fields only. It never approximates, refines,
    /// canonicalizes, or changes a cache, so equal values built differently
    /// can report different sizes. Use it to observe representation growth
    /// across repeated operations, not as a complexity bound. Work and
    /// temporary memory are linear in the visited nodes.
    pub fn representation_size(&self, node_limit: usize) -> RepresentationSize {
        let scale_bits = stored_rational_bits(&self.rational);
        let mut size = match (&self.class, &self.computable) {
            (One, _) => RepresentationSize {
                nodes: 0,
                depth: 0,
                max_rational_bits: 0,
                complete: true,
            },
            (Irrational, Some(computable)) => computable.representation_size(node_limit),
            // A materialized certificate of a closed form is a cache of that
            // form, so it does not count as stored structure.
            (class, _) => RepresentationSize {
                nodes: 1,
                depth: 1,
                max_rational_bits: class.stored_rational_bits(),
                complete: true,
            },
        };
        size.max_rational_bits = size.max_rational_bits.max(scale_bits);
        size
    }
}

#[cfg(test)]
mod representation_size_tests {
    use super::*;

    #[test]
    fn rationals_and_closed_forms_have_bounded_sizes() {
        let rational = Real::new(Rational::fraction(-255, 7).unwrap());
        assert_eq!(
            rational.representation_size(16),
            RepresentationSize {
                nodes: 0,
                depth: 0,
                max_rational_bits: 8 + 3,
                complete: true,
            }
        );
        let root = Real::from(2_u8).sqrt().unwrap() * Real::from(3_u8);
        let size = root.representation_size(16);
        assert_eq!((size.nodes, size.depth, size.complete), (1, 1, true));
        assert_eq!(size.max_rational_bits, 2 + 1);
    }

    #[test]
    fn shared_operands_count_once_and_depth_follows_the_longest_chain() {
        let atom = Real::pi() + Real::from(1_u8);
        let mut chain = atom.clone();
        for _ in 0..40 {
            // Each step reuses the previous value twice; a tree count would
            // double every step, while the graph grows by a bounded amount.
            chain = &chain * &chain + &atom;
        }
        let size = chain.representation_size(10_000);
        assert!(size.complete);
        assert!(size.nodes < 40 * 8, "{size:?}");
        assert!(size.depth >= 40, "{size:?}");
        let truncated = chain.representation_size(5);
        assert!(!truncated.complete);
        assert_eq!(truncated.nodes, 5);
        assert!(truncated.depth <= size.depth);
    }

    #[test]
    fn deep_chains_do_not_use_the_call_stack() {
        let mut chain = Real::pi();
        for index in 1..=4_000_u32 {
            chain += Real::from(index).sqrt().unwrap();
        }
        let size = chain.representation_size(usize::MAX);
        assert!(size.complete);
        assert!(size.depth >= 1_000, "{size:?}");
    }
}

#[cfg(feature="serde")]
impl Real {
    #[doc(hidden)]
    pub fn r16_debug_graph_snapshot(&self,limit:usize)->Result<serde_json::Value,&'static str> {
        let graph=self.computable.as_ref().map(|value|value.r16_graph_snapshot(limit)).transpose()?;
        Ok(serde_json::json!({"format":"r16-exact-real-dag-v1","rational":&self.rational,"class":&self.class,"computable":graph}))
    }
}
#[cfg(all(test,feature="serde"))]
mod r16_graph_tests {
    use super::*;
    fn expanded(value:&serde_json::Value,nodes:&[serde_json::Value])->serde_json::Value {
        match value {
            serde_json::Value::Object(map) if map.len()==1 && map.contains_key("r16_node_ref")=>serde_json::json!({"internal":expanded(&nodes[value["r16_node_ref"].as_u64().unwrap() as usize],nodes)}),
            serde_json::Value::Object(map)=>serde_json::Value::Object(map.iter().map(|(k,v)|(k.clone(),expanded(v,nodes))).collect()),
            serde_json::Value::Array(values)=>serde_json::Value::Array(values.iter().map(|v|expanded(v,nodes)).collect()),
            _=>value.clone(),
        }
    }
    #[test]
    fn graph_expansion_matches_ordinary_exact_serde_and_restores_it() {
        let atom=Real::pi()+Real::one();let shared=&atom*&atom+Real::from(3).sqrt().unwrap();
        for value in [shared.clone(), &shared*&shared+&atom, (Real::one()/(&shared+Real::one())).unwrap(),Real::from(7)] {
            let before=serde_json::to_value(&value).unwrap();let captured=value.r16_debug_graph_snapshot(10_000).unwrap();
            let graph=&captured["computable"];
            let computable=if graph.is_null(){serde_json::Value::Null}else{serde_json::json!({"internal":expanded(&graph["nodes"][graph["root"].as_u64().unwrap() as usize],graph["nodes"].as_array().unwrap())})};
            let restored=serde_json::json!({"rational":captured["rational"],"class":captured["class"],"computable":computable});
            assert_eq!(before,restored);assert_eq!(before,serde_json::to_value(&value).unwrap());
        }
    }
    #[test]
    fn graph_sharing_stays_linear_and_limits_fail_explicitly() {
        let atom=Real::pi()+Real::one();let mut value=atom.clone();for _ in 0..40{value=&value*&value+&atom;}
        let captured=value.r16_debug_graph_snapshot(100_000).unwrap();let nodes=captured["computable"]["nodes"].as_array().unwrap();
        assert!(!nodes.is_empty() && nodes.len()<1000);assert!(serde_json::to_vec(&captured).unwrap().len()<500_000);
        assert_eq!(value.r16_debug_graph_snapshot(1),Err("diagnostic graph node limit"));
        assert_eq!(value.r16_debug_graph_snapshot(100_000).unwrap(),captured);
    }
}
