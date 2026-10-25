from pathlib import Path
import sys, json, statistics, math, hashlib, collections
import numpy as np
from scipy.stats import t

d=Path(sys.argv[1]);meta=json.loads((d/'metadata.json').read_text())
assert meta.get('complete') is True
(d/'analysis-driver.py').write_bytes(Path(__file__).read_bytes())
mode=meta['mode'];n=meta['pairs'];cases=[(k,direction,policy,lane) for k in range(7) for direction in ['forward','reverse'] for policy in ['strict','approximate'] for lane in ['retained','workflow']]
rows={};artifacts=0;count=0;resource_stability=[];resource_differences=[];latency=[];max_rss={v:0 for v in ['baseline','candidate']}
resource_keys=['bytes','calls','peak_live_growth','result_live_delta','continuation_bytes','continuation_calls','retained_after_drop','total_bytes','total_calls','fixture_retained_after_drop']
def estimate(a,b,family):
    logs=np.log(np.array(b,dtype=float)/np.array(a,dtype=float));mean=float(logs.mean());se=float(logs.std(ddof=1))/math.sqrt(len(logs))
    marginal=float(t.ppf(0.975,len(logs)-1))*se
    simultaneous=float(t.ppf(1-0.05/(2*family),len(logs)-1))*se
    return {'baseline_median_ns':statistics.median(a),'candidate_median_ns':statistics.median(b),'geometric_paired_ratio':math.exp(mean),'ci95':[math.exp(mean-marginal),math.exp(mean+marginal)],'simultaneous_ci95':[math.exp(mean-simultaneous),math.exp(mean+simultaneous)],'baseline_process_values_ns':a,'candidate_process_values_ns':b}
for case in cases:
    kind,direction,policy,lane=case;key=f'{kind:02}-{direction}-{policy}-{lane}'
    for pair in range(n):
        directory=d/f'pair-{pair:02}'
        for variant in ['baseline','candidate']:
            prefix=directory/f'{variant}-{key}'
            values=[json.loads(l) for l in prefix.with_suffix('.jsonl').read_text().splitlines()]
            assert len(values)==8 and all(r['sample']==i and r['certainty']=='Certified' and r['status']=='complete' for i,r in enumerate(values))
            exact=prefix.with_suffix('.artifact.json').read_bytes()
            checksum=14695981039346656037
            for byte in exact:checksum=((checksum^byte)*1099511628211)&((1<<64)-1)
            assert all(r['checksum']==str(checksum) and r['output_size']==len(exact) for r in values)
            rows[variant,case,pair]=values;count+=len(values)
            time=prefix.with_suffix('.time').read_text()
            peak=int(next(l.split(':',1)[1].strip() for l in time.splitlines() if 'Maximum resident set size (kbytes)' in l))
            max_rss[variant]=max(max_rss[variant],peak)
        assert (directory/f'baseline-{key}.artifact.json').read_bytes()==(directory/f'candidate-{key}.artifact.json').read_bytes()
        artifacts+=1
    for variant in ['baseline','candidate']:
        assert all((d/f'pair-{pair:02}/{variant}-{key}.artifact.json').read_bytes()==(d/f'pair-00/{variant}-{key}.artifact.json').read_bytes() for pair in range(n))
    if mode=='allocations':
        for variant in ['baseline','candidate']:
            expected=[{field:r[field] for field in resource_keys} for r in rows[variant,case,0]]
            stable=all([{field:r[field] for field in resource_keys} for r in rows[variant,case,pair]]==expected for pair in range(n))
            resource_stability.append({'variant':variant,'case':case,'stable':stable,'sequence':expected})
        a=rows['baseline',case,0];b=rows['candidate',case,0]
        diff=[{'sample':i,'differences':{field:[x[field],y[field]] for field in resource_keys if x[field]!=y[field]}} for i,(x,y) in enumerate(zip(a,b))]
        diff=[r for r in diff if r['differences']]
        if diff:resource_differences.append({'case':case,'samples':diff})
    else:
        for phase in ['cold','warm']:
            for metric in ['total_ns','ns','continuation_ns']:
                def values(variant):
                    return [rows[variant,case,pair][0][metric] if phase=='cold' else statistics.median(r[metric] for r in rows[variant,case,pair][1:]) for pair in range(n)]
                result=estimate(values('baseline'),values('candidate'),112)
                latency.append({'case':case,'phase':phase,'metric':metric,'protected':metric=='total_ns',**result})
sizes={}
for build in meta['builds']:
    sections=build['binary']['sections'];text_bytes=int(next(l.split()[1] for l in sections.splitlines() if l.split() and l.split()[0]=='.text'))
    sizes[build['variant']]={'file_bytes':build['binary']['bytes'],'text_bytes':text_bytes,'sha256':build['binary']['sha256']}
summary={'mode':mode,'complete_certified_queries':count,'exact_artifact_pairs':artifacts,'cross_process_artifacts_identical':True,'size_from_this_run_build_metadata':sizes,'max_process_rss_kib':max_rss}
if mode=='allocations':
    summary.update(resource_sequences_stable=all(r['stable'] for r in resource_stability),different_resource_cells=len(resource_differences),resource_differences=resource_differences)
    (d/'resource-sequences.json').write_text(json.dumps(resource_stability,indent=2)+'\n')
else:
    protected=[r for r in latency if r['protected']]
    summary.update(protected_metric_count=len(protected),literal_simultaneous_nonregression=all(r['simultaneous_ci95'][1]<=1 for r in protected),marginal_adverse=[r for r in protected if r['ci95'][0]>1],simultaneous_adverse=[r for r in protected if r['simultaneous_ci95'][0]>1])
    (d/'latency.json').write_text(json.dumps(latency,indent=2)+'\n')
(d/'analysis.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps({k:v for k,v in summary.items() if k not in ['resource_differences','marginal_adverse','simultaneous_adverse']},indent=2))
if mode=='native':print('marginal adverse',len(summary['marginal_adverse']),'simultaneous adverse',len(summary['simultaneous_adverse']))
