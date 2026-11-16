from pathlib import Path
import json,subprocess,re
s=Path(__file__).parent;results={}
for variant in ['baseline','candidate']:
 d=s/('artifacts-'+variant);p=d/'certification';sections={}
 raw=subprocess.check_output(['readelf','-SW',str(p)],text=True);(d/'certification.sections').write_text(raw)
 for line in raw.splitlines():
  m=re.match(r'\s*\[\s*\d+\]\s+(\.\S+)\s+\S+\s+[0-9a-fA-F]+\s+[0-9a-fA-F]+\s+([0-9a-fA-F]+)\s+[0-9a-fA-F]+\s+(\S+)\s+\d+\s+\d+\s+\d+\s*$',line)
  if m and 'A' in m[3]:sections[m[1]]={'bytes':int(m[2],16),'executable':'X' in m[3]}
 ranges=[]
 for line in (d/'certification.nm').read_text().splitlines():
  fields=line.split(maxsplit=3)
  if len(fields)==4 and fields[2] in ['T','t']:ranges.append((int(fields[0]),int(fields[0])+int(fields[1])))
 total=end=0
 for a,b in sorted(ranges):
  total+=max(0,b-max(a,end));end=max(end,b)
 results[variant]={'file_bytes':p.stat().st_size,'complete_emitted_code_bytes':sum(x['bytes'] for x in sections.values() if x['executable']),'address_deduplicated_named_code_bytes':total,'allocated_sections':sections}
caps=json.loads((s/'size-screen-proposal.json').read_text())['targets']['hypersolve-certification-x86_64-stable'];comparisons={}
for metric in ['file','complete_emitted_code','address_deduplicated_named_code']:
 a=results['baseline'][metric+'_bytes'];b=results['candidate'][metric+'_bytes'];delta=b-a;pct=100*delta/a
 comparisons[metric]={'baseline_bytes':a,'candidate_bytes':b,'delta_bytes':delta,'delta_percent':pct,'absolute_cap_bytes':caps[metric+'_growth_bytes'],'percentage_cap':caps[metric+'_growth_percent'],'passes':delta<=caps[metric+'_growth_bytes'] and pct<=caps[metric+'_growth_percent']}
out={'artifacts':results,'comparisons':comparisons,'all_screen_caps_pass':all(r['passes'] for r in comparisons.values()),'not_final_cumulative_admission':True}
(s/'size-screen.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(comparisons,indent=2))
