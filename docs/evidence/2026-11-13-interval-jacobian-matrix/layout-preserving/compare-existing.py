import hashlib, importlib.util, json, pathlib, struct, subprocess
root=pathlib.Path('/tmp/interval-refactor/jacobian-matrix/layout-preserving')
spec=importlib.util.spec_from_file_location('elf',root.parent/'elf_sections.py'); elf=importlib.util.module_from_spec(spec); spec.loader.exec_module(elf)
builds=json.loads((root/'existing-benchmark-builds.json').read_text())
sections={}; summary={}
for name,record in builds.items():
 p=pathlib.Path(record['path']); assert hashlib.sha256(p.read_bytes()).hexdigest()==record['sha256']
 sections[name]=elf.sections(p)
 stripped=p.with_name(p.name+'-stripped')
 subprocess.run(['objcopy','--strip-all',str(p),str(stripped)],check=True)
 with (root/(name+'-existing-smoke.log')).open('w') as log:
  smoke=subprocess.run([str(p),'--test'],stdout=log,stderr=subprocess.STDOUT,check=True)
 summary[name]={'bytes':p.stat().st_size,'stripped_bytes':stripped.stat().st_size,'sha256':record['sha256'],'stripped_sha256':hashlib.sha256(stripped.read_bytes()).hexdigest(),'smoke_returncode':smoke.returncode}
a,b=sections['baseline'],sections['candidate']
summary['changed_sections']={k:{'baseline':len(a.get(k,b'')),'candidate':len(b.get(k,b''))} for k in a.keys()|b.keys() if a.get(k)!=b.get(k)}
summary['text_identical']=a['.text']==b['.text'];summary['text_bytes']=len(a['.text'])
summary['data_rel_ro_u32_changes']=[{'offset':i,'baseline':struct.unpack_from('<I',a['.data.rel.ro'],i)[0],'candidate':struct.unpack_from('<I',b['.data.rel.ro'],i)[0]} for i in range(0,len(a['.data.rel.ro'])-3,4) if a['.data.rel.ro'][i:i+4]!=b['.data.rel.ro'][i:i+4]]
for name in sections:
 (root/(name+'-existing-strtab.txt')).write_text('\n'.join(x.decode(errors='backslashreplace') for x in sections[name]['.strtab'].split(b'\0')))
(root/'existing-benchmark-comparison.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(summary,indent=2))
