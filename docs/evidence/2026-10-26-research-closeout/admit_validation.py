from pathlib import Path
import collections,hashlib,json,subprocess,time
raw=Path(__file__).resolve().parent
main=Path('/home/tim/Documents/GitHub/workspace/csgrs')
final=Path('/tmp/csgrs-research-release-checkout')
attribution=json.loads((raw/'maintenance-source-attribution.json').read_text())
final_revision=attribution['final_code_revision']
allowed_differences=set(attribution['allowed_checkpoint_differences'])
final_requirements=attribution['required_final_source_paths_by_step']
ui='crates/hypertri/examples/hypertri_ui/src/app.rs'
ui_steps=set(json.loads((raw/'ui-fix-source-attribution.json').read_text())['required_final_source_steps'])
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=final,text=True).strip()==final_revision
names=subprocess.check_output(['git','ls-files'],cwd=final,text=True).splitlines()
final_sources={n:hashlib.sha256((final/n).read_bytes()).hexdigest() for n in names if (final/n).is_file()}
matrix=json.loads((raw/'matrix.json').read_text())
required={s['id']:s for s in matrix['steps']+matrix['extra_clippy']}
records=[]
for directory in sorted(raw.glob('validation-*')):
    if not directory.is_dir() or not (directory/'steps.json').exists():continue
    for step in json.loads((directory/'steps.json').read_text()):
        if step['id'].startswith('release-clippy-') or step['id']=='examples-extra-clippy':required[step['id']]=step
    events=[json.loads(x) for x in (directory/'events.jsonl').read_text().splitlines()] if (directory/'events.jsonl').exists() else []
    records.append((directory,events))
workflow={s['id'] for s in matrix['steps']};assert len(workflow)==129
assert len(set(required)-workflow)==196
covered=collections.defaultdict(list);attempts=[];guards={};running=[]
for directory,events in records:
    after_path=directory/'sources-after.json'
    if not after_path.exists():after_path=directory/'sources-after-reschedule.json'
    if not after_path.exists():
        if events:running.append({'record':directory.name,'step':events[-1]['id']})
        continue
    before=json.loads((directory/'sources-before.json').read_text());after=json.loads(after_path.read_text())
    changed=[n for n in set(before)|set(after) if before.get(n)!=after.get(n)]
    differences=[n for n in set(before)|set(final_sources) if before.get(n)!=final_sources.get(n)]
    guards[directory.name]={'source_changes_during_record':changed,'differences_from_final_code':differences,'before_sha256':hashlib.sha256((directory/'sources-before.json').read_bytes()).hexdigest(),'after_file':after_path.name,'after_sha256':hashlib.sha256(after_path.read_bytes()).hexdigest()}
    valid=not changed and set(differences)<=allowed_differences
    for event in events:
        if event['event']!='finish':continue
        attempts.append({'record':directory.name,'step':event['id'],'status':event['status']})
        if event['status']!=0 or not valid or event['id'] not in required:continue
        expected=required[event['id']]
        if event['command'].strip()!=expected['command'].strip() or event['cwd']!=expected['cwd']:continue
        if any(before.get(n)!=final_sources[n] for n in final_requirements.get(event['id'],[])):continue
        if event['id'].startswith('rust-release-') and differences:continue
        covered[event['id']].append({'record':directory.name,'log':event['id']+'.log','command':event['command'],'cwd':event['cwd'],'toolchain':event['env'].get('RUSTUP_TOOLCHAIN'),'elapsed_seconds':event['elapsed_seconds'],'final_code_inputs_identical':not differences,'uncompiled_maintenance_paths':differences})
missing=sorted(set(required)-set(covered))
progress={'checked_ns':time.time_ns(),'workflow_steps_covered':len(workflow&set(covered)),'workflow_steps_required':129,'strict_lint_steps_covered':len((set(required)-workflow)&set(covered)),'strict_lint_steps_required':196,'missing':missing,'running_records':running,'source_guards':guards}
(raw/'admission-progress.json').write_text(json.dumps(progress,indent=2)+'\n')
if missing or running:
    print(json.dumps({k:v for k,v in progress.items() if k not in ['source_guards','missing']},indent=2));raise SystemExit(1)
