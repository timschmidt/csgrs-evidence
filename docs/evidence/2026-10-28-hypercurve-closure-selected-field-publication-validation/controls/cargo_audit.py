#!/usr/bin/env python3
"""Run Cargo unchanged, audit its configuration, and lint temporary consumers."""
from pathlib import Path
import json, os, subprocess, sys, time

requested=sys.argv[1:]
arguments=[('+'+os.environ['CSGRS_CLOSEOUT_NIGHTLY']) if a=='+nightly' else ('+'+os.environ['CSGRS_CLOSEOUT_STABLE']) if a=='+stable' else a for a in requested]
real=os.environ['CSGRS_CLOSEOUT_REAL_CARGO']
journal=Path(os.environ['CSGRS_CLOSEOUT_CARGO_AUDIT'])
def record(event,argv,status=None):
    row={'epoch_ns':time.time_ns(),'event':event,'cwd':os.getcwd(),'arguments':argv,
         'requested_arguments':requested,'toolchain':os.environ.get('RUSTUP_TOOLCHAIN'),'target_dir':os.environ.get('CARGO_TARGET_DIR')}
    if status is not None:row['status']=status
    with journal.open('a') as out:out.write(json.dumps(row)+'\n')
record('start',arguments)
result=subprocess.run([real,*arguments])
record('finish',arguments,result.returncode)
if result.returncode:raise SystemExit(result.returncode)
index=1 if arguments and arguments[0].startswith('+') else 0
command=arguments[index] if len(arguments)>index else ''
manifest=Path.cwd()/'Cargo.toml'
if '--manifest-path' in arguments:manifest=Path(arguments[arguments.index('--manifest-path')+1]).resolve()
temporary=any(part.startswith(('csgrs-release-check.','hyperspatial-consumer-')) for part in manifest.parts)
if temporary and command in ['build','run']:
    lint=list(arguments)
    lint[index]='clippy'
    if '--' in lint:lint=lint[:lint.index('--')]
    lint+=['--','-D','warnings']
    print('Closeout: strict Clippy for temporary consumer',manifest,flush=True)
    record('temporary-consumer-clippy-start',lint)
    result=subprocess.run([real,*lint])
    record('temporary-consumer-clippy-finish',lint,result.returncode)
    raise SystemExit(result.returncode)
