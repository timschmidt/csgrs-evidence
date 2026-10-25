
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
