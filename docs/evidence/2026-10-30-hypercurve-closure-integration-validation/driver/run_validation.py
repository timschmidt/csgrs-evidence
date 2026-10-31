from pathlib import Path
import argparse, json, subprocess, sys, time

# Runs the unchanged pre-push matrix driver against an isolated clean checkout
# of the integration candidate, phase by phase, stopping at the first failure.
here = Path(__file__).resolve().parent
work = here.parents[1]
parser = argparse.ArgumentParser()
parser.add_argument('mode', choices=['normal', 'directed'])
parser.add_argument('--phases', default=None, help='comma-separated subset of phases')
args = parser.parse_args()
checkout = (here / args.mode).resolve()
head = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip()
assert not subprocess.check_output(['git', 'status', '--porcelain'], cwd=checkout, text=True).strip()
phases = ['quick', 'lint', 'workflow', 'release'] if args.mode == 'normal' else ['workflow']
if args.phases:
    phases = [p for p in phases if p in args.phases.split(',')]
build_root = work / ('research-closeout-builds' if args.mode == 'normal' else 'research-closeout-directed-expanded-builds')
only = '^(?!hyperspatial-directed-)' if args.mode == 'normal' else '^hyperspatial-directed-'
rows = []
for phase in phases:
    command = [sys.executable, str(here / 'driver.py'), '--checkout', str(checkout), '--phase', phase,
               '--build-root', str(build_root), '--only', only]
    print('START', args.mode, phase, head, flush=True)
    started = time.time()
    with (here / f'{args.mode}-{phase}-controller.log').open('w') as log:
        result = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT)
    row = {'mode': args.mode, 'phase': phase, 'head': head, 'command': command,
           'exit_code': result.returncode, 'elapsed_seconds': time.time() - started}
    rows.append(row)
    (here / f'{args.mode}-phases.json').write_text(json.dumps(rows, indent=2) + '\n')
    print('FINISH', row, flush=True)
    if result.returncode:
        raise SystemExit(result.returncode)
print('MODE COMPLETE', args.mode, head, flush=True)
