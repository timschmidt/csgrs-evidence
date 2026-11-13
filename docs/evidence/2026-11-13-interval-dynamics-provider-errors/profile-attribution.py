from pathlib import Path
from collections import defaultdict
import re,json
p=Path(__file__).parent

def parse(path):
    names={};counts=defaultdict(int);current=None;callee=False
    for line in path.read_text().splitlines():
        if line.startswith(('fn=','cfn=')):
            match=re.fullmatch(r'(c?fn)=\((\d+)\)(?: (.*))?',line)
            assert match,line
            kind,key,name=match.groups()
            if name is not None:names[key]=name
            if kind=='fn':current=key;callee=False
        elif line.startswith('calls='):callee=True
        elif re.match(r'^[+*\-0-9]',line):
            fields=line.split()
            if len(fields)==2:
                if not callee and current is not None:counts[current]+=int(fields[1])
                callee=False
    result=defaultdict(int)
    for key,value in counts.items():result[names[key]]+=value
    summary=int(re.search(r'^summary: (\d+)',path.read_text(),re.M)[1]);assert sum(result.values())==summary,(sum(result.values()),summary)
    return dict(result)
rows=[]
for case in ['corner_lookahead_feed_limit_certification','symmetric_jerk_limited_feed_time','mixed_path_symmetric_jerk_limited_feed_time']:
    values={v:parse(p/f'callgrind-{case}-{v}.out') for v in ['baseline','extraction','provider-errors']}
    names=set().union(*(v.keys() for v in values.values()))
    changes=[]
    for name in sorted(names):
        counts={v:values[v].get(name,0) for v in values}
        if len(set(counts.values()))>1:changes.append(dict(function=name,self_instructions=counts,provider_delta=counts['provider-errors']-counts['baseline']))
    rows.append(dict(case=case,changes=sorted(changes,key=lambda x:abs(x['provider_delta']),reverse=True)))
(p/'profile-attribution.json').write_text(json.dumps(rows,indent=2)+'\n')
for row in rows:
    print(row['case'])
    for change in row['changes'][:12]:print(change)
