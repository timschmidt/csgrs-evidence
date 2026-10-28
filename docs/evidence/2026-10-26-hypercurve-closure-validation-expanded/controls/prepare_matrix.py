from pathlib import Path
import itertools, json, re, shlex, time

HERE = Path(__file__).resolve().parent
inventory = json.loads((HERE / 'workflow-inventory.json').read_text())
steps, setup = [], []

def variants(matrix):
    keys = [k for k in matrix if k not in ('include', 'exclude')]
    original = [dict(zip(keys, values)) for values in itertools.product(*(matrix[k] for k in keys))] if keys else []
    rows = [dict(row) for row in original]
    for extra in matrix.get('include', []):
        matches = [i for i, row in enumerate(original) if all(k not in row or row[k] == v for k, v in extra.items())]
        if matches:
            for i in matches: rows[i].update(extra)
        else: rows.append(dict(extra))
    rows = [row for row in rows if not any(all(row.get(k) == v for k, v in excluded.items()) for excluded in matrix.get('exclude', []))]
    return rows or [{}]

def expand(value, matrix):
    if not isinstance(value, str): return str(value)
    def replace(match):
        key = match[1].strip()
        if key == 'steps.pages.outputs.base_path': return '/csgrs'
        assert key.startswith('matrix.'), key
        item = matrix
        for part in key.split('.')[1:]: item = item.get(part, '') if isinstance(item, dict) else ''
        return str(item)
    return re.sub(r'\$\{\{\s*(.*?)\s*\}\}', replace, value)

for job in inventory['jobs']:
    for variant, matrix in enumerate(variants(job['matrix'])):
        workflow = Path(job['workflow']).stem
        toolchain = str(matrix.get('toolchain', '1.95.0' if job['job'] == 'msrv' else 'stable'))
        env = {'RUSTUP_TOOLCHAIN': toolchain}
        for source in [job['workflow_env'], job['job_env']]: env.update({k: expand(v, matrix) for k, v in source.items()})
        for step in job['steps']:
            origin = {'workflow': job['workflow'], 'job': job['job'], 'matrix': matrix, 'step': step['index'], 'name': step['name']}
            if 'run' not in step:
                if 'crate-ci/typos@' in step.get('uses', ''):
                    command = 'typos'
                else:
                    setup.append({**origin, **step, 'handling': 'Inspect hosted action or verify locally installed prerequisite; no deployment/publication performed by validation.'})
                    continue
            else: command = expand(step['run'], matrix)
            step_env = {**env, **{k: expand(v, matrix) for k, v in step.get('env', {}).items()}}
            if command.startswith('rustup toolchain install'):
                setup.append({**origin, 'command': command, 'handling': 'Installed toolchain/targets/components verified separately; do not change user default toolchain.'})
                continue
            if command.startswith('cargo install --locked --version 0.2.126 wasm-bindgen-cli'):
                setup.append({**origin, 'command': command.splitlines()[0], 'handling': 'Pinned wasm-bindgen 0.2.126 binary copied and hashed; version checked.'})
                command = '\n'.join(command.splitlines()[1:])
            cwd = step.get('working_directory') or job['defaults'].get('run', {}).get('working-directory', '.')
            if command.strip() == '$COMMAND': command = step_env['COMMAND']
            for key, value in step_env.items():
                command = command.replace('${' + key + '}', value)
            identifier = f'{workflow}-{job["job"]}-{variant}-{step["index"]}'
            steps.append({'id': identifier, 'origin': origin, 'cwd': cwd, 'command': command, 'env': step_env,
                          'target_group': f'{toolchain}-' + (workflow + '-coverage' if job['job'] == 'coverage' else 'normal'),
                          'kind': 'workflow', 'timeout_seconds': 21600})

# Every Cargo feature/manifest/target combination in the workflows also gets
# strict Clippy. Script-internal configurations are supplied explicitly below.
lint_keys = set()
lint_steps = []
def lint(cwd, command, env, origin, target_group=None):
    argv = shlex.split(command)
    if not argv or argv[0] != 'cargo': return
    if len(argv) > 1 and argv[1].startswith('+'): argv.pop(1)
    if argv[1:3] == ['hack', 'check'] or argv[1:3] == ['hack', 'test']:
        args = ['cargo', 'hack', 'clippy'] + argv[3:]
        if '--all-targets' not in args: args.append('--all-targets')
        args += ['--', '-D', 'warnings']
    else:
        if argv[1] not in ['check', 'test', 'build', 'doc', 'bench', 'clippy', 'run']: return
        args = ['cargo', 'clippy']
        valued = {'-p', '--package', '--manifest-path', '--features', '-F', '--target', '--profile'}
        flags = {'--locked', '--offline', '--all-features', '--no-default-features', '--workspace', '--release', '--lib', '--bins', '--benches', '--examples', '--tests', '--all-targets'}
        i = 2
        while i < len(argv):
            arg = argv[i]
            if arg == '--': break
            if arg in valued:
                args += argv[i:i+2]; i += 2; continue
            if arg in ['--bin', '--bench', '--test', '--example']:
                args += argv[i:i+2]; i += 2; continue
            if arg in flags: args.append(arg)
            i += 1
        if not any(x in args for x in ['--lib','--bins','--benches','--examples','--tests','--all-targets','--bin','--bench','--test','--example']):
            # Preserve Cargo's build/check/doc target surface. In particular,
            # a WASM application build must not acquire native test-only deps.
            if argv[1]=='test':args.append('--tests')
            elif argv[1]=='bench':args.append('--benches')
        args += ['--', '-D', 'warnings']
    # Ignore shell-variable commands here; the explicit configurations below
    # cover script functions and the two workflow variable argument vectors.
    if any('$' in x for x in args): return
    lint_env = {k:v for k,v in env.items() if k not in ['COMMAND','CARGO_ARGS','CRATE','ARGS']}
    key = (cwd, tuple(args), tuple(sorted(lint_env.items())))
    if key in lint_keys: return
    lint_keys.add(key)
    lint_steps.append({'id':f'extra-clippy-{len(lint_steps):03}', 'origin':origin, 'cwd':cwd,
                       'command':shlex.join(args), 'env':lint_env, 'target_group':target_group or lint_env.get('RUSTUP_TOOLCHAIN','stable')+'-normal',
                       'kind':'strict-clippy', 'timeout_seconds':21600})

