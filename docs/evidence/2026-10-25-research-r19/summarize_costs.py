from pathlib import Path
import hashlib,json,statistics,subprocess,time
from runtime_manifest import runtime_sources
raw=Path(__file__).resolve().parent
assert json.loads((raw/'latest-expanded-native-campaign.json').read_text())['complete']
record=raw/f'expanded-cost-summary-{time.time_ns()}';record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
families={}
for scope,count in [('cost',90),('construction',24),('workflow',4)]:
    samples=Path(json.loads((raw/f'latest-{scope}-final.json').read_text())['record'])
    meta=json.loads((samples/'metadata.json').read_text());analysis=json.loads((samples/'analysis.json').read_text())
    assert meta['complete'] and meta['family_metrics']==118 and len(analysis['metrics'])==count
    families[scope]={'record':str(samples),'metrics':count,
                    **{k:analysis[k] for k in ['upper_exceeds_one','marginal_adverse','simultaneous_adverse','literal_performance_gate_pass']}}
combined={'families':families,'metrics':118,
          'upper_exceeds_one':sum(v['upper_exceeds_one'] for v in families.values()),
          'marginal_adverse':sum(v['marginal_adverse'] for v in families.values()),
          'simultaneous_adverse':sum(v['simultaneous_adverse'] for v in families.values()),
          'performance_only_gate_pass':all(v['literal_performance_gate_pass'] for v in families.values()),
          'scope':'All 118 predeclared protected latency metrics; completeness gains are separately counted, never error/success speedup ratios. Final primary adoption checks still required.'}
(record/'latency-summary.json').write_text(json.dumps(combined,indent=2)+'\n')
allocation=[]
for scope in ['cost','construction']:
    samples=Path(json.loads((raw/f'latest-{scope}-allocations.json').read_text())['record'])
    meta=json.loads((samples/'metadata.json').read_text());assert meta['complete'] and meta['pairs']==5
    cells=[(k,p) for k in range(10) for p in ['json','cbor','value']] if scope=='cost' else [(k,None) for k in range(8)]
    for kind,path in cells:
        cell=f'{kind}-{path}' if path else str(kind)
        rows={v:[r for pair in range(5) for line in (samples/f'pair-{pair:02}'/f'{v}-{cell}.jsonl').read_text().splitlines() if (r:=json.loads(line))] for v in ['baseline','candidate']}
        for phase in ['first','warm']:
            values={v:[r for r in rows[v] if r['phase']==phase] for v in rows}
            for field in ['bytes','calls','live_delta','peak_live_growth']:
                requested=field in ['bytes','calls']
                data={v:[r[field]/r['iterations'] if requested else r[field] for r in values[v]] for v in values}
                allocation.append({'scope':scope,'record':str(samples),'kind':kind,'path':path,'phase':phase,'field':field,
                    'unit':'per result' if requested else 'per retained result batch',
                    'iterations':1 if phase=='first' else 8,
                    'baseline_median':statistics.median(data['baseline']),'candidate_median':statistics.median(data['candidate']),
                    'median_delta':statistics.median(data['candidate'])-statistics.median(data['baseline']),
                    'baseline_range':[min(data['baseline']),max(data['baseline'])],
                    'candidate_range':[min(data['candidate']),max(data['candidate'])]})
(record/'allocation-summary.json').write_text(json.dumps({'rows':allocation,'scope':'Five independent counting-System pairs; full requested realloc traffic. Vector storage and operand preparation are outside counters. Warm live/peak values describe eight retained results together, not an individual-operation heap bound.'},indent=2)+'\n')
sizes=[]
for scope in ['cost','construction','workflow']:
    entries={}
    for variant in ['baseline','candidate']:
        name=f'latest-{scope}-build-{variant}'+('' if scope=='workflow' else '-native')+'.json'
        build=json.loads((raw/name).read_text());binary=Path(build['binary'])
        assert hashlib.sha256(binary.read_bytes()).hexdigest()==build['sha256']
        output=subprocess.check_output(['size',str(binary)],text=True)
        (record/f'{scope}-{variant}-size.txt').write_text(output)
        cols=output.splitlines()[1].split();entries[variant]={'bytes':binary.stat().st_size,'text':int(cols[0]),'data':int(cols[1]),'bss':int(cols[2]),'sha256':build['sha256'],'build':build['record']}
    sizes.append({'scope':scope,'variants':entries,'delta':{k:entries['candidate'][k]-entries['baseline'][k] for k in ['bytes','text','data','bss']}})
(record/'binary-size.json').write_text(json.dumps({'rows':sizes,'scope':'Matched release native standalone executables; does not establish a deployed WASM or package size.'},indent=2)+'\n')
sources=[]
for name,entry in runtime_sources('candidate').items():
    base=runtime_sources('baseline')[name]
    values={v:{'bytes':Path(e['source']).stat().st_size,'lines':len(Path(e['source']).read_text().splitlines()),'sha256':e['sha256']} for v,e in [('baseline',base),('candidate',entry)]}
    sources.append({'path':name,'variants':values,'delta':{k:values['candidate'][k]-values['baseline'][k] for k in ['bytes','lines']}})
(record/'runtime-source-size.json').write_text(json.dumps(sources,indent=2)+'\n')
(raw/'latest-expanded-cost-summary.json').write_text(json.dumps({'record':str(record),'latency':combined},indent=2)+'\n')
print(json.dumps(combined,indent=2));print('R19 COST SUMMARY',record,flush=True)
