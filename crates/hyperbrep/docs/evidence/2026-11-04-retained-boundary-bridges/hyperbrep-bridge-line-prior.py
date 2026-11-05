from pathlib import Path
import subprocess
files=[Path('crates/hypercurve/src/polynomial_curve_section.rs'),Path('crates/hypercurve/src/curve_evaluation.rs')]
saved={p:p.read_bytes() for p in files}
try:
 for p in files:p.write_bytes(subprocess.check_output(['git','show','HEAD:'+str(p)]))
 for name in ['rational_overlaps_keep_selected_trims_across_policies','rational_common_support_keeps_other_branch_endpoint_contacts']:
  with Path('/tmp/hyperbrep-bridge-line-prior-'+name+'.log').open('w') as f:
   r=subprocess.run(['cargo','test','--offline','--locked','-p','hypercurve','--all-features','--test','polynomial_rational_sections',name,'--','--exact','--nocapture'],stdout=f,stderr=subprocess.STDOUT)
  print(name,r.returncode,flush=True)
finally:
 for p,s in saved.items():p.write_bytes(s)
