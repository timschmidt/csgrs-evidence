from pathlib import Path
import collections,gzip,json,re,sys

def parse(path):
    groups=collections.defaultdict(lambda:{'calls':0,'ns':0,'weight_vectors':0,'control_vectors':0})
    stages=collections.defaultdict(lambda:{'calls':0,'ns':0});caches=collections.Counter();shortcuts=collections.Counter();stack=[]
    opening=gzip.open if path.suffix=='.gz' else open
    with opening(path,'rt') as file:
        for line in file:
            if line.startswith('R28_STAGE_BEGIN '):stack.append(line.split()[1])
            elif line.startswith('R28_STAGE_END '):
                _,name,*_=line.split();assert stack.pop()==name
                stages[name]['calls']+=1;stages[name]['ns']+=int(re.search(r'ns=(\d+)',line)[1])
            elif line.startswith('R28_FIT '):
                fields=dict(re.findall(r'(\w+)=([^\s]+)',line))
                key='|'.join([','.join(stack) or 'outside',fields['family'],fields['circle'],fields['outcome']])
                row=groups[key];row['calls']+=1
                for key in ['ns','weight_vectors','control_vectors']:row[key]+=int(fields[key])
            elif line.startswith('R28_CACHE '):
                fields=dict(re.findall(r'(\w+)=([^\s]+)',line));caches[(','.join(stack) or 'outside')+'|'+fields['kind']]+=1
            elif line.startswith('R28_SHORTCUT '):
                fields=dict(re.findall(r'(\w+)=([^\s]+)',line));shortcuts[(','.join(stack) or 'outside')+'|'+fields['family']]+=1
    assert not stack
    return {'fits':dict(groups),'stages':dict(stages),'cache_materializations':dict(caches),'shortcuts':dict(shortcuts)}

directory=Path(sys.argv[1]);report={}
for path in sorted(directory.glob('*.stderr'))+sorted(directory.glob('*.stderr.gz')):
    if path.name.startswith('build.'):continue
    report[path.name.split('.stderr')[0]]=parse(path)
(directory/'route-summary.json').write_text(json.dumps(report,indent=2)+'\n')
(directory/'trace-analysis-driver.py').write_bytes(Path(__file__).read_bytes())
print(json.dumps({name:{'fits':sum(r['calls'] for r in row['fits'].values()),'shortcuts':sum(row['shortcuts'].values()),'weight_vectors':sum(r['weight_vectors'] for r in row['fits'].values()),'control_vectors':sum(r['control_vectors'] for r in row['fits'].values())} for name,row in report.items()},indent=2))
