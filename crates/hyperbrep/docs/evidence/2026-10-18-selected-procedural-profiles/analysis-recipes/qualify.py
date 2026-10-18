"""Source-bound native and downstream qualification; no concurrent measurements."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes, run

C = ['--offline', '--locked']
CORE = ['-p', 'hyperbrep', '-p', 'hyperbrep-io']
commands = [
    ('curve-clippy', ['cargo', 'clippy', *C, '-p', 'hypercurve', '--all-features', '--all-targets', '--', '-D', 'warnings'], {}, 1200),
    ('native-clippy', ['cargo', 'clippy', *C, *CORE, '--all-features', '--all-targets', '--', '-D', 'warnings'], {}, 1200),
    ('minimal-clippy', ['cargo', 'clippy', *C, *CORE, '--no-default-features', '--all-targets', '--', '-D', 'warnings'], {}, 1200),
    ('new-debug', ['cargo', 'test', *C, *CORE, '--test', 'selected_procedural_profiles', '--no-fail-fast'], {}, 900),
    ('native-release', ['cargo', 'test', *C, *CORE, '--all-features', '--release', '--no-fail-fast'], {}, 1800),
    ('native-minimal', ['cargo', 'test', *C, *CORE, '--no-default-features', '--release', '--no-fail-fast'], {}, 1800),
    ('curve-tests', ['cargo', 'test', *C, '--release', '-p', 'hypercurve', '--all-features', '--test', 'selected_point_definitions', '--test', 'span_parameter_transport', '--test', 'point_affine_forms', '--test', 'native_curve_images', '--test', 'retained_bezier_images', '--test', 'hypercurve_rational_bezier', '--test', 'hypercurve_bezier_algebraic_parameter', '--test', 'hypercurve_curve_region_boolean', '--test', 'hypercurve_curve_region_promotion', '--test', 'hypercurve_exact_closure', '--test', 'hypercurve_curve_intersection', '--test', 'hypercurve_analytic_parallel_region', '--test', 'hypercurve_path_closure', '--test', 'path_orientation', '--test', 'hypercurve_bezier_fit_offset', '--no-fail-fast'], {}, 1800),
    ('curve-retained', ['cargo', 'test', *C, '--release', '-p', 'hypercurve', '--all-features', '--lib', 'bezier_region::', '--no-fail-fast'], {}, 1800),
    ('curve-parameter', ['cargo', 'test', *C, '--release', '-p', 'hypercurve', '--all-features', '--lib', 'bezier_parameter::', '--', '--test-threads=2'], {}, 1800),
    ('curve-subdivision', ['cargo', 'test', *C, '--release', '-p', 'hypercurve', '--all-features', '--lib', 'curve_subdivision::tests'], {}, 1800),
    ('curve-winding', ['cargo', 'test', *C, '--release', '-p', 'hypercurve', '--all-features', '--lib', 'curve_region_boolean::regularized_face_winding_tests'], {}, 900),
    ('curve-successors', ['cargo', 'test', *C, '--release', '-p', 'hypercurve', '--all-features', '--lib', 'curve_region_boolean::certified_successor_tests'], {}, 1800),
    ('rustdoc', ['cargo', 'doc', *C, *CORE, '-p', 'hypercurve', '--all-features', '--no-deps'], {'RUSTDOCFLAGS': '-D warnings'}, 1200),
    ('fuzz-check', ['cargo', 'check', *C, '--manifest-path', 'crates/hyperbrep/fuzz/Cargo.toml', '--bins'], {}, 900),
]
for name in ['independent_chord_linear_forms_replay_exact_coefficient_relations', 'retained_chord_coordinate_and_linear_queries_observe_requested_policy', 'retained_chord_derived_queries_match_exact_affine_oracles_and_requested_policy', 'native_pruning_certificates_require_the_consumed_parameter_range', 'point_similarity_composition_preserves_retained_policy_barriers']:
    commands.append(('owner-compatibility-'+name, ['cargo','test',*C,'--release','-p','hypercurve','--all-features','--lib',name],{},900))
for name, example, folder in [
    ('analytic', 'analytic_step', 'exports'), ('faceted', 'faceted_step', 'faceted-exports'),
    ('advanced', 'advanced_step', 'advanced-exports'), ('supplied', 'supplied_step', None),
    ('circular', 'circular_step', None), ('similarity', 'analytic_similarity', 'scaled-exports'),
    ('torus', 'torus_step', 'torus-exports'), ('cone', 'cone_step', 'cone-exports'),
    ('region', 'region_extrusion_step', 'region-exports'),
]:
    command = ['cargo', 'run', *C, '-p', 'hyperbrep-io', '--example', example, '--release']
    if folder:
        command += ['--', str(OUT/folder)]
    commands.append((name+'-example', command, {}, 900))
commands += [('fmt', ['cargo', 'fmt', '--all', '--', '--check'], {}, 300), ('diff-check', ['git', 'diff', '--check'], {}, 300)]
source = hashes()
# A BRep-only correction does not invalidate the independently executed owner
# tests. Reuse is explicit and requires identical commands and every owner,
# dependency, test, manifest, lock and admission input. Never reuse BRep/IO
# checks across that correction.
reuse = '--reuse-unaffected-owner' in sys.argv
old_attempts = json.loads((OUT/'attempts.json').read_text()) if reuse else []
owner_crates = ('hypercurve', 'hyperreal', 'hyperlimit', 'hypersolve', 'hyperlattice', 'hypertri')
owner_inputs = lambda inputs: {p: h for p, h in inputs.items()
    if any(p.startswith('crates/'+crate+'/') for crate in owner_crates)
    or p in ['Cargo.toml','Cargo.lock','AGENTS.md','properties.md','docs/admission.md']}
reused = []
failures = []
blocked = []
executed = []
for label, command, extra, seconds in commands:
    candidate = next((row for row in reversed(old_attempts)
        if row['label'] == label and row['exit_code'] == 0
        and row['command'] == command and row['environment'] == extra
        and row['source_unchanged']), None)
    if candidate is not None and (label.startswith('curve-') or label.startswith('owner-compatibility-')):
        previous = json.loads((OUT/candidate['source']).read_text())
        assert owner_inputs(previous) == owner_inputs(source), label
        reused.append(dict(label=label, attempt=candidate['attempt'], source=candidate['source'],
            log=candidate['log'], unchanged_inputs=owner_inputs(source),
            reason='Every owner/test/dependency/manifest/lock/admission input is byte-identical; only downstream BRep/IO and qualification recipes changed.'))
        print('retaining unchanged owner check', label, flush=True)
        code = 0
    else:
        code = run(label, command, seconds, extra)
        executed.append(label)
    assert hashes() == source
    if code:
        row = json.loads((OUT/'attempts.json').read_text())[-1]
        log = (OUT/row['log']).read_text()
        (blocked if label == 'new-debug' and 'FACTORS > 0' in log else failures).append(label)
    (OUT/'qualification-driver.json').write_text(json.dumps(dict(
        source=source, executed=executed, reused_unaffected_owner_checks=reused, failures=failures, upstream_debug_blocked=blocked,
        scope='Affected source-path BREP/IO and shared curve qualification. Not full pre-push, packaging, MSRV, coverage, formal proof, fuzz campaign or general resource bounds.'), indent=2)+'\n')
print('failed:', failures, 'upstream-owned debug blockers:', blocked, flush=True)
raise SystemExit(bool(failures))
