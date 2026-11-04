from pathlib import Path
import os,subprocess,shutil,tempfile,json,hashlib,re
root=Path('/home/tim/Documents/GitHub/workspace/csgrs');repo=Path('/tmp/csgrs-research-evidence')
record='docs/evidence/2026-11-04-research-r06-native';dest=repo/record
hashes=json.loads(Path('/tmp/csgrs-r06-native-final-source-hashes.json').read_text())
assert all(hashlib.sha256((root/p).read_bytes()).hexdigest()==h for p,h in hashes.items())
for name in ['domain-brep-final','curve-unit-final','curve-certificate-final','root-final','suite-retry']:
 s=Path('/tmp/csgrs-r06-native-'+name+'.log').read_text()
 assert 'test result: FAILED' not in s and not re.search(r'^error:',s,re.M)
 assert s.rstrip().splitlines()[-1].startswith('test result: ok.'),(name,s.splitlines()[-3:])
for name in ['domain-clippy-final','domain-msrv-final','domain-doc-final','curve-fuzz-check','domain-fuzz-final']:
 assert 'Finished' in Path('/tmp/csgrs-r06-native-'+name+'.log').read_text()
assert 'Done 28107 runs' in Path('/tmp/csgrs-r06-native-asan.log').read_text()
assert json.loads(Path('/tmp/csgrs-r06-native-wasm-certificate-retry-runtime.jsonl').read_text().splitlines()[-1])['completed']==9
matrix=json.loads(Path('/tmp/csgrs-r06-native-capability-final-run/report.json').read_text())
assert json.loads(Path('/tmp/csgrs-r06-native-brep-wasm-runtime.jsonl').read_text().splitlines()[-1])['completed']==1
assert matrix['evidence_inputs_stable'] and matrix['status']=='witnesses_passed'
assert len(matrix['fixtures'])==6 and all(r['status']=='witness_passed' for r in matrix['fixtures'])
assert not dest.exists();dest.mkdir(parents=True)
for p in sorted(Path('/tmp').glob('csgrs-r06-native-*')):
 if p.is_file() and p.suffix in ['.log','.json','.jsonl','.rs','.py','.cjs','.txt','.sh','.stderr'] and 'evidence-commit' not in p.name:
  shutil.copyfile(p,dest/p.name)
for name in ['cost-samples','capability-run','capability-final-run','svg-seeds','fuzz-artifacts']:
 shutil.copytree('/tmp/csgrs-r06-native-'+name,dest/name)
for name in ['cost-baseline','cost-candidate','wasm','brep-wasm']:
 source=Path('/tmp/csgrs-r06-native-'+name);target=dest/name;target.mkdir()
 for file in ['Cargo.toml','Cargo.lock','exports.json','derivation.json','source.json']:
  if (source/file).exists():shutil.copyfile(source/file,target/file)
 shutil.copytree(source/'src',target/'src')
files=subprocess.check_output(['git','-C',str(root),'diff','--name-only','HEAD'],text=True).splitlines()+['crates/hypercurve/tests/polynomial_vertical_components.rs']
for p in files:
 target=dest/'final-source'/p;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/p,target)
for p in ['Cargo.toml','Cargo.lock','crates/hypercurve/fuzz/Cargo.toml','crates/hypercurve/fuzz/Cargo.lock','crates/hyperbrep/fuzz/Cargo.toml','crates/hyperbrep/fuzz/Cargo.lock']:
 target=dest/'root-locks'/p;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/p,target)
