from pathlib import Path
import ast,collections,hashlib,json
s=Path(__file__).parent
rows=json.loads((s/'observations.json').read_text())
assert len(rows)==146
images=json.loads((s/'original-images.json').read_text())
assert images[0]['sha256']==images[1]['sha256']
for image in images:assert hashlib.sha256(Path(image['path']).read_bytes()).hexdigest()==image['sha256']
all_outputs=set();all_signatures=set();instrumented=[];bygroup={};reconciled=0
for row in rows:
 lines=(s/row['log']).read_text().splitlines()
 output=tuple(line for line in lines if line.startswith(('OUTPUT ','TRACE ')));assert len(output)==2
 all_outputs.add(output)
 fields={l.split(' ',1)[0]:l.split(' ',1)[1] for l in lines if not l.startswith(('EVENT ','INTERPOSER_READY '))}
 for i,(ak,uk) in enumerate(zip(['ALLOCATION','CLEANUP','INPUT_CLEANUP'],['USABLE','USABLE_CLEANUP','INPUT_USABLE_CLEANUP'])):
  assert tuple(row['epochs'][i]['allocation'])==ast.literal_eval(fields[ak])
  assert tuple(row['epochs'][i]['usable'])==ast.literal_eval(fields[uk])
 assert ast.literal_eval(fields['ALLOCATION'])==(2910,2809,593,193309,14100,9088)
 bygroup.setdefault((row['label'],row['mode']),[]).append(row)
 if row['mode']=='plain':assert not any(l.startswith('EVENT ') for l in lines);continue
 assert lines[0]=='INTERPOSER_READY flag=0'
 ends=[i for i,l in enumerate(lines) if l.startswith(('USABLE ','USABLE_CLEANUP ','INPUT_USABLE_CLEANUP '))];assert len(ends)==3
 events=[];begin=1
 for epoch,end in enumerate(ends):
  chunk=[l.split() for l in lines[begin:end] if l.startswith('EVENT ')];begin=end+1
  counts=collections.Counter(e[1] for e in chunk)
  traffic=sum(int(e[6]) for e in chunk);live=peak=0
  for e in chunk:live+=int(e[6])-int(e[5]);peak=max(peak,live)
  a=row['epochs'][epoch]['allocation'];u=row['epochs'][epoch]['usable']
  assert [counts['A'],counts['D'],counts['R'],sum(int(e[4]) for e in chunk)]==a[:4]
  assert [traffic,peak,live]==u
  reconciled+=1
  if epoch==0:events=chunk
 sig=tuple((e[1],int(e[4])) for e in events);all_signatures.add(sig)
 instrumented.append((row,events))
assert len(all_outputs)==1 and len(all_signatures)==1 and reconciled==219
# Compare corresponding event ordinals, not merely aggregates by request size.
reference=instrumented[0][1]
variable=[]
for i,event in enumerate(reference):
 if event[1] not in ['A','R']:continue
 usable=sorted({int(events[i][6]) for _,events in instrumented})
 if len(usable)>1:variable.append(dict(event_ordinal=i,kind=event[1],requested=int(event[4]),usable_bytes=usable))
assert variable
for row,events in instrumented:
 diff=sum(int(a[6])-int(b[6]) for a,b in zip(events,reference))
 assert diff==row['epochs'][0]['usable'][0]-instrumented[0][0]['epochs'][0]['usable'][0]
summary=json.loads((s/'summary.json').read_text())
for group in summary['groups']:
 selected=bygroup[(group['label'],group['mode'])]
 assert len(selected)==group['processes']
 for i,g in enumerate(group['epochs']):
  assert sorted({tuple(r['epochs'][i]['usable']) for r in selected})==[tuple(t) for t in g['usable_tuples']]
  assert sorted({tuple(r['epochs'][i]['allocation']) for r in selected})==[tuple(t) for t in g['allocation_tuples']]
verification=dict(processes=146,plain_processes=73,interposed_processes=73,reconciled_epochs=reconciled,full_output_trace_equal=True,byte_identical_fixed_current=True,all_operation_request_sequences_equal=True,operation_events=len(reference),variable_usable_event_ordinals=len(variable),all_usable_traffic_differences_reconciled=True,original_images_sha_verified=True,original_charges_removed=False,caps_changed=False,admitted=False,requested_free_bytes_not_inferred=True,no_runtime_claim=True)
(s/'variable-events.json').write_text(json.dumps(variable,indent=2)+'\n')
(s/'verification.json').write_text(json.dumps(verification,indent=2)+'\n')
print(json.dumps(verification,indent=2))
