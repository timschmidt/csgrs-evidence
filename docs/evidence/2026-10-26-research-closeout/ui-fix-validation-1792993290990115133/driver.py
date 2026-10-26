from pathlib import Path
import hashlib,json,os,subprocess,time

root=Path('/home/tim/Documents/GitHub/workspace/csgrs')
raw=Path(__file__).resolve().parent
record=raw/('ui-fix-validation-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
path='crates/hypertri/examples/hypertri_ui/src/app.rs'
before=hashlib.sha256((root/path).read_bytes()).hexdigest()
(record/'app.rs').write_bytes((root/path).read_bytes())
env=os.environ.copy();env.update(CARGO_TARGET_DIR=str(root/'target/research-closeout-ui'),CCACHE_DIR=str(root/'target/research-closeout-tools/ccache'),CCACHE_TEMPDIR=str(root/'target/research-closeout-tools/ccache/tmp'),CARGO_BUILD_JOBS='2',CARGO_NET_OFFLINE='true')
manifest='crates/hypertri/examples/hypertri_ui/Cargo.toml'
checks=[('fmt',['cargo','+1.99.1','fmt','--manifest-path',manifest,'--','--check']),
        ('native-clippy',['cargo','+1.99.1','clippy','--locked','--manifest-path',manifest,'--','-D','warnings']),
        ('native-tests',['cargo','+1.99.1','test','--locked','--manifest-path',manifest]),
        ('wasm-clippy',['cargo','+1.99.1','clippy','--locked','--release','--manifest-path',manifest,'--target','wasm32-unknown-unknown','--','-D','warnings']),
        ('msrv-clippy',['cargo','+1.95.0','clippy','--locked','--manifest-path',manifest,'--','-D','warnings'])]
rows=[]
for name,command in checks:
    print('START',name,flush=True);started=time.time()
    with (record/(name+'.log')).open('w') as out:result=subprocess.run(command,cwd=root,env=env,stdout=out,stderr=subprocess.STDOUT)
    rows.append({'name':name,'command':command,'status':result.returncode,'seconds':time.time()-started})
    (record/'commands.json').write_text(json.dumps(rows,indent=2)+'\n')
    print('FINISH',name,result.returncode,flush=True)
    if result.returncode:print((record/(name+'.log')).read_text()[-4000:],flush=True);break
assert before==hashlib.sha256((root/path).read_bytes()).hexdigest()
summary={'record':str(record),'source':path,'sha256':before,'source_unchanged':True,'checks':rows,'passed':len(rows)==len(checks) and all(r['status']==0 for r in rows)}
(record/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(raw/'latest-ui-fix-validation.json').write_text(json.dumps(summary,indent=2)+'\n')
print('UI FIX VALIDATION COMPLETE',record,summary['passed'],flush=True)
raise SystemExit(0 if summary['passed'] else 1)
