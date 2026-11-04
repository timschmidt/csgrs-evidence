from pathlib import Path
import os,subprocess,shutil,tempfile,json,hashlib,re

root=Path('/home/tim/Documents/GitHub/workspace/csgrs')
repo=Path('/tmp/csgrs-research-evidence')
record='docs/evidence/2026-11-04-research-r30-hulls';dest=repo/record
hashes=json.loads(Path('/tmp/csgrs-r30-final-source-hashes.json').read_text())
assert all(hashlib.sha256((root/p).read_bytes()).hexdigest()==h for p,h in hashes.items())
census=json.loads(Path('/tmp/csgrs-r30-final-census.json').read_text())
assert sum(r['passed'] for r in census.values())==356
checks=json.loads(Path('/tmp/csgrs-r30-static-results.json').read_text())
assert len(checks)==7 and all(r['exit_code']==0 for r in checks)
for name in ['owner','downstream-accepted','minimal-root','original-ignored']:
    log=Path('/tmp/csgrs-r30-'+name+'-final.log').read_text()
    assert 'test result: FAILED' not in log and not re.search(r'^error:',log,re.M)
    assert log.rstrip().splitlines()[-1].startswith('test result: ok.')
wasm=Path('/tmp/csgrs-r30-wasm-runtime-final.jsonl').read_text().splitlines()
assert json.loads(wasm[-1])['completed']==3
assert all(json.loads(r)['imports']==0 and json.loads(r)['result']=='pass' for r in wasm[:-1])
samples=Path('/tmp/csgrs-r30-cost-samples')
processes=json.loads((samples/'processes.json').read_text());assert len(processes)==54 and all(p['exit_code']==0 for p in processes)
summary=json.loads((samples/'summary.json').read_text());assert len(summary)==18 and sum(r['samples'] for r in summary)==876
assert all('false' not in p.read_text() for p in samples.glob('*-candidate-*.stderr'))
assert any('false' in p.read_text() for p in samples.glob('*-baseline-sphere32.stderr'))
rows=json.loads((samples/'row-hashes.json').read_text())
for case in {r['case'] for r in summary}:
    assert len({r['sha256'] for name,r in rows.items() if '-candidate-'+case+'.rows' in name})==1
trace=json.loads(Path('/tmp/csgrs-r30-trace-analysis.json').read_text());assert len(trace['changed_keys'])==40 and trace['first_eye_difference']['index']==53
assert not dest.exists();dest.mkdir(parents=True)
extensions={'.log','.json','.jsonl','.rs','.py','.cjs','.txt','.sh','.stderr','.tsv','.rows'}
for p in sorted(Path('/tmp').glob('csgrs-r30-*')):
    if p.is_file() and p.suffix in extensions and 'evidence-commit' not in p.name:
        shutil.copyfile(p,dest/p.name)
shutil.copytree(samples,dest/'cost-samples')
for name in ['cost-baseline','cost-candidate','wasm']:
    source=Path('/tmp/csgrs-r30-'+name);target=dest/name;target.mkdir()
    for file in ['Cargo.toml','Cargo.lock','metadata.json','derivation.json']:
        if (source/file).exists():shutil.copyfile(source/file,target/file)
    shutil.copytree(source/'src',target/'src')
shutil.copyfile('/tmp/csgrs-r30-baseline-owner/crates/hypermesh/Cargo.toml',dest/'baseline-owner-Cargo.toml')
shutil.copyfile('/tmp/csgrs-r06-cost-allocator.rs',dest/'allocator.rs')
paths=set(subprocess.check_output(['git','-C',str(root),'diff','--name-only','HEAD'],text=True).splitlines())|set(hashes)
for p in paths:
    target=dest/'final-source'/p;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/p,target)
for p in ['Cargo.toml','Cargo.lock','rust-toolchain.toml','crates/hypermesh/Cargo.toml','crates/hypermesh/fuzz/Cargo.toml','crates/hypermesh/fuzz/Cargo.lock']:
    if (root/p).exists():
        target=dest/'root-inputs'/p;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/p,target)
