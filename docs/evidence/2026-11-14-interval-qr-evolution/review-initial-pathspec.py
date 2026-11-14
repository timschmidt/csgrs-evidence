from pathlib import Path
import subprocess,json,hashlib,re
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-qr-evolution');source=json.loads((s/'SOURCE.json').read_text())
def git(*args):return subprocess.check_output(['git',*args],cwd=r)
p='crates/hyperdynamics/src/field/coordinates.rs';before=git('show',source['base']+':'+p);after=git('show',source['commit']+':'+p)
old=b'/// Time is unchanged. This supplies fixed coordinates, not adaptive QR selection.';new=b'/// Time is unchanged. This carrier retains one chart; frame evolution is a separate operation.'
append=b'\n/// Finite-window automatic QR selection with retained transport and native proofs.\n#[cfg(feature = "qr-evolution")]\npub mod qr_evolution;\n'
assert after==before.replace(old,new)+append
existing=git('diff','--name-only',source['base'],source['commit'],'--','crates/*/src').decode().splitlines();assert existing==[p,p.replace('coordinates.rs','coordinates/qr_evolution.rs')]
for name in ['qr.rs','evolution.rs','transition.rs']:
 path='crates/hyperdynamics/src/field/coordinates/'+name;assert git('show',source['base']+':'+path)==git('show',source['commit']+':'+path)
newmod=(r/existing[1]).read_text();assert 'PredicatePolicy' not in newmod
checks=json.loads((s/'final-qualification.json').read_text());main=json.loads((s/'main-validation.json').read_text());assert len(checks)==8 and len(main)==5 and all(x['returncode']==0 for x in checks+main)
assert len(json.loads((s/'timing-runs.json').read_text()))==9
assert len(json.loads((s/'cold-warm-runs.json').read_text()))==36
alloc=(s/'allocations-third-fixture.log').read_text();assert alloc.count('after_drop=0')==6
counts={}
for name in ['final-owner-tests','final-physics','main-owner-tests','main-physics-tests']:
 nums=[int(x) for x in re.findall(r'test result: ok\. (\d+) passed',(s/(name+'.log')).read_text())];counts[name]=dict(tests=sum(nums),groups=len(nums))
row=dict(existing_coordinate_bodies_unchanged=True,existing_qr_transition_evolution_bytes_unchanged=True,new_module_does_not_introduce_predicate_policy=True,old_source_revisions=source,test_counts=counts,full_pre_push_not_run=True,no_push=True)
(s/'REVIEW.json').write_text(json.dumps(row,indent=2)+'\n');print(json.dumps(row,indent=2))
