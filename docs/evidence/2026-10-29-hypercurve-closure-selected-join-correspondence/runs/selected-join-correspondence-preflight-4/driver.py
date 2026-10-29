from pathlib import Path
import argparse,importlib.util,json,os,subprocess,sys,time
sys.dont_write_bytecode=True
parser=argparse.ArgumentParser();parser.add_argument('--attempt',required=True);args=parser.parse_args()
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-join-correspondence';record=c/('selected-join-correspondence-preflight-'+args.attempt);record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e);source,files,patch=e.source_snapshot()
e.save_json(record/'source-before.json',source);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes())
command=['cargo','+1.95.0','clippy','--locked','--release','-p','hypersolve','-p','hypercurve','-p','hyperbrep','-p','csgrs','--all-features','--all-targets','--','-D','warnings']
env={**os.environ,'CARGO_BUILD_JOBS':'2','CARGO_TARGET_DIR':str(r.parent/'hypersolve-selected-join-correspondence-admission-msrv'),'CCACHE_DIR':str(r.parent/'hypercurve-admission-ccache'),'CCACHE_TEMPDIR':str(r.parent/'hypercurve-admission-ccache/tmp')}
started=time.time()
with (record/'clippy.log').open('w') as log:
 p=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=w,env=env,stdout=log,stderr=subprocess.STDOUT)
 e.save_json(record/'active.json',{'pid':p.pid,'command':command,'started_epoch':started});code=p.wait()
after,af,_=e.source_snapshot();e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af)
row={'command':command,'exit_code':code,'source':source,'source_stable':source==after,'elapsed_seconds':time.time()-started,'epoch':time.time()};e.save_json(record/'complete.json',row);print(row);assert code==0 and row['source_stable']
