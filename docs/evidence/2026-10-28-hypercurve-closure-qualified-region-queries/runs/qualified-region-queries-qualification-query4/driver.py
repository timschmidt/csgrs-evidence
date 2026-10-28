from pathlib import Path
import argparse
import importlib.util
import json
import os
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode = True
parser = argparse.ArgumentParser()
parser.add_argument('increment', choices=['selected-circle-regions', 'region-replay', 'circle-line-contacts', 'selected-circle-corners', 'empty-native-replay', 'qualified-region-queries'])
parser.add_argument('--attempt', default='recovered1')
parser.add_argument('--target', type=Path)
args = parser.parse_args()
root = Path(__file__).resolve().parents[1]
checkout = root / args.increment
record = root / 'controls' / (args.increment + '-qualification-' + args.attempt)
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, files, patch = evidence.source_snapshot()
evidence.save_json(record / 'source-before.json', source)
evidence.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
for name in source['untracked_inputs']:
    destination = record / 'inputs' / name
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_bytes((checkout / name).read_bytes())
target = str(args.target.resolve() if args.target else root.parent / ('hypercurve-' + args.increment + '-admission'))
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_TARGET_DIR': target,
       'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '2',
       'CCACHE_DIR': str(root.parent / 'hypercurve-admission-ccache'),
       'CCACHE_TEMPDIR': str(root.parent / 'hypercurve-admission-ccache/tmp')}
base = ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypercurve']
focused = [('selected-points', [*base, '--test', 'fiber_point_incidence'], {})]
if args.increment == 'qualified-region-queries':
    focused.insert(0, ('qualified-queries', [*base, '--test', 'qualified_region_queries'], {}))
    for target_name, case in [
        ('hypercurve_curve_region_boolean', 'circular_conic_batch_obeys_the_approximate_512_terminal'),
        ('hypercurve_curve_region_boolean', 'approximate_policy_reports_a_consumed_terminal_instead_of_relabeling_it_exact'),
        ('hypercurve_curve_region_boolean', 'general_curve_batch_obeys_the_approximate_512_terminal'),
        ('hypercurve_curve_region_boolean', 'line_general_batch_obeys_the_approximate_512_terminal'),
        ('hypercurve_curve_region_boolean', 'conic_general_batch_obeys_the_approximate_512_terminal'),
        ('hypercurve_curve_region_promotion', 'unified_region_offset_corner_options_obey_the_terminal_policy'),
        ('hypercurve_curve_region_stroke', 'path_stroke_obeys_the_approximate_512_connectivity_terminal'),
    ]:
        focused.append((case, [*base, '--test', target_name, case, '--', '--exact', '--nocapture'], {}))
if args.increment != 'selected-circle-regions':
    focused += [('region-replay', [*base, '--test', 'svg_region_replay'], {}),
                ('root-region-replay', ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'csgrs', '--test', 'svg_region_replay'], {})]
for name in [
    'bezier_offset::conversion_tests::independent_oblique_chords_support_constrained_fillet_families',
    'bezier_region::tests::regularized_composite_chord_roles_preserve_nested_islands_and_profiles',
]:
    focused.append((name.rsplit('::', 1)[-1], [*base, '--lib', name, '--', '--exact', '--nocapture'], {}))
if args.increment in ['selected-circle-corners', 'empty-native-replay', 'qualified-region-queries']:
    for name in [
        'curve::curve_fillet::tests::collapsed_selected_circle_fillet_reuses_constrained_contacts_and_support',
        'bezier_offset::conversion_tests::exact_point_translation_retains_consumed_and_inherited_policies',
        'bezier_offset::conversion_tests::qualified_chord_displacement_retains_direction_dependency',
        'bezier_offset::conversion_tests::mapped_circle_cut_ray_retains_concentric_offsets_and_reversal',
        'bezier_offset::conversion_tests::point_similarity_composition_preserves_retained_policy_barriers',
        'bezier_offset::cusp_semicircle::incident_point::tests::selected_point_angular_authority_keeps_inherited_frame_policy',
    ]:
        focused.append((name.rsplit('::', 1)[-1], [*base, '--lib', name, '--', '--exact', '--nocapture'], {}))
if args.increment in ['selected-circle-corners', 'empty-native-replay', 'qualified-region-queries']:
    focused.append(('affine-chord-frame', [*base, '--test', 'hypercurve_curve_region_promotion', 'algebraic_chords_survive_nonsingular_exact_affine_transforms', '--', '--exact', '--nocapture'], {}))
if args.increment in ['empty-native-replay', 'qualified-region-queries']:
    focused.append(('positive-height-empty-replay', [*base, '--test', 'hypercurve_curve_region_boolean', 'empty_output_does_not_certify_an_approximate_normalization', '--', '--exact', '--nocapture'], {}))
    focused.insert(0, ('native-svg-contract', [*base, '--test', 'hypercurve_svg'], {}))
