#!/usr/bin/env python3
"""Preserve only release-check temporary consumer evidence before its normal cleanup."""
from pathlib import Path
import json, os, shutil, subprocess, sys, time
args=sys.argv[1:]
if len(args)==2 and args[0]=='-rf':
    source=Path(args[1])
    if source.is_absolute() and source.name.startswith('csgrs-release-check.') and source.is_dir() and not source.is_symlink():
        record=Path(os.environ['CSGRS_CLOSEOUT_TEMP_EVIDENCE'])
        destination=record/source.name
        assert not destination.exists()
        shutil.copytree(source,destination,symlinks=True)
        manifest=[{'path':str(f.relative_to(destination)),'bytes':f.stat().st_size} for f in destination.rglob('*') if f.is_file() and not f.is_symlink()]
        (record/(source.name+'-capture.json')).write_text(json.dumps({'epoch_ns':time.time_ns(),'original':str(source),'captured_at':str(destination),'files':manifest},indent=2)+'\n')
        print('Closeout: preserved packaged consumer sources and outputs before cleanup',flush=True)
raise SystemExit(subprocess.run(['/usr/bin/rm',*args]).returncode)
