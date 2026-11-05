from pathlib import Path
import subprocess
p=Path('crates/hyperbrep/src/topology/edit/partition.rs');s=p.read_text()
a='let open_chains = open_trace_chains(&endpoint_adjacency, &open_candidates);'
b='let open_chains = open_trace_chains(&endpoint_adjacency, &open_candidates).into_iter().filter(|_| false).collect::<Vec<_>>();'
assert a in s
try:
 p.write_text(s.replace(a,b))
 with Path('/tmp/hyperbrep-selected-attachment-boundary-control.log').open('w') as f:
  r=subprocess.run(['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--lib','geometry::tests::surface_trace_chains_keep_existing_boundary_junctions','--','--exact','--nocapture'],stdout=f,stderr=subprocess.STDOUT)
 print(r.returncode)
finally:p.write_text(s)
