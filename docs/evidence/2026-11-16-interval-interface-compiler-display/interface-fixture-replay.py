from pathlib import Path
import hashlib,json,subprocess
s=Path(__file__).parent
binaries={'baseline':s/'interface-artifacts-baseline/fixture-driver','candidate':Path('/mnt/development/.interval-refactor-build/coordinated-ci/alumina-interface-repair/debug/alumina-cam-fixture')}
valid='0123456789abcdef0123456789abcdef'
cases=[
 ('default-attended',['--network-policy','network-attended'],None),
 ('default-cached',['--network-policy','cached-autonomous'],None),
 ('lowercase',['--device-id',valid],None),
 ('uppercase',['--device-id',valid.upper()],None),
 ('empty',['--device-id',''],'--device-id must contain exactly 32 hexadecimal digits'),
 ('short',['--device-id','00'],'--device-id must contain exactly 32 hexadecimal digits'),
 ('zero',['--device-id','0'*32],'--device-id may not use the all-zero sentinel'),
 ('invalid-high',['--device-id','g'+'0'*31],'--device-id contains a non-hexadecimal digit'),
 ('invalid-low',['--device-id','0'*31+'g'],'--device-id contains a non-hexadecimal digit'),
 ('duplicate',['--device-id',valid,'--device-id',valid],'--device-id values must be unique'),
]
out=s/'interface-fixture-replay';out.mkdir();report=[];valid_outputs={}
for name,args,error in cases:
 results={}
 for label,binary in binaries.items():
  r=subprocess.run([str(binary),*args],capture_output=True,timeout=30)
  (out/(name+'.'+label+'.stdout')).write_bytes(r.stdout)
  (out/(name+'.'+label+'.stderr')).write_bytes(r.stderr)
  if error is None:
   assert r.returncode==0 and not r.stderr,(name,label,r.stderr)
   json.loads(r.stdout)
  else:
   assert r.returncode==1 and not r.stdout,(name,label,r.returncode)
   assert r.stderr.decode().strip()=='Error: '+json.dumps(error),(name,label,r.stderr)
  results[label]=r
 assert results['baseline'].returncode==results['candidate'].returncode
 assert results['baseline'].stdout==results['candidate'].stdout
 assert results['baseline'].stderr==results['candidate'].stderr
 if error is None:valid_outputs[name]=results['candidate'].stdout
 report.append({'case':name,'arguments':args,'exit_code':results['candidate'].returncode,'exact_stdout_equal':True,'exact_stderr_equal':True,'expected_error':error,'stdout_sha256':hashlib.sha256(results['candidate'].stdout).hexdigest()})
 (out/'result.json').write_text(json.dumps(report,indent=2)+'\n')
assert valid_outputs['lowercase']==valid_outputs['uppercase']
print('All10fixture input cases agree exactly; all6rejection cases match their independent error expectations.')
