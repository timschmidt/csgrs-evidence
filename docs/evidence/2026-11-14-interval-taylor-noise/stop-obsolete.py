from pathlib import Path
import os,signal,json,time
s=Path(__file__).parent
entries={}
for p in Path('/proc').iterdir():
 if not p.name.isdigit():continue
 try:
  args=(p/'cmdline').read_bytes().split(b'\0');stat=(p/'stat').read_text().rsplit(')',1)[1].split();entries[int(p.name)]=(int(stat[1]),args)
 except (OSError,IndexError):pass
roots=[pid for pid,(_,args) in entries.items() if len(args)>2 and args[1]==str(s/'run-validation.py').encode() and args[2] in [b'msrv',b'stable']]
assert len(roots)==2,roots
victims=set(roots)
while True:
 more={pid for pid,(parent,_) in entries.items() if parent in victims}-victims
 if not more:break
 victims|=more
for pid in victims:
 try:os.kill(pid,signal.SIGSTOP)
 except ProcessLookupError:pass
for pid in victims:
 try:os.kill(pid,signal.SIGTERM);os.kill(pid,signal.SIGCONT)
 except ProcessLookupError:pass
(s/'first-validation-interruption.json').write_text(json.dumps(dict(reason='source review found loss of original residual identity after affine duplication; stop obsolete candidate before targeted reproduction and repair',roots=roots,processes=sorted(victims),signal='SIGTERM after stopping process tree; not timeout'),indent=2)+'\n')
print('stopped obsolete candidate validation trees',roots)
