from pathlib import Path
import hashlib,json,time
root=Path(__file__).resolve().parent
assert all(row['exit_code']==0 and row['source_stable'] for row in json.loads((root/'circle-replay-prototype7-results.json').read_text()))
assert json.loads((root/'circle-replay-msrv-probe2.json').read_text())['exit_code']==0
records=[]
for attempt in range(1,7):
 prefix=f'circle-replay-prototype{attempt}'
 # Every source snapshot and executable recipe is retained; these superseded
 # ELF outputs are not inputs to the final runner or evidence archive.
 required=[root/(prefix+'-results.json'),root/(prefix+'-source-before.json'),root/(prefix+'-source-after.json'),root/(prefix+'.patch')]
 assert all(p.is_file() for p in required),prefix
 assert json.loads(required[1].read_text())==json.loads(required[2].read_text()),prefix
 recipe=required[0].read_text()
 for p in sorted(root.glob(prefix+'-*')):
  if not p.is_file():continue
  with p.open('rb') as stream:magic=stream.read(4)
  if magic!=b'\x7fELF':continue
  assert str(p) in recipe,p
  records.append({'path':str(p),'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'source_snapshot':str(required[1]),'command_results':str(required[0]),'removed':False})
assert records
report={'reason':'Reserve tmp quota for T evidence closeout. Remove only completed, superseded U prototype ELF build outputs. All exact positive sources, assertions, patches, input snapshots, compiler recipes, logs and results remain; no source or fixture is removed. T/U/V final Cargo targets and active executables remain untouched.','records':records,'recorded_epoch':time.time()}
receipt=root/'circle-replay-completed-probe-binary-recovery.json';assert not receipt.exists();receipt.write_text(json.dumps(report,indent=2)+'\n')
for row in records:
 Path(row['path']).unlink();row['removed']=True
 receipt.write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({'removed':len(records),'bytes':sum(r['bytes'] for r in records)}))
