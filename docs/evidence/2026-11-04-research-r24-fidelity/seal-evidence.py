from pathlib import Path
import os,subprocess,shutil,tempfile,json,hashlib,re,tomllib
root=Path('/home/tim/Documents/GitHub/workspace/csgrs');repo=Path('/tmp/csgrs-research-evidence');record='docs/evidence/2026-11-04-research-r24-fidelity';dest=repo/record
hashes=json.loads(Path('/tmp/csgrs-r24-final-source-hashes.json').read_text());assert all(hashlib.sha256((root/p).read_bytes()).hexdigest()==h for p,h in hashes.items())
checks=json.loads(Path('/tmp/csgrs-r24-validation-results.json').read_text());assert len(checks)==14 and all(r['exit_code']==0 for r in checks)
extra=json.loads(Path('/tmp/csgrs-r24-affected-results.json').read_text());assert len(extra)==4 and all(r['exit_code']==0 for r in extra)
post=json.loads(Path('/tmp/csgrs-r24-post-repair-results.json').read_text());assert len(post)==4 and all(r['exit_code']==0 for r in post)
assert json.loads(Path('/tmp/csgrs-r24-brep-fuzz-result.json').read_text())['exit_code']==0
assert json.loads(Path('/tmp/csgrs-r24-brep-fuzz-pins.json').read_text())['original_registry_versions_preserved']
report=json.loads(Path('/tmp/csgrs-r24-capability-after-compiler-fix/report.json').read_text());assert report['status']=='witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures'])==8
assert 'Ran 17 tests' in Path('/tmp/csgrs-r24-capability-schema-final.log').read_text() and Path('/tmp/csgrs-r24-capability-schema-final.log').read_text().rstrip().endswith('OK')
census={}
for name in ['owner-full-stage','owner','owner-svg','brep-persistence','brep','io','root','minimal-tests','affected-recheck','algebraic-native']:
 p=Path('/tmp/csgrs-r24-'+name+'-final.log') if name!='owner-full-stage' else Path('/tmp/csgrs-r24-owner-full-stage.log')
 log=p.read_text();assert 'test result: FAILED' not in log and not re.search(r'^error:',log,re.M)
 rows=re.findall(r'^test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;',log,re.M);assert rows
 census[name]={'passed':sum(int(r[0]) for r in rows),'failed':sum(int(r[1]) for r in rows),'ignored':sum(int(r[2]) for r in rows),'summaries':len(rows)}
assert census['owner-full-stage']['passed']>3000
Path('/tmp/csgrs-r24-final-census.json').write_text(json.dumps(census,indent=2)+'\n')
wasm=Path('/tmp/csgrs-r24-wasm-runtime-final.jsonl').read_text().splitlines();assert json.loads(wasm[-1])['completed']==6 and all(json.loads(r)['imports']==0 and json.loads(r)['result']=='pass' for r in wasm[:-1]);assert 'warning:' not in Path('/tmp/csgrs-r24-wasm-build-final.log').read_text()
assert not json.loads(Path('/tmp/csgrs-r24-wasm-registry.json').read_text())['outside_root']
samples=Path('/tmp/csgrs-r24-cost-samples');processes=json.loads((samples/'processes.json').read_text());assert len(processes)==30 and all(p['exit_code']==0 for p in processes)
summary=json.loads((samples/'summary.json').read_text());assert len(summary)==10 and sum(r['samples'] for r in summary)==360
rows=json.loads((samples/'row-hashes.json').read_text())
for case in ['plain','construct','edit','replay','brep_replay']:
 assert len({v['sha256'] for k,v in rows.items() if '-'+case+'.rows' in k and k.endswith('.rows')})==1
 for flavor in ['baseline','candidate']:assert len({v['sha256'] for k,v in rows.items() if '-'+flavor+'-'+case+'.rows.native' in k})==1
assert not dest.exists();dest.mkdir(parents=True)
extensions={'.log','.json','.jsonl','.rs','.py','.cjs','.txt','.sh','.stderr','.tsv','.rows','.toml','.lock'}
for p in sorted(Path('/tmp').glob('csgrs-r24-*')):
 if p.is_file() and p.suffix in extensions and 'evidence-commit' not in p.name:shutil.copyfile(p,dest/p.name)
