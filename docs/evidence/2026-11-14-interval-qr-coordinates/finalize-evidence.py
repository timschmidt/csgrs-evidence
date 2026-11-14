from pathlib import Path
import subprocess,json,hashlib,re,collections
s=Path(__file__).parent;base=Path('/mnt/development')
assert 'timings complete' in (s/'complete-checks.log').read_text()
assert all(x['returncode']==0 for x in json.loads((s/'main-validation.json').read_text()))
timing=json.loads((s/'new-timing-summary.json').read_text());assert len(timing)==18
ranges=collections.defaultdict(list)
for row in timing:ranges[row['case']].append(row['median']['point_estimate']/1000)
assert len(ranges)==6 and all(len(x)==3 for x in ranges.values())
(s/'timing-ranges.json').write_text(json.dumps({k:{'median_microseconds_min':min(v),'median_microseconds_max':max(v)} for k,v in sorted(ranges.items())},indent=2)+'\n')
def count(path):
 rows=[tuple(map(int,m.groups())) for m in re.finditer(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out',path.read_text())]
 assert rows and all(r[1:]==(0,0,0,0) for r in rows),rows
 return sum(r[0] for r in rows)
counts={'hyperdynamics':count(s/'main-tests.log'),'hypersolve_qr':count(s/'main-core-tests.log')}
(s/'main-test-summary.json').write_text(json.dumps(counts,indent=2)+'\n')
initial=json.loads((s/'BASELINE.json').read_text());snap={}
for name in ['csgrs','alumina-interface','alumina-firmware','csgrs-evidence','csgrs-qr-coordinates']:
 r=base/name
 def git(*args):return subprocess.check_output(['git',*args],cwd=r)
 snap[name]=dict(head=git('rev-parse','HEAD').decode().strip(),branch=git('branch','--show-current').decode().strip(),status=git('status','--porcelain').decode(),staged_sha256=hashlib.sha256(git('diff','--cached','--binary')).hexdigest(),unstaged_sha256=hashlib.sha256(git('diff','--binary')).hexdigest())
for name in ['alumina-interface','alumina-firmware','csgrs-evidence']:
 for key in ['head','branch','status','staged_sha256','unstaged_sha256']:assert snap[name][key]==initial[name][key],(name,key)
source=json.loads((s/'SOURCE.json').read_text());integration=json.loads((s/'INTEGRATION.json').read_text())
assert snap['csgrs']['head']==snap['csgrs-qr-coordinates']['head']==source['commit']
assert snap['csgrs-qr-coordinates']['status']==''
assert len(snap['csgrs']['status'].splitlines())==41 and snap['csgrs']['unstaged_sha256']==hashlib.sha256(b'').hexdigest()
assert snap['csgrs']['staged_sha256']==integration['pending_sha256']
(s/'FINAL-REPOSITORIES.json').write_text(json.dumps(snap,indent=2)+'\n')
controls=json.loads((s/'candidate-inspected-controls.json').read_text())
comparisons=json.loads((s/'candidate-control-artifact-comparison.json').read_text())
extra='\n## Final integration and measurements\n\n'
extra+=f"Source commit `{source['commit']}` is integrated on `{source['base']}`. An alternate-index application and reversal recover the complete original pending tree exactly. The 41 extraction paths remain staged with SHA-256 `{integration['pending_sha256']}`. Interface's eight edits and Firmware's clean state are unchanged. Main's combined pending extraction passes {counts['hyperdynamics']} Hyperdynamics tests, {counts['hypersolve_qr']} focused Hypersolve QR tests, the standalone minimal core feature, strict Hyperdynamics Clippy, formatting and repository budget. Exact commands and outcomes are in main-validation.json. No push occurred.\n\n"
extra+='All five old-feature consumers have identical allocated sections except build IDs and identical canonical function layouts. The control comparison includes native evolution, Taylor models, affine models, coordinate evolution and direct chart transitions. Raw file deltas and byte identity:\n\n| Consumer | Raw byte delta | Byte-identical |\n| --- | ---: | --- |\n'
for x in controls:
 c=next(c for c in comparisons if c['name']==x['name']);extra+=f"| {x['name']} | {x['raw_bytes_delta']} | {c['identical']} |\n"
extra+='\nOther differences are confined to nonallocated symbol/string metadata and build IDs. These same-path fixed-feature controls do not establish arbitrary-platform or unified all-feature cost invariance. No old-path timing claim is made.\n\nThree maintained Criterion trials each complete six workloads. CPU 0, ASLR disabled, one-second warmup, two-second measurement and 30 samples were used after builds/tests completed. All exact-flow checks pass. Median microsecond ranges:\n\n| Workload | Minimum trial median | Maximum trial median |\n| --- | ---: | ---: |\n'
for name,values in sorted(ranges.items()):extra+=f'| {name} | {min(values):.3f} | {max(values):.3f} |\n'
extra+='\nQR reduces completed report count and warm allocations on the rotated fixture while increasing native arithmetic. The constant fixture retains adverse overhead. Preparation is separately measured and must be amortized by actual use; these results do not establish a universal speedup or wrapping reduction. Complete samples, estimates and binary hashes are retained.\n\nAll 28 prior frozen stages verify unchanged. This stage freezes at archival; subsequent committed-blob, registry and final frozen-stage checks live outside it. Phase 11 timing regressions, remaining migrations, adaptive frame/order/step control, broader adoption, embedded qualification and coordinated release remain open.\n'
p=s/'README.md';assert '## Final integration and measurements' not in p.read_text();p.write_text(p.read_text()+extra)
(s/'STATUS.md').write_text('Exact QR construction and field consumption admitted on the declared corpus. Full goal remains active; no phase completion, automatic frame controller, universal performance gain, whole-resource bound, release or push is claimed.\n')
print(json.dumps({'source':source['commit'],'main_counts':counts,'ranges':dict(ranges)},indent=2))
