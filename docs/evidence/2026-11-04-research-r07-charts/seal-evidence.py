from pathlib import Path
import os,subprocess,shutil,tempfile,json,hashlib,re
root=Path('/home/tim/Documents/GitHub/workspace/csgrs');repo=Path('/tmp/csgrs-research-evidence')
record='docs/evidence/2026-11-04-research-r07-charts';dest=repo/record
hashes=json.loads(Path('/tmp/csgrs-r07-final-source-hashes.json').read_text())
assert all(hashlib.sha256((root/p).read_bytes()).hexdigest()==h for p,h in hashes.items())
for name in ['suite','root','minimal','doctests']:
 s=Path('/tmp/csgrs-r07-'+name+'-final.log').read_text()
 assert 'test result: FAILED' not in s and not re.search(r'^error:',s,re.M)
 if name=='doctests':
  results=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored',s)
  assert len(results)==4 and sum(int(x[0]) for x in results)==11 and all(x[1]=='0' for x in results)
  checks=json.loads(Path('/tmp/csgrs-r07-extra-checks.json').read_text())
  assert next(x for x in checks if x['name']=='doctests')['exit_code']==0
 else:
  assert s.rstrip().splitlines()[-1].startswith('test result: ok.'),(name,s[-1200:])
summaries=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored',Path('/tmp/csgrs-r07-suite-final.log').read_text())
assert len(summaries)==205 and sum(int(x[0]) for x in summaries)==3927 and sum(int(x[2]) for x in summaries)==37
for name in ['clippy','msrv','doc','curve-fuzz-check','brep-fuzz-check']:
 s=Path('/tmp/csgrs-r07-'+name+'-final.log').read_text();assert 'Finished' in s and not re.search(r'^error:',s,re.M)
assert json.loads(Path('/tmp/csgrs-r07-wasm-runtime.jsonl').read_text().splitlines()[-1])['completed']==13
matrix=json.loads(Path('/tmp/csgrs-r07-capability-run/report.json').read_text())
assert matrix['evidence_inputs_stable'] and matrix['status']=='witnesses_passed'
assert len(matrix['fixtures'])==8 and all(r['status']=='witness_passed' for r in matrix['fixtures'])
assert len(Path('/tmp/csgrs-r07-pair-cost.tsv').read_text().splitlines())==260
assert len(Path('/tmp/csgrs-r07-retention.tsv').read_text().splitlines())==500
assert not dest.exists();dest.mkdir(parents=True)
for p in sorted(Path('/tmp').glob('csgrs-r07-*')):
 if p.is_file() and p.suffix in ['.log','.json','.jsonl','.rs','.py','.cjs','.txt','.sh','.stderr','.tsv'] and 'evidence-commit' not in p.name:
  shutil.copyfile(p,dest/p.name)
for name in ['capability-run','cost-samples','cost-final-samples']:
 shutil.copytree('/tmp/csgrs-r07-'+name,dest/name)
for name in ['cost-baseline','cost-candidate','wasm']:
 source=Path('/tmp/csgrs-r07-'+name);target=dest/name;target.mkdir()
 for file in ['Cargo.toml','Cargo.lock','exports.json','derivation.json']:
  if (source/file).exists():shutil.copyfile(source/file,target/file)
 shutil.copytree(source/'src',target/'src')
for file in ['csgrs-r06-cost-allocator.rs','csgrs-r06-native-cost-cases.rs']:
 shutil.copyfile('/tmp/'+file,dest/file)
files=subprocess.check_output(['git','-C',str(root),'diff','--name-only','HEAD'],text=True).splitlines()+list(hashes)
for p in set(files):
 target=dest/'final-source'/p;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/p,target)
for p in ['Cargo.toml','Cargo.lock','rust-toolchain.toml','crates/hypercurve/Cargo.toml','crates/hypercurve/fuzz/Cargo.toml','crates/hypercurve/fuzz/Cargo.lock','crates/hyperbrep/fuzz/Cargo.toml','crates/hyperbrep/fuzz/Cargo.lock']:
 if not (root/p).exists():continue
 target=dest/'root-locks'/p;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/p,target)
