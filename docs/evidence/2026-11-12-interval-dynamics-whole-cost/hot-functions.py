from pathlib import Path
import json,subprocess,re,difflib
out=Path('/tmp/interval-refactor/dynamics-whole-cost');families=json.loads((out/'symbol-families.json').read_text());paths={'original':'/tmp/interval-refactor/dynamics-axis-baseline/target/release/deps/path_predicates-76b5bb949f77565a','control':'/tmp/interval-refactor/dynamics-cost-binaries/whole-control','inline-reports':'/tmp/interval-refactor/dynamics-cost-binaries/whole-inline-reports'}
names=['hyperpath::routing::certify_differential_pair_skew','hyperpath::specctra::import_specctra_trace_record','hyperpath::specctra::parse_specctra_grid_trace_records'];rows=[]
for name in names:
 reference=None
 for label,path in paths.items():
  family=families[label]['families'][name];assert family['count']==1;item=family['instances'][0];start=int(item['address'],16);command=['objdump','-d','-C','--no-show-raw-insn',f'--start-address={start}',f'--stop-address={start+item["bytes"]}',path];text=subprocess.check_output(command,text=True);filename=label+'-'+name.rsplit('::',1)[1]+'.asm';(out/filename).write_text(text)
  instructions=[]
  for line in text.splitlines():
   m=re.match(r'^\s*[0-9a-f]+:\s+(\S+)(.*)',line)
   if not m:continue
   op=m[1]+m[2];op=re.sub(r'\b[0-9a-f]+(?= <)','ADDR',op);op=re.sub(r'-?0x[0-9a-f]+(?=\(%rip\))','DISP',op);op=re.sub(r'::h[0-9a-f]{16}\b','::HASH',op);op=re.sub(r'\.llvm\.\d+','.llvm.HASH',op);instructions.append(op)
  if reference is None:reference=instructions
  differences=list(difflib.unified_diff(reference,instructions,fromfile='original',tofile=label))
  rows.append(dict(function=name,label=label,command=command,log=filename,bytes=item['bytes'],instructions=len(instructions),normalized_listing_matches_original=instructions==reference,normalized_differences=differences))
(out/'hot-functions.json').write_text(json.dumps(dict(scope='static entry function listings only; normalized addresses/RIP displacements and compiler symbol hashes are not a proof of runtime or transitive callee equality',rows=rows),indent=2)+'\n')
for r in rows:print(r['label'],r['function'],r['bytes'],r['instructions'],r['normalized_listing_matches_original'])
