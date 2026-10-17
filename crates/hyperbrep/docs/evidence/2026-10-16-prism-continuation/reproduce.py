"""Capture current public prism outcomes before changing their implementation."""
import argparse
from pathlib import Path
import shutil
from check import ENV, OUT, run

PROJECT = Path('/tmp/hyperbrep-prism-continuation-probe')
CASES = [(family, slab, rotation, operation)
         for family, slab, rotations, operations in [
             ('cylinder', 'cover', ['identity', 'diagonal', 'rational'], ['difference', 'clear']),
             ('box', 'cover', ['identity'], ['difference']),
             ('box', 'same', ['identity'], ['difference']),
             ('box', 'tiny_upper_gap', ['identity'], ['difference']),
             ('strip', 'cover', ['identity'], ['difference']),
             ('ring', 'cover', ['identity'], ['difference']),
             ('annulus', 'cover', ['identity'], ['difference']),
             *[('cylinder', slab, ['identity'], ['difference']) for slab in [
                 'same', 'lower_equal', 'upper_equal', 'tiny_cover', 'tiny_upper_gap',
                 'tiny_lower_gap', 'interior', 'touch', 'disjoint']],
             ('bore', 'cover', ['identity'], ['difference']),
             ('coaxial_bore', 'cover', ['identity'], ['difference']),
             ('cylinder', 'cover', ['identity'], ['reverse']),
         ] for rotation in rotations for operation in operations]
parser = argparse.ArgumentParser()
parser.add_argument('--only', nargs='+', choices=['-'.join(case) for case in CASES])
parser.add_argument('--skip-build', action='store_true')
parser.add_argument('--prefix', default='baseline')
args = parser.parse_args()
(PROJECT/'src/bin').mkdir(parents=True, exist_ok=True)
for name in ['Cargo.toml', 'Cargo.lock']:
    shutil.copyfile(OUT/'diagnostic-project'/name, PROJECT/name)
(PROJECT/'src/lib.rs').write_text('')
shutil.copyfile(OUT/'prism-frontier.rs.txt', PROJECT/'src/bin/prism.rs')
if not args.skip_build:
    result = run(args.prefix+'-build', ['cargo', 'build', '--offline', '--locked', '--release',
                                  '--manifest-path', str(PROJECT/'Cargo.toml'), '--bin', 'prism'])
    if result:
        raise SystemExit(result)
exports = OUT/(args.prefix+'-artifacts')
exports.mkdir(exist_ok=True)
failures = []
for case in CASES:
    name = '-'.join(case)
    if args.only and name not in args.only:
        continue
    if run(args.prefix+'-'+name, [str(Path(ENV['CARGO_TARGET_DIR'])/'release/prism'),
                             *case, str(exports)], 240):
        failures.append(name)
print('Diagnostic process failures:', failures, flush=True)
print('Typed geometry/export failures remain in their logs; these runs are not semantic admission.', flush=True)
raise SystemExit(bool(failures))
