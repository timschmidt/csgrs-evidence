from pathlib import Path
import ast,collections,gzip,hashlib,json,re,subprocess
s=Path(__file__).parent;read=lambda n:json.loads((s/n).read_text());sha=lambda data:hashlib.sha256(data).hexdigest();completion=read('completion.json');assert completion['exit_code']==0 and completion['processes']==56 and completion['seconds']<120
provenance=read('provenance.json');rows=read('classified.json');original=read('observations.json');assert len(rows)==len(original)==56;maps=read('symbols.json');refs={};reconstructed=[]
for name,item in provenance['interposer'].items():assert (s/name).read_bytes()==Path(item['source']).read_bytes() and sha((s/name).read_bytes())==item['sha256']
for label,image in provenance['images'].items():
 assert sha(Path(image['path']).read_bytes())==image['sha256']
 offsets=sorted(maps[label]);lines=subprocess.check_output(['addr2line','-C','-f','-e',image['path'],*['0x'+o for o in offsets]],text=True,timeout=20).splitlines();assert len(lines)==2*len(offsets)
 assert {o:dict(function=lines[2*i],source=lines[2*i+1]) for i,o in enumerate(offsets)}==maps[label]
for row,recorded in zip(rows,original,strict=True):
 assert all(row[k]==v for k,v in recorded.items());assert row['exit_code']==0 and not row['timed_out']
 contents=[]
 for log in row['logs']:
  raw=gzip.decompress((s/log['path']).read_bytes());assert len(raw)==log['bytes'] and sha(raw)==log['sha256'];contents.append(raw.decode())
 fields=dict(line.split(' ',1) for line in contents[0].splitlines());output=(fields['OUTPUT'],fields['TRACE']);key=row['recording']
 if key in refs:assert output==refs[key]
 else:refs[key]=output
 allocation=ast.literal_eval(fields['ALLOCATION']);assert list(allocation)==row['allocation'];assert list(ast.literal_eval(fields['CLEANUP']))==row['cleanup']
 image=provenance['images'][row['label']]['path'];pattern=re.escape(image)+r'\(\+0x([0-9a-f]+)\)';events=[]
 for block in contents[1].split('END_ALLOC632\n'):
  if not block.strip():continue
  assert block.startswith('ALLOC632 pointer=');offsets=re.findall(pattern,block);assert offsets
  functions=[maps[row['label']][o]['function'] for o in offsets]
  events.append(dict(offsets=offsets,functions=functions,trace_collection=any('dispatch_trace::collect_dispatch_counts' in f for f in functions),btree=any('alloc::collections::btree::' in f for f in functions),observed_epoch=any('solver_five_chain_resource::allocation::observe' in f for f in functions)))
 assert events==row['resolved_events'];assert all(e['trace_collection'] and e['btree'] for e in events)
 count=sum(e['observed_epoch'] for e in events);assert count==row['observed_epoch_632']
 if row['mode']=='plain' or row['recording']=='passive':assert not events
 reconstructed.append(dict(label=row['label'],recording=row['recording'],mode=row['mode'],allocation=allocation,observed=count,captured=len(events)))
groups=[]
for label in ['fixed','five']:
 for recording in ['active','passive']:
  for mode in ['plain','interposed']:
   selected=[r for r in reconstructed if (r['label'],r['recording'],r['mode'])==(label,recording,mode)];assert len(selected)==(12 if recording=='active' else 2)
   groups.append(dict(label=label,recording=recording,mode=mode,processes=len(selected),allocation_tuples=sorted(set(tuple(r['allocation']) for r in selected)),observed_epoch_632=sorted(set(r['observed'] for r in selected))))
active=[r for r in reconstructed if r['recording']=='active' and r['mode']=='interposed'];assert len(active)==24
by_nodes=collections.defaultdict(set)
for r in active:by_nodes[r['observed']].add(tuple(r['allocation']))
assert all(len(v)==1 for v in by_nodes.values());classes=sorted((k,next(iter(v))) for k,v in by_nodes.items());assert len(classes)>=2
for (count,a),(next_count,b) in zip(classes,classes[1:]):
 d=next_count-count;assert tuple(y-x for x,y in zip(a,b,strict=True))==(d,d,0,632*d,632*d,0)
assert {r['allocation'][5] for r in reconstructed if r['recording']=='active'}=={10381}
assert len({tuple(r['allocation']) for r in reconstructed if r['recording']=='passive'})==1
host={name:subprocess.check_output(cmd,stderr=subprocess.STDOUT,text=True).strip() for name,cmd in [('kernel',['uname','-a']),('glibc',['ldd','--version']),('addr2line',['addr2line','--version'])]};(s/'host-after.json').write_text(json.dumps(host,indent=2)+'\n')
result=dict(processes=56,active_processes=48,passive_processes=8,full_output_trace_domains=2,additional_full_output_trace_comparisons=54,all_captured_632_from_trace_btree=True,observed_epoch_classes=[dict(nodes=k,allocation=a) for k,a in classes],per_extra_observed_node=dict(allocations=1,deallocations=1,reallocations=0,requested_traffic=632,requested_peak=632,requested_retained=0),active_requested_retained=10381,groups=groups,original_image_and_interposer_bytes_preserved=True,prior_charges_subtracted=False,resource_cap_revision=False,ASLR_causality_proved=False,unchanged_resource_measurement_claim=False,admitted=False)
(s/'verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k!='groups'},indent=2))
