from pathlib import Path
import subprocess,json,time,shutil,hashlib,re
p=Path(__file__).parent;old=Path('/tmp/interval-refactor/taylor');root=Path('/mnt/development/csgrs-taylor');bins=Path('/tmp/interval-refactor/taylor-resolution-binaries');rows=[]
for project,exe,target in [('old-native-cost','dyadic-evolution-cost-probe','taylor-old-target'),('old-native-semantic','evolution-semantic-probe','taylor-old-target'),('model-cost','taylor-model-cost-probe','taylor-new-target')]:
 command=['cargo','+1.95.0','build','--release','--locked','--manifest-path',str(old/project/'Cargo.toml'),'--target-dir','/tmp/interval-refactor/'+target];start=time.monotonic()
 with (p/(project+'-final-build.log')).open('w') as f:r=subprocess.run(command,cwd=root,stdout=f,stderr=subprocess.STDOUT)
 assert r.returncode==0
 output=bins/('arity-'+project);shutil.copy2(Path('/tmp/interval-refactor')/target/'release'/exe,output)
 row=dict(project=project,command=command,cwd=str(root),returncode=r.returncode,seconds=time.monotonic()-start,path=str(output),bytes=output.stat().st_size,sha256=hashlib.sha256(output.read_bytes()).hexdigest());rows.append(row);(p/'final-consumer-builds.json').write_text(json.dumps(rows,indent=2)+'\n')
 if project!='model-cost':
  baseline=Path('/tmp/interval-refactor/taylor-binaries')/('pristine-baseline-'+project)
  def section(binary):
   data=binary.read_bytes();headers=subprocess.check_output(['readelf','-SW',str(binary)],text=True);m=re.search(r'\]\s+\.text\s+\S+\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)',headers);assert m;return data[int(m[2],16):int(m[2],16)+int(m[3],16)]
  original=section(baseline);actual=section(output);assert original==actual;assert output.stat().st_size <= baseline.stat().st_size
  row.update(baseline_path=str(baseline),text_bytes=len(actual),text_sha256=hashlib.sha256(actual).hexdigest(),baseline_text_identical=True,baseline_elf_size_identical=baseline.stat().st_size==output.stat().st_size,elf_delta=output.stat().st_size-baseline.stat().st_size)
  if project=='old-native-semantic':
   result=subprocess.check_output([str(output)]);assert result==(old/'baseline-old-native-semantic.log').read_bytes();(p/'arity-semantic.log').write_bytes(result);row.update(semantic_bytes=len(result),semantic_identical=True)
 (p/'final-consumer-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(project,row['bytes'],flush=True)
