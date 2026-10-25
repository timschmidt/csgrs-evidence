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
(record/'fit-tests.rs').write_bytes((root/'crates/hypercurve/src/bezier_fit/tests.rs').read_bytes())
(record/'environment.json').write_text(json.dumps({'compiler':subprocess.check_output(['rustc','-Vv'],text=True),'head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR','PROPTEST_RNG_SEED']}},indent=2)+'\n')
checks=[
 ('fmt',['cargo','fmt','--all','--','--check'],300),
 ('clippy',['cargo','clippy','--locked','--offline','-p','hypercurve','-p','csgrs','--all-features','--all-targets','--','-D','warnings'],900),
 ('docs',['env','RUSTDOCFLAGS=-D warnings','cargo','doc','--locked','--offline','-p','hypercurve','-p','csgrs','--all-features','--no-deps'],600),
 ('fit-oracles',['cargo','test','--locked','--offline','--release','-p','hypercurve','--all-features','--lib','bezier_fit::tests','--','--test-threads=2'],900),
 ('fit-integration',['cargo','test','--locked','--offline','--release','-p','hypercurve','--all-features','--test','hypercurve_bezier_fit_offset','--test','native_curve_images','--','--test-threads=2'],1200),
 ('downstream',['cargo','test','--locked','--offline','--release','-p','csgrs','--all-features','--test','downstream_profiles','--test','mixed_modeling_profiles','--test','receipt_composition','--test','adapter_curve_failures','--','--test-threads=2'],1200),
 ('budget',['bash','scripts/check-repository-budget.sh'],300),
 ('diff-check',['git','diff','--check'],300),
]
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
for filename in ['fit-oracles.log','fit-integration.log','downstream.log']:
    if not (record/filename).exists():continue
    rows=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;', (record/filename).read_text())
    summary[filename]={'groups':len(rows),'passed':sum(int(r[0]) for r in rows),'failed':sum(int(r[1]) for r in rows),'ignored':sum(int(r[2]) for r in rows)}
(record/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(record/'completion.json').write_text(json.dumps({'failed':failed,'sources_unchanged':True},indent=2)+'\n')
print('PRIMARY COMPLETE',record,failed,flush=True)