commands = [
    ('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check'], {}),
    ('msrv-clippy', ['cargo', 'clippy', '--locked', '-p', 'hypercurve', '-p', 'csgrs', '-p', 'hyperbrep', '--all-targets', '--all-features', '--', '-D', 'warnings'], {'RUSTUP_TOOLCHAIN': '1.95.0', 'CARGO_TARGET_DIR': target + '-msrv'}),
    ('core-check', ['cargo', 'check', '--locked', '--release', '-p', 'hypercurve', '-p', 'hyperbrep', '--no-default-features'], {}),
    ('docs', ['cargo', 'doc', '--locked', '--no-deps', '--all-features', '-p', 'hypercurve', '-p', 'csgrs', '-p', 'hyperbrep'], {'RUSTDOCFLAGS': '-D warnings'}),
    ('fuzz-check', ['cargo', 'clippy', '--locked', '--manifest-path', 'crates/hypercurve/fuzz/Cargo.toml', '--bins', '--', '-D', 'warnings'], {'RUSTUP_TOOLCHAIN': '1.95.0', 'CARGO_TARGET_DIR': target + '-fuzz'}),
    ('full-suite', [*base, '--no-fail-fast'], {}),
    ('downstream', ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'csgrs', '--test', 'adapter_curve_failures', '--test', 'downstream_profiles', '--test', 'exact_profile_sweeps', '--test', 'mixed_modeling_profiles', '--test', 'svg_selected_replay', '--test', 'svg_parallel_replay', '--test', 'svg_chord_replay', '--test', 'svg_point_replay', '--test', 'svg_circle_replay', *(['--test', 'svg_region_replay'] if args.increment != 'selected-circle-regions' else []), '--test', 'export_projection_contracts', '--test', 'scalar_certificate_failures', '--no-fail-fast'], {}),
]
for package in ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']:
    commands.append(('dependent-' + package, ['cargo', 'test', '--locked', '--release', '--all-features', '-p', package, '--no-fail-fast'], {}))
commands += [
    ('matrix-guards', ['python3', 'crates/hypercurve/scripts/test_capability_matrix.py'], {}),
    ('matrix', ['python3', 'crates/hypercurve/scripts/capability_matrix.py', '--output', str(record / 'capabilities')], {}),
    ('typos', ['typos'], {}),
    ('budget', ['scripts/check-repository-budget.sh'], {}),
    ('diff', ['git', 'diff', '--check'], {}),
]
assert len(commands) == 18
records = []
for phase, plan in [('focused', focused), ('qualification', commands)]:
    for name, command, extra in plan:
        assert evidence.source_snapshot()[0] == source, 'Source changed before ' + name
        print('START', phase, name, flush=True)
        started = time.time()
        timeout = 21600 if phase == 'qualification' else 3600
        with (record / (phase + '-' + name + '.log')).open('w') as log:
            process = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=checkout, env={**env, **extra}, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
            active = {'pid': process.pid, 'phase': phase, 'name': name, 'started_epoch': started, 'command': command, 'source': source}
            evidence.save_json(record / 'active.json', active)
            try:
                code = process.wait(timeout=timeout)
            except subprocess.TimeoutExpired:
                os.killpg(process.pid, signal.SIGKILL)
                process.wait()
                code = 'external_timeout'
        after, after_files, _ = evidence.source_snapshot()
        row = {'phase': phase, 'name': name, 'command': command, 'cwd': str(checkout), 'started_epoch': started,
               'elapsed_seconds': time.time() - started, 'exit_code': code, 'source_stable': source == after,
               'external_timeout_seconds': timeout,
               'settings': {key: value for key, value in {**env, **extra}.items() if key in ['RUSTUP_TOOLCHAIN', 'CARGO_TARGET_DIR', 'CARGO_BUILD_JOBS', 'RUST_TEST_THREADS', 'RUSTDOCFLAGS', 'CCACHE_DIR', 'CCACHE_TEMPDIR']}}
        records.append(row)
        evidence.save_json(record / 'results.json', records)
        evidence.save_json(record / 'source-after.json', after)
        evidence.save_json(record / 'files-after.json', after_files)
        print('FINISH', phase, name, code, round(row['elapsed_seconds'], 2), 'stable', row['source_stable'], flush=True)
        if code != 0 or not row['source_stable']:
            sys.exit(1)
evidence.save_json(record / 'complete.json', {'source': source, 'focused_groups': len(focused), 'qualification_groups': 18, 'all_passed': True, 'epoch': time.time()})
print('QUALIFICATION COMPLETE', flush=True)
