from pathlib import Path
import json,copy,hashlib
s=Path(__file__).parent
ledger=Path('/mnt/development/csgrs/docs/research/interval-size-accounts.json')
d=json.loads(ledger.read_text());assert len(d['accounts'])==46
record='docs/evidence/2026-11-16-interval-interface-compiler-display'
r=json.loads((s/'interface-ui-revised-size-review.json').read_text());assert r['all_size_caps_pass']
base=json.loads((s/'interface-artifacts-baseline/report.json').read_text())['artifacts']
final=json.loads((s/'interface-artifacts-ui-final/report.json').read_text())['artifacts']
base['ui-release-tests']=json.loads((s/'interface-ui-tests-baseline/report.json').read_text())
final['ui-release-tests']=json.loads((s/'interface-ui-tests-final/report.json').read_text())
for target,measure in r['comparisons']['cumulative'].items():
 metrics={}
 for name,m in {'file':measure['file'],**({'emitted_code':measure['total_emitted_code']} if 'total_emitted_code' in measure else {}),**measure.get('sections',{})}.items():
  assert m['passes_both_caps']
  growth=max(m['delta_bytes'],0);percent=max(m['delta_percent'],0)
  metrics[name]={'baseline':m['baseline_bytes'],'previous_retained':m['baseline_bytes'],'retained':m['candidate_bytes'],'incremental_growth_bytes':m['delta_bytes'],'incremental_growth_percent':m['delta_percent'],'net_growth_bytes':m['delta_bytes'],'growth_percent':m['delta_percent'],'accepted_positive_growth_bytes':growth,'remaining_cumulative_bytes':m['absolute_cap_bytes']-growth,'remaining_cumulative_percent':m['percentage_cap']-percent,'caps':{'incremental_bytes':m['absolute_cap_bytes'],'incremental_percent':m['percentage_cap'],'cumulative_bytes':m['absolute_cap_bytes'],'cumulative_percent':m['percentage_cap']},'passes_both_caps':True}
  if 'total_section_ceiling_bytes' in m:metrics[name]['total_section_ceiling_bytes']=m['total_section_ceiling_bytes']
 d['accounts'].append({'artifact':'alumina-interface#'+target,'role':'finite display midpoint correctness and strict compiler compatibility','target':'wasm32-unknown-unknown' if target.startswith('wasm') else 'x86_64-unknown-linux-gnu','toolchain':'stable as pinned by archived tool inventory and build records','profile':'Interface configured release; final linked artifact and all emitted code, including monomorphizations','baseline_repositories':json.loads((s/'interface-ui-size-proposal.json').read_text())['fixed_goal_baseline'],'equivalent_control_commit':'32a59de0d69436427e5b97297c4929fd908bf326','baseline_equivalence':'Archived interface-fixed-control.json and interface-ui-fixed-control.json verify source/build equivalence for this artifact; separate core tests are not included.','baseline_sha256':base[target]['sha256'],'retained_sha256':final[target]['sha256'],'metrics':metrics,'headroom':{'brotli_asset_ceiling_bytes':4194304,'minimum_headroom_bytes':524288,'measured_headroom_bytes':688115} if target=='wasm-brotli' else 'Host/hosted artifact; no firmware image or flash partition. Artifact-specific remaining byte/percentage allowance is recorded in each metric.','evidence':record,'source_snapshot':'0db15b4a749692cac610496ec4f1c1f8bdd73ee0','padding_revision':record+'/interface-ui-padding-budget-revision.json'})
core=json.loads((s/'interface-core-budget/revised-size-review.json').read_text());assert core['all_caps_pass']
a=next(a for a in d['accounts'] if a['artifact']==core['existing_account']['artifact'])
assert a==core['existing_account']
old=copy.deepcopy(a)
a['matched_layout_requalifications']=[{'change':'interface-compiler-display','scope':core['scope'],'baseline_repositories':a['baseline_repositories'],'source_artifacts':{k:{x:v[x] for x in ['bytes','sha256','text_bytes','text_sha256']} for k,v in core['source_variants'].items()},'comparisons':core['comparisons'],'cumulative_accounting':{'prior_file_positive_growth_still_charged_bytes':a['metrics']['file']['accepted_positive_growth_bytes'],'prior_text_positive_growth_still_charged_bytes':a['metrics']['text']['accepted_positive_growth_bytes'],'additional_file_positive_growth_bytes':0,'additional_text_positive_growth_bytes':0,'rule':'Historical file/text metrics remain unchanged. Current-layout fixed-to-candidate and previous-to-candidate comparisons are supplemental; no layout credit or reduction resets the prior charges. Allocated-section comparisons and separate padding revision retain both incremental and fixed-baseline values.'},'evidence':record,'padding_revision':record+'/interface-core-padding-budget-revision.json'}]
assert {k:v for k,v in a.items() if k!='matched_layout_requalifications'}==old
assert len(d['accounts'])==54
d['accepted_changes'].append({'id':'interface-compiler-display','benefit':'finite display midpoint overflow repair, strict stable compiler compatibility, and independent extreme-coordinate regression','repository':'alumina-interface','source_snapshot':'0db15b4a749692cac610496ec4f1c1f8bdd73ee0','production_implementation_changed':True,'evidence':record,'scope':'Eight new host/hosted artifact accounts and an explicit matched-layout requalification of the existing core test account. All prior accepted positive charges remain.'})
(s/'interface-proposed-size-accounts.json').write_text(json.dumps(d,indent=2)+'\n')
print('Prepared',len(d['accounts']),'accounts; original ledger unchanged',hashlib.sha256(ledger.read_bytes()).hexdigest())
