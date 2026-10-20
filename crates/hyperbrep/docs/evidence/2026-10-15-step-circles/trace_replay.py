"""Temporary diagnostic only: preserve the exact failure and record its caller."""
from check import ROOT, OUT, run
import difflib
import hashlib
import json

path=ROOT/'crates/hyperbrep/src/persistence.rs'
original=path.read_text()
needle='fn from(value: BuildError) -> Self {\n        Self::Build(value)'
replacement='fn from(value: BuildError) -> Self {\n        eprintln!("REPLAY BUILD FAILURE: {value:?}\\n{}", std::backtrace::Backtrace::force_capture());\n        Self::Build(value)'
assert original.count(needle)==1
changed=original.replace(needle,replacement)
builder_path=ROOT/'crates/hyperbrep/src/topology/builder.rs'
builder_original=builder_path.read_text()
builder_changed=builder_original
for call in ['self.validate_wire_image(*wire, surface)', 'self.validate_wire_simplicity(*wire)',
             'self.validate_wire_orientation(outer, orientation, true, surface)',
             'self.validate_wire_nesting(outer, &inner)']:
    needle=call+'?'
    assert needle in builder_changed
    builder_changed=builder_changed.replace(needle,call+'.inspect_err(|error| eprintln!("REPLAY STAGE '+call+': {error:?}"))?')
(OUT/'diagnostic-builder.patch').write_text(''.join(difflib.unified_diff(builder_original.splitlines(True),builder_changed.splitlines(True),fromfile=str(builder_path.relative_to(ROOT)),tofile=str(builder_path.relative_to(ROOT)))))
extra=[]
for relative in ['geometry.rs','topology/helpers.rs','parameter.rs','geometry/point.rs']:
    target=ROOT/'crates/hyperbrep/src'/relative
    before=target.read_text()
    needle='PredicateOutcome::Unknown { needed, stage } => {'
    after=before.replace(needle,needle+'\n eprintln!("UNRESOLVED AT {}:{}\\n{}", file!(), line!(), std::backtrace::Backtrace::force_capture());')
    extra.append((target,before,after))
    (OUT/('diagnostic-'+relative.replace('/','-')+'.patch')).write_text(''.join(difflib.unified_diff(before.splitlines(True),after.splitlines(True),fromfile=str(target.relative_to(ROOT)),tofile=str(target.relative_to(ROOT)))))
target=ROOT/'crates/hyperbrep/src/topology/validation/analytic_image.rs'
before=target.read_text()
needle='''        require_vector_equal(
            &surface_tangent,
            &edge_tangent,
            BuildError::EdgeUseSupportMismatch,
        )'''
assert before.count(needle)>=1
after=before.replace(needle,needle+'''.inspect_err(|_| eprintln!("TANGENT UV: {surface_parameter:?}\\nSURFACE TANGENT: {surface_tangent:?}\\nEDGE TANGENT: {edge_tangent:?}\\nEDGE PARAMETER: {edge_parameter:?}\\nEDGE RATE: {edge_rate:?}"))''',1)
extra.append((target,before,after))
(OUT/'diagnostic-analytic-image.patch').write_text(''.join(difflib.unified_diff(before.splitlines(True),after.splitlines(True),fromfile=str(target.relative_to(ROOT)),tofile=str(target.relative_to(ROOT)))))
(OUT/'diagnostic-persistence.patch').write_text(''.join(difflib.unified_diff(original.splitlines(True),changed.splitlines(True),fromfile=str(path.relative_to(ROOT)),tofile=str(path.relative_to(ROOT)))))
try:
    path.write_text(changed)
    builder_path.write_text(builder_changed)
    for target,before,after in extra: target.write_text(after)
    code=run('replay-diagnostic',['cargo','test','--offline','--locked','-p','hyperbrep-io','--test','step_circles',
                                  'analytic_import_edits_replays_and_composes_through_empty_results','--','--nocapture'])
    assert code==101
finally:
    path.write_text(original)
    builder_path.write_text(builder_original)
    for target,before,after in extra: target.write_text(before)
    (OUT/'diagnostic-restored.json').write_text(json.dumps(dict(path=str(path.relative_to(ROOT)),
        sha256=hashlib.sha256(path.read_bytes()).hexdigest(),restored=path.read_text()==original),indent=2)+'\n')
