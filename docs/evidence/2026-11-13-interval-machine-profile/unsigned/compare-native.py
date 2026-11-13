from pathlib import Path
import subprocess,hashlib,json,shutil
p=Path(__file__).parent
bins=Path('/tmp/interval-refactor/machine-profile-binaries')
src=Path('/tmp/interval-refactor/machine-profile-cost-target/release/machine-profile-probe')
candidate=bins/'unsigned-candidate-profile'
shutil.copy2(src,candidate)
base=bins/'final-baseline-profile'
rows={}
for name,binary in [('baseline',base),('candidate',candidate)]:
 q=subprocess.run([str(binary)],capture_output=True)
 (p/(name+'-profile-values.log')).write_bytes(q.stdout)
 (p/(name+'-profile-values.stderr')).write_bytes(q.stderr)
 assert q.returncode==0
 rows[name]={'bytes':binary.stat().st_size,'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'command':[str(binary)],'returncode':q.returncode}
a=p.joinpath('baseline-profile-values.log').read_bytes();b=p.joinpath('candidate-profile-values.log').read_bytes()
rows['full_transcript_equal']=a==b
rows['profile_results']=sum(x.startswith(b'RESULT ') for x in a.splitlines())
rows['full_identities']=sum(x.startswith(b'IDENTITY ') for x in a.splitlines())
rows['displayed_allocation_rows']=sum(x.startswith(b'| ') for x in a.splitlines())
rows['size_delta']=rows['candidate']['bytes']-rows['baseline']['bytes']
rows['scope']='Complete profile Debug fields, full configuration/capability identities and displayed allocation columns; not raw allocation totals or timing.'
p.joinpath('native-result.json').write_text(json.dumps(rows,indent=2)+'\n')
print(json.dumps(rows,indent=2))
assert rows['full_transcript_equal'] and rows['profile_results']==7 and rows['full_identities']==7
