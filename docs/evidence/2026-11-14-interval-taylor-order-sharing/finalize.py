from pathlib import Path
import subprocess,json,hashlib,os,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs');rows=[]
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/taylor-order-sharing-main','CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
for name,cmd in [('format',['cargo','+1.95.0','fmt','--all','--','--check']),('budget',['bash','scripts/check-repository-budget.sh']),('diff',['git','diff','--check']),('owner',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--all-features','--test','field_taylor_orders']),('consumer',['cargo','+1.95.0','run','--locked','-p','hyperdynamics','--features','taylor-flow','--example','taylor_orders'])]:
 print(name,flush=True);start=time.monotonic()
 with (s/f'main-{name}.log').open('wb') as out:p=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,returncode=p.returncode,elapsed_seconds=time.monotonic()-start));(s/'main-validation.json').write_text(json.dumps(rows,indent=2)+'\n');assert p.returncode==0,name
source=json.loads((s/'SOURCE.json').read_text());overlap={'crates/hyperdynamics/'+x for x in ['Cargo.toml','README.md','CHANGELOG.md']}
for path in source['paths']:
 qualified=subprocess.check_output(['git','show',source['commit']+':'+path],cwd=r)
 if path not in overlap:assert (r/path).read_bytes()==qualified,path
# Three documentation/manifest overlaps are covered by exact tree reversal and
# equality of every pending added/deleted/context line in INTEGRATION.json.
integration=json.loads((s/'INTEGRATION.json').read_text());assert integration['exact_reversal'] and integration['pending_changes_identical_except_blob_ids_and_hunk_metadata']
source['status']='qualified locally on Rust 1.95 and stable; integrated preserving pending extraction content'
(s/'SOURCE.json').write_text(json.dumps(source,indent=2)+'\n')
baseline=json.loads((s/'BASELINE.json').read_text());repos={}
for name in baseline:
 root=Path('/mnt/development')/name
 def git(*args):return subprocess.check_output(['git',*args],cwd=root)
 row=dict(head=git('rev-parse','HEAD').decode().strip(),status=git('status','--porcelain=v1').decode(),staged_sha256=hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),unstaged_sha256=hashlib.sha256(git('diff','--binary')).hexdigest())
 if name!='csgrs':assert row==baseline[name],name
 else:
  assert row['head']==source['commit'] and row['status']==baseline[name]['status']
  assert row['staged_sha256']==integration['pending_after_sha256']
  assert row['unstaged_sha256']==baseline[name]['unstaged_sha256']
 repos[name]=row
(s/'FINAL-REPOSITORIES.json').write_text(json.dumps(repos,indent=2)+'\n')
(s/'REVIEW.json').write_text(json.dumps(dict(changed_paths=source['paths'],qualified_nonoverlapping_files_match=True,overlap_paths=sorted(overlap),overlap_proof='exact reverse tree; pending content identical with only blob and hunk metadata changed',existing_acceptance_not_removed=True,sibling_states_preserved=True,pending_extraction_preserved=True,scope='prepared trajectory order sharing; existing function bodies unchanged',publication=False),indent=2)+'\n')
(s/'CHECKPOINT.json').write_text(json.dumps(dict(status='integrated and qualified; ready for evidence archive',active_sessions=[],source_commit=source['commit'],goal_complete=False),indent=2)+'\n')
print(json.dumps(rows,indent=2))
