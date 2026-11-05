"""Lint additional CI feature/manifest/target configurations, beyond explicit lint steps."""
import json
import pathlib
import shlex

OUT = pathlib.Path(__file__).resolve().parent
plan = json.loads((OUT / 'plan.json').read_text())
extra = []
seen = set()

def add(command, cwd, env, source):
    key = (command, cwd, env.get('RUSTUP_TOOLCHAIN', 'stable'))
    if key in seen:
        return
    seen.add(key)
    extra.append(dict(sequence=200 + len(extra), id='additional-clippy/' + source, name=command, command=command, cwd=cwd, env=env.copy()))

def convert(command, env):
    for variable in ['CRATE', 'ARGS', 'CARGO_ARGS']:
        command = command.replace('${' + variable + '}', env.get(variable, ''))
    tokens = shlex.split(command)
    if not tokens or tokens[0] != 'cargo':
        return None
    if tokens[1] == 'hack':
        return 'cargo hack clippy --feature-powerset --exclude-features all-algorithms --all-targets -- -D warnings'
    if tokens[1] not in ['check', 'test', 'build', 'bench', 'run', 'doc']:
        return None
    args = ['cargo', 'clippy', '--locked']
    flags = {'--no-default-features', '--all-features', '--all-targets', '--workspace', '--lib', '--bins', '--benches', '--tests', '--release'}
    values = {'--features', '-F', '-p', '--package', '--manifest-path', '--target', '--example', '--bin', '--profile'}
    index = 2
    while index < len(tokens):
        token = tokens[index]
        if token == '--':
            break
        if token in flags:
            args.append(token)
        elif token in values:
            args += [token, tokens[index + 1]]
            index += 1
        elif any(token.startswith(v + '=') for v in values):
            args.append(token)
        elif token == '${CARGO_ARGS}':
            args.append(token)
        index += 1
    if '--target' not in args and not any(a in args for a in ['--lib', '--bins', '--benches', '--tests', '--all-targets', '--example', '--bin']):
        if tokens[1] == 'test':
            args.append('--tests')
        elif tokens[1] == 'bench':
            args.append('--benches')
    return ' '.join(a if a == '${CARGO_ARGS}' else shlex.quote(a) for a in args) + ' -- -D warnings'

for item in plan:
    for line in item['command'].splitlines():
        result = convert(line, item['env'])
        if result:
            add(result, item['cwd'], item['env'], item['id'])

# Configuration helpers nested inside the CI scripts.
for crate in ['hypersolve', 'hypertri']:
    for args in ['--no-default-features', '--no-default-features --features hyperreal/cached-f32-approx', '--no-default-features --features hyperreal/cached-f64-approx', '--all-features --features hyperreal/cached-f32-approx,hyperreal/cached-f64-approx']:
        if crate == 'hypertri':
            args += ' --features all-algorithms,runtime-select'
        add('cargo clippy --locked --all-targets ' + args + ' -- -D warnings', 'crates/' + crate, {'RUSTUP_TOOLCHAIN': 'stable'}, crate + '/representation-script')
for tc in ['stable', '1.95.0']:
    add('cargo clippy --locked --workspace --all-targets -- -D warnings', '.', {'RUSTUP_TOOLCHAIN': tc}, 'workspace-and-release/' + tc)
    add('cargo clippy --locked -p hyperspatial --no-default-features --tests -- -D warnings', '.', {'RUSTUP_TOOLCHAIN': tc}, 'hyperspatial-native/' + tc)
    add('cargo clippy --locked -p hyperspatial --all-targets --all-features -- -D warnings', '.', {'RUSTUP_TOOLCHAIN': tc}, 'hyperspatial-native/' + tc)
    add('cargo clippy --locked --manifest-path crates/hyperspatial/fuzz/Cargo.toml --bins -- -D warnings', '.', {'RUSTUP_TOOLCHAIN': tc}, 'hyperspatial-fuzz/' + tc)
    for crate in ['hyperreal', 'hyperlattice', 'hyperlimit']:
        add('cargo clippy --locked -p ' + crate + ' --all-targets --all-features -- -D warnings', '.', {'RUSTUP_TOOLCHAIN': tc}, 'hyperspatial-prerequisites/' + tc)
for args in ['--no-default-features', '--no-default-features --features hyperreal/cached-f32-approx', '--no-default-features --features hyperreal/cached-f64-approx', '--all-features --features hyperreal/cached-f32-approx,hyperreal/cached-f64-approx']:
    for crate in ['hyperspatial', 'hyperreal', 'hyperlattice', 'hyperlimit']:
        # serde is used by the native prerequisites; include the same cache layouts.
        features = ' --features serde' if crate != 'hyperspatial' else ''
        add('cargo clippy --locked -p ' + crate + ' --all-targets ' + args + features + ' -- -D warnings', '.', {'RUSTUP_TOOLCHAIN': 'stable'}, 'hyperspatial-representations')
for features in ['curve', 'curve stl-io dxf-io obj-io ply-io amf-io gltf-io gerber-io metaballs sdf offset']:
    add('cargo clippy --locked --no-default-features --features ' + shlex.quote(features) + ' -- -D warnings', '.', {'RUSTUP_TOOLCHAIN': 'stable'}, 'adversarial-feature-configs')
for args in ['--no-default-features', '--no-default-features --features runtime-select', '--no-default-features --features earcut,runtime-select', '--no-default-features --features cdt,runtime-select', '--all-features']:
    add('cargo clippy --locked --tests ' + args + ' -- -D warnings', 'crates/hypertri', {'RUSTUP_TOOLCHAIN': 'stable'}, 'coverage-configs')
(OUT / 'lint-plan.json').write_text(json.dumps(extra, indent=2) + '\n')
print('Additional Clippy configurations:', len(extra))