(dest/'candidate.patch').write_bytes(subprocess.check_output(['git','-C',str(root),'diff','--binary','HEAD']))
(dest/'README.md').write_text('''# R30 fixed-input hull scheduling

Base d64c01aa69f31b37ddb14ea24f15c9f489f88aeb. Apply candidate.patch and restore
the two new tests/hull_determinism.rs files from final-source (root and owner).
The three final Rust hashes bind the accepted implementation/tests. Subsequent
archive receipts are administrative. Detailed admission is owned by Hypermesh
PERFORMANCE.md, R30 cache-independent hull scheduling. The intentional row and
diagonal migration is recorded in docs/MIGRATIONS.md, independently of exact-set
validation. Broader symbolic seed/cache determinism and resource closure remain
open. This is not a performance-only change or permutation-invariant hull.

The original strict 32x16 trigonometric sphere fails repeated vertex/triangle
rows at base. A direct tie witness also fails. A tie-only candidate still fails
the sphere: a temporary trace observes 40 coordinate views changing by one
binary64 bit, identical seed/point count and the first changed eye at index53.
Tracing is absent from final production. Symbolic coordinates now use input
order; stored rational coordinates keep distance scheduling through fresh
rational views. Equal scores choose the least retained input index. Each eye
still belongs to a certified outside set, sufficient for QuickHull's update.
No fitted, rounded or stereographically resampled source is substituted.

Independent rational determinants check every source point against every hull
halfspace. Known cube corners and rational unit-sphere extrema, original point
identity and closed-PWN validation supply separate expectations. Both policies,
three fixed permutations, symbolic translations, all three hull APIs, tiny and
overflowing scheduling views, Boolean/hull continuation and fresh/warmed/cloned/
rebuilt/cold-child sphere paths are retained. Neighboring sample counts and the
original unchanged sampled-sphere/Boolean/successive-operation tests run; the
original ignored 32x16 source runs separately. Final census totals356 native
passing executions. Three shared zero-import WASM recipes run under Node.

The nine cost controls preserve inputs, pinned registry versions, features,
allocator and completion/validation contracts across three alternating pairs.
876 calls complete Certified. Native JSON rows are generated after the timed
hull/validation interval. Five artifact rows agree; shell/symbolic/sphere rows
intentionally change. All candidate repeats and fresh processes agree. Base
sphere32 repeats do not. Raw cold/warm timing, requested bytes, allocator calls,
logical peaks, drop observations and full first-artifact rows are retained.
Symbolic cube and sphere workloads regress; this correctness migration is not
a speedup or a statistical nonregression claim. The two matched native probes
have equal size but different hashes. Their inputs are generated by the exact
source functions preserved in cost-main.rs; sphere ordering/formulas match the
root source without modeling-cache reuse. External probe linkage is not an
installed library/binding size measurement. Input-owned caches remain alive.

The first failing assertion dumped verbose scalar debug data; its concise
replacement keeps the same geometric/row condition. The first cost harness
reimported Ordering from its allocator include; corrected builds pass without
warnings. The first downstream command named a nonexistent solid_regressions
target. The first owner-filtered command selected no new integration tests;
the final full owner command runs all three unfiltered. Failed prototypes and
harness logs are preserved, not relabeled geometric success. Original hard
geometry and assertions remain. No runtime sanitizer/fuzz, full pre-push CI,
installed distribution or production binding campaign is claimed.

Binaries/build trees and unchanged source trees are omitted; source snapshots,
patch, pinned manifests/locks, scripts, raw logs/data and binary hashes remain.
Reconstruct baseline Hypermesh via git archive of the base revision and use
baseline-owner-Cargo.toml, whose sibling dependency paths point to this task's
unchanged lower crates. No third-party package archives are redistributed.

Parent 6dca69fdbbf7e96280889d6b5c04a1aacbbee625; only this new evidence record
is added. The local bare archive is used without a network push. Unrelated
.claude work and historical worktree controls remain untouched.
''')
shutil.copyfile(__file__,dest/'seal-evidence.py')
parent='6dca69fdbbf7e96280889d6b5c04a1aacbbee625';branch='research-r30-hulls-2026-11-04'
fd,index=tempfile.mkstemp(prefix='csgrs-r30-index-',dir='/tmp');os.close(fd);Path(index).unlink();env={**os.environ,'GIT_INDEX_FILE':index}
def git(*args):return subprocess.check_output(['git','-C',str(repo),*args],env=env,text=True).strip()
try:
    git('read-tree',parent);git('add','--sparse',record);tree=git('write-tree')
    changes=git('diff-tree','--no-commit-id','--name-status','--no-renames','-r',parent,tree).splitlines()
    count=sum(1 for p in dest.rglob('*') if p.is_file())
    assert len(changes)==count and all(x.startswith('A\t'+record+'/') for x in changes)
    commit=git('commit-tree',tree,'-p',parent,'-m','Qualify deterministic hull scheduling, exact sets and adverse symbolic costs')
    git('update-ref','refs/heads/'+branch,commit)
    print(json.dumps(dict(branch=branch,commit=commit,files=count),indent=2))
finally:Path(index).unlink(missing_ok=True)
