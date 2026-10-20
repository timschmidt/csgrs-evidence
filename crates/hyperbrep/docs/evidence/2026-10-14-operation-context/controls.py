from pathlib import Path
import difflib
import hashlib
import json
import subprocess
root=Path('/mnt/development/csgrs')
out=Path('/tmp/hyperbrep-context-controls')
out.mkdir(exist_ok=False)
source=root/'crates/hyperbrep/src/context.rs'
original=source.read_text()
needle='with_budget(self.budget, || strict(evaluate))'
assert original.count(needle)==1
controls=[
 ('bypass-budget','with_budget(WorkBudget { refinements: usize::MAX, promotions: usize::MAX }, || strict(evaluate))','brep_parameter_location_retries_after_resource_exhaustion'),
 ('ambient-policy','with_budget(self.budget, evaluate)','explicit_context_suspends_and_restores_an_ambient_approximation'),
]
results=[]
try:
    for name,replacement,test in controls:
        modified=original.replace(needle,replacement)
        source.write_text(modified)
        path=str(source.relative_to(root))
        (out/(name+'.patch')).write_text(''.join(difflib.unified_diff(original.splitlines(keepends=True),modified.splitlines(keepends=True),fromfile='a/'+path,tofile='b/'+path,n=0)))
        args=['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--test','work_budget',test,'--','--nocapture']
        with (out/(name+'.log')).open('w') as log:
            result=subprocess.run(args,cwd=root,stdout=log,stderr=subprocess.STDOUT)
        output=(out/(name+'.log')).read_text()
        assert result.returncode==101 and 'test result: FAILED. 0 passed; 1 failed;' in output,output
        print(name+': focused assertion rejected mutant',flush=True)
        results.append({'name':name,'args':args,'exit_code':result.returncode,'patch':name+'.patch','log':name+'.log','source':path,'retained_source_sha256':hashlib.sha256(original.encode()).hexdigest()})
finally:
    source.write_text(original)
(out/'controls.json').write_text(json.dumps(results,indent=2)+'\n')
