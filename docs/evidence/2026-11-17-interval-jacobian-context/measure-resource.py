from pathlib import Path
import hashlib, json, subprocess, sys, time

s = Path(__file__).parent
features = sys.argv[1]
candidate_label = sys.argv[2] if len(sys.argv) > 2 else 'candidate'
prefix = '' if candidate_label == 'candidate' else candidate_label + '-'
assert features in ['default', 'trace']
lookup = {label: json.loads((s / f'{candidate_label if label == "candidate" else label}-{features}-resource-build.json').read_text()) for label in ['baseline', 'candidate']}
assert lookup['baseline']['lock_sha256'] == lookup['candidate']['lock_sha256']
for row in lookup.values():
    assert hashlib.sha256(Path(row['binary']['path']).read_bytes()).hexdigest() == row['binary']['sha256']
out = s / (prefix + features + '-resource-measurements')
out.mkdir(exist_ok=False)
records = []
start = time.monotonic()
for repetition in range(4):
    for case in range(8):
        for warm in [0, 1]:
            for mode, patterns in [('stack', [165, 90]), ('observe', [165])]:
                for pattern in patterns:
                    order = ['baseline', 'candidate'] if (repetition+case+warm)%2 == 0 else ['candidate', 'baseline']
                    pair = {}
                    for label in order:
                        cmd = [lookup[label]['binary']['path'], str(case), mode, str(warm), str(pattern)]
                        p = subprocess.run(cmd, capture_output=True, text=True, timeout=60)
                        name = f'{repetition}-{case}-{warm}-{mode}-{pattern}-{label}'
                        (out / (name+'.log')).write_text(p.stdout+p.stderr)
                        assert p.returncode == 0, (name, p.returncode, p.stdout, p.stderr)
                        lines = p.stdout.splitlines()
                        row = dict(repetition=repetition,case=case,warm=warm,mode=mode,pattern=pattern,label=label,exit_code=p.returncode)
                        if mode == 'stack':
                            assert len(lines)==1 and lines[0].startswith('STACK ')
                            fields=lines[0].split(' ',5)
                            row['stack_bytes']=int(fields[4]);row['output_bits']=fields[5]
                        else:
                            row['observations']=lines
                        pair[label]=row
                        records.append(row)
                    if mode == 'stack':
                        assert pair['baseline']['output_bits']==pair['candidate']['output_bits']
                    else:
                        assert pair['baseline']['observations']==pair['candidate']['observations'], pair
    (out/'raw.json').write_text(json.dumps(records,indent=2)+'\n')
    print(features,'repetition',repetition,'complete',flush=True)
groups=[]
for case in range(8):
    for warm in [0,1]:
        rows=[x for x in records if (x['case'],x['warm'],x['mode'])==(case,warm,'stack')]
        old=[x['stack_bytes'] for x in rows if x['label']=='baseline'];new=[x['stack_bytes'] for x in rows if x['label']=='candidate'];assert len(old)==len(new)==8
        groups.append(dict(case=case,warm=warm,baseline_max=max(old),candidate_max=max(new),growth=max(new)-max(old)))
result={'candidate_variant':candidate_label,'features':features,'processes':len(records),'allocation_and_cleanup_pairs_identical':64,'output_pairs_identical':192,'trace_pairs_identical':64 if features=='trace' else None,'stack_groups':groups,'all_stack_maxima_nonincreasing':all(x['growth']<=0 for x in groups),'elapsed_execution_seconds':time.monotonic()-start,'scope':'Finite eight-case supported corpus in fresh processes. Raw results, complete output bits, allocation/drop deltas and full traces where enabled; not runtime evidence or universal bounds.'}
(s/(prefix+features+'-resource-comparison.json')).write_text(json.dumps(result,indent=2)+'\n')
print(features,'processes',len(records),'stack nonincreasing',result['all_stack_maxima_nonincreasing'],flush=True)
print([r for r in groups if r['growth']>0],flush=True)
