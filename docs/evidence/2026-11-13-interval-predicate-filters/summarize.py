from pathlib import Path
import collections,json,re,statistics
s=Path('/tmp/interval-refactor/predicate-filters')
times=collections.defaultdict(lambda:collections.defaultdict(list));rows={}
for i,label in [(1,'candidate-cost'),(2,'cost-probe'),(3,'cost-probe'),(4,'candidate-cost')]:
    lines=(s/f'matched-{i}-{label}.log').read_text().splitlines()
    rows[i]=[l for l in lines if l.startswith('ROW|')]
    for line in lines:
        p=line.split('|')
        if p[0]=='TIME' and p[3]=='0':
            times[tuple(p[1:3]+p[4:5])][label].append(int(p[7])/int(p[6]))
assert rows[1]==rows[4] and rows[2]==rows[3] and len(rows[1])==18
results=[]
for key,t in times.items():
    c=t['candidate-cost'];b=t['cost-probe'];assert len(c)==len(b)==10
    results.append(dict(case=key[0],policy=key[1],mode=key[2],baseline_ns=b,candidate_ns=c,median_ratio=statistics.median(c)/statistics.median(b),candidate_min_exceeds_baseline_max=min(c)>max(b)))
(s/'comparison.json').write_text(json.dumps(dict(results=results,changed_receipts=[dict(candidate=c,baseline=b) for c,b in zip(rows[1],rows[2]) if c!=b]),indent=2)+'\n')
initial=collections.defaultdict(list)
for line in (s/'cost-probe-initial.log').read_text().splitlines():
    p=line.split('|')
    if p[0]=='TIME':initial[tuple(p[1:5])].append(int(p[7])/int(p[6]))
out=[]
for (name,policy,method,mode),samples in initial.items():
    if method!='0':out.append(dict(case=name,policy=policy,precision=-16 if method=='1' else -64,mode=mode,baseline_ns=initial[(name,policy,'0',mode)],candidate_ns=samples,median_ratio=statistics.median(samples)/statistics.median(initial[(name,policy,'0',mode)])))
(s/'initial-coordinate-comparison.json').write_text(json.dumps(out,indent=2)+'\n')
tests={}
for name in ['baseline-owner','candidate-owner','owner','default','retained-frontier']:
    path=s/f'{name}.log'
    if path.exists():
        counts=[int(x) for x in re.findall(r'(\d+) passed; 0 failed;',path.read_text())]
        tests[name]=dict(raw_including_replay_children=sum(counts),binary_counts=counts)
(s/'test-summary.json').write_text(json.dumps(tests,indent=2)+'\n')
print('matched cost rows',len(results),'receipt changes',sum(c!=b for c,b in zip(rows[1],rows[2])))
print({k:v['raw_including_replay_children'] for k,v in tests.items()})
