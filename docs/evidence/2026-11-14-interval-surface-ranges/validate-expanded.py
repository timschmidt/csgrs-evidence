from pathlib import Path
import subprocess,json
s=Path(__file__).parent
checks=[
('expanded-final-format',['cargo','+1.95.0','fmt','--all','--','--check']),
('expanded-final-solver',['cargo','+1.95.0','test','--locked','-p','hypersolve','--features','interval-lattice,serde,dispatch-trace','--test','bivariate_expression','--test','expression_program','--test','expression_interval','--test','program_affine','--test','program_jacobian_trace']),
('expanded-final-consumer',['cargo','+1.95.0','test','--locked','-p','hyperbrep','--features','interval-ranges,dispatch-trace','--test','interval_ranges','--test','surface_ranges_example']),
('expanded-final-private',['cargo','+1.95.0','test','--locked','-p','hyperbrep','--features','interval-ranges,dispatch-trace','--lib','geometry::interval_ranges::tests']),
('expanded-final-clippy',['cargo','+1.95.0','clippy','--locked','-p','hypersolve','-p','hyperbrep','--features','hypersolve/interval-lattice,hypersolve/serde,hyperbrep/dispatch-trace,hyperbrep/interval-ranges','--all-targets','--','-D','warnings']),
('expanded-final-disabled',['cargo','+1.95.0','check','--locked','-p','hyperbrep','--no-default-features','--all-targets']),
('expanded-final-downstream',['cargo','+1.95.0','test','--locked','-p','hyperbrep-io','--features','hyperbrep/interval-ranges','--test','spline_exchange']),
]
rows=[]
for name,cmd in checks:
 print(name,flush=True)
 p=subprocess.run(['python3',str(s/'run-check.py'),name,*cmd],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
 print(p.stdout[-1200:],flush=True)
 rows.append({'name':name,'returncode':p.returncode,'record':name+'.json'})
 (s/'expanded-validation.json').write_text(json.dumps({'qualified':False,'known_gate':'native post-preparation full-dispatch assertion differs by one scalar arithmetic-reuse first-observation count','checks':rows},indent=2)+'\n')
 if p.returncode and name!='expanded-final-private':
  raise SystemExit(p.returncode)
print('focused validation complete; qualification remains open',flush=True)
