from pathlib import Path
import hashlib,json,os,resource,shutil,signal,subprocess,time
from runtime_manifest import assert_runtime
raw=Path(__file__).resolve().parent
baseline=json.loads((raw/'latest-brep-baseline-reproduction.json').read_text())
source=Path(baseline['record']);assert hashlib.sha256((source/'model.json').read_bytes()).hexdigest()==baseline['archive_sha256']
source_rows=json.loads((source/'results.json').read_text());assert source_rows[0]['status']==0 and source_rows[0]['stages'][-1]['outcome']=='Exact'
build=json.loads((raw/'latest-brep-build-candidate.json').read_text());assert_runtime(json.loads(Path(build['sources']).read_text()),'candidate');assert hashlib.sha256(Path(build['binary']).read_bytes()).hexdigest()==build['sha256']
original_build=json.loads((source/'build.json').read_text());assert build['harness_sha256']==original_build['harness_sha256'] and build['lock_sha256']==original_build['lock_sha256']
record=raw/f'brep-continuation-{time.time_ns()}';record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes());(record/'runtime_manifest.py').write_bytes((raw/'runtime_manifest.py').read_bytes())
for name in ['fixture.json','model.json']:shutil.copy2(source/name,record/name)
(record/'build.json').write_text(json.dumps(build,indent=2)+'\n')
def limits():
    resource.setrlimit(resource.RLIMIT_AS,(2<<30,2<<30));resource.setrlimit(resource.RLIMIT_FSIZE,(64<<20,64<<20));resource.setrlimit(resource.RLIMIT_CORE,(0,0))
command=['/usr/bin/time','-v',build['binary'],'reload',str(record)];start=time.monotonic()
with (record/'stdout').open('x') as out,(record/'stderr').open('x') as err:
    p=subprocess.Popen(command,stdout=out,stderr=err,preexec_fn=limits,start_new_session=True)
    try:status=p.wait(timeout=180)
    except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
stages=[json.loads(line) for line in (record/'stdout').read_text().splitlines()]
passed=status==0 and stages[-1].get('outcome')=='Exact' and stages[-1].get('wire_preserved') is True
assert hashlib.sha256((record/'model.json').read_bytes()).hexdigest()==baseline['archive_sha256']
result={'record':str(record),'passed':passed,'status':status,'stages':stages,'command':command,'seconds':time.monotonic()-start,'baseline_record':str(source),'archive_sha256':baseline['archive_sha256'],'archive_bytes':baseline['archive_bytes'],'containment':'180s/2GiBaddress/64MiBoutput/2MiBworkerstack/no core','scope':'Cold BRep archive admission, exact8corner/volume/certainty and byte-preservation checks. No timing comparison.'}
(record/'completion.json').write_text(json.dumps(result,indent=2)+'\n');(raw/'latest-brep-continuation.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result),flush=True)
if not passed:print((record/'stderr').read_text()[-4000:],flush=True)
raise SystemExit(0 if passed else 1)
