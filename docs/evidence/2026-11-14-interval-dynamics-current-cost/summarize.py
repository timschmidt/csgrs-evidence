from pathlib import Path
import json

s = Path(__file__).parent
profiles = json.loads((s/'all-profile-comparison.json').read_text())
wide = json.loads((s/'wide-comparison.json').read_text())
repeat = json.loads((s/'repeat-comparison.json').read_text())
assert len(profiles) == len(wide) == 194 and len(repeat) == 6
assert {r['case'] for r in profiles} == {r['case'] for r in wide}
counts = {}
for label, key in [('extraction','extraction_delta'),('provider-control','provider_delta')]:
    counts[label] = dict(increased=sum(r[key]>0 for r in profiles),
                         decreased=sum(r[key]<0 for r in profiles),
                         unchanged=sum(r[key]==0 for r in profiles),
                         broad_adverse_screen=sum(r[label]['adverse_separated'] for r in wide),
                         selected_repeat_adverse=sum(r[label]['adverse_separated'] for r in repeat))
selected = []
for r in repeat:
    profile = next(p for p in profiles if p['case']==r['case'])
    selected.append(dict(case=r['case'], timing={v:r[v] for v in counts}, instructions=profile['instructions']))
largest = sorted(profiles, key=lambda r:r['provider_delta']/r['instructions']['baseline'], reverse=True)
summary = dict(counts=counts, selected_repeats=selected,
               largest_provider_instruction_increases=[{k:v for k,v in r.items() if k!='attribution_changes'} for r in largest[:10]],
               scope='Single instrumented 32-callback observation per variant/case, with warmed full-result destruction. These are instruction observations, not wall-time or hardware-cause measurements. Symbol-level attribution may combine generic instantiations. Six fixed longer repeats are not confirmation of every broad-screen flag. No full admission claimed.')
(s/'SUMMARY.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(summary,indent=2),flush=True)