for step in steps:
    command = step['command'].replace('\\\n', ' ')
    for key,value in step['env'].items():
        command = command.replace('${'+key+'}',value).replace('$'+key,value)
    for line in command.splitlines():
        if line.startswith('cargo '): lint(step['cwd'],line,step['env'],step['origin'],step['target_group'])

stable={'RUSTUP_TOOLCHAIN':'stable'}
manual=[]
def manual_config(cwd,cmd,toolchains=('stable',)):
    for toolchain in toolchains: manual.append((cwd,cmd,{'RUSTUP_TOOLCHAIN':toolchain}))
manual_config('.', 'cargo check --no-default-features --features curve')
manual_config('.', 'cargo check --no-default-features --features "curve stl-io dxf-io obj-io ply-io amf-io gltf-io gerber-io metaballs sdf offset"')
manual_config('.', 'cargo build --profile wasm --target wasm32-unknown-unknown --no-default-features --features wasm')
for toolchain in ['stable','1.95.0']:
    for cmd in ['cargo test -p hyperspatial --no-default-features', 'cargo check -p hyperspatial --all-targets --all-features', 'cargo check --manifest-path crates/hyperspatial/fuzz/Cargo.toml --bins']:
        manual_config('.',cmd,(toolchain,))
for flags in ['--no-default-features','--no-default-features --features hyperreal/cached-f32-approx','--no-default-features --features hyperreal/cached-f64-approx','--all-features --features hyperreal/cached-f32-approx,hyperreal/cached-f64-approx']:
    manual_config('crates/hypersolve','cargo test --test real_representations '+flags)
    for package in ['hyperspatial','hyperreal','hyperlattice','hyperlimit']:
        targets={'hyperspatial':'--tests','hyperreal':'--test jacobi --test jacobi_prepared --test atan2_right_half_plane --test bounded_parameter_encodings','hyperlattice':'--test complex_jacobi --test jacobi_epsilon --test complex_atanh','hyperlimit':'--test real_representations'}[package]
        manual_config('.', 'cargo test -p '+package+' '+targets+' '+flags+(' --features serde' if package!='hyperspatial' else ''))
for flags in ['--no-default-features --features all-algorithms,runtime-select','--no-default-features --features all-algorithms,runtime-select,hyperreal/cached-f32-approx','--no-default-features --features all-algorithms,runtime-select,hyperreal/cached-f64-approx','--all-features --features hyperreal/cached-f32-approx,hyperreal/cached-f64-approx']:
    manual_config('crates/hypertri','cargo test --test real_representations '+flags)
manual_config('.', 'cargo test -p hyperreal --lib --tests --no-default-features --features serde,dispatch-trace')
manual_config('.', 'cargo build --release -p hyperspatial --example e1_probe --features dispatch-trace')
for crate in ['hypercurve','hypermesh','hypertri']:
    manual_config(f'crates/{crate}/examples/{crate}_ui','cargo build --release --target wasm32-unknown-unknown')
# Release package consumers and docs.rs configurations use these package-local
# feature sets. Resolve the metadata after the clean closeout checkout exists.
for cwd,cmd,env in manual: lint(cwd,cmd,env,{'script_internal':True})

(HERE/'matrix.json').write_text(json.dumps({'created_ns':time.time_ns(),'steps':steps,'extra_clippy':lint_steps,'setup_and_hosted_actions':setup,
    'notes':['Installed tool prerequisites are checked separately.','Workflow step commands retain configured arguments and limits; no test/coverage threshold is reduced.','Final release docs.rs and examples feature configurations are appended from Cargo metadata.','Hypercurve release step may cite an exact equivalent completed R19 run after source attribution.','No new research experiment: directed and ASan runs are the existing mandatory workflow validation.']},indent=2)+'\n')
print('Workflow steps',len(steps),'additional strict Clippy steps',len(lint_steps),'setup/hosted actions',len(setup))
