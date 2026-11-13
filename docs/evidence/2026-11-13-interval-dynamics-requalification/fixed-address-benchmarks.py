from pathlib import Path
import subprocess,os,json,time,shutil,hashlib,re
p=Path(__file__).parent;runtime=Path('/tmp/interval-refactor/dynamics-criterion-runtime');common=Path('/tmp/interval-refactor/dynamics-benchmark-executable');rows=[]
names=['specctra_grid_route_text_parse_256', 'specctra_grid_mixed_route_text_parse', 'specctra_grid_arc_wire_exact_lift', 'trace_circular_board_edge_clearance_exact', 'trace_obround_board_edge_clearance_exact', 'specctra_trace_record_exact_import', 'differential_pair_skew_certification', 'corner_lookahead_feed_limit_certification', 'symmetric_jerk_limited_feed_time', 'mixed_path_symmetric_jerk_limited_feed_time', 'rect_pad_board_edge_clearance_exact', 'mixed_path_constant_feed_time_certification'];pattern='^(?:'+'|'.join(re.escape(n) for n in names)+')$'
for index,variant in enumerate(['baseline','candidate','candidate','baseline']):
 source=Path('/tmp/interval-refactor/dynamics-requal-binaries')/variant;shutil.copy2(source,common)
 if runtime.exists():shutil.rmtree(runtime)
 name=f'fixed-address-{index}-{variant}'
 cmd=['setarch','x86_64','-R','taskset','-c','0','python3',str(p/'warm-exec.py'),str(common),pattern,'--bench','--warm-up-time','0.2','--measurement-time','0.5','--sample-size','20','--save-baseline','sample','--noplot'];start=time.monotonic()
 with (p/(name+'.log')).open('w') as log:r=subprocess.run(cmd,cwd='/tmp/interval-refactor',env=os.environ|{'CRITERION_HOME':str(runtime)},stdout=log,stderr=subprocess.STDOUT,timeout=600)
 count=0
 for source_dir in runtime.rglob('sample'):
  if source_dir.is_dir():shutil.copytree(source_dir,p/(name+'-criterion')/source_dir.parent.relative_to(runtime));count+=1
 rows.append(dict(index=index,variant=variant,command=cmd,cwd='/tmp/interval-refactor',env={'CRITERION_HOME':str(runtime)},sha256=hashlib.sha256(source.read_bytes()).hexdigest(),returncode=r.returncode,seconds=time.monotonic()-start,case_directories=count));(p/'fixed-address-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,count,round(time.monotonic()-start,2),flush=True);assert r.returncode==0 and count==len(names)
