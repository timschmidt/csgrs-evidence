from pathlib import Path
import json,re,hashlib,collections
s=Path(__file__).parent
baseline=[l for l in (s/'baseline-artifacts.log').read_text().splitlines() if re.match(r'^(PREP\d|PREP_TRACE\d|PREP_WORK\d|REPORT\d|TRACE\d|WORK\d)=',l)]
candidate=[l for l in (s/'candidate-correctness.log').read_text().splitlines() if re.match(r'^(PREP\d|PREP_TRACE\d|PREP_WORK\d|REPORT\d|TRACE\d|WORK\d)=',l)]
assert len(baseline)==18 and len(candidate)==36
assert collections.Counter(candidate)==collections.Counter(baseline+baseline)
blob=('\n'.join(baseline)+'\n').encode();(s/'baseline-full-artifacts.txt').write_bytes(blob)
correctness={'full_artifacts_equal':True,'baseline_rows':18,'candidate_observers':2,'bytes':len(blob),'sha256':hashlib.sha256(blob).hexdigest(),'test_summaries':[l for l in (s/'candidate-correctness.log').read_text().splitlines() if l.startswith('test result:')]}
(s/'correctness-comparison.json').write_text(json.dumps(correctness,indent=2)+'\n')
key=lambda x:(x['case'],x['mode'],x['order'],x['warmup_16'],x['repeat'])
data={label:{key(x):x for x in json.loads((s/(label+'-allocation/samples.json')).read_text())} for label in ['baseline','candidate']};assert data['baseline'].keys()==data['candidate'].keys();groups=collections.defaultdict(list);deltas=[]
for k,b in data['baseline'].items():
 c=data['candidate'][k];delta={phase:{metric:c[phase][metric]-b[phase][metric] for metric in b[phase]} for phase in ['before','retained','after']};row={'case':k[0],'mode':k[1],'order':k[2],'warmup_16':k[3],'repeat':k[4],'delta':delta};deltas.append(row);groups[k[:3]].append(row)
summary=[]
for group,rows in sorted(groups.items()):
 entry={'case':group[0],'mode':group[1],'order':group[2],'observations':len(rows),'before_equal':all(all(v==0 for v in row['delta']['before'].values()) for row in rows),'cleanup_live_equal':all(row['delta']['after']['live_bytes']==0 for row in rows),'retained_live_delta_range':[min(row['delta']['retained']['live_bytes'] for row in rows),max(row['delta']['retained']['live_bytes'] for row in rows)],'peak_delta_range':[min(row['delta']['retained']['peak_live_bytes'] for row in rows),max(row['delta']['retained']['peak_live_bytes'] for row in rows)],'allocation_count_delta_range':[min(row['delta']['retained']['allocation_count'] for row in rows),max(row['delta']['retained']['allocation_count'] for row in rows)]};summary.append(entry)
(s/'allocation-deltas.json').write_text(json.dumps(deltas,indent=2)+'\n')
result={'matched_observations':len(deltas),'fresh_processes':72,'scope':'Requested Rust allocation payload during complete ordinary preparation, restriction, or combined preparation+restriction, including retained output then destruction. Source field excluded; preexisting high-order program also excluded in restriction-only. Tracer headers, C heap, allocator overhead and process RSS excluded. Warm=false first observation has no prewarm; later repetitions share that process cache. Warm=true prewarms16times. No timing or total-memory bound claim.','groups':summary,'retained_regressions':sum(x['delta']['retained']['live_bytes']>0 for x in deltas),'peak_regressions':sum(x['delta']['retained']['peak_live_bytes']>0 for x in deltas)}
(s/'allocation-comparison.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(correctness,indent=2));print(json.dumps(result,indent=2))
