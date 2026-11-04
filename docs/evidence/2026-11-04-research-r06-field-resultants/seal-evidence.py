from pathlib import Path
import os, subprocess, shutil, tempfile, json, hashlib, re

root = Path('/home/tim/Documents/GitHub/workspace/csgrs')
repo = Path('/tmp/csgrs-research-evidence')
record = 'docs/evidence/2026-11-04-research-r06-field-resultants'
dest = repo / record
hashes = json.loads(Path('/tmp/csgrs-r06-field-final-source-hashes.json').read_text())
assert all(hashlib.sha256((root/p).read_bytes()).hexdigest() == h for p,h in hashes.items())
counts = {}
for name, expected in [('owner-accepted',(41,1359,0)), ('complete-curve-unit',(1,75,1)),
                       ('complete-curve-integration',(6,63,0)), ('complete-brep',(4,21,0)),
                       ('complete-doctests',(5,12,0))]:
    log = Path('/tmp/csgrs-r06-field-'+name+'-final.log').read_text()
    rows = re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored',log)
    actual = (len(rows),sum(int(r[0]) for r in rows),sum(int(r[2]) for r in rows))
    assert actual == expected and all(r[1]=='0' for r in rows), (name,actual)
    assert 'test result: FAILED' not in log and not re.search(r'^error:',log,re.M)
    counts[name] = dict(batches=actual[0],passed=actual[1],ignored=actual[2])
checks=json.loads(Path('/tmp/csgrs-r06-field-complete-downstream-results.json').read_text())
assert len(checks)==7 and all(r['exit_code']==0 for r in checks)
for name in ['clippy-accepted-final','msrv-accepted-final','doc-complete-final']:
    log=Path('/tmp/csgrs-r06-field-'+name+'.log').read_text()
    assert 'Finished' in log and not re.search(r'^error:',log,re.M)
wasm=Path('/tmp/csgrs-r06-field-wasm-accepted-runtime.jsonl').read_text().splitlines()
assert json.loads(wasm[-1])['completed']==15
assert all(json.loads(line)['imports']==0 and json.loads(line)['result']=='pass' for line in wasm[:-1])
assert 'All nine exact' in Path('/tmp/csgrs-r06-field-trace-accepted-driver.log').read_text()
cost=Path('/tmp/csgrs-r06-field-cost-final-samples')
summary=json.loads((cost/'summary.json').read_text())
assert len(summary)==18 and sum(r['samples'] for r in summary)==1080
for case in {r['case'] for r in summary}:
    a,b=[r for r in summary if r['case']==case]
    assert all(a[k]==b[k] for k in ['requested_bytes','allocation_calls','peak_logical_bytes','post_drop_delta'])
retention=Path('/tmp/csgrs-r06-field-workflow-retention.tsv').read_text().splitlines()
assert len(retention)==30 and all(int(r.split('\t')[-1])==0 for r in retention[7:])
assert not dest.exists()
dest.mkdir(parents=True)
extensions={'.log','.json','.jsonl','.rs','.py','.cjs','.txt','.sh','.stderr','.tsv','.rows'}
for source in sorted(Path('/tmp').glob('csgrs-r06-field-*')):
    if source.is_file() and source.suffix in extensions and 'evidence-commit' not in source.name:
        shutil.copyfile(source,dest/source.name)
for name in ['cost-samples','cost-inplace-samples','cost-drop-samples','cost-schedules-samples','cost-final-samples',
             'traces','schedules-traces','accepted-traces','pre-schedules']:
    source=Path('/tmp/csgrs-r06-field-'+name);target=dest/name;target.mkdir()
    for file in sorted(source.iterdir()):
        if file.is_file() and file.suffix in extensions:shutil.copyfile(file,target/file.name)
for name in ['cost-baseline','cost-candidate','wasm','workflow-cost']:
    source=Path('/tmp/csgrs-r06-field-'+name);target=dest/name;target.mkdir()
    for file in ['Cargo.toml','Cargo.lock','exports.json','derivation.json','prior.lock']:
        if (source/file).exists():shutil.copyfile(source/file,target/file)
    shutil.copytree(source/'src',target/'src')
for name in ['ragged-counterfactual','ragged-pinned']:
    source=Path('/tmp/csgrs-r06-field-'+name)/'crates/hypersolve';target=dest/name;target.mkdir()
    for file in ['Cargo.toml','Cargo.lock','src/ordered_field_resultant.rs','tests/ordered_field_resultant.rs']:
        if (source/file).exists():
            output=target/file;output.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(source/file,output)
for file in ['csgrs-r06-cost-allocator.rs','csgrs-r08-field-resultant-missing.log','csgrs-r07-affine-map-frontier-controls-final.log']:
    source=Path('/tmp')/file
    if source.exists():shutil.copyfile(source,dest/file)
paths=set(subprocess.check_output(['git','-C',str(root),'diff','--name-only','HEAD'],text=True).splitlines())|set(hashes)
for file in paths:
    target=dest/'final-source'/file;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/file,target)