(dest/'candidate.patch').write_bytes(subprocess.check_output(['git','-C',str(root),'diff','--binary','HEAD']))
(dest/'README.md').write_text('''# R07 native polynomial pairs in distinct charts

Base c688fbfd9e4d1d06ba6113986a7752de8bdabb24. Apply candidate.patch and
restore both new Rust files from final-source (polynomial_curve_pair_charts.rs
and polynomial_pair_charts.rs). The single owner qualification is Hypercurve
PERFORMANCE.md, R07 polynomial pairs in distinct charts. Subsequent archive
receipts are administrative; Rust hashes bind the final implementation/tests.
Sources, locks, commands, early failed experiments, raw final outputs and
measurements are retained. Binaries are omitted; hashes and build inputs remain.

The original xy half-axis pair fails intersection/Unsupported on the base.
A separate known-point exchanged-parabola parameter also reproduces an
incidence gap. The new rational relative-chart query view reuses exact
resultant/component authority and retains both original selected sources.
Common-component overlaps retain nonlinear bidirectional transport. Known
selected point coordinates feed an exact joint-field fiber census rather than
requiring independent scalar projection. All candidate contacts are filtered
against original selected domains. See the owner record for the sufficient
arc/component argument and unqualified algebraic/resource frontiers.

The old quintic/parabola Unsupported fixture retains identical operands and
now proves complete disjointness independently. The initial mixed-line oracle
failure compared isolated contact counts with closed-overlap endpoint duplicates;
the corrected oracle explicitly checks both closed endpoints and all genuine
isolated events. No original hard geometry is removed. A retained nonsingular shear of y=x^2
still reports Unsupported against polynomial and authored line forms of
y=1/2; the public-API frontier source and logs remain. Its authored-line probe
first needed explicit Point2-to-CurvePoint2 conversions to compile. The new cold test's
first compile failure used a nonexistent topology.is_complete accessor; the
correct assertion checks topology.result().is_complete. The layout probe's
first compile failure requested a private, unexported correspondence type; the
final probe measures its containing public overlap record instead.

The first cost campaign preserved all nine legacy rows, then its added-domain
phase panicked because the external candidate feature was not enabled. Both
probes are corrected to use the same feature before the final full campaign;
final builds are warning-free. The initial unused helper warning was in that
external feature configuration. This was a harness failure, not a geometry
outcome. The four "new" rows in the inherited cost driver are already-admitted
vertical controls from R06; the genuinely new 13 chart-pair recipes are measured
separately by pairs.rs, with all assertions and output consumption included.
Their native cold-child SVG recipe is excluded from the WASM-derived source.

Final combined native, downstream root, minimal-feature, doctest, stable and
MSRV warning-denied Clippy, strict docs and both fuzz-manifest compile checks
are distinct commands. Eight capability witnesses have stable source snapshots.
Thirteen mechanically shared geometry recipes execute in fresh zero-import
WASM instances under Node; SVG/fresh-process replay is a separate native test.
No runtime sanitizer/fuzz campaign, full pre-push CI, installed package or
production binding qualification was added in this increment. Existing ignored
tests remain. A finite corpus does not prove universal algebraic closure.

The matched legacy controls preserve all outcome/artifact rows, requested
allocation traffic and allocation counts. The full-circle SVG row was already
BudgetExhausted at base and stays an exhausted outcome, not exact success; its
receipt alone does not prove an actual reached limit. Other eight SVG controls
complete. Timings are observations on a shared host, not a performance guarantee.
The separate 500-call degree-17 probe, after two warmups, records early measured retention and later stable
drop observations; neither it nor the configured work budget bounds total heap,
coefficient arithmetic or cancellation latency. New functionality grows the
matched native probe binary; see binary hashes and sizes rather than attributing
that entire size to isolated library code. No new representation family is added.

Evidence parent 7764d5b4fd4d81ae529924c0dd8cd7c9684c5efe; only this new record
is added. The main task does not push or alter unrelated .claude work.
''')
shutil.copyfile(__file__,dest/'seal-evidence.py')
parent='7764d5b4fd4d81ae529924c0dd8cd7c9684c5efe';branch='research-r07-charts-2026-11-04'
fd,index=tempfile.mkstemp(prefix='csgrs-r07-index-',dir='/tmp');os.close(fd);Path(index).unlink();env={**os.environ,'GIT_INDEX_FILE':index}
def git(*args):return subprocess.check_output(['git','-C',str(repo),*args],env=env,text=True).strip()
try:
 git('read-tree',parent);git('add','--sparse',record);tree=git('write-tree')
 changes=git('diff-tree','--no-commit-id','--name-status','--no-renames','-r',parent,tree).splitlines()
 count=sum(1 for p in dest.rglob('*') if p.is_file())
 assert len(changes)==count and all(x.startswith('A\t'+record+'/') for x in changes)
 commit=git('commit-tree',tree,'-p',parent,'-m','Qualify native polynomial chart pairs, selected transport and downstream replay')
 git('update-ref','refs/heads/'+branch,commit)
 print(json.dumps({'branch':branch,'commit':commit,'files':count},indent=2))
finally:Path(index).unlink(missing_ok=True)
