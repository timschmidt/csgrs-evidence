from pathlib import Path
import subprocess,re,json,os,hashlib
out=Path('/tmp/interval-refactor/dynamics-return');root=Path('/mnt/development/csgrs-dynamics-return')
log=(out/'restored-routing-tests.log').read_text();path=re.search(r'Running unittests src/lib.rs \(([^)]*hyperpath-[^)]*)\)',log).group(1)
rows=[]
for policy in ['strict','approximate']:
 expected=None
 for implementation in ['legacy','direct','compat']:
  mode=implementation+'-'+policy;c=[str(root/path),'--exact','routing::feed_join_migration::reports_and_counts_match_in_fresh_processes','--nocapture'];env=os.environ.copy();env['HYPERDYNAMICS_FEED_JOIN_DIFFERENTIAL']=mode
  run=subprocess.run(c,env=env,stdout=subprocess.PIPE,stderr=subprocess.STDOUT);(out/(mode+'-final.log')).write_bytes(run.stdout);assert run.returncode==0
  lines=[l for l in run.stdout.splitlines() if l.startswith((b'ROW|',b'TRACE|'))];assert len(lines)==92
  if expected is None:expected=lines
  else:assert lines==expected
  rows.append(dict(mode=mode,command=c,exit=run.returncode,report_and_trace_lines=len(lines),sha256=hashlib.sha256(b'\n'.join(lines)).hexdigest()))
(out/'fresh-replay.json').write_text(json.dumps(rows,indent=2)+'\n');print('six fresh-process transcripts match')
