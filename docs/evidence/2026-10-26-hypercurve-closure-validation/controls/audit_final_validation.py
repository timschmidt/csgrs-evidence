from pathlib import Path
import argparse,hashlib,json,subprocess,time
root=Path(__file__).resolve().parent
p=argparse.ArgumentParser();p.add_argument('--require-complete',action='store_true');a=p.parse_args()
subprocess.run(['python3',str(root/'coverage_report.py')],check=True)
report=json.loads((root/'coverage-report.json').read_text())
checkout=Path('/tmp/hypercurve-closure-prepush-native')
final='4b5bcdde506703e65f593a8006fde6e808e800a5'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==final
tracked=subprocess.check_output(['git','ls-files'],cwd=checkout,text=True).splitlines()
sources={n:hashlib.sha256((checkout/n).read_bytes()).hexdigest() for n in tracked if (checkout/n).is_file()}
metadata=json.loads((root/'final-workspace-metadata.json').read_text());packages={x['name']:x for x in metadata['packages']}
def closure(n,seen=None):
    seen=set() if seen is None else seen
    if n in seen:return seen
    seen.add(n)
    for d in packages[n]['dependencies']:
        if d.get('path') and d['name'] in packages:closure(d['name'],seen)
    return seen
attribution={};pending=[]
for label,attempt in report['successful_attempts'].items():
    if label=='hypercurve-quality-0-5':
        assert attempt['head']==final
        attribution[label]={'head':final,'mode':'full Hypercurve suite on final code','log_sha256':attempt['log_sha256']}
        continue
    record=root/attempt['record']
    if not (record/'summary.json').exists():
        pending.append(record.name);continue
    summary=json.loads((record/'summary.json').read_text());assert not summary['source_changes'],record
    before=json.loads((record/'sources-before.json').read_text());after=json.loads((record/'sources-after.json').read_text());assert before==after,record
    changed=[n for n in sorted(set(before)|set(sources)) if before.get(n)!=sources.get(n)]
    mode='same tracked inputs'
    scope=[]
    if changed:
        owner=label.split('-')[0]
        assert owner in ['hyperreal','hyperlattice','hyperlimit','hypersolve','hypertri','hypermesh','hyperspatial'],(label,summary['head'],changed)
        scope=sorted(closure(owner));assert 'hypercurve' not in scope
        selected=[n for n in sources if any(n.startswith('crates/'+dep+'/') for dep in scope) or n in ['Cargo.toml','Cargo.lock','rust-toolchain.toml','rust-toolchain'] or n.startswith(('.cargo/','.github/','scripts/'))]
        assert all(before.get(n)==sources[n] for n in selected),(label,[n for n in selected if before.get(n)!=sources[n]])
        assert not any(n.startswith('crates/'+dep+'/') for n in changed for dep in scope),(label,changed)
        mode='unchanged owning package, all local dependency packages, manifests, lock, scripts and workflows'
    log=record/(label+'.log');assert log.is_file()
    attribution[label]={'head':summary['head'],'mode':mode,'dependency_scope':scope,'record':record.name,'log_sha256':hashlib.sha256(log.read_bytes()).hexdigest(),'tracked_differences_from_final':changed}
result={'final_code':final,'created_epoch':time.time(),'required_workflow_steps':report['required_workflow_steps'],'required_strict_clippy':report['required_strict_clippy'],'executed':report['passed'],'execution_complete':report['execution_complete'],'pending_record_closeout':sorted(set(pending)),'source_attribution_complete':len(attribution)==325,'attribution':attribution,'unsuccessful_attempts_retained':report['unsuccessful_attempts'],'historical_results_reused':False,'interpretation':'All successful commands were executed during this closure session. Older in-session records count only where source/dependency inputs are unchanged. Cancelled duplicate attempts remain separate from their completed replacements.'}
(root/'final-source-attribution.json').write_text(json.dumps(result,indent=2)+'\n')
print({k:result[k] for k in ['executed','execution_complete','pending_record_closeout','source_attribution_complete']})
if a.require_complete:assert result['execution_complete'] and result['source_attribution_complete'] and not pending