for name in ['cost-samples','cost-before-container-fix','cost-before-lint-fix','cost-before-native-consumer','cost-before-compiler-fix','capability-final','capability-final-algebraic','capability-after-compiler-fix']:
 source=Path('/tmp/csgrs-r24-'+name)
 if source.exists():shutil.copytree(source,dest/name)
for name in ['cost-baseline','cost-candidate','wasm']:
 source=Path('/tmp/csgrs-r24-'+name);target=dest/name;target.mkdir()
 for file in ['Cargo.toml','Cargo.lock','metadata.json','derivation.json']:
  if (source/file).exists():shutil.copyfile(source/file,target/file)
 shutil.copytree(source/'src',target/'src')
for owner in ['hypercurve','hyperbrep']:shutil.copyfile('/tmp/csgrs-r24-baseline-owner/crates/'+owner+'/Cargo.toml',dest/('baseline-'+owner+'-Cargo.toml'))
shutil.copyfile('/tmp/csgrs-r06-cost-allocator.rs',dest/'allocator.rs')
paths=set(subprocess.check_output(['git','-C',str(root),'diff','--name-only','HEAD'],text=True).splitlines())|set(hashes)
for p in paths:
 target=dest/'final-source'/p;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/p,target)
for p in ['Cargo.toml','Cargo.lock','crates/hypercurve/Cargo.toml','crates/hypercurve/fuzz/Cargo.toml','crates/hypercurve/fuzz/Cargo.lock','crates/hyperbrep/Cargo.toml','crates/hyperbrep/fuzz/Cargo.toml','crates/hyperbrep/fuzz/Cargo.lock','crates/hyperbrep-io/Cargo.toml']:
 if (root/p).exists():
  target=dest/'root-inputs'/p;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/p,target)
