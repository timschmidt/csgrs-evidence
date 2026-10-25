
#[cfg(feature = "serde")]
thread_local! {
    static R16_GRAPH_IDS: std::cell::RefCell<Option<std::collections::HashMap<usize,usize>>> = const {std::cell::RefCell::new(None)};
}
#[cfg(feature = "serde")]
impl Serialize for Computable {
    fn serialize<S: serde::Serializer>(&self, serializer:S)->Result<S::Ok,S::Error> {
        use serde::ser::SerializeStruct;
        let state=R16_GRAPH_IDS.with(|ids|ids.borrow().as_ref().map(|ids|ids.get(&(Arc::as_ptr(&self.internal) as usize)).copied()));
        match state {
            Some(Some(id)) => serde_json::json!({"r16_node_ref":id}).serialize(serializer),
            Some(None) => Err(serde::ser::Error::custom("uncaptured diagnostic graph operand")),
            None => {let mut state=serializer.serialize_struct("Computable",1)?;state.serialize_field("internal",&self.internal)?;state.end()}
        }
    }
}
#[cfg(feature = "serde")]
struct R16GraphGuard(Option<std::collections::HashMap<usize,usize>>);
#[cfg(feature = "serde")]
impl Drop for R16GraphGuard {fn drop(&mut self){R16_GRAPH_IDS.with(|ids|{ids.replace(self.0.take());});}}
#[cfg(feature = "serde")]
impl Computable {
    pub(crate) fn r16_graph_snapshot(&self, limit:usize)->Result<serde_json::Value,&'static str> {
        let mut ids=std::collections::HashMap::new();let mut nodes=Vec::new();let mut stack=vec![(self,false)];let mut started=0;
        while let Some((value,expanded))=stack.pop() {
            let key=Arc::as_ptr(&value.internal) as usize;
            if ids.contains_key(&key){continue;}
            if expanded {ids.insert(key,nodes.len());nodes.push(value);continue;}
            if started==limit{return Err("diagnostic graph node limit");}
            if value.internal.approximation.stored_rational_bits()>1_048_576{return Err("diagnostic rational bit limit");}
            started+=1;stack.push((value,true));value.internal.approximation.for_each_operand(|child|{if !ids.contains_key(&(Arc::as_ptr(&child.internal) as usize)){stack.push((child,false));}});
        }
        let root=ids[&(Arc::as_ptr(&self.internal) as usize)];
        let _guard=R16GraphGuard(R16_GRAPH_IDS.with(|current|current.replace(Some(ids))));
        let nodes=nodes.iter().map(|node|serde_json::to_value(&node.internal.approximation).map_err(|_|"diagnostic node serialization")).collect::<Result<Vec<_>,_>>()?;
        Ok(serde_json::json!({"root":root,"nodes":nodes}))
    }
}
