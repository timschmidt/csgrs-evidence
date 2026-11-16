from pathlib import Path
import json,hashlib,subprocess
s=Path(__file__).parent
labels=['scalar-witness','owner-final-witness','interface-witness','machine-profile-tests','owner-clippy','owner-fmt','interface-fmt','restored-machine-profile','restored-interval','restored-owner-fmt','restored-interface-fmt']
assert all(json.loads((s/(label+'.json')).read_text())['exit_code']==0 for label in labels)
b=json.loads((s/'baseline-builds.json').read_text());r=json.loads((s/'restored-builds.json').read_text());assert len(b)==len(r)==2
assert all((x['kind'],x['bytes'],x['sha256'])==(y['kind'],y['bytes'],y['sha256']) for x,y in zip(b,r))
assert (s/'baseline-profile-values.log').read_bytes()==(s/'restored-profile-values.log').read_bytes()
assert len(json.loads((s/'restored-wasm-replay.json').read_text())['cases'])==7
replay_checks=[]
for name in ['csgrs','alumina-interface']:
 repo=Path('/mnt/development/interval-profile-static')/name
 assert not subprocess.check_output(['git','status','--porcelain'],cwd=repo)
 cmd=['git','apply','--check',str(s/(name+'-candidate.patch'))]
 p=subprocess.run(cmd,cwd=repo,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True);assert p.returncode==0,p.stdout
 replay_checks.append({'repo':str(repo),'command':cmd,'exit_code':p.returncode,'output':p.stdout})
initial=json.loads((s/'initial-state.json').read_text());protected={}
for name in ['primary','interface','firmware']:
 entry=initial[name];repo=entry['path']
 def git(*args):return subprocess.check_output(['git','-C',repo,*args])
 protected[name]={'head':git('rev-parse','HEAD').decode().strip(),'status':git('status','--porcelain').decode()}
 assert protected[name]['head']==entry['head']
 for kind,args in [('staged',['diff','--cached','--binary']),('unstaged',['diff','--binary'])]:
  digest=hashlib.sha256(git(*args)).hexdigest();assert digest==entry[kind+'_sha256'];protected[name][kind+'_sha256']=digest
(s/'final-verification.json').write_text(json.dumps({'restored_artifacts_byte_identical':True,'restored_transcript_byte_identical':True,'candidate_patches_reapply_cleanly':replay_checks,'protected':protected,'decision':'rejected; no production change retained','unexecuted_after_early_rejection':['full Interface strict/approximate dispatch and canonical schedule/browser campaign','full owner/runtime/allocation portfolio beyond seven profile probes','successive_operations benchmark and monomorphized code-size campaign','full CI/pre-push campaign'],'claims':'No speedup, universal closure, completed Phase 8, or release-readiness claim.'},indent=2)+'\n')
(s/'README.md').write_text((s/'README-draft.md').read_text())
print('restoration and experiment record verified')
