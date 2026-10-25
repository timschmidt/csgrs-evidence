from pathlib import Path
import hashlib, json, re, subprocess

root=Path('/tmp/csgrs-r28-trace')
raw=Path(__file__).resolve().parent
def body_bounds(text, signature, start=0):
    pos=text.index(signature,start); opening=text.index('{',pos); depth=1; i=opening+1
    while depth:
        depth += (text[i]=='{')-(text[i]=='}'); i+=1
    return opening+1,i-1

p=root/'crates/hypercurve/src/bezier_fit.rs'; text=p.read_text()
edits=[]
for family in ['QuadraticBezier2','CubicBezier2','RationalQuadraticBezier2','RationalBezier2']:
    begin,end=body_bounds(text,'pub(crate) fn fit_exact_line_image_with_policy(',text.index('impl '+family+' {'))
    body=text[begin:end]
    body=body.replace('return Ok(Classification::Decided(BezierLineImageFitRelation::NotLine));', 'eprintln!("R28_SHORTCUT family='+family+'"); return Ok(Classification::Decided(BezierLineImageFitRelation::NotLine));')
    if family=='RationalBezier2':
        body=body.replace('let weights = self.weights().iter().collect::<Vec<_>>();','r28_weight_vectors += 1;\n        let weights = self.weights().iter().collect::<Vec<_>>();')
        body=body.replace('let controls = points.iter().collect::<Vec<_>>();','r28_control_vectors += 1;\n                let controls = points.iter().collect::<Vec<_>>();')
        counters='let mut r28_weight_vectors=0; let mut r28_control_vectors=0;'
        degree='self.degree()'
    else:
        counters='let r28_weight_vectors=0; let r28_control_vectors=0;'
        degree='3' if family=='CubicBezier2' else '2'
    circle='self.retained_circular_conic().is_some()' if family.startswith('Rational') else 'false'
    replacement='\n        '+counters+'\n        let r28_start=std::time::Instant::now();\n        let r28_result=(|| {'+body+'\n        })();\n        let r28_elapsed=r28_start.elapsed().as_nanos();\n        let r28_outcome=match &r28_result {\n            Ok(Classification::Decided(BezierLineImageFitRelation::Fit(_))) => "Fit",\n            Ok(Classification::Decided(BezierLineImageFitRelation::NotLine)) => "NotLine",\n            Ok(Classification::Uncertain(_)) => "Uncertain",\n            Err(_) => "Error",\n        };\n        eprintln!("R28_FIT family='+family+' degree={} circle={} weight_vectors={} control_vectors={} ns={} outcome={} policy={:?}",'+degree+','+circle+',r28_weight_vectors,r28_control_vectors,r28_elapsed,r28_outcome,policy);\n        if !matches!(r28_result,Ok(Classification::Decided(_))) { eprintln!("R28_FIT_DECLINE {:?}",r28_result); }\n        r28_result\n    '
    edits.append((begin,end,replacement))
for begin,end,replacement in reversed(edits): text=text[:begin]+replacement+text[end:]
p.write_text(text)

p=root/'crates/hypercurve/src/rational_bezier_general.rs';text=p.read_text()
start=text.index('pub fn affine_control_points(&self)')
pos=text.index('let mut points = Vec::with_capacity(self.homogeneous_controls().len());',start)
text=text[:pos]+'eprintln!("R28_CACHE kind=affine degree={}", self.degree());\n        '+text[pos:]
start=text.index('pub fn weights(&self)')
pos=text.index('self.data.weights.get_or_init(|| {',start)+len('self.data.weights.get_or_init(|| {')
text=text[:pos]+'\n            eprintln!("R28_CACHE kind=weights degree={}", self.degree());'+text[pos:]
p.write_text(text)

p=root/'crates/hypercurve/src/curve_region_boolean.rs';text=p.read_text();edits=[]
for name,scope in [('build_boolean_region_from_topology','output'),('coalesce_certified_boolean_line_runs','coalesce')]:
    begin,end=body_bounds(text,'fn '+name+'(')
    replacement='\n        eprintln!("R28_STAGE_BEGIN '+scope+'");\n        let r28_start=std::time::Instant::now();\n        let r28_result=(|| {'+text[begin:end]+'\n        })();\n        eprintln!("R28_STAGE_END '+scope+' ns={} success={}",r28_start.elapsed().as_nanos(),r28_result.is_ok());\n        r28_result\n    '
    edits.append((begin,end,replacement))
for begin,end,replacement in sorted(edits,reverse=True):text=text[:begin]+replacement+text[end:]
p.write_text(text)

subprocess.run(['cargo','fmt','--all'],cwd=root,check=True)
(raw/'candidate-trace-source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
paths=['crates/hypercurve/src/bezier_fit.rs','crates/hypercurve/src/rational_bezier_general.rs','crates/hypercurve/src/curve_region_boolean.rs']
(raw/'candidate-trace-source.json').write_text(json.dumps({'paths':{p:hashlib.sha256((root/p).read_bytes()).hexdigest() for p in paths},'scope':'diagnostic only; unchanged branch/results; per-call instrumentation distorts stage timings; vector counts are preparation-site counts, not all allocator calls'},indent=2)+'\n')
print('R28 instrumentation prepared',flush=True)
