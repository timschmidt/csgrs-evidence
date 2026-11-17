from pathlib import Path
import hashlib,json,re
s=Path(__file__).parent;old=Path('/tmp/interval-refactor/solver-combined-admission/chain-resource/fixture.rs').read_text();new=(s/'consumer/fixture.rs').read_text()
def normalize(text):
 out=[];quoted=False;escaped=False
 for c in text:
  if quoted:
   out.append(c)
   if escaped:escaped=False
   elif c=='\\':escaped=True
   elif c=='"':quoted=False
  elif c=='"':quoted=True;out.append(c)
  elif not c.isspace():out.append(c)
 return ''.join(out)
def assertions(text):
 out=[]
 for m in re.finditer(r'\bassert(?:_eq|_ne)?!\s*\(',text):
  depth=1;i=m.end();quoted=escaped=False
  while depth:
   c=text[i];i+=1
   if quoted:
    if escaped:escaped=False
    elif c=='\\':escaped=True
    elif c=='"':quoted=False
   elif c=='"':quoted=True
   elif c=='(':depth+=1
   elif c==')':depth-=1
  out.append(normalize(text[m.start():i]))
 return out
old_asserts=assertions(old);new_asserts=assertions(new);cursor=0
for item in old_asserts:
 while cursor<len(new_asserts) and new_asserts[cursor]!=item:cursor+=1
 assert cursor<len(new_asserts),item
 cursor+=1
assert old[old.index('pub fn fixture'):old.index('#[derive(Debug)]')]==new[new.index('pub fn fixture'):new.index('#[derive(Debug)]')]
old_fields=old[old.index('pub struct ChainOutput'):old.index('pub fn operation')]
new_fields=new[new.index('pub struct ChainOutput'):new.index('fn residual_diagnostics')]
fields=re.findall(r'^    ([a-z_]+): (.*),$',old_fields,re.M)
for name,kind in fields:assert normalize(name+':'+kind+',') in normalize(new_fields)
calls=['finite_difference_jacobian','evaluate_residuals','solve_damped_normal','certify_candidate_domains','certify_univariate_quadratic_alpha','certify_candidate']
pattern=r'\b('+'|'.join(calls)+r')\('
a=re.findall(pattern,old[old.index('pub fn operation'):old.index('pub fn validate')]);b=re.findall(pattern,new[new.index('pub fn operation'):new.index('pub fn validate')]);assert a==b
for name,p in json.loads((s/'monitor-provenance.json').read_text()).items():assert (s/'consumer'/name).read_bytes()==Path(p['source']).read_bytes() and hashlib.sha256((s/'consumer'/name).read_bytes()).hexdigest()==p['sha256']
result=dict(original_assertions=len(old_asserts),extended_assertions=len(new_asserts),all_original_assertions_preserved_in_order=True,original_input_construction_byte_identical=True,original_output_fields=len(fields),all_original_output_fields_retained=True,original_operation_call_sequence=a,original_operation_call_order_preserved=True,unchanged_monitors_and_runners=5,original_fixture_sha256=hashlib.sha256(old.encode()).hexdigest(),extended_fixture_sha256=hashlib.sha256(new.encode()).hexdigest(),scope='Static source checks plus reviewed additive diff; executable controls and full cross-revision report/trace comparisons remain required.')
(s/'fixture-verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
