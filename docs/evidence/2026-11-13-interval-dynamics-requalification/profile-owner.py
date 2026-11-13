from pathlib import Path
import subprocess,os,json,time,shutil,hashlib,re
p=Path(__file__).parent;tool='/tmp/interval-refactor/profiling-tools/valgrind/usr/bin/valgrind';lib='/tmp/interval-refactor/profiling-tools/valgrind/usr/libexec/valgrind'
cases=[('specctra_grid_route_text_parse_256','hyperpath::specctra::parse_specctra_grid_trace_records'),('specctra_trace_record_exact_import','hyperpath::specctra::import_specctra_trace_record'),('differential_pair_skew_certification','hyperpath::routing::certify_differential_pair_skew'),('mixed_path_symmetric_jerk_limited_feed_time','hyperpath::routing::feed::certify_symmetric_jerk_limited_feed_time_for_path'),('symmetric_jerk_limited_feed_time','hyperpath::routing::feed::certify_symmetric_jerk_limited_feed_time'),('corner_lookahead_feed_limit_certification','hyperpath::routing::feed::certify_corner_lookahead_limits')]
rows=[];common=Path('/tmp/interval-refactor/dynamics-profile-owner-executable')
for case,fn in cases:
 for variant in ['baseline','candidate']:
  source=Path('/tmp/interval-refactor/dynamics-requal-binaries')/variant;shutil.copy2(source,common)
  name='owner-callgrind-'+case+'-'+variant;cmd=[tool,'--tool=callgrind','--cache-sim=yes','--branch-sim=yes','--collect-atstart=no','--toggle-collect='+fn,'--callgrind-out-file='+str(p/(name+'.out')),str(common),'^'+re.escape(case)+'$','--test'];env=os.environ|{'VALGRIND_LIB':lib};start=time.monotonic()
  with (p/(name+'.log')).open('w') as log:r=subprocess.run(cmd,cwd='/tmp/interval-refactor',env=env,stdout=log,stderr=subprocess.STDOUT,timeout=120)
  out=(p/(name+'.out')).read_text();events=re.search(r'^events: (.*)$',out,re.M).group(1).split();cost=list(map(int,re.search(r'^summary: (.*)$',out,re.M).group(1).split()));assert cost[0]>0
  rows.append(dict(case=case,variant=variant,command=cmd,env={'VALGRIND_LIB':lib},sha256=hashlib.sha256(source.read_bytes()).hexdigest(),returncode=r.returncode,seconds=time.monotonic()-start,events=dict(zip(events,cost))));(p/'owner-profile-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(case,variant,r.returncode,cost,flush=True);assert r.returncode==0
