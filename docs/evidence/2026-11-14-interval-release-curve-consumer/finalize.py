from pathlib import Path
import subprocess,json,time,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs');rows=[]
for name,cmd in [('main-syntax',['bash','-n','scripts/release-check.sh']),('main-shellcheck',['shellcheck','-x','scripts/release-check.sh']),('main-format',['cargo','+1.95.0','fmt','--all','--','--check']),('main-budget',['bash','scripts/check-repository-budget.sh']),('main-diff',['git','diff','--check'])]:
 start=time.monotonic()
 with (s/(name+'.log')).open('wb') as f:p=subprocess.run(cmd,cwd=r,stdout=f,stderr=subprocess.STDOUT)
 rows.append({'name':name,'command':cmd,'returncode':p.returncode,'seconds':time.monotonic()-start});(s/'main-checks.json').write_text(json.dumps(rows,indent=2)+'\n');assert p.returncode==0,name
baseline=json.loads((s/'initial-repositories.json').read_text());source=json.loads((s/'SOURCE.json').read_text());repos={}
for name,old in baseline.items():
 def git(*a):return subprocess.check_output(['git','-C',old['path'],*a])
 new={'path':old['path'],'head':git('rev-parse','HEAD').decode().strip(),'status':git('status','--porcelain').decode(),'staged_sha256':hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),'unstaged_sha256':hashlib.sha256(git('diff','--binary')).hexdigest()}
 expected=old|({'head':source['commit']} if name=='csgrs' else {})
 assert new==expected,(name,new,expected)
 repos[name]=new
(s/'final-repositories.json').write_text(json.dumps(repos,indent=2)+'\n')
q=json.loads((s/'QUALIFICATION.json').read_text())
(s/'COMPLETION.md').write_text('''# Retained maintained archive consumer

Both complete release checks passed on the clean committed candidate.
Each verified 21 packages, documented 21 workspace feature configurations,
and executed all 27 clients. The new archive example is unchanged from its
qualified source and was also independently rerun on both built binaries:
four parameter-cell reports and successful native evidence consumption.

The only external consumer dependency declaration change is enabling
Hypercurve interval-ranges; all previous 26 clients remain. Shell syntax,
ShellCheck, Rust formatting, diff and repository budget checks passed before
and after integration. No production Rust source, example, workflow, repository manifest, version
or repository dependency declaration was changed.

The isolated pre-edit negative fixture initially also lacked dependent solver
features. Its original three diagnostics are retained. A focused control
enables the solver feature set already present through Hyperdynamics field;
then only the Hypercurve feature rejects the import, and enabling it succeeds.
These controls use current workspace library sources. Archive qualification
comes from the two complete release runs, not from those negative controls.

Both release commands ran concurrently, so their elapsed times are not a
performance comparison. Binary sizes are absolute debug-build observations.
Per-client files captured while the pipeline was running are snapshots and
may be partial; the full release log and its zero exit establish the complete
27-client result. Separate final curve-example logs have all four cells.

Integration retained the staged pending patch byte for byte and left both
Alumina repositories unchanged. The full goal and every phase remain open.
See REMAINING-GAPS.md. No full pre-push matrix, push or publication performed.
''')
print('main checks passed and all pending/sibling states preserved')
