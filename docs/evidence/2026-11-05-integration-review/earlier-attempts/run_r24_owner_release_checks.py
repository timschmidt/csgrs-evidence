"""Run unchanged release workflows on the isolated committed release fixes."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import time

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
TREE = ROOT / 'target/main-release-review-20261105'
parser = argparse.ArgumentParser()
parser.add_argument('sequence', type=int, choices=[117, 118])
args = parser.parse_args()
item = next(x for x in json.loads((HERE / 'plan.json').read_text()) if x['sequence'] == args.sequence)
revision = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=TREE, text=True).strip()
if revision != '952b987fe8b23ace512619fb4b1e63ca9d7c17a5':
    raise SystemExit('Unexpected release-fix revision')
subprocess.run(['git', 'diff', '--exit-code', 'HEAD'], cwd=TREE, check=True)
inputs = json.loads((HERE / 'compiled-input-hashes.json').read_text())
changed = [p for p, h in inputs.items() if hashlib.sha256((TREE / p).read_bytes()).hexdigest() != h]
qualified = json.loads((HERE / 'r24-owner-fix-focused.json').read_text())['changes']
if set(changed) != (set(qualified) & set(inputs)) or any(hashlib.sha256((TREE / p).read_bytes()).hexdigest() != h for p,h in qualified.items()):
    raise SystemExit(f'Unreviewed release-fix source mismatch: {changed}')
compiler = item['env']['RUSTUP_TOOLCHAIN']
env = dict(os.environ, **item['env'])
env.update(
    RUSTUP_TOOLCHAIN=compiler, CCACHE_DISABLE='1', CARGO_INCREMENTAL='0', CARGO_BUILD_JOBS='2',
    CARGO_TERM_COLOR='never', CARGO_TARGET_DIR=str(ROOT / 'target/research-closeout-builds' / (compiler + '-normal')),
    GITHUB_WORKSPACE=str(TREE), RUNNER_TEMP='/tmp/csgrs-prepush-runner-20261105',
    TMPDIR='/tmp/csgrs-prepush-tmp-20261105', GOCACHE=str(HERE / 'tools/go-cache'),
    GOPATH=str(HERE / 'tools/go-path'), npm_config_cache=str(HERE / 'tools/npm-cache'),
)
env['PATH'] = str(HERE / 'tools/bin') + ':' + str(ROOT / 'tests/wasm/node_modules/.bin') + ':' + env['PATH']
attempt = 1 + len(list(HERE.glob(f'r24-owner-release-{args.sequence:03d}-*.log')))
log = HERE / f'r24-owner-release-{args.sequence:03d}-{attempt}.log'
started = time.time()
run_env = {key: env[key] for key in ['RUSTUP_TOOLCHAIN', 'CCACHE_DISABLE', 'CARGO_INCREMENTAL', 'CARGO_BUILD_JOBS', 'CARGO_TARGET_DIR', 'TMPDIR', 'GOCACHE', 'GOPATH']}
print('START', args.sequence, compiler, flush=True)
with log.open('w') as output:
    output.write(json.dumps(dict(item, revision=revision, actual_cwd=str(TREE), run_env=run_env, source_equivalence=dict(clean=True, unchanged_compiled_inputs=len(inputs)-len(changed), reviewed_source_changes=qualified, reason='Isolated committed owner fix for reproduced public trait and release failures; not qualification of unchanged main41fb.'))) + '\n')
    output.flush()
    result = subprocess.run(['bash', '-euo', 'pipefail', '-c', item['command']], cwd=TREE, env=env, stdout=output, stderr=subprocess.STDOUT)
row = dict(sequence=args.sequence, attempt=attempt, revision=revision, id=item['id'], name=item['name'], command=item['command'], cwd=str(TREE.relative_to(ROOT)), env={**item['env'], 'GITHUB_WORKSPACE':str(TREE), 'RUNNER_TEMP':env['RUNNER_TEMP']}, run_env=run_env, started=started, seconds=time.time()-started, exit_code=result.returncode, log=str(log.relative_to(ROOT)), log_sha256=hashlib.sha256(log.read_bytes()).hexdigest(), source_equivalence=dict(clean_initial=True, unchanged_compiled_inputs=len(inputs)-len(changed), reviewed_source_changes=qualified))
with (HERE / 'r24-owner-release-results.jsonl').open('a') as output:
    output.write(json.dumps(row) + '\n')
print('END', args.sequence, result.returncode, round(row['seconds'], 1), flush=True)
if result.returncode:
    print('\n'.join(log.read_text(errors='replace').splitlines()[-20:]), flush=True)
raise SystemExit(result.returncode)
