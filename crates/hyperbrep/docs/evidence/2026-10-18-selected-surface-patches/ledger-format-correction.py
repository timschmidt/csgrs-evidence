"""Replace only the HyperBRep JSON value while retaining surrounding source bytes."""
import json,re,subprocess
from pathlib import Path
from run import ROOT

def update_block(path,new_value):
    relative=str(path.relative_to(ROOT))
    original=subprocess.check_output(['git','show','HEAD:'+relative],cwd=ROOT,text=True)
    matches=list(re.finditer(r'(?m)^([ ]*)"hyperbrep":\s*',original))
    assert len(matches)==1,len(matches)
    match=matches[0];start=match.end()
    old_value,consumed=json.JSONDecoder().raw_decode(original[start:])
    data=json.loads(original)
    assert old_value==data['current_work']['hyperbrep']
    indent=match[1]
    replacement=json.dumps(new_value,indent=2).replace('\n','\n'+indent)
    result=original[:start]+replacement+original[start+consumed:]
    expected=data;expected['current_work']['hyperbrep']=new_value
    assert json.loads(result)==expected
    path.write_text(result)
    return dict(prefix_bytes=len(original[:start].encode()),suffix_bytes=len(original[start+consumed:].encode()),scope='Only the current_work.hyperbrep value changed; all surrounding bytes retained from HEAD.')

if __name__=='__main__':
    path=ROOT/'docs/properties-status.json'
    data=json.loads(path.read_text())
    print(json.dumps(update_block(path,data['current_work']['hyperbrep']),indent=2))
