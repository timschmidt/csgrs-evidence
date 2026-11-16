from pathlib import Path
import hashlib,json
s=Path(__file__).parent;out=s/'interface-core-budget'
d=json.loads((out/'result.json').read_text());assert d['candidate_restored'] and set(d['variants'])=={'fixed','previous','candidate'}
for label,item in d['variants'].items():
 raw=(out/label/'test-binary').read_bytes();assert len(raw)==item['bytes'] and hashlib.sha256(raw).hexdigest()==item['sha256']
results={};checks=[]
def compare(a,b,kind,family):
 caps=d['caps'][kind];absolute=caps[family+'_bytes'];percentage=caps[family+'_percent'];delta=b-a
 result={'baseline':a,'candidate':b,'delta_bytes':delta,'delta_percent':delta*100/a if a else None,'absolute_cap_bytes':absolute,'percentage_cap':percentage,'passes_both_caps':delta<=absolute and (delta<=0 or (a>0 and delta*100<=a*percentage)),'remaining_absolute_bytes':absolute-max(0,delta)}
 checks.append(result['passes_both_caps']);return result
for family,baseline in [('incremental','previous'),('cumulative','fixed')]:
 a=d['variants'][baseline];b=d['variants']['candidate']
 row={'file':compare(a['bytes'],b['bytes'],'file',family),'text':compare(a['text_bytes'],b['text_bytes'],'text',family),'allocated_sections':{}}
 asec=a['allocated_sections'];bsec=b['allocated_sections']
 for name in sorted(asec.keys()|bsec.keys()):
  av=asec.get(name,{'bytes':0});bv=bsec.get(name,{'bytes':0})
  executable='X' in (av.get('flags','')+bv.get('flags',''))
  row['allocated_sections'][name]=compare(av['bytes'],bv['bytes'],'text' if executable else 'file',family)
 results[family]=row
result={'scope':d['scope'],'status':'Matched Rust1.95 cumulative and incremental size evidence only; no new account or retention until other gates pass.','existing_account':d['existing_account'],'caps_unchanged':True,'comparisons':results,'all_caps_pass':all(checks),'prior_retained_growth_in_this_layout':{'file_bytes':d['variants']['previous']['bytes']-d['variants']['fixed']['bytes'],'text_bytes':d['variants']['previous']['text_bytes']-d['variants']['fixed']['text_bytes']},'source_variants':{label:{key:value for key,value in item.items() if key!='dependency_test_flags'} for label,item in d['variants'].items()},'no_cross_artifact_or_section_netting':True}
(out/'comparison.json').write_text(json.dumps(result,indent=2)+'\n')
for family,row in results.items():
 print(family,'file',row['file']['delta_bytes'],'text',row['text']['delta_bytes'])
 for name,metric in row['allocated_sections'].items():
  if not metric['passes_both_caps']:print('CAP FAILURE',family,name,metric)
print('all_caps_pass',all(checks),'prior_retained_growth',result['prior_retained_growth_in_this_layout'])
raise SystemExit(0 if all(checks) else 2)
