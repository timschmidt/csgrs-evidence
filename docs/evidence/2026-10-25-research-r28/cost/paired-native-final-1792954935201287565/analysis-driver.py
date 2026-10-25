from pathlib import Path
import json,math,re,statistics,sys
import numpy as np
from scipy.stats import t

directory=Path(sys.argv[1]);meta=json.loads((directory/'metadata.json').read_text());assert meta['complete']
(directory/'analysis-driver.py').write_bytes(Path(__file__).read_bytes())
n=meta['pairs'];rows={};latency=[];resources=[];changes=[];peaks={'baseline':0,'candidate':0}
for kind in range(12):
    for policy in ['strict','approximate']:
        for pair in range(n):
            for variant in ['baseline','candidate']:
                prefix=directory/f'pair-{pair:02}/{variant}-{kind:02}-{policy}'
                values=[json.loads(line) for line in prefix.with_suffix('.jsonl').read_text().splitlines()];assert len(values)==8
                assert all(row['certainty']=='Certified' and row['kind']==kind and row['policy']==policy for row in values)
                rows[variant,kind,policy,pair]=values
                stderr=prefix.with_suffix('.stderr').read_text();peak=int(next(line.split(':',1)[1].strip() for line in stderr.splitlines() if 'Maximum resident set size (kbytes)' in line));peaks[variant]=max(peaks[variant],peak)
            keys=['kind','policy','sample','iterations','certainty','expected_outcome','checksum']
            assert [{k:r[k] for k in keys} for r in rows['baseline',kind,policy,pair]]==[{k:r[k] for k in keys} for r in rows['candidate',kind,policy,pair]]
        if meta['mode']=='native' and n>1:
            for phase in ['first','warm']:
                def values(variant):
                    return [rows[variant,kind,policy,pair][0]['ns'] if phase=='first' else statistics.median(row['ns']/row['iterations'] for row in rows[variant,kind,policy,pair][1:]) for pair in range(n)]
                a=values('baseline');b=values('candidate');logs=np.log(np.array(b)/np.array(a));center=float(logs.mean());se=float(logs.std(ddof=1))/math.sqrt(n)
                interval=lambda level:[math.exp(center-float(t.ppf(level,n-1))*se),math.exp(center+float(t.ppf(level,n-1))*se)]
                latency.append({'case':[kind,policy],'phase':phase,'baseline_median_ns':statistics.median(a),'candidate_median_ns':statistics.median(b),'ratio':math.exp(center),'ci95':interval(.975),'simultaneous_ci95':interval(1-.05/(2*48)),'paired_log_sd':float(logs.std(ddof=1)),'baseline_process_ns':a,'candidate_process_ns':b})
        if meta['mode']=='allocations':
            keys=['bytes','calls','live_delta','peak_live_growth']
            seq={}
            for variant in ['baseline','candidate']:
                expected=[{k:r[k] for k in keys} for r in rows[variant,kind,policy,0]]
                stable=all([{k:r[k] for k in keys} for r in rows[variant,kind,policy,pair]]==expected for pair in range(n))
                resources.append({'variant':variant,'case':[kind,policy],'stable':stable,'sequence':expected});seq[variant]=expected
            if seq['baseline']!=seq['candidate']:changes.append({'case':[kind,policy],**seq})
summary={k:meta[k] for k in ['mode','purpose','pairs','batch','total_certified_queries','successful_fit_queries','typed_unsupported_queries','exact_outcome_row_pairs']}
summary['max_process_rss_kib']=peaks
summary['sizes']={r['variant']:{'file_bytes':r['binary']['bytes'],'text_bytes':int(next(line.split()[1] for line in r['binary']['sections'].splitlines() if line.split() and line.split()[0]=='.text')),'sha256':r['binary']['sha256']} for r in meta['builds']}
if latency:
    compact=lambda row:{k:v for k,v in row.items() if not k.endswith('process_ns')}
    targets=[r for r in latency if r['case'][0]<4 and r['phase']=='warm']
    summary.update(protected_metrics=len(latency),literal_nonregression=all(r['simultaneous_ci95'][1]<=1 for r in latency),target_effect=all(r['simultaneous_ci95'][1]<.8 for r in targets),marginal_adverse=[compact(r) for r in latency if r['ci95'][0]>1],simultaneous_adverse=[compact(r) for r in latency if r['simultaneous_ci95'][0]>1])
    (directory/'latency.json').write_text(json.dumps(latency,indent=2)+'\n')
if resources:
    summary.update(resource_sequences_stable=all(r['stable'] for r in resources),changed_resource_cells=len(changes),resource_changes=changes)
    (directory/'resources.json').write_text(json.dumps(resources,indent=2)+'\n')
(directory/'analysis.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps({k:v for k,v in summary.items() if k not in ['marginal_adverse','simultaneous_adverse','resource_changes']},indent=2))
if latency:print('ADVERSE',len(summary['marginal_adverse']),'marginal',len(summary['simultaneous_adverse']),'simultaneous')
