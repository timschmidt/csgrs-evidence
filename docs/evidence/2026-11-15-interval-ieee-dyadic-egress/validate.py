from pathlib import Path
import os,json,subprocess,time,sys
s=Path(__file__).parent;root=Path('/mnt/development/csgrs-ieee-egress');kind=sys.argv[1]
if kind=='native':
 commands=[
 ('owner',['cargo','+stable','test','--locked','-p','hyperinterval','--all-features']),
 ('lattice',['cargo','+stable','test','--locked','-p','hyperlattice-interval','--all-features']),
 ('release-egress',['cargo','+stable','test','--locked','--release','-p','hyperinterval','--all-features','--test','dyadic_float_egress']),
 ('release-modes',['cargo','+stable','test','--locked','--release','-p','hyperinterval','--all-features','--test','float','dyadic_egress_ignores_native_modes','--','--nocapture']),
 ('clippy',['cargo','+stable','clippy','--locked','-p','hyperinterval','--all-features','--all-targets','--','-D','warnings']),
 ('clippy-minimal',['cargo','+stable','clippy','--locked','-p','hyperinterval','--no-default-features','--all-targets','--','-D','warnings']),
 ('docs',['cargo','+stable','doc','--locked','-p','hyperinterval','--all-features','--no-deps']),
 ('fmt',['cargo','+stable','fmt','--all','--','--check']),
 ('budget',['bash','scripts/check-repository-budget.sh'])]
else:
 features='integer,fixed,dyadic,float-proposal,float-enclosure,serde'
 commands=[
 ('owner',['cargo','+1.88.0','test','--locked','-p','hyperinterval','--no-default-features','--features',features]),
 ('clippy',['cargo','+1.88.0','clippy','--locked','-p','hyperinterval','--no-default-features','--features',features,'--all-targets','--','-D','warnings']),
 ('thumb',['cargo','+1.88.0','check','--locked','-p','hyperinterval','--no-default-features','--features','dyadic,float-enclosure','--target','thumbv7em-none-eabihf'])]
env=os.environ|{'CARGO_BUILD_JOBS':'12','CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/ieee-egress-'+kind,'RUSTDOCFLAGS':'-D warnings','CARGO_TERM_COLOR':'never'}
rows=[]
for name,cmd in commands:
 start=time.monotonic()
 with (s/(kind+'-'+name+'.log')).open('w') as f:p=subprocess.run(cmd,cwd=root,env=env,stdout=f,stderr=subprocess.STDOUT)
 rows.append({'name':name,'command':cmd,'exit_code':p.returncode,'seconds':time.monotonic()-start});(s/(kind+'-validation.json')).write_text(json.dumps(rows,indent=2)+'\n');print(kind,name,p.returncode,flush=True)
 if p.returncode:sys.exit(p.returncode)
(s/(kind+'-completed.json')).write_text(json.dumps({'all_passed':True,'commands':len(rows)})+'\n')
