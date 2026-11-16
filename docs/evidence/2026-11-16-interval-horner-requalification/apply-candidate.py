from pathlib import Path
import subprocess,json,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/interval-horner-current/csgrs')
for name in ['baseline-original-corpus','baseline-production-trace-corpus','baseline-certification-build','baseline-allocation-profile']:
 assert json.loads((s/'runs'/name/'result.json').read_text())['exit_code']==0,name
assert (s/'artifacts-baseline/report.json').exists()
old=Path('/tmp/interval-refactor/horner/candidate-borrowed.patch').read_text()
subprocess.run(['git','-C',str(r),'apply','--include=crates/hyperinterval/src/rational.rs','/tmp/interval-refactor/horner/candidate-borrowed.patch'],check=True)
p=r/'crates/hyperinterval/src/lib.rs';v=p.read_text();assert v.count('pub use rational::RationalInterval;')==1;p.write_text(v.replace('pub use rational::RationalInterval;','pub use rational::{NonEmptyRationalInterval, NonEmptyRationalIntervalRef, RationalInterval};'))
# Import just the two original new owner witnesses; preserve every current test.
part=old.split('diff --git a/crates/hyperinterval/tests/rational.rs')[1].split('diff --git ')[0]
added='\n'.join(line[1:] for line in part.splitlines() if line.startswith('+') and not line.startswith('+++'))
tests=added[added.index('#[test]'):added.index('        assert!(backend')].rstrip()
p=r/'crates/hyperinterval/tests/rational.rs';v=p.read_text().replace('use hyperinterval::{IntervalError, RationalInterval, SignSet};','use hyperinterval::{IntervalError, NonEmptyRationalInterval, SignSet, RationalInterval};');v+='\n'+tests+'\n'
# Extend the existing three-way trace without dropping its original equality.
v=v.replace('assert!(backend == "legacy" || backend == "shared");','assert!(backend == "legacy" || backend == "shared" || backend == "nonempty");')
needle='                        let right = RationalInterval::new(c.clone(), d.clone()).unwrap();';assert v.count(needle)==1;v=v.replace(needle,needle+'\n                        let nonempty_left = left.clone().into_nonempty().unwrap();\n                        let nonempty_right = right.clone().into_nonempty().unwrap();')
needle='                                    legacy::rational_interval_product(a, b, c, d)\n                                } else {';assert v.count(needle)==1;v=v.replace(needle,'                                    legacy::rational_interval_product(a, b, c, d)\n                                } else if backend == "nonempty" {\n                                    nonempty_left.mul(&nonempty_right).into_bounds()\n                                } else {')
needle='    assert_eq!(new, old);';assert v.count(needle)==1;v=v.replace(needle,needle+'\n    assert_eq!(run("nonempty"), old);');p.write_text(v)
# Adapt only the historical production hunks; keep current included tests intact.
for name in ['algebraic','root_isolation']:
 part=old.split(f'diff --git a/crates/hypersolve/src/{name}.rs')[1].split('diff --git ')[0]
 header='diff --git a/crates/hypersolve/src/'+name+'.rs b/crates/hypersolve/src/'+name+'.rs'
 hunks=part.split('@@')
 # Build a fresh exact old/new body pair from each hunk, ignoring stale line numbers.
 p=r/f'crates/hypersolve/src/{name}.rs';v=p.read_text()
 import re
 chunks=re.split(r'^@@[^\n]*\n',part,flags=re.M)[1:]
 for chunk in chunks:
  if '#[path = "interval_migration/' in chunk:continue
  before='\n'.join(x[1:] for x in chunk.splitlines() if x.startswith((' ','-')))+'\n'
  after='\n'.join(x[1:] for x in chunk.splitlines() if x.startswith((' ','+')))+'\n'
  assert v.count(before)==1,(name,before[:120]);v=v.replace(before,after)
 p.write_text(v)
p=r/'crates/hypersolve/Cargo.toml';v=p.read_text();old_dep='hyperinterval = { version = "0.1.0", path = "../hyperinterval", default-features = false, optional = true }';assert v.count(old_dep)==1;v=v.replace(old_dep,'hyperinterval = { version = "0.1.0", path = "../hyperinterval", default-features = false, features = ["rational"] }')
v=v.replace('# Test-only interval migration candidates; production remains gated by cost.\nhyperinterval = { version = "0.1.0", path = "../hyperinterval", default-features = false, features = ["rational"] }\n','')
v=v.replace('"expression-program", "dep:hyperinterval", "hyperinterval/hyperreal"','"expression-program", "hyperinterval/hyperreal"').replace('"hyperinterval?/serde"','"hyperinterval/serde"');v=v.replace('dispatch-trace = [\n','dispatch-trace = [\n    "hyperinterval/dispatch-trace",\n');p.write_text(v)
subprocess.run(['rustfmt','--edition','2024',*[str(r/f) for f in ['crates/hyperinterval/src/rational.rs','crates/hyperinterval/tests/rational.rs']]],check=True)
patch=subprocess.check_output(['git','-C',str(r),'diff','--binary']);(s/'candidate.patch').write_bytes(patch)
(s/'candidate-source.json').write_text(json.dumps({'head':subprocess.check_output(['git','-C',str(r),'rev-parse','HEAD'],text=True).strip(),'patch_sha256':hashlib.sha256(patch).hexdigest(),'historical_candidate':'/tmp/interval-refactor/horner/candidate-borrowed.patch','status':'isolated unaccepted requalification; current production trace comparisons remain additional to all original tests','ownership_caveat':'Same mathematical operation/predicate sequence, but borrowed translation and working-form replacement can change temporary lifetimes; allocation/peak-stack/cost gates remain required.'},indent=2)+'\n')
print('Applied isolated current candidate',hashlib.sha256(patch).hexdigest())