(dest/'candidate.patch').write_bytes(subprocess.check_output(['git','-C',str(root),'diff','--binary','HEAD']))
(dest/'README.md').write_text('''# R06 native selected vertical charts

Base: ff9926b76e0da47f4a886dcef4db53f4621bfd9a. Apply candidate.patch and
restore the new final-source/crates/hypercurve/tests/polynomial_vertical_components.rs.
The owner Hypercurve PERFORMANCE.md R06 section is the single qualification
record. final-source and source-hashes include every changed/new Rust file;
root locks, native/WASM/cost sources, commands and raw outputs are retained.
Archive receipts are added to the root repository after this snapshot.
Compiled native/fuzz/WASM binaries are omitted; hashes, exact build inputs and
runtime receipts permit rebuilding with paths remapped to your checkout.

The original x=0 native admission blocker reproduces on the committed base.
Two selected graph charts retain full original equations, factor powers,
domains and selected fibers, with exact coordinate-exchange transport. The
original x, xy and x(x^2+y^2) fixtures now publish complete native sets. Nodes,
cusps, tangencies, boundary columns, nearby distinct columns, selected quintic
jets/line sections, named filled reconstruction and cold SVG/BRep replay and
recut are independently checked. Native source-chart references cannot alias
exchanged components. BRep uses the curve owner's sufficient whole-image
identity certificate and retains spatial/pcurve correspondence validation.
Archive/SVG grammar is unchanged. Newly mapped BRep admission is only the exact
unit-square source exchange: a polynomial identity is not a whole UV-domain
certificate. The translated-parabola draft failure and corrected refusal remain. General cross-chart polynomial intersections
remain Unsupported, reproduced by chart_gap. No complete algebraic closure or
full R06/R07 completion is claimed.

The broad combined native run began before the final direct unmapped identity
fast path and final bounded-domain BRep guard were added. Its exact compiled-source attribution is therefore limited;
do not label it a fully attributed final-source suite. Final post-edit BRep/IO,
polynomial unit/integration, root, stable/MSRV warning-denied Clippy, strict docs,
WASM and cost commands are separate. The final BRep/IO/static/doc/fuzz commands rerun after the guard. Hypercurve
production bytes are unchanged during the late BRep guard and test-only expansion.
The commands and final summaries state counts and source attribution. Existing
ignored tests remain. Full pre-push CI, installed packages and production
language bindings were not qualified; no push or publication occurred.

The initial broad linker bus error coincided with a full measured /tmp user
quota. Explicit quota failures in cost/WASM/Clippy builds are retained (the
first Clippy path was reused on retry; its exact diagnostic is in commands).
Cleanup removed only finished owned build caches, including 13 GiB of the
three packages' release artifacts. Unchanged-source retries complete. This
storage failure is distinct from geometric resource exhaustion. Actual zero
promotion allowance, pre-cancellation and successful later admission retry have
explicit receipts. No total arithmetic/heap/cancellation latency bound exists.

Nine actual zero-import WASM exports run the mechanically copied native curve
and empty-set fixtures in fresh Node instances. SVG feature is disabled there;
native cold-child SVG and BRep replay are separate. One further unchanged
shared BRep recipe passes in its own fresh zero-import WASM instance after the
bounded-domain guard, including the original vertical section, whole-image
validation, native JSON replay, affine transport and recut. Its source, exact
lockfile and runtime/hash receipts remain. A seeded existing SVG
libFuzzer/AddressSanitizer target completes 28,107 runs in 61 seconds. Its named
initial SVG records, mutated corpus, exact seed generator and controls remain.
LeakSanitizer is disabled. This is bounded coverage-guided runtime evidence,
not exhaustive/lexicase coverage or a leak guarantee. Nightly's recursive
Send/Sync warning at unchanged bezier_region.rs static EMPTY reproduces on the
base with that warning denied. It is not suppressed. Stable/MSRV strict checks
are distinct.

Three alternating pinned-CPU process pairs preserve all nine legacy complete
outcome/artifact rows byte-for-byte, with unchanged logical allocation counts
and requested traffic. The already exhausted full-circle SVG row remains an
exhausted outcome; its receipt alone does not establish an actual reached
resource guard. Eight other SVG controls complete. Timings move in both
directions under concurrent shared-host validation, including adverse boundary
and cusp observations; no speedup or statistical nonregression is claimed.
Four new completed native admission/query/location/split/reversal recipes are
measured separately from earlier rejection. Their contracts omit native SVG
and BRep cost completion. All samples, allocator code, binary hashes and source
inputs remain. The retention follow-up runs 100 calls in three fresh-input
cycles and preserves startup allocations as well as stable later-cycle drop
observations; it does not prove a universal bound or identify every owner.
The branch/topology measured sizes are unchanged. Main probe size also includes
new candidate-only workflow code; it is not isolated library growth.

This evidence commit adds only this new record to parent
2d27c29d62728f14cdbcdf7b08e366503becf7ea. Earlier records are unchanged.
''')
shutil.copyfile(__file__,dest/'seal-evidence.py')
parent='2d27c29d62728f14cdbcdf7b08e366503becf7ea';branch='research-r06-native-2026-11-04'
fd,index=tempfile.mkstemp(prefix='csgrs-r06-native-index-',dir='/tmp');os.close(fd);Path(index).unlink();env={**os.environ,'GIT_INDEX_FILE':index}
def git(*args):return subprocess.check_output(['git','-C',str(repo),*args],env=env,text=True).strip()
try:
 git('read-tree',parent);git('add','--sparse',record);tree=git('write-tree')
 changes=git('diff-tree','--no-commit-id','--name-status','--no-renames','-r',parent,tree).splitlines()
 count=sum(1 for p in dest.rglob('*') if p.is_file())
 assert len(changes)==count and all(x.startswith('A\t'+record+'/') for x in changes)
 commit=git('commit-tree',tree,'-p',parent,'-m','Qualify native vertical curve charts, replay, costs and remaining frontiers')
 git('update-ref','refs/heads/'+branch,commit)
 print(json.dumps({'branch':branch,'commit':commit,'files':count},indent=2))
finally:Path(index).unlink(missing_ok=True)
