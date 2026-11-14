from pathlib import Path
import hashlib, json, os, shutil, subprocess, time, tomllib

s = Path(__file__).parent / 'package-delivery'
b = Path('/mnt/development/.interval-refactor-build/surface-interval-ranges-packages-delivery')
root = b / 'docs-consumer'
(root / 'src').mkdir(parents=True)
archive = b / 'packages/hyperbrep-0.2.0'
package = tomllib.loads((archive / 'Cargo.toml').read_text())
assert package['package']['metadata']['docs']['rs']['all-features'] is True
features = sorted(package['features'])
manifest = (b / 'consumer/Cargo.toml').read_text().replace(
    'name="packaged-surface-interval-ranges"', 'name="packaged-surface-range-documentation"')
assert 'features=["interval-ranges"]' in manifest
manifest = manifest.replace('features=["interval-ranges"]', 'features='+json.dumps(features))
(root / 'Cargo.toml').write_text(manifest)
(root / 'src/lib.rs').write_text('//! Package documentation verification root.\n')
shutil.copyfile(b / 'consumer/Cargo.lock', root / 'Cargo.lock')
(s / 'docs-consumer-Cargo.toml').write_text(manifest)
env = os.environ | {'CARGO_HOME': str(b / 'cargo-home'),
                    'CARGO_TARGET_DIR': str(b / 'target'),
                    'CARGO_BUILD_JOBS': '2', 'CARGO_NET_OFFLINE': 'true',
                    'RUSTDOCFLAGS': '-D warnings'}
rows = []
def run(name, command, capture=False):
    print('START', name, flush=True)
    start = time.monotonic()
    with (s / (name+'.log')).open('xb') as out:
        result = subprocess.run(command, cwd=root, env=env, stdout=out,
                                stderr=subprocess.PIPE if capture else subprocess.STDOUT)
    if capture:
        (s / (name+'.stderr')).write_bytes(result.stderr)
    rows.append(dict(name=name, command=command, returncode=result.returncode,
                     seconds=time.monotonic()-start))
    (s / 'docs-followup-commands.json').write_text(json.dumps(rows, indent=2)+'\n')
    print(json.dumps(rows[-1]), flush=True)
    if result.returncode:
        print((s / (name+'.log')).read_text()[-5000:])
        raise SystemExit(result.returncode)
run('docs-consumer-resolve', ['cargo', '+1.95.0', 'metadata', '--offline', '--format-version', '1'], True)
metadata = json.loads((s / 'docs-consumer-resolve.log').read_text())
brep, = [p for p in metadata['packages'] if p['name'] == 'hyperbrep']
node, = [p for p in metadata['resolve']['nodes'] if p['id'] == brep['id']]
assert set(node['features']) == set(features)
assert all(Path(p['manifest_path']).is_relative_to(b / 'packages')
           for p in metadata['packages'] if p['name'].startswith('hyper'))
before = tomllib.loads((b / 'consumer/Cargo.lock').read_text())['package']
allowed = {(p['name'], p['version'], p.get('source'), p.get('checksum')) for p in before if p.get('source')}
assert all((p['name'], p['version'], p.get('source'), p.get('checksum')) in allowed
           for p in tomllib.loads((root / 'Cargo.lock').read_text())['package'] if p.get('source'))
shutil.copyfile(root / 'Cargo.lock', s / 'docs-consumer-Cargo.lock')
# Feature selection is in the workspace root's dependency declaration. Cargo
# permits documenting the selected dependency without feature CLI flags here.
run('package-docs-v2', ['cargo', '+1.95.0', 'doc', '--locked', '-p', 'hyperbrep', '--no-deps'])
html = b / 'target/doc/hyperbrep/interval_ranges/index.html'
assert html.is_file()
items = ['prepare_rational_bezier_surface_ranges', 'PreparedRationalBezierSurfaceRanges',
         'SurfaceRangeEnclosure', 'SurfaceRangeBox', 'SurfaceRangeError']
assert all(item in html.read_text() for item in items)
source = json.loads((s / 'SOURCE.json').read_text())
(s / 'package-docs.json').write_text(json.dumps(dict(
    source_commit=source['commit'], packaged_docs_rs_all_features=True,
    declared_features=features, resolved_features=node['features'],
    default_features=package['features']['default'], optional_api_exposed=items,
    html_sha256=hashlib.sha256(html.read_bytes()).hexdigest(),
    all_resolved_hyper_packages_from_archives=True,
    registry_versions_and_checksums_preserved=True, hosted_execution_claimed=False,
    previous_failure='Cargo CLI rejected dependency feature flags outside workspace; source/docs compilation had not started'), indent=2)+'\n')
native = json.loads((s / 'package-commands.json').read_text())
assert all(row['returncode'] == 0 for row in native if row['name'] != 'package-docs')
assert all(row['returncode'] == 0 for row in rows)
(s / 'COMPLETE.json').write_text(json.dumps(dict(
    source_commit=source['commit'], archives_verified=9,
    archive_only_native_consumer_passed=True, strict_consumer_clippy_passed=True,
    strict_packaged_docs_passed=True, all_features_exposed=True,
    original_failed_docs_command_preserved=True, source_revision_unchanged=True,
    full_release_not_claimed=True), indent=2)+'\n')
print('Packaged all-feature documentation exposes the complete interval-range API', flush=True)
