from pathlib import Path
import os, json, subprocess, hashlib, time, signal, re

root=Path('/home/tim/Documents/GitHub/workspace/csgrs')
record=Path(__file__).resolve().parent/('primary-validation-'+str(time.time_ns()))
record.mkdir();(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r04-primary-only-target',CCACHE_DIR='/tmp/csgrs-r04-primary-ccache',CCACHE_TEMPDIR='/tmp/csgrs-r04-primary-ccache/tmp',PROPTEST_RNG_SEED='20261025',CARGO_BUILD_JOBS='2')
def inventory():
    names=subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard'],cwd=root,text=True).splitlines()
    return {n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names if (root/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock','config.toml'])}
before=inventory();(record/'sources-before.json').write_text(json.dumps(before,indent=2)+'\n')
(record/'source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
from runtime_manifest import assert_runtime, snapshot_runtime
assert_runtime(before,'candidate')
snapshot_runtime(record,'candidate')
application=json.loads((record.parent/'latest-primary-application.json').read_text())
assert before==json.loads((Path(application['record'])/'sources-after.json').read_text())
for name in application['changed_files']:
    target=record/'source'/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes((root/name).read_bytes())
(record/'environment.json').write_text(json.dumps({'compiler':subprocess.check_output(['rustc','-Vv'],text=True),'head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR','PROPTEST_RNG_SEED']}},indent=2)+'\n')
checks=[('fmt', ['cargo', 'fmt', '--all', '--', '--check'], 300), ('owner-default-clippy', ['cargo', 'clippy', '--locked', '--offline', '--release', '-p', 'hyperreal', '-p', 'hyperlimit', '--all-targets', '--', '-D', 'warnings'], 1200), ('all-feature-clippy', ['cargo', 'clippy', '--locked', '--offline', '--release', '-p', 'hyperreal', '-p', 'hyperlimit', '-p', 'hypertri', '-p', 'hypermesh', '-p', 'hypercurve', '-p', 'csgrs', '--all-features', '--all-targets', '--', '-D', 'warnings'], 2400), ('docs', ['env', 'RUSTDOCFLAGS=-D warnings', 'cargo', 'doc', '--locked', '--offline', '-p', 'hyperreal', '-p', 'hyperlimit', '-p', 'hypertri', '-p', 'hypermesh', '-p', 'hypercurve', '-p', 'csgrs', '--all-features', '--no-deps'], 1800), ('hyperreal', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'hyperreal', '--all-features', '--no-fail-fast', '--', '--test-threads=2'], 3600), ('hyperlimit', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'hyperlimit', '--all-features', '--no-fail-fast', '--', '--test-threads=2'], 3600), ('hypertri', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'hypertri', '--all-features', '--no-fail-fast', '--', '--test-threads=2'], 3600), ('hypermesh', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'hypermesh', '--all-features', '--no-fail-fast', '--', '--test-threads=2'], 3600), ('hypercurve', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'hypercurve', '--all-features', '--no-fail-fast', '--', '--test-threads=2'], 3600), ('csgrs', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'csgrs', '--all-features', '--no-fail-fast', '--', '--test-threads=2'], 3600), ('cylinder-matrix', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'csgrs', '--all-features', '--test', 'downstream_solids', 'near_coincident_rotated_cylinder_boolean_matrix_completes_exactly', '--', '--ignored', '--exact', '--test-threads=1'], 1200), ('long-successive', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'csgrs', '--all-features', '--test', 'successive_operations', '--', '--ignored', '--test-threads=1'], 2400), ('full-planter', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'csgrs', '--all-features', '--test', 'downstream_solids', 'viral_planter_keeps_every_child', '--', '--ignored', '--exact', '--test-threads=1'], 1800), ('wasm-build', ['cargo', 'build', '--locked', '--offline', '--release', '-p', 'hyperreal', '-p', 'hyperlimit', '-p', 'hypermesh', '-p', 'hypercurve', '--target', 'wasm32-unknown-unknown'], 1800), ('budget', ['bash', 'scripts/check-repository-budget.sh'], 300), ('diff-check', ['git', 'diff', '--check'], 300)]
failed=None
for name,cmd,limit in checks:
    print('START',name,flush=True);start=time.time()
    with (record/'commands.jsonl').open('a') as out:out.write(json.dumps({'event':'start','name':name,'command':cmd,'cwd':str(root),'epoch':start,'timeout_seconds':limit})+'\n')
    with (record/(name+'.log')).open('w') as out:
        proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
        try:status=proc.wait(timeout=limit)
        except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
    with (record/'commands.jsonl').open('a') as out:out.write(json.dumps({'event':'finish','name':name,'status':status,'elapsed_seconds':time.time()-start})+'\n')
    print('FINISH',name,status,flush=True)
    if status!=0:failed=name;break
after=inventory();assert before==after
(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n')
summary={}
for filename in [name+'.log' for name in ['hyperreal','hyperlimit','hypertri','hypermesh','hypercurve','csgrs','cylinder-matrix','long-successive']]:
    if not (record/filename).exists():continue
    rows=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;', (record/filename).read_text())
    summary[filename]={'groups':len(rows),'passed':sum(int(r[0]) for r in rows),'failed':sum(int(r[1]) for r in rows),'ignored':sum(int(r[2]) for r in rows)}
(record/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(record/'completion.json').write_text(json.dumps({'failed':failed,'sources_unchanged':True},indent=2)+'\n')
(record.parent/'latest-primary-validation.json').write_text(json.dumps({'record':str(record),'failed':failed,'sources_unchanged':True},indent=2)+'\n')
print('R19 FINAL PRIMARY COMPLETE',record,failed,flush=True)
raise SystemExit(0 if failed is None else 1)
