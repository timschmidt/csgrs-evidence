from pathlib import Path
import subprocess
p=Path('crates/hyperbrep/src/topology/edit/partition.rs');s=p.read_text();a='            let chains = closed_trace_chains(&ordered, &uncrossed)?;'
assert a in s
b=a+'''\n            eprintln!("CHAIN CENSUS face={:?} operand={:?} traces={:?} split_counts={:?} candidates={:?} chains={:?}", face_id, operand, ordered.iter().map(|t| (t.source_index, t.intersection.curve().kind())).collect::<Vec<_>>(), split_parameters.iter().map(Vec::len).collect::<Vec<_>>(), uncrossed, chains);
'''
try:
 p.write_text(s.replace(a,b))
 with Path('/tmp/hyperbrep-selected-attachment-chain-trace.log').open('w') as f:
  r=subprocess.run(['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--test','tensor_graph_solids','nonlinear_tensor_caps_support_transverse_recuts','--','--ignored','--exact','--nocapture'],stdout=f,stderr=subprocess.STDOUT)
 print('chain trace exit',r.returncode)
finally:p.write_text(s)
