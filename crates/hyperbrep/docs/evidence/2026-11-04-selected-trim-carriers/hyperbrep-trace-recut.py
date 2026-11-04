import pathlib,subprocess,json,difflib
original={};changed={}
for path in pathlib.Path('crates/hyperbrep/src').rglob('*.rs'):
    text=path.read_text();replacement=text
    for prefix in ['GeometryError','crate::GeometryError']:
        error=prefix+'::UnsupportedPcurveContour'
        emit='{ eprintln!("PCURVE BLOCK {}:{}", file!(), line!()); '+error+' }'
        replacement=replacement.replace('.ok_or('+error+')','.ok_or_else(|| '+emit+')')
        replacement=replacement.replace('return Err('+error+');','return Err('+emit+');')
        replacement=replacement.replace('=> Err('+error+'),','=> Err('+emit+'),')
    if replacement!=text:
        original[path]=text;changed[path]=replacement
patch=''.join(''.join(difflib.unified_diff(original[p].splitlines(True),s.splitlines(True),fromfile='a/'+str(p),tofile='b/'+str(p))) for p,s in changed.items())
pathlib.Path('/tmp/hyperbrep-recut-instrumentation.patch').write_text(patch)
try:
    for p,s in changed.items():p.write_text(s)
    cmd=['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--test','tensor_graph_solids','nonlinear_tensor_caps_support_transverse_recuts','--','--ignored','--exact','--nocapture']
    with open('/tmp/hyperbrep-recut-instrumented.log','w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
    print('instrumented recut status',r.returncode,'files',len(changed))
finally:
    for p,s in original.items():p.write_text(s)
