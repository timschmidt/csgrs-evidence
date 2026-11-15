import subprocess,sys,json,os
from pathlib import Path
s=Path(__file__).parent
runs=[
 ('final-formatting',['cargo','+stable','fmt','--all','--','--check']),
 ('strict-clippy',['cargo','+stable','clippy','--locked','-p','hyperdrc','--release','--all-targets','--all-features','--','-D','warnings']),
 ('required-app-tests',['env','HYPERDRC_REQUIRE_COMPLEX_FIXTURES=1','cargo','+stable','test','--locked','-p','hyperdrc','--release','--lib','app::tests::','--','--test-threads=16']),
 ('required-gerber-smoke',['env','HYPERDRC_REQUIRE_COMPLEX_FIXTURES=1','cargo','+stable','test','--locked','-p','hyperdrc','--release','--lib','zz_complex_project_performance_tests::gerber_package_completes_smoke_check_suite','--','--exact','--nocapture','--test-threads=1']),
 ('required-kicad-smoke',['env','HYPERDRC_REQUIRE_COMPLEX_FIXTURES=1','cargo','+stable','test','--locked','-p','hyperdrc','--release','--lib','zz_complex_project_performance_tests::kicad_board_completes_smoke_check_suite','--','--exact','--nocapture','--test-threads=1']),
]
results=[]
for label,command in runs:
 p=subprocess.run([sys.executable,str(s/'run.py'),label,*command])
 results.append({'label':label,'exit_code':p.returncode})
 print(json.dumps(results[-1]),flush=True)
(s/'qualification.json').write_text(json.dumps(results,indent=2)+'\n')
