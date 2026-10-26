from pathlib import Path
import hashlib
import json
import os
import re
import signal
import subprocess
import time

raw=Path(__file__).resolve().parent
root=Path('/tmp/csgrs-r19-trace')
record=raw/('private-validation-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r19-target',CARGO_BUILD_JOBS='1',CARGO_PROFILE_RELEASE_DEBUG='0',RUSTFLAGS='',PROPTEST_RNG_SEED='20261025')
def inventory():
    names=subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard'],cwd=root,text=True).splitlines()
    return {n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names if (root/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock','config.toml'])}
before=inventory();(record/'sources-before.json').write_text(json.dumps(before,indent=2)+'\n')
(record/'source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
for n in ['crates/hyperreal/src/computable/node/representation.rs','crates/hyperreal/src/computable/node/structural_analysis.rs','crates/hyperreal/src/computable/node/algebra.rs','crates/hyperreal/src/computable/node/shared_square_quotient.rs','crates/hyperreal/src/computable/node/imported_domain_tests.rs','crates/hyperreal/src/computable/node/shared_square_quotient_tests.rs','crates/hyperreal/src/computable/node/ring_jacobi_relations_tests.rs','crates/hyperreal/tests/serde_cotangent_continuation.rs']:
    (record/Path(n).name).write_bytes((root/n).read_bytes())
checks=[
 ('fmt',['cargo','fmt','--all','--','--check'],300),
 ('new-unit',['cargo','test','--locked','--offline','--release','-p','hyperreal','--features','serde,cached-f64-approx','--lib','imported_domain_tests','--','--test-threads=1'],1200),
 ('new-public',['cargo','test','--locked','--offline','--release','-p','hyperreal','--features','serde,cached-f64-approx','--test','serde_cotangent_continuation','--','--test-threads=1'],600),
 ('hyperreal',['cargo','test','--locked','--offline','--release','-p','hyperreal','--all-features','--no-fail-fast','--','--test-threads=2'],1800),
 ('hyperlimit',['cargo','test','--locked','--offline','--release','-p','hyperlimit','--all-features','--no-fail-fast','--','--test-threads=2'],1200),
 ('default-clippy',['cargo','clippy','--locked','--offline','--release','-p','hyperreal','-p','hyperlimit','--all-targets','--','-D','warnings'],1200),
 ('all-feature-clippy',['cargo','clippy','--locked','--offline','--release','-p','hyperreal','-p','hyperlimit','--all-features','--all-targets','--','-D','warnings'],1200),
]
failed=None;rows=[]
for name,cmd,limit in checks:
    print('R19 PRIVATE START',name,flush=True);start=time.monotonic()
    with (record/(name+'.log')).open('w') as out:
        p=subprocess.Popen(cmd,cwd=root,env=env,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
        try:status=p.wait(timeout=limit)
        except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
    rows.append({'name':name,'command':cmd,'status':status,'seconds':time.monotonic()-start,'timeout_seconds':limit})
    (record/'commands.json').write_text(json.dumps(rows,indent=2)+'\n')
    print('R19 PRIVATE FINISH',name,status,flush=True)
    if status!=0:failed=name;break
after=inventory();assert before==after
(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n')
counts={}
for row in rows:
    matches=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;', (record/(row['name']+'.log')).read_text())
    if matches:counts[row['name']]={'passed':sum(int(r[0]) for r in matches),'failed':sum(int(r[1]) for r in matches),'ignored':sum(int(r[2]) for r in matches),'groups':len(matches)}
result={'record':str(record),'failed':failed,'sources_unchanged':True,'counts':counts,
        'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_PROFILE_RELEASE_DEBUG','RUSTFLAGS','PROPTEST_RNG_SEED']}}
(record/'completion.json').write_text(json.dumps(result,indent=2)+'\n')
(raw/'latest-private-validation.json').write_text(json.dumps(result,indent=2)+'\n')
print('R19 PRIVATE COMPLETE',record,failed,flush=True)
raise SystemExit(0 if failed is None else 1)
