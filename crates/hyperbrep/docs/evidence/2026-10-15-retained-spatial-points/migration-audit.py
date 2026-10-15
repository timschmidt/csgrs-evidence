from pathlib import Path
import hashlib
import json
import re
import subprocess

root=Path('/mnt/development/csgrs')
baseline='7bc780d89'
def old(path): return subprocess.check_output(['git','show',baseline+':'+path],cwd=root,text=True)
def compact(source): return re.sub(r'\s+','',source)
paths=subprocess.check_output(['git','diff','--name-only',baseline],cwd=root,text=True).splitlines()
exclude={'geometry.rs','parameter.rs','construction.rs','error.rs','lib.rs'}
mechanical=[]
for path in paths:
    if path.startswith('crates/hyperbrep/src/') and path.endswith('.rs') and Path(path).name not in exclude:
        before=old(path); after=(root/path).read_text()
        assert compact(before)==compact(after.replace('.evaluate_real(','.point_at(')),path
        mechanical.append({'path':path,'renamed_calls':after.count('.evaluate_real(')-before.count('.evaluate_real(')})

path='crates/hyperbrep/src/geometry.rs'
def body(source, signature):
    start=source.index('{',source.index(signature))
    depth=0
    for end in range(start,len(source)):
        depth += (source[end]=='{')-(source[end]=='}')
        if depth==0: return source[start:end+1]
    raise ValueError(signature)
assert compact(body(old(path),'pub fn point_at(&self, parameter: &Real) -> GeometryResult<Point3>'))==compact(body((root/path).read_text(),'pub(crate) fn evaluate_real(&self, parameter: &Real) -> GeometryResult<Point3>'))

path='crates/hyperbrep/benches/kernel.rs'
before=old(path); after=(root/path).read_text()
recovered=after.replace('    let midpoint_parameter = hyperbrep::Parameter::from_real(midpoint.clone());\n','').replace('black_box(&midpoint_parameter)','black_box(&midpoint)').replace('.point_at(&parameter.into())','.point_at(&parameter)')
for message in ['authored midpoint has coordinates','authored edge fraction has coordinates']:
    recovered=recovered.replace('            .try_coordinates()\n            .expect("'+message+'")\n            .clone()\n','')
assert compact(before)==compact(recovered),'kernel harness changed beyond direct API migration'
result={
    'baseline_revision':baseline,
    'mechanical_call_migrations':mechanical,
    'native_evaluator_body':'Identical after whitespace normalization; moved from the public point_at entry to the private evaluate_real implementation.',
    'kernel_harness':{
        'baseline_sha256':hashlib.sha256(before.encode()).hexdigest(),
        'candidate_sha256':hashlib.sha256(after.encode()).hexdigest(),
        'audit':'Only six spatial evaluation call sites change: two setup helpers wrap authored parameters and borrow/clone stored output coordinates; four timed calls use one Parameter prepared outside timing. All fixtures, loop counts, assertions and checksums remain unchanged. Source is not byte-identical.'
    }
}
destination=Path('/tmp/hyperbrep-spatial-migration-audit.json')
destination.write_text(json.dumps(result,indent=2)+'\n')
print(f'{len(mechanical)} internal files have only call-name/format changes; native evaluator and benchmark migration verified.')
