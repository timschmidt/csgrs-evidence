from pathlib import Path
import json,subprocess,time
raw=Path(__file__).resolve().parent
validation=json.loads((raw/'latest-downstream-validation.json').read_text());assert validation['failed'] is None
record=raw/f'expanded-matched-builds-{time.time_ns()}';record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes());rows=[]
try:
    for variant in ['candidate','baseline']:
        subprocess.run(['python',str(raw/'set_variant.py'),variant],check=True)
        for script,args in [('build_cost.py',['native']),('build_cost.py',['allocations']),('build_construction.py',['native']),('build_construction.py',['allocations']),('build_workflow.py',[])]:
            cmd=['python',str(raw/script),variant,*args];start=time.monotonic()
            print('R19 EXPANDED BUILD START',script,variant,args,flush=True)
            p=subprocess.run(cmd,cwd=raw)
            rows.append({'command':cmd,'status':p.returncode,'seconds':time.monotonic()-start})
            (record/'commands.json').write_text(json.dumps(rows,indent=2)+'\n')
            assert p.returncode==0,(record,cmd)
finally:
    subprocess.run(['python',str(raw/'set_variant.py'),'candidate'],check=True)
(raw/'latest-expanded-matched-builds.json').write_text(json.dumps({'record':str(record),'complete':True,'commands':len(rows)},indent=2)+'\n')
print('R19 EXPANDED MATCHED BUILDS COMPLETE',record,flush=True)
