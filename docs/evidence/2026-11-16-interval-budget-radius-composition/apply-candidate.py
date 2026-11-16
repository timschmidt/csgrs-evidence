from pathlib import Path
import subprocess
s=Path(__file__).parent;root=Path('/mnt/development/interval-profile-static/csgrs');interface=Path('/mnt/development/interval-profile-static/alumina-interface')
assert (s/'baseline-builds.json').exists() and (s/'baseline-wasm-replay.json').exists() and (s/'baseline-trace-build.json').exists()
assert not subprocess.check_output(['git','status','--porcelain'],cwd=root)
assert not subprocess.check_output(['git','status','--porcelain'],cwd=interface)
for source,target in [('radius.rs.candidate','crates/hyperinterval/src/radius.rs'),('radius_composition.rs.candidate','crates/hyperinterval/tests/radius_composition.rs')]:
 p=root/target;assert not p.exists();p.write_bytes((s/source).read_bytes())
p=root/'crates/hyperinterval/Cargo.toml';t=p.read_text();assert 'real-radius' not in t;t=t.replace('real-ball = ["hyperreal"]','real-ball = ["hyperreal"]\nreal-radius = ["rational"]');p.write_text(t)
p=root/'crates/hyperinterval/src/lib.rs';t=p.read_text();t=t.replace('#[cfg(feature = "real-ball")]\nmod real_ball;','#[cfg(feature = "real-ball")]\nmod real_ball;\n#[cfg(feature = "real-radius")]\nmod radius;');t+='\n#[cfg(feature = "real-radius")]\npub use radius::{RationalRadius, RealRadius};\n';p.write_text(t)
p=interface/'Cargo.toml';t=p.read_text();old='hyperinterval = { path = "../csgrs/crates/hyperinterval", default-features = false, features = ["rational"] }';assert old in t;t=t.replace(old,old.replace('["rational"]','["rational", "real-radius"]'));p.write_text(t)
p=interface/'crates/alumina-interface-core/src/machine_profile.rs';t=p.read_text();t=t.replace('use hyperlimit::{PredicatePolicy, compare_reals};','use hyperinterval::{RationalRadius, RealRadius};\nuse hyperlimit::{PredicatePolicy, compare_reals};')
old='        if requested_total_error_mm <= Rational::zero()\n            || source_curve_allocation_mm < Rational::zero()\n            || controller_interpolation_allocation_mm < Rational::zero()\n        {\n            return Err(MachineProfileError::InvalidErrorBudget);\n        }\n'
new='        if requested_total_error_mm <= Rational::zero() {\n            return Err(MachineProfileError::InvalidErrorBudget);\n        }\n        let source_curve_allocation_mm = RationalRadius::new(source_curve_allocation_mm)\n            .map_err(|_| MachineProfileError::InvalidErrorBudget)?;\n        let controller_interpolation_allocation_mm = RationalRadius::new(controller_interpolation_allocation_mm)\n            .map_err(|_| MachineProfileError::InvalidErrorBudget)?;\n'
assert old in t;t=t.replace(old,new,1)
t=t.replace('vector_norm2(&','RealRadius::euclidean_norm(&')
old='        let output_quantum_seconds = (Real::from(profile.output_quantum_cycles())\n            / Real::from(profile.timer_ticks_per_second()))?;'
new='        let output_quantum_seconds = RealRadius::from_unsigned_ratio(\n            profile.output_quantum_cycles(),\n            core::num::NonZeroU64::new(profile.timer_ticks_per_second())\n                .expect("validated positive machine timer"),\n        )?;'
assert old in t;t=t.replace(old,new,1)
t=t.replace('Real::from(source_curve_allocation_mm_exact.clone())','RealRadius::from(source_curve_allocation_mm_exact.clone())').replace('Real::from(controller_interpolation_allocation_mm_exact.clone())','RealRadius::from(controller_interpolation_allocation_mm_exact.clone())')
t=t.replace('            &required_total_error_mm,','            required_total_error_mm.as_real(),',1)
for name in ['source_curve_allocation_mm_exact','controller_interpolation_allocation_mm_exact']:
 old='                '+name+',\n';assert t.count(old)==1;t=t.replace(old,'                '+name+': '+name+'.into_rational(),\n')
for name in ['source_curve_allocation_mm','controller_interpolation_allocation_mm','endpoint_quantization_error_mm','step_event_tracking_error_mm','command_lattice_error_mm','calibration_error_mm','following_error_mm','output_grid_position_error_mm','required_total_error_mm']:
 old='                '+name+',\n';assert t.count(old)==1,(name,t.count(old));t=t.replace(old,'                '+name+': '+name+'.into_real(),\n')
old='fn vector_norm2(components: &[Real]) -> Result<Real, Problem> {\n    let mut squared = Real::zero();\n    for component in components {\n        squared += component * component;\n    }\n    squared.sqrt()\n}\n\n'
assert old in t;t=t.replace(old,'',1);p.write_text(t)
print('candidate applied to isolated repositories only')
