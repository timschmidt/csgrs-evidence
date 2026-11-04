from pathlib import Path
import itertools,subprocess
app=Path('/home/tim/Documents/GitHub/workspace/synaps-cad');old=subprocess.check_output(['git','-C',str(app),'show','124c31d:src/compiler/geometry/conversions.rs'],text=True).split('#[cfg(test)]')[0]
old=old.replace('&crate::compiler::MESH_CONTEXT','&csgrs::GeometryContext::STRICT.mesh_context()').replace('''    Ok(MeshData {
        positions,''','''    Ok(MeshData {
        source: mesh.clone(),
        positions,''')
Path('/tmp/csgrs-native-cost-old.rs').write_text(old)
root=Path('/tmp/csgrs-research-target/release/deps');synaps=max(root.glob('libsynaps_cad-*.rlib'),key=lambda p:p.stat().st_mtime_ns)
for csgrs,parser in itertools.product(root.glob('libcsgrs*.rlib'),root.glob('libopenscad_rs-*.rlib')):
 args=['rustc','--edition=2024','-O','/tmp/csgrs-native-cost-probe.rs','-L','dependency='+str(root),'-o','/tmp/csgrs-native-cost-probe','--extern','synaps_cad='+str(synaps),'--extern','openscad_rs='+str(parser),'--extern','csgrs='+str(csgrs)]
 result=subprocess.run(args,capture_output=True,text=True)
 if result.returncode==0:
  print('Matched artifacts:',synaps.name,csgrs.name,parser.name);break
else:raise RuntimeError(result.stderr)
