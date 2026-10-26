from pathlib import Path
import hashlib,json,time

root=Path('/home/tim/Documents/GitHub/workspace/csgrs')
raw=Path('/tmp/csgrs-research-2026-10-25')
verification=json.loads((raw/'post-archive/r19-verification.json').read_text())
meta=json.loads((raw/'r19-archive.json').read_text())
record,files,size,digest=verification['record_row'].split('\t')
assert verification['verified_local_records']==17
ledger=root/'docs/evidence-archive.md';text=ledger.read_text()
old='The latest local follow-on commit is\n`e9b57b21802b18371d062a1a38303cbc8176acc5`, adding'
assert text.count(old)==1
new=f'''The latest local follow-on commit is
`{meta['commit']}`, adding
`{record}` ({int(files):,} files, {int(size):,} bytes), with
SHA-256 `{digest}`.
It records cold exact-domain continuation, 303 newly exact public consumer
cells, unchanged cold BRep archive replay, failed prototypes, resource limits,
all 20 passing final checks, and the measured adverse construction costs.
Performance-only admission fails. All seventeen research records verify at
this commit; historical paths and published `main` remain unchanged.

Its parent is
`e9b57b21802b18371d062a1a38303cbc8176acc5`, adding'''
ledger.write_text(text.replace(old,new))
program=root/'docs/research-program.md';text=program.read_text()
intro='''The research program is paused at the maintainer's request on 26 October
2026. R19 is the final admitted experiment in this run; the remaining entries
keep their open scope. R20 received read-only preparation, with no candidate,
measurement campaign or admission. The exact curve and BRep closure plans and
agent instructions are retained as requirements, not completed implementations.
The milestone narratives below describe their original validation checkpoints;
publication status is maintained in the [evidence index](evidence-archive.md).
The separate repository-wide pre-push checks are part of closing out this run.

'''
assert intro not in text
text=text.replace('# Research program, October 2026\n\n','# Research program, October 2026\n\n'+intro,1)
text=text.replace('In progress: combined owner/downstream suites running; final interactions, holdout and release gates remain open.','R19 combined owner/downstream suites pass. Broader interactions, holdout and release admission remain open; the research program is paused.')
program.write_text(text)
out=raw/'closeout/r19-ledger-finalization.json'
assert not out.exists()
out.write_text(json.dumps({'epoch_ns':time.time_ns(),'archive':verification,'files':{str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in [ledger,program]},'research_status':'paused by user; closeout validation and push pending'},indent=2)+'\n')
print('R19 archive indexed; research pause recorded.')
