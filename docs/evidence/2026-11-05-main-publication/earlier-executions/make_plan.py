import itertools
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[2]
OUT = pathlib.Path(__file__).resolve().parent
source = json.load(open('/tmp/csgrs-prepush-workflow-commands.json'))
plan, setup, actions = [], [], []
for workflow in source:
    for job in workflow['jobs']:
        matrix = job['matrix'] or {}
        dimensions = {k: v for k, v in matrix.items() if k not in ('include', 'exclude')}
        rows = [dict(zip(dimensions, p)) for p in itertools.product(*dimensions.values())] if dimensions else []
        for inc in matrix.get('include', []):
            matches = [r for r in rows if dimensions and all(k not in dimensions or r[k] == v for k, v in inc.items())]
            if matches:
                for row in matches:
                    row.update(inc)
            else:
                rows.append(inc.copy())
        for row in rows or [{}]:
            def expand(value):
                def lookup(match):
                    value = row
                    for key in match[1].split('.')[1:]:
                        value = value.get(key, '') if isinstance(value, dict) else ''
                    return str(value)
                return re.sub(r'\$\{\{\s*(matrix\.[\w.]+)\s*\}\}', lookup, str(value))

            env = {k: expand(v) for src in (workflow['env'], job['env']) for k, v in src.items()}
            toolchain = env.get('RUSTUP_TOOLCHAIN', 'stable')
            defaultwd = job['defaults'].get('run', {}).get('working-directory', workflow['defaults'].get('run', {}).get('working-directory', '.'))
            for step in job['steps']:
                ident = f"{pathlib.Path(workflow['file']).stem}/{job['id']}/{json.dumps(row, sort_keys=True)}"
                if step.get('if') == "matrix.backend.name == 'default'" and row['backend']['name'] != 'default':
                    continue
                if 'run' not in step:
                    if 'uses' in step:
                        actions.append(dict(id=ident, step=step))
                    continue
                command = expand(step['run']).replace('\\\n', ' ')
                step_env = {**env, **{k: expand(v) for k, v in step.get('env', {}).items()}}
                selected = re.search(r'rustup default ([\w.\-]+)', command)
                if selected:
                    toolchain = selected[1]
                if 'TOOLCHAIN' in step_env:
                    toolchain = step_env['TOOLCHAIN']
                step_env['RUSTUP_TOOLCHAIN'] = toolchain
                if 'rustup ' in command:
                    setup.append(dict(id=ident, command=command, env=step_env))
                    command = re.sub(r'rustup toolchain install [^\n]*\n?', '', command)
                    command = re.sub(r'rustup default [^\n]+\n?', '', command).strip()
                if not command:
                    continue
                if command.strip() == '$COMMAND':
                    command = step_env['COMMAND']
                if 'steps.pages.outputs.base_path' in str(step_env):
                    step_env['BASE_PATH'] = '/csgrs'
                step_env['GITHUB_WORKSPACE'] = str(ROOT)
                step_env['RUNNER_TEMP'] = str(OUT / 'artifacts')
                if 'coverage' in job['id']:
                    step_env['CARGO_TARGET_DIR'] = str(OUT / ('coverage-' + pathlib.Path(workflow['file']).stem))
                plan.append(dict(id=ident, name=step.get('name', command.splitlines()[0]), command=command, cwd=step.get('working-directory', defaultwd), env=step_env))

plan.append(dict(id='rust/spelling/local', name='Spelling', command='typos', cwd='.', env={'RUSTUP_TOOLCHAIN': 'stable'}))

def priority(item):
    command = item['command']
    if 'cargo fmt' in command and 'cargo test' not in command:
        return 0
    if 'clippy' in command and 'scripts/' not in command:
        return 1
    if command.startswith('cargo check') or command.startswith('cc ') or 'repository-budget' in command:
        return 2
    if 'cargo install' in command or 'npm ci' in command:
        return 3
    return 4

plan.sort(key=priority)
for index, item in enumerate(plan, 1):
    item['sequence'] = index
for name, value in [('plan', plan), ('setup', setup), ('actions', actions)]:
    (OUT / (name + '.json')).write_text(json.dumps(value, indent=2) + '\n')
print('Commands:', len(plan), 'setup blocks:', len(setup), 'actions:', len(actions))
for item in plan:
    print(item['sequence'], item['id'], item['cwd'], item['command'].replace('\n', ' / ')[:210])
