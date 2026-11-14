from pathlib import Path
import subprocess,json
s=Path(__file__).parent
checks=[
('acceptance-format',['cargo','+1.95.0','fmt','--all','--','--check']),
('acceptance-solver',['cargo','+1.95.0','test','--locked','-p','hypersolve','--features','interval-lattice,serde,dispatch-trace','--test','bivariate_expression','--test','expression_program','--test','expression_interval','--test','program_affine','--test','program_jacobian_trace']),
('acceptance-private',['cargo','+1.95.0','test','--locked','-p','hyperbrep','--features','interval-ranges,dispatch-trace','--lib','geometry::interval_ranges::tests']),
('acceptance-consumer',['cargo','+1.95.0','test','--locked','-p','hyperbrep','--features','interval-ranges,dispatch-trace','--test','interval_ranges','--test','surface_ranges_example']),
('acceptance-clippy',['cargo','+1.95.0','clippy','--locked','-p','hypersolve','-p','hyperbrep','--features','hypersolve/interval-lattice,hypersolve/serde,hyperbrep/dispatch-trace,hyperbrep/interval-ranges','--all-targets','--','-D','warnings']),
('acceptance-downstream',['cargo','+1.95.0','test','--locked','-p','hyperbrep-io','--features','hyperbrep/interval-ranges','--test','spline_exchange']),
('acceptance-docs',['env','RUSTDOCFLAGS=-D warnings','cargo','+1.95.0','doc','--locked','-p','hypersolve','-p','hyperbrep','--features','hypersolve/interval-lattice,hypersolve/serde,hyperbrep/dispatch-trace,hyperbrep/interval-ranges','--no-deps']),
]
rows=[]
for name,cmd in checks:
 print(name,flush=True)
 p=subprocess.run(['python3',str(s/'run-check.py'),name,*cmd],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
 print(p.stdout[-1200:],flush=True)
 rows.append({'name':name,'returncode':p.returncode,'record':name+'.json'})
 (s/'acceptance-validation.json').write_text(json.dumps({'stage_qualified':False,'scope':'expanded acceptance only; full owner, cost and delivery gates remain open','checks':rows},indent=2)+'\n')
 if p.returncode: raise SystemExit(p.returncode)
print('expanded acceptance checks pass; stage not qualified',flush=True)
