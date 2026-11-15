from pathlib import Path
import json,hashlib,subprocess,shutil,time,os
s=Path(__file__).parent;root=Path('/mnt/development/interval-profile-positive');rows=[]
base=json.loads((s/'baseline-builds.json').read_text());restored=json.loads((s/'restored-builds.json').read_text())
for a,b in zip(base,restored):assert (a['kind'],a['bytes'],a['sha256'])==(b['kind'],b['bytes'],b['sha256'])
assert (s/'baseline-profile-values.log').read_bytes()==(s/'restored-profile-values.log').read_bytes()
assert (s/'baseline-profile-values.log').read_bytes()==(s/'final-candidate-profile-values.log').read_bytes()
for name,repo,cmd in [
 ('restored-owner-format','csgrs',['cargo','+1.95.0','fmt','--all','--','--check']),
 ('restored-interface-format','alumina-interface',['cargo','+1.95.0','fmt','--all','--','--check']),
 ('restored-owner-diff','csgrs',['git','diff','--check']),
 ('restored-interface-diff','alumina-interface',['git','diff','--check'])]:
 start=time.monotonic()
 with (s/(name+'.log')).open('wb') as out:p=subprocess.run(cmd,cwd=root/repo,stdout=out,stderr=subprocess.STDOUT)
 rows.append({'name':name,'command':cmd,'cwd':str(root/repo),'returncode':p.returncode,'seconds':time.monotonic()-start});(s/'restored-checks.json').write_text(json.dumps(rows,indent=2)+'\n');assert p.returncode==0,name
for name in ['csgrs','alumina-interface']:assert not subprocess.check_output(['git','status','--porcelain'],cwd=root/name)
baseline=json.loads((s/'BASELINE.json').read_text());new={}
for name,old in baseline.items():
 def git(*args):return subprocess.check_output(['git','-C',old['path'],*args])
 row={'path':old['path'],'head':git('rev-parse','HEAD').decode().strip(),'status':git('status','--porcelain').decode(),'staged_sha256':hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),'unstaged_sha256':hashlib.sha256(git('diff','--binary')).hexdigest()};assert row==old,(name,row,old);new[name]=row
(s/'RESTORED-STATE.json').write_text(json.dumps(new,indent=2)+'\n')
shutil.copy2('/tmp/interval-refactor/flow-noise-final-frozen-check.json',s/'prior-frozen-check.json');prior=json.loads((s/'prior-frozen-check.json').read_text());assert len(prior)==47 and all(x['matched'] for x in prior)
summary=json.loads((s/'SUMMARY.json').read_text());summary.update({'restored_binaries_byte_identical_to_baseline':True,'restored_complete_native_output_identical':True,'both_isolated_worktrees_clean':True,'all_authoritative_repository_states_unchanged':True,'prior_frozen_stages_unchanged':47});(s/'SUMMARY.json').write_text(json.dumps(summary,indent=2)+'\n')
print('all restoration checks and states verified; both rebuilt artifacts match baseline byte for byte',flush=True)
