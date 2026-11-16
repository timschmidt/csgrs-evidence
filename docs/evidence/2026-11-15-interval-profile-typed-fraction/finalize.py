from pathlib import Path
import json,hashlib,subprocess
s=Path(__file__).parent
labels=['scalar-witness','interval-witness','owner-clippy','owner-fmt','interface-fmt','restored-scalar','restored-interval','restored-owner-fmt','restored-interface-fmt']
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
(s/'README.md').write_text('''# Typed unsigned fraction experiment: rejected

Source: accepted CSGRS 97713a6102d2b7bb090d6c7ce33e6e156f816588,
Interface f5341f36803ad77c856313315d67ac8b3bb63f9a, firmware
b9ecf8df54723e532a42867a1d3c549f827d5f6d. ADMISSION.md states ownership,
domain, properties and missing witness. No accepted production change is retained.

The missing typed From conversion first fails with E0277. The candidate then
adds unsigned NonZeroU64 fraction ingress at Hyperreal's existing private reducer,
leaving signed fallible fraction untouched. It reapplies the previously rejected
nonempty/positive interval migration and removes impossible Result transport from
the radius factory. These representations remain experimental.

Both scalar witnesses pass: 240 full-u64 pairs match independent BigRational
canonical components and quotient identities; 390 fresh-process cold/warm
construction traces match the historical signed-fraction domain exactly, including
rational statistics. Display/debug and serde bytes also match on that domain.
Sixteen interval tests pass, retaining independent exact/GMP expectations,
empty/invalid distinctions, composition and previous trace assertions. Both owning
crates pass all-feature/all-target Clippy with -D warnings on Rust 1.95; both
workspace format checks pass.

The complete seven-case native profile/identity/allocation transcripts are
byte-identical. Both WASM consumers replay the native fields, preserve invalid
cases and make zero host calls. These are supplemental finite comparisons, not
independent full-profile or full schedule/policy proofs.

| Artifact | Baseline | Candidate | Delta |
| --- | ---: | ---: | ---: |
| Native | 810416 | 810752 | +336 |
| WASM | 1069027 | 1069529 | +502 |

The combined candidate fails the no-growth gate. Removing impossible scalar error
transport does not establish an acceptable complete migration. No runtime speedup
or instruction-level cause is claimed; build duration and WASM fuel are not runtime
benchmark evidence. No arbitrary inlining/layout tuning or weakened gates follow.
Full policy/schedule/browser, owner runtime, successive-operation, monomorphized
size and pre-push campaigns are not run after this early rejection.

Candidate patches and all eleven changed source files are retained and verified
to reapply cleanly. The isolated repositories are restored clean. Restored scalar
fraction and rational interval tests and both format checks pass. Fresh restored
native/WASM artifacts and native transcript reproduce baseline byte for byte.
Protected primary 41 staged paths and Interface 8 pending paths remain byte-identical;
firmware remains clean. All 71 previous frozen evidence stages verify unchanged.
No push or publication. Phase 8 and the entire interval-refactor goal remain open.

Every executed check has a command/result JSON and log. final-verification.json
states limitations explicitly. Executables remain external, hash-bound in build
records; the source and harnesses needed to rebuild are retained here.
''')
print('restoration and complete experiment record verified')
