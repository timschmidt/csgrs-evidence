"""Seal main qualification only after its actual 280-command audit passes."""
from pathlib import Path
import hashlib,json,os,shutil,subprocess,time
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]
OLD=ROOT/'target/prepush-20261105'
OUT=ROOT/'target/evidence-closeout-staging-20261105/docs/evidence/2026-11-05-main-publication'
subprocess.run(['python3',str(HERE/'audit_gates.py')],check=True)
extra=[json.loads(x) for x in (HERE/'supplemental-results.jsonl').read_text().splitlines()]
assert {x['name'] for x in extra}=={'default-curve-traits-1.95.0','default-curve-traits-1.99.1'}
for row in extra:
    assert row['exit_code']==0 and row['source_unchanged']
    assert hashlib.sha256((ROOT/row['log']).read_bytes()).hexdigest()==row['log_sha256']
assert 'test result: ok. 3 passed;' in (HERE/'svg-replay-msrv.log').read_text()
assert not OUT.exists(),OUT
OUT.mkdir(parents=True)
inventory=[]
def copy(p,relative):
    q=OUT/relative;q.parent.mkdir(parents=True,exist_ok=True)
    if p.is_symlink():
        q.symlink_to(os.readlink(p));inventory.append({'path':str(relative),'symlink':os.readlink(p)})
    else:
        assert p.suffix!='.crate',p
        assert p.stat().st_size<100*1024*1024,p
        shutil.copy2(p,q);inventory.append({'path':str(relative),'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()})
def tree(p,relative):
    for x in sorted(p.rglob('*')):
        if x.is_file() or x.is_symlink():copy(x,Path(relative)/x.relative_to(p))
for base,label in [(OLD,'earlier-executions'),(HERE,'main-publication')]:
    for p in sorted(base.iterdir()):
        if p.is_file() and p.suffix in {'.py','.json','.jsonl','.log','.tsv','.txt','.toml','.patch'}:
            copy(p,Path(label)/p.name)
for name in ['spatial-directed-clean','spatial-asan-clean','artifacts']:
    tree(OLD/name,Path('earlier-executions')/name)
for name in ['coverage-hypersolve','coverage-hyperspatial','coverage-hypertri']:
    folder=OLD/name
    for p in sorted(folder.iterdir()):
        if p.is_file():copy(p,Path('unchanged-owner-coverage')/name/p.name)
    profiles=[{'path':p.name,'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for p in sorted((folder/'profraw').glob('*.profraw'))]
    q=OUT/'unchanged-owner-coverage'/name/'raw-profile-inventory.json';q.write_text(json.dumps(profiles,indent=2)+'\n')
tree(Path('/tmp/csgrs-main-publication-runner-20261105/hypercurve-capabilities'),'main-curve-capabilities')
site=HERE/'site';assert site.is_dir()
(OUT/'site-inventory.json').write_text(json.dumps([{'path':str(p.relative_to(site)),'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for p in sorted(site.rglob('*')) if p.is_file()],indent=2)+'\n')
packages=[]
for compiler in ['1.99.1','1.95.0']:
    for p in sorted((ROOT/'target/research-closeout-builds'/(compiler+'-normal/release-check/package')).glob('*.crate')):
        packages.append({'compiler':compiler,'name':p.name,'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()})
assert len(packages)==36
(OUT/'package-inventory.json').write_text(json.dumps(packages,indent=2)+'\n')
(OUT/'README.md').write_text('''# Qualified main publication

This record qualifies code revision ae46b5bf9848cd6ae0bb0e231bad693614c9c0c6.
It contains the completed main research/consolidation work, restoration of
public default-precision curve auto traits, current-source Cargo package
verification and exact vertical-polynomial SVG replay acceptance. The incoming
BRep integration and its solver/endpoint experiments are absent from this tree
and remain unqualified in the separate integration-review record.

The audit covers all 280 named locally executable workflow/Clippy commands.
140 affected commands execute on 3,754 frozen tracked inputs. Another 140 have
actual earlier successful executions on 41fb7657dc and exact unchanged complete
owner/local-dependency source, fixture, manifest and CI scopes. They are not
relabeled as fresh executions. Every original source revision, failure and
corrected attempt remains, including earlier staging-source, namespace, corpus,
license-server and sanitizer containment failures. Actual locally executed
commands retain their complete feature/target/manifest arguments.

Both complete root test configurations, native curve corpus, affected
consumers, WASM/UI/demo assembly, examples and stable/MSRV 18-package build,
docs and clean-consumer verification must pass before this collector runs.
Default-precision public carrier thread/unwind traits are independently checked
on both compilers; exact SVG replay also passes its focused MSRV check.
Unchanged native sanitizer campaigns retain their full thirteen mutation
workloads and original budgets. Hosted deployment/publication actions are
inspected rather than executed locally. CI configuration is unchanged, so the
conditional zizmor gate is not triggered.

The curve trait owner has its own 217-file correctness/cost record. The six
library files and maintained carrier test here match that owner exactly. Prior
package-verification results could reuse stale synthetic registry sources;
clean consumers patched to the unpacked owner archives still exercised actual
owner source. This record's isolated Cargo homes and fresh staged source
verification establish the stronger current-package claim on stable and MSRV.
All original invalid-input/resource controls remain; vertical source replay
now requires exact success, identity, subdivision and reversal rather than an
obsolete Unsupported expectation.

These checks establish the maintained finite corpus and public carrier
contract, not universal algebraic closure, uniform performance or total-work
bounds. Final archive-reference/admission edits are documentation only; final
formatting, spelling, retention-budget and clean-worktree checks are required
before pushing. The published source retains this code revision as an ancestor.

Compiler outputs, downloaded tools, third-party crate bytes, duplicate coverage
HTML and individual raw profile files are excluded. Merged profiles, source
and raw-profile inventories, generated report snapshots, corpus data, complete
logs and package/site digests remain. Source bytes are available at the named
code revision; package bytes are not redistributed.
''')
(OUT/'retained-files.json').write_text(json.dumps({'time':time.time(),'files':inventory},indent=2)+'\n')
print(json.dumps({'record':str(OUT),'copied_files':len(inventory),'bytes':sum(x.get('bytes',0) for x in inventory)}))
