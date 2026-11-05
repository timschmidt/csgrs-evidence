from pathlib import Path
import json,hashlib
root=Path.cwd();p=Path('/tmp/csgrs-r24-wasm');(p/'src').mkdir(parents=True,exist_ok=True)
source=root/'crates/hypercurve/tests/parallel_fidelity.rs';s=source.read_text();s=s.replace('mod support;','#[path="'+str(root/'crates/hypercurve/tests/support/mod.rs')+'"]\nmod support;').replace('#[test]\n','')
names=['restriction_reversal_and_scale_preserve_the_pointwise_source_map','selected_restrictions_keep_the_selected_parameter_without_projection','zero_distance_keeps_inherited_fidelity_and_unverified_geometry_stays_unverified','extracted_parallel_curves_keep_their_individual_source_and_metric','repeated_exact_edits_keep_a_compact_replay_and_the_pointwise_bound']
for name in names:s=s.replace('fn '+name+'(', 'pub fn '+name+'(')
(p/'src/cases.rs').write_text(s)
(p/'src/lib.rs').write_text('mod cases;\n'+''.join('#[unsafe(no_mangle)] pub extern "C" fn fidelity_'+str(i)+'(){cases::'+n+'();}\n' for i,n in enumerate(names)))
(p/'Cargo.toml').write_text('[package]\nname="csgrs-r24-wasm"\nversion="0.0.0"\nedition="2024"\n[workspace]\n[lib]\ncrate-type=["cdylib"]\n[dependencies]\nhypercurve={path="'+str(root/'crates/hypercurve')+'"}\nhyperreal={path="'+str(root/'crates/hyperreal')+'"}\n[features]\nsvg=[]\n[profile.release]\npanic="abort"\nopt-level=3\n')

if not (p/'Cargo.lock').exists(): (p/'Cargo.lock').write_bytes((root/'Cargo.lock').read_bytes())
(p/'derivation.json').write_text(json.dumps({'source':str(source),'sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'recipes':names,'changes':['absolute support module path','remove test attributes','expose five unchanged recipe bodies','exclude SVG/native subprocess paths through existing feature gates']},indent=2)+'\n')