for file in ['Cargo.toml','Cargo.lock','rust-toolchain.toml','crates/hypersolve/Cargo.toml',
             'crates/hypersolve/fuzz/Cargo.toml','crates/hypersolve/fuzz/Cargo.lock',
             'crates/hypercurve/fuzz/Cargo.toml','crates/hypercurve/fuzz/Cargo.lock',
             'crates/hyperbrep/fuzz/Cargo.toml','crates/hyperbrep/fuzz/Cargo.lock',
             'crates/hypersolve/tests/support/recursive_quadratic.rs',
             'crates/hypersolve/tests/support/selected_polynomial_replay.rs']:
    if (root/file).exists():
        target=dest/'root-inputs'/file;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(root/file,target)
(dest/'candidate.patch').write_bytes(subprocess.check_output(['git','-C',str(root),'diff','--binary','HEAD']))
(dest/'final-census.json').write_text(json.dumps(counts,indent=2)+'\n')
(dest/'README.md').write_text('''# R06 retained ordered-field bivariate elimination

Base 5442eee1af553b1196c00dc4f211774948762414. Apply candidate.patch and restore
the two new ordered_field_resultant.rs files from final-source (src and tests).
The six final Rust hashes bind the accepted implementation and tests. Later
archive receipt edits are administrative. The single detailed qualification is
crates/hypersolve/PERFORMANCE.md, R06 selected-coefficient bivariate resultants.
This is an additive solver primitive, not native selected-coefficient topology,
mapped-curve incidence or complete geometric operation closure. The retained
shear frontier remains unsupported. R06/R07 and total resource bounds stay open.

The base cannot compile the missing API witness. A first harness import named
the root Classification enum rather than classification::Classification<T>;
the corrected missing witness gives the clean absent-API error. Final tests
retain exact coefficient dependencies through elimination, complete root
isolation, selection and fresh-process graph replay. Independent factorizations
verify full resultant scale, nonmonic coefficients and axis parity, not just
zeros. The independent degree-5/7 join has degree35; dependent fields in the
other recipes make no such minimal-degree claim. Zero resultants do not assert
real common components: s^2+t^2+1 explicitly has none. Native Bezout control
grids are independently authored, not rounded enclosure midpoints.

Early drafts incorrectly published a canceled final zero and expanded constant
or ragged inputs until actual 10,000-callback limits. Their failing recipes and
source snapshots remain; these controls are not geometric exact successes.
Shared scalar/Bezout authorities preserve original operation order and operand
lifetimes. Draft allocation growth exposed a lost in-place scalar dispatch and
retained trace lifetime, both corrected. Final nine exact artifact, dispatch
and rational-stat controls agree; 1,080 legacy timing/allocation samples retain
adverse timing ratios. New workflow measurements compare two completed drafts
of the new API, never an unsupported baseline's rejection speed. The remaining
unequal-degree case still requests about4.35GB per full factored recipe. The
30-call retention observation records early nonzero deltas and later zero;
neither is a total-work, heap or cancellation-latency guarantee.

The failed first counterfactual copied ignored coverage artifacts into an owned
temporary directory and hit the actual /tmp quota. Only that new copy was
removed; recreation used tracked git-archive sources. Initial standalone locks
and an inherited WASM lock selected different registry versions; final pinned
controls are separate. Failed harness probes (pivot struct, ambiguous integer
conversion, missing execute permission, a mistaken singleton-enclosure oracle)
and corrected Clippy findings remain in logs. No original hard input is removed.
An earlier globally filtered Hypercurve command did not run every integration
recipe; complete-downstream runs all six integration targets unfiltered.

Final owner, scoped consumer, doctest, stable/MSRV warning-denied Clippy, strict
docs and three fuzz-manifest compile checks pass. Fifteen shared zero-import
WASM recipes execute; fresh-process cold replay is native. No runtime fuzz,
sanitizer, installed-package, full pre-push CI or publication qualification is
claimed. Binaries/build targets are omitted; source, locks, hashes, scripts,
commands, failures and raw measurements remain. Reconstruct baseline sources
from the base commit; pre-schedules overrides preserve the same 13 cost recipes.

Parent 6d353969435e3ef8e79eed64da8d28c32439dfed. Only this new record is added;
prior evidence is unchanged. No push; unrelated .claude work is untouched.
''')
shutil.copyfile(__file__,dest/'seal-evidence.py')
parent='6d353969435e3ef8e79eed64da8d28c32439dfed';branch='research-r06-field-resultants-2026-11-04'
fd,index=tempfile.mkstemp(prefix='csgrs-r06-field-index-',dir='/tmp');os.close(fd);Path(index).unlink()
env={**os.environ,'GIT_INDEX_FILE':index}
def git(*args):return subprocess.check_output(['git','-C',str(repo),*args],env=env,text=True).strip()
try:
    git('read-tree',parent);git('add','--sparse',record);tree=git('write-tree')
    changes=git('diff-tree','--no-commit-id','--name-status','--no-renames','-r',parent,tree).splitlines()
    count=sum(1 for p in dest.rglob('*') if p.is_file())
    assert len(changes)==count and all(x.startswith('A\t'+record+'/') for x in changes)
    commit=git('commit-tree',tree,'-p',parent,'-m','Qualify selected-coefficient resultants, replay and shared determinant costs')
    git('update-ref','refs/heads/'+branch,commit)
    print(json.dumps(dict(branch=branch,commit=commit,files=count),indent=2))
finally:Path(index).unlink(missing_ok=True)
