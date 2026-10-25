from pathlib import Path
import hashlib,json,subprocess,time
raw=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-r16-trace')
assert (raw/'capture-full-real-1792956802844918019/recovered-failure.json').exists()
plan={'created_ns':time.time_ns(),'owner':'Private Hyperreal diagnostic export, reused by the R16 capture; no primary source change','properties':['P1-P6','P19-P20','P35-P36'],'missing_acceptance':'Tree serde expanded one shared coefficient to 5,874,413,454 bytes and the second hit disk quota. Capture needs a bounded graph representation preserving operators, literal payloads, child identities and ordinary serde behavior.','design':'Reuse the existing exhaustive operand visitor for iterative postorder IDs. During serialization of node payloads, replace each Computable child with its preassigned node reference. Preserve Real scale/class separately. Restore normal serde with a thread-local RAII guard. Refuse missing references or more than 100,000 nodes / 1,048,576 rational bits per node.','gates':'Compare a small expanded graph exactly with ordinary serde before/after; verify shared growth and explicit node-limit refusal. Original second workflow repeats only after these tests pass. Add 64-MiB per-file and 512-MiB total export caps plus external 300-second/8-GiB containment.','scope':'Diagnostic-only helper/API; not a new public archive protocol, unchecked importer or admitted Hyperreal change.'}
(raw/'graph-capture-plan.json').write_text(json.dumps(plan,indent=2)+'\n')
p=root/'crates/hyperreal/src/computable/node/representation.rs';s=p.read_text();old='#[cfg_attr(feature = "serde", derive(Serialize, Deserialize))]';assert s.count(old)==1;p.write_text(s.replace(old,'#[cfg_attr(feature = "serde", derive(Deserialize))]',1))
node=r'''
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
'''
p=root/'crates/hyperreal/src/computable/node/representation_size.rs';p.write_text(p.read_text()+node);(raw/'graph-node-helper.rs').write_text(node)
real=r'''
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
'''
p=root/'crates/hyperreal/src/real/arithmetic/representation_size.rs';p.write_text(p.read_text()+real);(raw/'graph-real-helper.rs').write_text(real)
p=root/'crates/hypersolve/src/algebraic_fiber/r16_trace.rs';s=p.read_text();needle='serde_json::to_writer(&mut writer, value).expect("exact Real export");';assert s.count(needle)==1;s=s.replace(needle,'let snapshot=value.r16_debug_graph_snapshot(100_000).expect("bounded exact graph capture");\n            serde_json::to_writer(&mut writer, &snapshot).expect("exact graph export");');s=s.replace('exact_real_file','exact_real_graph_file').replace('object references exact serialized Real','object references exact Real graph');p.write_text(s)
subprocess.run(['cargo','fmt','--all'],cwd=root,check=True)
(raw/'graph-trace-source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root));(raw/'graph-r16_trace.rs').write_bytes(p.read_bytes())
s=(raw/'run_full_real_capture.py').read_text().replace('capture-full-real-','capture-graph-')
s=s.replace('resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))','resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3));resource.setrlimit(resource.RLIMIT_FSIZE,(64*1024**2,64*1024**2))')
s=s.replace('if elapsed>=300:','if sum(f.stat().st_size for f in case.iterdir() if f.is_file())>=512*1024**2:\n    os.killpg(p.pid,signal.SIGKILL);p.wait();status="capture-byte-limit";break\n   if elapsed>=300:')
(raw/'run_graph_capture.py').write_text(s)
print('Bounded graph capture prepared; must pass graph tests before running original workload')