assert all(not row['source_changes_during_record'] for row in guards.values()),'Inspect source guard failures before admission'
ui_validation=json.loads((raw/'latest-ui-fix-validation.json').read_text())
assert ui_validation['passed'] and ui_validation['source_unchanged'] and ui_validation['sha256']==final_sources[ui]
assert all(row['status']==0 for row in ui_validation['checks'])
asan_path=Path('/tmp/csgrs-research-closeout-checkout/target/hyperspatial-asan/report.json')
asan=json.loads(asan_path.read_text());assert len(asan['campaigns'])==13
assert {c['target'] for c in asan['campaigns']}==set(asan['campaign_seconds'])
assert all(c['returncode']==0 and c['mutation_evidence']['mutated'] for c in asan['campaigns'])
assert asan['seconds_per_input']==10 and asan['rss_limit_mib']==2048 and asan['max_input_bytes']==6
assert sum(asan['campaign_seconds'].values())==10200
for name,digest in asan['source_sha256'].items():assert final_sources[name]==digest,name
asan_compiler=json.loads((raw/'asan-actual-compiler.json').read_text())
audit=raw/asan_compiler['record']/'cargo-invocations.jsonl'
children=[json.loads(x) for x in audit.read_text().splitlines() if json.loads(x)['event']=='start' and json.loads(x)['arguments'][:1]==['run']]
assert len(children)==13 and all(x['toolchain']=='nightly-2026-10-26-x86_64-unknown-linux-gnu' for x in children)
assert 'rustc version 1.101.0-nightly (76456a688 2026-10-25)' in asan_compiler['binary_compiler_confirmation']['readelf_comment']
ci_changes=subprocess.check_output(['git','diff','--name-only','3cca6a894858c8b98497a3cfe81cff5e17e1a7f2',final_revision,'--','.github/workflows','.github/actions','.github/dependabot.yml','.pre-commit-config.yaml'],cwd=main,text=True).splitlines();assert not ci_changes
hosted=json.loads((raw/'hosted-action-review.json').read_text());assert len(hosted['steps'])==4
result={**progress,'all_required_checks_passed':True,'sources_unchanged':True,'source_guard_scope':'No tracked input changed during an accepted record. Across checkpoints, maintenance-source-attribution.json identifies uncompiled changed paths and requires final hashes for every affected step.','final_code_revision':final_revision,'frozen_kernel_revision':'05cfe80739567e8abba2c01ddc398b4671814fe1','covered_steps':dict(covered),'attempts':attempts,'source_attribution':'The maintenance source attribution lists all five changed paths. Every affected demo, DRC/circuit/workspace configuration and full release workflow passed on its required final source hashes; the other compiled inputs are identical. Failed setup and old-source lint attempts are retained and superseded by complete successful checks.','ui_fix_validation':ui_validation,'sanitizer_campaigns':[{'target':x['target'],'returncode':x['returncode'],'mutation_evidence':x['mutation_evidence']} for x in asan['campaigns']],'sanitizer_compiler_qualification':'The script report header queried the older user nightly alias. The actual command audit and binary compiler section establish nightly-2026-10-26; see asan-actual-compiler.json.','hosted_exclusions':hosted['steps'],'ci_configuration_changed':False,'zizmor_required':False,'scope':'Required pre-push validation only. Workflow benchmark timings ran with concurrent checks and are not new performance-admission evidence. R19 remains the final research experiment; R20 was not started. The curve and BRep closure plans remain requirements, not implementation claims.','remaining_work':['Collect and archive artifacts, preserving raw profiles and command evidence.','Update the evidence index and closeout documentation, run affected document checks, and commit all intended changes.','Verify and push the evidence research branch and source main; pause the original research goal at the user request.']}
assert not (raw/'validation-admission.json').exists()
(raw/'validation-admission.json').write_text(json.dumps(result,indent=2)+'\n')
(raw/'final-code-sources.json').write_text(json.dumps(final_sources,indent=2)+'\n')
print('ADMITTED: 129 workflow steps and 196 strict lint configurations, with final UI and source attribution.')
