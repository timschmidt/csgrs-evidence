from pathlib import Path
import subprocess,json,hashlib,re,collections
s=Path(__file__).parent;base=Path('/mnt/development')
assert 'timings complete' in (s/'complete-checks.log').read_text()
assert all(x['returncode']==0 for x in json.loads((s/'main-validation.json').read_text()))
timing=json.loads((s/'new-timing-summary.json').read_text());assert len(timing)==24
ranges=collections.defaultdict(list)
for row in timing:ranges[row['case']].append(row['median']['point_estimate']/1000)
assert len(ranges)==8 and all(len(x)==3 for x in ranges.values())
(s/'timing-ranges.json').write_text(json.dumps({k:{'median_microseconds_min':min(v),'median_microseconds_max':max(v)} for k,v in sorted(ranges.items())},indent=2)+'\n')
def count(path):
 rows=[tuple(map(int,m.groups())) for m in re.finditer(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out',path.read_text())]
 assert rows and all(r[1:]==(0,0,0,0) for r in rows),rows
 return sum(r[0] for r in rows)
counts={'hyperdynamics':count(s/'main-tests.log'),'minimal_reachability':count(s/'main-minimal.log')}
(s/'main-test-summary.json').write_text(json.dumps(counts,indent=2)+'\n')
initial=json.loads((s/'BASELINE.json').read_text());snap={}
for name in ['csgrs','alumina-interface','alumina-firmware','csgrs-evidence','csgrs-dynamics-portfolio-cost']:
 r=base/name
 def git(*args):return subprocess.check_output(['git',*args],cwd=r)
 snap[name]=dict(head=git('rev-parse','HEAD').decode().strip(),branch=git('branch','--show-current').decode().strip(),status=git('status','--porcelain').decode(),staged_sha256=hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),unstaged_sha256=hashlib.sha256(git('diff','--binary')).hexdigest())
for name in ['alumina-interface','alumina-firmware','csgrs-evidence']:
 for key in ['head','branch','status','staged_sha256','unstaged_sha256']:assert snap[name][key]==initial[name][key],(name,key)
source=json.loads((s/'SOURCE.json').read_text());integration=json.loads((s/'INTEGRATION.json').read_text())
assert snap['csgrs']['head']==snap['csgrs-dynamics-portfolio-cost']['head']==source['commit']
assert snap['csgrs-dynamics-portfolio-cost']['status']==''
assert len(snap['csgrs']['status'].splitlines())==41 and snap['csgrs']['unstaged_sha256']==hashlib.sha256(b'').hexdigest()
assert snap['csgrs']['staged_sha256']==integration['pending_sha256']
(s/'FINAL-REPOSITORIES.json').write_text(json.dumps(snap,indent=2)+'\n')
extra='\n## Final integration and timing\n\n'
extra+=f"Source commit `{source['commit']}` is integrated on `{source['base']}`. Alternate-index application and reversal recover the complete original pending tree exactly. The 41 extraction paths remain staged with SHA-256 `{integration['pending_sha256']}`. Interface's eight edits and Firmware's clean state are unchanged. Main's combined pending extraction passes {counts['hyperdynamics']} Hyperdynamics tests, {counts['minimal_reachability']} minimal-feature reachability tests, strict Hyperdynamics Clippy, formatting and repository budget. Commands/outcomes are in main-validation.json; no push occurred.\n\n"
extra+='Three maintained Criterion trials each complete eight workloads on CPU 0 with ASLR disabled, one-second warmup, two-second requested measurement and 30 samples, after builds/tests completed. Criterion can extend the requested duration for slow completed workloads. Independent exact-flow and width checks pass. Median microsecond ranges:\n\n| Workload | Minimum trial median | Maximum trial median |\n| --- | ---: | ---: |\n'
for name,values in sorted(ranges.items()):extra+=f'| {name} | {min(values):.3f} | {max(values):.3f} |\n'
extra+='\nThese measurements compare complete strategies and include the explicit extra cover evidence for reachability. The exponential fixture continues to favor Taylor; ordinary Picard remains preferable on the measured constant flow. The existing regridded strategy provides a materially stronger native comparison than ordinary unrounded continuation. No universal speedup, isolated rounding-effect claim, automatic selector or external solver qualification is implied. All samples, estimates and artifact hashes remain archived.\n\nAll 30 prior frozen stages verify unchanged. This stage freezes at archival; subsequent committed-blob, registry and final frozen-stage checks live outside it. Phase 11 timing regressions, remaining migrations, automatic order/frame control, wider consumer adoption, external competitive qualification, embedded work and coordinated release remain open.\n'
p=s/'README.md';assert '## Final integration and timing' not in p.read_text();p.write_text(p.read_text()+extra)
(s/'STATUS.md').write_text('Existing regridded reachability is qualified in the completed dynamics comparison, with default-budget growth and cap-quality regressions. No production algorithm or policy changes. Full goal remains active; automatic selection, general performance/resource closure and release remain open.\n')
print(json.dumps({'source':source['commit'],'main_counts':counts,'ranges':dict(ranges)},indent=2))
