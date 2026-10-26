from pathlib import Path
import json,subprocess,time
from cost_gate import assert_cost_eligible
raw=Path(__file__).resolve().parent;assert_cost_eligible()
assert json.loads((raw/'latest-expanded-cost-preflight.json').read_text())['passed']
record=raw/f'expanded-native-campaign-{time.time_ns()}';record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes());rows=[]
def execute(label,command):
    print('R19 CAMPAIGN START',label,flush=True);start=time.monotonic()
    # Inner drivers own process limits, pair order, frozen binaries and outputs.
    p=subprocess.run(command,cwd=raw)
    rows.append({'label':label,'command':command,'status':p.returncode,'seconds':time.monotonic()-start})
    (record/'commands.json').write_text(json.dumps(rows,indent=2)+'\n')
    assert p.returncode==0,(record,label)
for scope in ['cost','construction']:
    execute(scope+'-baseline-check',['python',str(raw/f'run_{scope}.py'),'baseline-check'])
    execute(scope+'-calibrate',['python',str(raw/f'calibrate_{scope}.py')])
for purpose in ['pilot','final']:
    for scope in ['cost','construction']:
        execute(scope+'-'+purpose,['python',str(raw/f'run_{scope}.py'),purpose])
        samples=json.loads((raw/f'latest-{scope}-{purpose}.json').read_text())['record']
        execute(scope+'-'+purpose+'-analysis',['python',str(raw/f'analyze_{scope}.py'),samples])
execute('workflow-final',['python',str(raw/'run_workflow.py'),'final'])
for scope in ['cost','construction']:
    execute(scope+'-allocations',['python',str(raw/f'run_{scope}.py'),'allocations'])
execute('cost-completion',['python',str(raw/'run_cost.py'),'completion'])
(raw/'latest-expanded-native-campaign.json').write_text(json.dumps({'record':str(record),'complete':True,'commands':len(rows)},indent=2)+'\n')
print('R19 EXPANDED NATIVE CAMPAIGN COMPLETE',record,flush=True)
