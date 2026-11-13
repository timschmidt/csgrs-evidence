from pathlib import Path
import subprocess,time,json
p=Path(__file__).parent;start=time.monotonic()
while True:
 ready=True
 for filename,count,key in [('final-qualification.json',15,'returncode'),('downstream-qualification.json',11,'exit')]:
  try:rows=json.loads((p/filename).read_text())
  except (FileNotFoundError,json.JSONDecodeError):ready=False;continue
  assert all(r[key]==0 for r in rows),(filename,rows[-1]);ready &= len(rows)==count
 if ready:break
 assert time.monotonic()-start<900
 time.sleep(1)
print('All qualification groups complete; starting fixed measurements',flush=True)
for script in ['summarize.py','run-resolved-pairs.py','analyze-resolved-cost.py','run-model-cost.py','analyze-model-cost.py']:
 subprocess.run(['python3',str(p/script)],check=True)
