"""Sequential frozen-source consumers and artifact qualification before measuring."""
import datetime,hashlib,json,shutil,subprocess,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,ENV,hashes,run
source=hashes(); q=json.loads((OUT/'qualification-driver.json').read_text()); assert q['source']==source and not q['failures']
# Qualification has returned and no task compiler is running. Only disposable
# incremental state is removed; final artifacts and frozen baselines remain.
cache=Path(ENV['CARGO_TARGET_DIR'])/'debug/incremental'
if cache.exists():
 size=sum(p.stat().st_size for p in cache.rglob('*') if p.is_file())
 shutil.rmtree(cache)
 (OUT/'final-cache-cleanup.json').write_text(json.dumps(dict(path=str(cache),bytes=size,at=datetime.datetime.now(datetime.timezone.utc).isoformat(),scope='Regenerable private debug incremental cache only; after qualification, before new builds. Frozen executables and all raw evidence retained.'),indent=2)+'\n')
for recipe in ['finish_checks','new_consumers','originals','spline_artifacts']:
 print('Starting',recipe,flush=True)
 subprocess.run(['python3',str(OUT/'final-review'/(recipe+'.py'))],cwd=ROOT,env=ENV,check=True)
 assert hashes()==source
assert run('spline-occt',['python3',str(OUT/'final-review/spline_occt.py')],300)==0
for recipe,args in [('report',['--consumers-only']),('package_payload',[]),('storage',[]),('build_benchmarks',['candidate'])]:
 print('Starting',recipe,flush=True)
 subprocess.run(['python3',str(OUT/'final-review'/(recipe+'.py')),*args],cwd=ROOT,env=ENV,check=True)
 assert hashes()==source
print('All premeasurement consumers complete.',flush=True)
