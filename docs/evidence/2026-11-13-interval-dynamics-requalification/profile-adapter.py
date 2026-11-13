from pathlib import Path
import subprocess,os,json,time,shutil,hashlib
p=Path(__file__).parent;tool='/tmp/interval-refactor/profiling-tools/valgrind/usr/bin/valgrind';lib='/tmp/interval-refactor/profiling-tools/valgrind/usr/libexec/valgrind'
cases=['specctra_grid_route_text_parse_256','specctra_trace_record_exact_import','differential_pair_skew_certification','corner_lookahead_feed_limit_certification','symmetric_jerk_limited_feed_time','mixed_path_symmetric_jerk_limited_feed_time','rect_pad_board_edge_clearance_exact']
rows=[];common=Path('/tmp/interval-refactor/dynamics-profile-executable')
for case in cases:
 for variant in ['adapter-inline']:
  source=Path('/tmp/interval-refactor/dynamics-requal-binaries')/('probe-'+variant);shutil.copy2(source,common)
  name='callgrind-'+case+'-'+variant;cmd=[tool,'--tool=callgrind','--collect-atstart=no','--toggle-collect=dynamics_profile_epoch','--callgrind-out-file='+str(p/(name+'.out')),str(common)];env=os.environ|{'VALGRIND_LIB':lib,'OWNER_PROFILE':'1','OWNER_CASE':case};start=time.monotonic()
  with (p/(name+'.log')).open('w') as log:r=subprocess.run(cmd,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=120)
  rows.append(dict(case=case,variant=variant,command=cmd,env={'VALGRIND_LIB':lib,'OWNER_PROFILE':'1','OWNER_CASE':case},sha256=hashlib.sha256(source.read_bytes()).hexdigest(),returncode=r.returncode,seconds=time.monotonic()-start));(p/'adapter-profile-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(case,variant,r.returncode,flush=True);assert r.returncode==0
