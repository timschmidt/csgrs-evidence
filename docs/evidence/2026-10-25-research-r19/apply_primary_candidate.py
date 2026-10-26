from pathlib import Path
import hashlib,json,subprocess,time
from runtime_manifest import assert_runtime,snapshot_runtime
raw=Path(__file__).resolve().parent
root=Path('/home/tim/Documents/GitHub/workspace/csgrs');private=Path('/tmp/csgrs-r19-trace')
decision=json.loads((raw/'admission-decision.json').read_text())
assert decision['decision']=='retain-for-scoped-exact-completion'
assert json.loads((raw/'latest-expanded-native-campaign.json').read_text())['complete']
assert (raw/'latest-expanded-cost-summary.json').exists()
baseline=json.loads((raw/'baseline-build-1792976361955063929/sources.json').read_text())
# The probe build also records its external harness; these are not repository inputs.
for name in ['probe/Cargo.lock','probe/Cargo.toml','probe/main.rs']:baseline.pop(name)
assert len(baseline)==2352
validation=json.loads((raw/'latest-downstream-validation.json').read_text());assert validation['failed'] is None
candidate=json.loads((Path(validation['record'])/'sources-after.json').read_text())
assert_runtime(candidate,'candidate')
expected={
 'crates/hyperreal/src/computable/node/representation.rs',
 'crates/hyperreal/src/computable/node/structural_analysis.rs',
 'crates/hyperreal/src/computable/node/algebra.rs',
 'crates/hyperreal/src/computable/node/shared_square_quotient.rs',
 'crates/hyperreal/src/computable/node.rs',
 'crates/hyperreal/src/computable/node/imported_domain_tests.rs',
 'crates/hyperreal/src/computable/node/shared_square_quotient_tests.rs',
 'crates/hyperreal/src/computable/node/ring_jacobi_relations_tests.rs',
 'crates/hyperreal/tests/serde_cotangent_continuation.rs',
 'crates/hypertri/src/collinear.rs',
}
changes={n for n in candidate if candidate[n]!=baseline.get(n)}
assert changes==expected,(changes,expected)
def inventory(folder):
    names=subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard'],cwd=folder,text=True).splitlines()
    return {n:hashlib.sha256((folder/n).read_bytes()).hexdigest() for n in names if (folder/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock','config.toml'])}
before=inventory(root)
assert before==baseline,'Main source changed since the finally validated R18 baseline; inspect before copying.'
assert inventory(private)==candidate,'Private source changed after validation.'
record=raw/f'primary-application-{time.time_ns()}';record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes());(record/'decision.json').write_bytes((raw/'admission-decision.json').read_bytes())
(record/'sources-before.json').write_text(json.dumps(before,indent=2)+'\n')
snapshot_runtime(record,'candidate')
for name in sorted(changes):
    saved=record/'before'/name;saved.parent.mkdir(parents=True,exist_ok=True)
    if (root/name).exists():saved.write_bytes((root/name).read_bytes())
    target=root/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes((private/name).read_bytes())
after=inventory(root);assert after==candidate
(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n')
result={'record':str(record),'changed_files':sorted(changes),'source_inputs':len(after),'matches_validated_private_candidate':True,'status':'Applied for final primary/downstream validation; not a release or completed admission claim.'}
(record/'completion.json').write_text(json.dumps(result,indent=2)+'\n');(raw/'latest-primary-application.json').write_text(json.dumps(result,indent=2)+'\n')
print('R19 PRIMARY APPLIED',record,flush=True)
