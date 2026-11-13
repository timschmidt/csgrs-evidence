from pathlib import Path
import hashlib,json,re,subprocess
stage=Path(__file__).parent;tree=Path('/mnt/development/csgrs-dynamics-return');main=Path('/mnt/development/csgrs')
assert json.loads((stage/'baseline-build.json').read_text())['returncode']==0
assert not subprocess.check_output(['git','status','--porcelain'],cwd=tree)
original=subprocess.check_output(['git','diff','--cached','--binary'],cwd=main);assert original==(stage/'pending-extraction.patch').read_bytes()
subprocess.run(['git','apply','--index','--',str(stage/'pending-extraction.patch')],cwd=tree,check=True)
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=tree)==original
subprocess.run(['python3','-B',str(stage/'build.py'),'extraction'],check=True)
alias=Path('/tmp/interval-refactor/dynamics-requalification/error-alias-clean.patch').read_bytes();(stage/'error-alias-clean.patch').write_bytes(alias)
subprocess.run(['git','apply','--check','-'],cwd=tree,input=alias,check=True)
subprocess.run(['git','apply','-'],cwd=tree,input=alias,check=True)
subprocess.run(['python3','-B',str(stage/'build.py'),'error-alias-clean'],check=True)
paths=['crates/hyperpath/src/routing.rs']+['crates/hyperpath/src/routing/'+x+'.rs' for x in ['axis_projection','feed','jerk_schedule','lookahead']]
records=[]
for name in paths:
 p=tree/name;s=p.read_text()
 s,count=re.subn(r'(#\[deprecated\([\s\S]*?\)\]\n)(pub fn )',r'\1#[inline(always)]\n\2',s)
 assert count>0,name;p.write_text(s);records.append({'path':name,'forwarding_functions':count})
assert sum(x['forwarding_functions'] for x in records)==15
(stage/'inline-edits.json').write_text(json.dumps(records,indent=2)+'\n')
(stage/'error-alias-forwarders.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=tree))
subprocess.run(['git','diff','--check'],cwd=tree,check=True)
subprocess.run(['python3','-B',str(stage/'build.py'),'error-alias-forwarders'],check=True)
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=main)==original
print('four attributed artifact builds completed',flush=True)