(dest/'candidate.patch').write_bytes(subprocess.check_output(['git','-C',str(root),'diff','--binary','HEAD']))
(dest/'README.md').write_text('''# R24 per-output parallel fidelity

Base 628ede94d28404cd9e81b85442c81102de6c35d4. Apply candidate.patch and restore
new files from final-source. The final source hashes bind the Rust source/tests;
archive receipt edits are administrative. Hypercurve PERFORMANCE.md owns the
single qualification; BRep links it. Region/consumer/command fidelity and total
resource closure remain open. This record predates BRep branch integration and
whole pre-push CI; it makes no claim that either has completed or been pushed.

The corrected missing-API witness fails on baseline. An initial metadata-only
prototype loses receipts at native SVG reload. Immutable lineage now retains
original path, source index/span, immediate signed distance, metric, bound and
consumed qualification. Exact-image and pointwise claims differ. Actual circle
chart edits remain replayable; selected parameters are not projected. Affine
images retain transformed references and conservative bounds, without commuting
Euclidean offsets through shear. Fresh affine incidence identity, shallow debug
views and normalization avoid wrong proof reuse and avoidable graph expansion.

A new BRep consumer then reproduces receipt loss in native persistence. Its
ParallelFidelity pcurve variant uses the same Hypercurve graph, with scalar-free
inspection of actual records/backwards references, degrees, array elements and
dependency depth. Historical requests grant no work. The independent declared
proof-replay depth is admitted as a solver control. NativeCurve preserves typed
replay errors. The BRep dependency explicitly enables the existing SVG/native
feature; no second geometry kernel or display projection supplies the proof.
Malformed scalar CBOR can be syntactically counted but cannot publish geometry.
Actual byte/dependency/solver controls, cancellation and larger retries are
separate from coefficient growth, total work, heap, latency and stack bounds.

The whole Hypercurve run began before final lint/native-consumer work; its raw
full-stage log is historical stage evidence, not a whole-final-source claim.
Final current-source checks separately cover all nine receipt recipes, twelve
SVG graph unit regressions, BRep persistence and default/all-feature planar and
profile consumers, archive admission, full BRep IO and root profile/receipt
consumers. Stable/MSRV Clippy, minimal features, strict docs and two fuzz manifest
compiles are recorded. Final census includes overlapping configurations; do not
sum it as unique test coverage. Eight registered capability fixtures each run
exactly one named witness under containment, with stable source/binary inputs.

Continuous verifier proofs, independent quadratic normal/PH formulas, selected
source comparisons, algebraic endpoints/centers, exact endpoints, t³/chord 3/8
and cold-process continuation supply distinct evidence. Six unchanged shared
recipe bodies execute in fresh zero-import WASM instances, including BRep native
replay and admission controls. SVG/cold-child checks remain native in this pilot.

Thirty alternating cost processes complete 360 Certified calls across five
cases. Exact raw geometry artifacts agree, and plain native bytes agree;
annotated native payloads intentionally grow. The baseline lacks the newly
required fidelity work. Native/BRep proof replay is materially more expensive.
Measurements under concurrent validation load are descriptive, not statistical
nonregression admission. Payload allocation traffic, logical peaks, cold/warm
post-drop observations and first artifacts remain; no leak/heap bound follows.
One retained output keeps its full original connected source alive. Curve2's
outer host handle remains eight bytes; lineage/root each gain a shared pointer.
Matched native and WASM binary hashes/sizes describe probes, not distributions.

Earlier harness errors remain: missing-API conversion and feature typos were
corrected before reproducing real failures; graph test compile errors were
fixed. Clippy style findings were fixed without production lint suppression.
A WASM lock reset rejected --locked and briefly ran an old artifact; it is not
final acceptance. Final locked builds use root-pinned registry versions, and
the derivation preserves its lock. The imported unchanged BRep helper module
needs a direct Hyperlimit dependency and a probe-only dead_code annotation for
its other uncalled fixtures. Rustdoc auto-trait search overflowed at compiler depth128. A crate-local
compiler limit256 fixes it; no runtime decision/resource limit changes. Strict
docs, affected tests, stable/MSRV compiler checks and fuzz are rechecked.
New fuzz dependencies are root-pinned while every
original fuzz registry version is preserved. The first cost harness selected
paths()[0], which selected different pieces after baseline line/string demotion;
those samples are excluded. Corrected costs explicitly select the same quadratic
piece. The user pause terminated one build (143); resumed validation is distinct.
No assertion, hard fixture, policy or validation gate is weakened.

Binaries/build trees and unchanged source trees are omitted. Sources, patch,
locks, scripts, logs/artifacts and binary digests remain. Reconstruct baseline
Hypercurve and BRep via git archive and their saved manifests, using unchanged
lower crates. No third-party package archives are redistributed. Parent
26f019be868b12227a498daa65cf2cbb18b13b2e; only this record is appended. Local
bare archive only; unrelated .claude and external working-tree content are not
changed or included as accepted R24 implementation.
''')
shutil.copyfile(__file__,dest/'seal-evidence.py')
parent='26f019be868b12227a498daa65cf2cbb18b13b2e';branch='research-r24-fidelity-2026-11-04'
fd,index=tempfile.mkstemp(prefix='csgrs-r24-index-',dir='/tmp');os.close(fd);Path(index).unlink();env={**os.environ,'GIT_INDEX_FILE':index}
def git(*args):return subprocess.check_output(['git','-C',str(repo),*args],env=env,text=True).strip()
try:
 git('read-tree',parent);git('add','--sparse',record);tree=git('write-tree');changes=git('diff-tree','--no-commit-id','--name-status','--no-renames','-r',parent,tree).splitlines();count=sum(1 for p in dest.rglob('*') if p.is_file());assert len(changes)==count and all(x.startswith('A\t'+record+'/') for x in changes)
 commit=git('commit-tree',tree,'-p',parent,'-m','Qualify retained parallel fidelity, native BRep replay and proof costs');git('update-ref','refs/heads/'+branch,commit);print(json.dumps(dict(branch=branch,commit=commit,files=count,census=census),indent=2))
finally:Path(index).unlink(missing_ok=True)
