"""Run recorded local CI commands, preserving every attempt and raw log."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import time

OUT = Path(__file__).resolve().parent
WORKSPACE = OUT.parents[1]
ROOT = Path('/tmp/csgrs-main-qualified-20261105')
TOOLS = WORKSPACE / 'target/prepush-20261105/tools'
SOURCE = json.loads((OUT / 'source-inputs.json').read_text())
def verify_source():
    changed = [p for p,h in SOURCE.items() if hashlib.sha256((ROOT / p).read_bytes()).hexdigest() != h]
    if changed: raise SystemExit(f'Final source changed: {changed}')
verify_source()
parser = argparse.ArgumentParser()
parser.add_argument('--start', type=int, default=1)
parser.add_argument('--end', type=int, default=10000)
parser.add_argument('--only-failed', action='store_true')
parser.add_argument('--plan', default='plan.json')
parser.add_argument('--sequences')
parser.add_argument('--target-dir')
args = parser.parse_args()
plan = json.loads((OUT / args.plan).read_text())
base = dict(os.environ, CCACHE_DISABLE='1', CARGO_INCREMENTAL='0', CARGO_BUILD_JOBS='2', CARGO_TERM_COLOR='never')
base['PATH'] = str(TOOLS / 'bin') + ':' + base['PATH']
base['CARGO_TARGET_DIR'] = str(WORKSPACE / 'target')
(OUT / 'artifacts').mkdir(exist_ok=True)
scratch = Path('/tmp/csgrs-prepush-tmp-20261105')
scratch.mkdir(exist_ok=True)
base['TMPDIR'] = str(scratch)
base['GOCACHE'] = str(TOOLS / 'go-cache')
base['GOPATH'] = str(TOOLS / 'go-path')
base['npm_config_cache'] = str(TOOLS / 'npm-cache')
results = OUT / 'results.jsonl'
previous = {}
if results.exists():
    for line in results.read_text().splitlines():
        result = json.loads(line)
        previous[result['sequence']] = result
source_revision = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip()
for item in plan:
    sequence = item['sequence']
    if args.sequences and sequence not in {int(s) for s in args.sequences.split(',')}:
        continue
    if not args.start <= sequence <= args.end:
        continue
    prior = previous.get(sequence, {})
    if args.only_failed and prior.get('exit_code') == 0 and prior.get('env') == item['env'] and prior.get('revision') == source_revision and prior.get('command') == item['command']:
        continue
    attempt = 1 + sum(1 for p in OUT.glob(f'{sequence:03d}-*.log'))
    log = OUT / f'{sequence:03d}-{attempt}.log'
    env = dict(base, **item['env'])
    if 'CARGO_TARGET_DIR' not in item['env']:
        compiler = item['env'].get('RUSTUP_TOOLCHAIN', '1.99.1')
        reusable = WORKSPACE / 'target/research-closeout-builds' / (compiler + '-normal')
        if reusable.is_dir():
            env['CARGO_TARGET_DIR'] = str(reusable)
    if args.target_dir:
        env['CARGO_TARGET_DIR'] = str(WORKSPACE / args.target_dir)
    command = item['command']
    # Install local tools without changing the user's installed CLI versions.
    if 'cargo install' in command or 'cargo +stable install' in command:
        command = command.replace('install --locked', 'install --root "$PREPUSH_TOOL_ROOT" --locked')
        env['PREPUSH_TOOL_ROOT'] = str(TOOLS)
    print(f"START {sequence:03d} {item['id']} {item['name']}", flush=True)
    started = time.time()
    with log.open('w') as output:
        run_env = {key: env[key] for key in ['RUSTUP_TOOLCHAIN', 'CCACHE_DISABLE', 'CARGO_INCREMENTAL', 'CARGO_BUILD_JOBS', 'CARGO_TARGET_DIR', 'TMPDIR', 'GOCACHE', 'GOPATH']}
        output.write(json.dumps(dict(item, effective_command=command, revision=source_revision, run_env=run_env)) + '\n')
        output.flush()
        completed = subprocess.run(['bash', '-euo', 'pipefail', '-c', command], cwd=ROOT / item['cwd'], env=env, stdout=output, stderr=subprocess.STDOUT)
    verify_source()
    result = dict(source_inputs=len(SOURCE), source_unchanged=True, actual_cwd=str(ROOT / item['cwd']), sequence=sequence, attempt=attempt, revision=source_revision, id=item['id'], name=item['name'], command=command, cwd=item['cwd'], env=item['env'], run_env=run_env, started=started, seconds=time.time()-started, exit_code=completed.returncode, log=str(log.relative_to(WORKSPACE)), log_sha256=hashlib.sha256(log.read_bytes()).hexdigest())
    with results.open('a') as output:
        output.write(json.dumps(result) + '\n')
    print(f"END {sequence:03d} exit={completed.returncode} seconds={result['seconds']:.1f} log={log.name}", flush=True)
    if completed.returncode:
        print('\n'.join(log.read_text(errors='replace').splitlines()[-14:]), flush=True)
