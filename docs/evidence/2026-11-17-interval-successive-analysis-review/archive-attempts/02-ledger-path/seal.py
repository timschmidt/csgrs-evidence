from pathlib import Path
import hashlib,json,shutil,subprocess,time,runpy
root=Path('/mnt/development/csgrs');archive=Path('/mnt/development/csgrs-evidence');base=Path('/tmp/interval-refactor');stage=base/'solver-combined-admission';queue=base/'coordinated-ci';snapshot=base/'successive-analysis-review'
assert not snapshot.exists();snapshot.mkdir()
assert not subprocess.check_output(['git','status','--porcelain'],cwd=root)
assert not subprocess.check_output(['git','status','--porcelain'],cwd=archive)
primary=subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip();previous=subprocess.check_output(['git','rev-parse','HEAD'],cwd=archive,text=True).strip()
assert primary=='5d74e2c1dd3bdb0a68276c4cc2e290be453a27b5'
paths=[(stage/name,'analysis/'+name) for name in ['analyze-successive.py','test-successive-analysis.py','successive-analysis-controls.json','successive-runtime-corpus-review.json','successive-analysis-quiet-overlap.json','successive-analysis-controls-pause.json','quiet-progress-first-drc.json','TIMING-CONTRACT.md']]
paths += [(queue/name,'queue/'+name) for name in ['quiet-workflow-executed-plan.json','quiet-external-recurrence-hold.json','external-recurrence-watch/watch.py','external-recurrence-watch/active.json']]
for i in [1,2]:
 for name in ['result.json','output.log','command.sh']:
  rel=f'runs/hyperdrc.kicad-smoke.quiet-replay-{i}/{name}';paths.append((queue/rel,'queue/'+rel))
paths += [(attempt, 'archive-attempt/'+attempt.name) for attempt in (base/'successive-analysis-review-attempts/01-terminal-active-file').iterdir() if attempt.is_file()]
inputs={}
for source,relative in paths:
 dest=snapshot/relative;dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(source,dest);inputs[relative]={'source':str(source),'sha256':hashlib.sha256(dest.read_bytes()).hexdigest()}
observation=json.loads((queue/'external-recurrence-watch/observations.jsonl').read_text().splitlines()[-1]);(snapshot/'queue/host-observation.json').write_text(json.dumps(observation,indent=2)+'\n')
controls=json.loads((snapshot/'analysis/successive-analysis-controls.json').read_text());assert controls['passed']==26
assert controls['analyzer_sha256']==inputs['analysis/analyze-successive.py']['sha256']
assert controls['test_sha256']==inputs['analysis/test-successive-analysis.py']['sha256']
results=[json.loads((snapshot/f'queue/runs/hyperdrc.kicad-smoke.quiet-replay-{i}/result.json').read_text()) for i in [1,2]]
assert all(r['exit_code']==101 and r['source_boundaries_unchanged'] for r in results)
assert len(json.loads((snapshot/'queue/quiet-workflow-executed-plan.json').read_text())['commands'])==38
ledgers={name:hashlib.sha256((root/name).read_bytes()).hexdigest() for name in ['interval-size-accounts.json','interval-memory-accounts.json']}
report=dict(time=time.time(),primary_revision=primary,evidence_parent=previous,source_changes=False,owner='qualification evidence; Hypersolve candidates and existing Hyperdrc workflow gate',properties=['P5','P20'],missing_witness='Complete successive-operation post-run analysis that refuses incomplete or misattributed measurements and preserves per-step regressions.',synthetic_controls=26,actual_combined_timings=False,remaining_queued_commands=36,quiet_orchestrator_held=True,accepted_ledger_sha256=ledgers,production_admitted=False,memory_accounts_admitted=0,drc_worker_cpu_seconds=[189.525596316,188.118210819],drc_limit_seconds=120,drc_replay_status='Both unchanged assertions failed. External routing restarted after initial quiet window, invalidating an exclusive-host claim. First also overlapped synthetic control execution. Failures are retained without causal attribution, retries or gate waiver.',archive_scope='Finite snapshot only. Entire combined stage and live queue/watch logs remain mutable and are not sealed or admitted.',inputs=inputs)
(snapshot/'review.json').write_text(json.dumps(report,indent=2)+'\n')
record='docs/evidence/2026-11-17-interval-successive-analysis-review';destination=archive/record;assert not destination.exists();shutil.copytree(snapshot,destination)
subprocess.run(['git','add','--sparse','--',record],cwd=archive,check=True)
changes=subprocess.check_output(['git','diff','--cached','--name-status'],cwd=archive,text=True).splitlines();assert changes and all(line.startswith('A\t'+record+'/') for line in changes)
with (base/'successive-analysis-review-archive-commit.log').open('w') as out:subprocess.run(['git','commit','-m','Preserve successive analysis controls and contended DRC failures'],cwd=archive,check=True,stdout=out,stderr=subprocess.STDOUT)
revision=subprocess.check_output(['git','rev-parse','HEAD'],cwd=archive,text=True).strip()
assert subprocess.check_output(['git','diff','--name-status',previous,revision],cwd=archive,text=True).splitlines()==changes
api=runpy.run_path(str(root/'scripts/evidence_archive.py'));api['manifest'].__globals__['ROOTS']={record:False};rows=api['manifest'](str(archive),revision);assert len(rows)==2 and rows[1].startswith(record+'\t')
index=root/'docs/evidence-archive.tsv';old=index.read_text();assert record not in old;index.write_text(old+rows[1]+'\n')
assert index.read_text().splitlines()[:-1]==old.splitlines()
receipt=dict(revision=revision,previous_revision=previous,record=record,row=rows[1],all_previous_archive_paths_unchanged=True,all_previous_manifest_rows_preserved_in_order=True)
(base/'successive-analysis-review-archive.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
