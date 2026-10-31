#!/usr/bin/env python3
"""Preserve only release-check temporary consumer evidence before its normal cleanup."""
from pathlib import Path
import hashlib, json, os, shutil, subprocess, sys, time
args=sys.argv[1:]
if len(args)==2 and args[0]=='-rf':
    source=Path(args[1])
    if source.is_absolute() and source.name.startswith('csgrs-release-check.') and source.is_dir() and not source.is_symlink():
        record=Path(os.environ['CSGRS_CLOSEOUT_TEMP_EVIDENCE'])
        destination=record/source.name
        assert not destination.exists()
        destination.mkdir(parents=True)
        manifest=[]
        for item in sorted(source.rglob('*')):
            relative=item.relative_to(source)
            if item.is_symlink():
                manifest.append({'path':str(relative),'symlink':os.readlink(item),'retained':False,'reason':'External symlink recorded without following it.'})
                continue
            if not item.is_file():continue
            with item.open('rb') as stream:
                magic=stream.read(4);stream.seek(0)
                digest=hashlib.file_digest(stream,'sha256').hexdigest()
            reason=None
            if 'packages' in relative.parts and item.name not in ['Cargo.toml','Cargo.toml.orig','.cargo_vcs_info.json','Cargo.lock']:
                reason='Packaged repository source identified by commit and file digest; avoid duplicating its tree.'
            elif magic in [b'\x7fELF',b'\x00asm'] or item.suffix=='.crate':
                reason='Compiled artifact or package archive retained by digest; consumer source and commands remain retained.'
            if reason is None:
                target=destination/relative;target.parent.mkdir(parents=True,exist_ok=True)
                shutil.copy2(item,target)
                with target.open('rb') as stream:assert hashlib.file_digest(stream,'sha256').hexdigest()==digest
            manifest.append({'path':str(relative),'bytes':item.stat().st_size,'sha256':digest,'retained':reason is None,'reason':reason})
        (record/(source.name+'-capture.json')).write_text(json.dumps({'epoch_ns':time.time_ns(),'original':str(source),'captured_at':str(destination),'files':manifest,'retention':'Consumer sources and manifests copied; package source and compiled artifacts hashed, matching archive_validation.py exclusions.'},indent=2)+'\n')
        print('Closeout: preserved consumer sources and manifests; recorded package and compiled-artifact digests before cleanup',flush=True)
raise SystemExit(subprocess.run(['/usr/bin/rm',*args]).returncode)
