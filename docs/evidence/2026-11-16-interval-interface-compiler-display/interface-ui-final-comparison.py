from pathlib import Path
import collections,hashlib,json,re,subprocess
s=Path(__file__).parent
out=s/'interface-ui-final-comparison';out.mkdir()
proposal=json.loads((s/'interface-ui-size-proposal.json').read_text())
section_proposal=json.loads((s/'interface-ui-section-proposal.json').read_text())
assert json.loads((s/'runs/alumina-interface.ui-final.artifacts/result.json').read_text())['exit_code']==0
assert (s/'interface-artifacts-ui-final/source.patch').read_bytes()==(s/'interface-ui-final-candidate.patch').read_bytes()
reports={}
sections={}
def elf_sections(binary,label,name):
 raw=subprocess.check_output(['readelf','-SW',str(binary)])
 (out/(label+'-'+name+'.sections')).write_bytes(raw)
 rows={}
 for line in raw.decode().splitlines():
  match=re.match(r'\s*\[\s*\d+\]\s+(\.\S+)\s+\S+\s+[0-9a-fA-F]+\s+[0-9a-fA-F]+\s+([0-9a-fA-F]+)\s+[0-9a-fA-F]+\s+(\S+)\s+\d+\s+\d+\s+\d+\s*$',line)
  if match and 'A' in match[3]:rows[match[1]]={'bytes':int(match[2],16),'code':'X' in match[3],'flags':match[3]}
 assert '.text' in rows and rows['.text']['code']
 return rows
for label in ['baseline','candidate','ui-candidate','ui-final']:
 directory=s/('interface-artifacts-'+label)
 reports[label]=json.loads((directory/'report.json').read_text())['artifacts']
 sections[label]={}
 for name,info in reports[label].items():
  raw=(directory/name).read_bytes();assert len(raw)==info['bytes'] and hashlib.sha256(raw).hexdigest()==info['sha256']
  if name in ['desktop','native-library','fixture-driver']:
   sections[label][name]=elf_sections(directory/name,label,name)
   assert sections[label][name]['.text']['bytes']==info['text_bytes']
  elif name in ['wasm-raw','wasm-final']:
   rows=collections.defaultdict(int)
   for row in info['sections']:rows[str(row['id'])]+=row['bytes']
   sections[label][name]={k:{'bytes':v,'code':k=='10'} for k,v in rows.items()}
for label,test_label in [('baseline','baseline'),('ui-final','final')]:
 directory=s/('interface-ui-tests-'+test_label);info=json.loads((directory/'report.json').read_text());raw=(directory/'test-binary').read_bytes()
 assert len(raw)==info['bytes'] and hashlib.sha256(raw).hexdigest()==info['sha256']
 reports[label]['ui-release-tests']=info
 sections[label]['ui-release-tests']=elf_sections(directory/'test-binary',label,'ui-release-tests')
def metric(a,b,caps,kind):
 delta=b-a;percent=delta*100/a if a else (0 if b==0 else None)
 absolute=caps[kind+'_bytes'];relative=caps[kind+'_percent']
 okay=delta<=absolute and (delta<=0 or (a>0 and delta*100<=a*relative))
 return {'baseline_bytes':a,'candidate_bytes':b,'delta_bytes':delta,'delta_percent':percent,'absolute_cap_bytes':absolute,'percentage_cap':relative,'remaining_absolute_bytes':absolute-max(delta,0),'passes_both_caps':okay}
comparisons={}
for comparison,baseline,cap_key in [('cumulative','baseline','cumulative_caps'),('incremental_ui','candidate','incremental_ui_caps')]:
 rows={}
 for name,caps in proposal[cap_key].items():
  base=baseline
  if name=='ui-release-tests':base='baseline'
  a=reports[base][name];b=reports['ui-final'][name]
  row={'file':metric(a['bytes'],b['bytes'],caps,'file'),'baseline_variant':base}
  if name in sections['ui-final']:
   asec=sections[base][name];bsec=sections['ui-final'][name]
   row['sections']={}
   for section in sorted(asec.keys()|bsec.keys()):
    aa=asec[section] if section in asec else {'bytes':0,'code':bsec[section]['code']}
    bb=bsec.get(section,{'bytes':0,'code':aa['code']})
    assert aa['code']==bb['code']
    kind='code' if aa['code'] else 'file'
    row['sections'][section]=metric(aa['bytes'],bb['bytes'],caps,kind)
   acode=sum(v['bytes'] for v in asec.values() if v['code']);bcode=sum(v['bytes'] for v in bsec.values() if v['code'])
   row['total_emitted_code']=metric(acode,bcode,caps,'code')
  rows[name]=row
 comparisons[comparison]=rows
same_source_production={name:reports['ui-final'][name]['sha256']==reports['ui-candidate'][name]['sha256'] for name in reports['ui-candidate']}
fixtures={}
for mode in ['network-attended','cached-autonomous']:
 files={label:{stream:(s/('interface-artifacts-'+label)/(mode+'.'+stream)).read_bytes() for stream in ['stdout','stderr']} for label in ['baseline','candidate','ui-final']}
 assert all(files[label]==files['baseline'] for label in files)
 json.loads(files['baseline']['stdout'])
 fixtures[mode]={'identical_stdout_and_stderr':True,'stdout_sha256':hashlib.sha256(files['baseline']['stdout']).hexdigest(),'bytes':len(files['baseline']['stdout'])}
checks=[]
for family in comparisons.values():
 for row in family.values():
  checks.append(row['file']['passes_both_caps'])
  if 'total_emitted_code' in row:checks.append(row['total_emitted_code']['passes_both_caps'])
  checks.extend(v['passes_both_caps'] for v in row.get('sections',{}).values())
headroom=proposal['brotli_asset_ceiling_bytes']-reports['ui-final']['wasm-brotli']['bytes']
result={'status':'Measured size qualification only; no retention/accounting decision until remaining performance/memory/dispatch/validation obligations are reviewed.','proposal_sha256':hashlib.sha256((s/'interface-ui-size-proposal.json').read_bytes()).hexdigest(),'section_proposal_sha256':hashlib.sha256((s/'interface-ui-section-proposal.json').read_bytes()).hexdigest(),'fixed_control_records':['interface-fixed-control.json','interface-ui-fixed-control.json'],'comparisons':comparisons,'pre_bits_to_final_production_hash_equality':same_source_production,'canonical_fixture_replay':fixtures,'brotli_asset_headroom_bytes':headroom,'minimum_headroom_bytes':proposal['minimum_brotli_headroom_bytes'],'headroom_passes':headroom>=proposal['minimum_brotli_headroom_bytes'],'all_size_caps_pass':all(checks),'no_cross_artifact_or_section_netting':True,'flash':'Not applicable: no firmware image or embedded asset change. Hosted-asset headroom is not a flash measurement.'}
(out/'report.json').write_text(json.dumps(result,indent=2)+'\n')
for name,row in comparisons['cumulative'].items():print(name,'file',row['file']['delta_bytes'],'code',row.get('total_emitted_code',{}).get('delta_bytes'))
print('all_caps',all(checks),'headroom',headroom,'identical_prebits_production',all(same_source_production.values()))
raise SystemExit(0 if all(checks) and result['headroom_passes'] else 2)
