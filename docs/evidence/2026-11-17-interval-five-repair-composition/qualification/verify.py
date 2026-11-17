from pathlib import Path
import hashlib,json,re,subprocess
s=Path(__file__).parent;r=Path('/mnt/development/interval-solver-five-repair/csgrs')
def git(*args):return subprocess.check_output(['git','-C',str(r),*args])
def sha(data):return hashlib.sha256(data).hexdigest()
completion=json.loads((s/'completion.json').read_text());assert completion['exit_code']==0
original_attempt=s.with_name(s.name+'-attempt-01')
assert json.loads((original_attempt/'completion.json').read_text())['exit_code']==1
assert json.loads((original_attempt/'commands.json').read_text())[0]['name']=='baseline-format'
assert json.loads((original_attempt/'commands.json').read_text())[0]['exit_code']==1
original_start=json.loads((original_attempt/'hold.json').read_text())['started_unix']
finished=json.loads((s/'release.json').read_text())['time_unix']
assert finished-original_start<=7200
added=lambda p: ''.join(''.join(line[1:].split()) for line in p.read_text().splitlines() if line.startswith('+') and not line.startswith('+++'))
assert added(original_attempt/'composition-test.patch')==added(s/'composition-test.patch')
candidate=json.loads((s/'candidate.json').read_text());assert git('rev-parse','HEAD').decode().strip()==candidate['revision'] and not git('status','--porcelain=v1')
base=candidate['baseline'];repair=candidate['residual_repair']
changed=git('diff','--name-only',base,candidate['revision']).decode().splitlines()
assert sorted(changed)==sorted(['crates/hypersolve/src/certification.rs','crates/hypersolve/src/failed_constraints.rs','crates/hypersolve/tests/residual_certainty.rs','crates/hypersolve/src/solver_contract_tests.rs'])
for path,digest in json.loads((s/'residual-source-equivalence.json').read_text()).items():
 data=(r/path).read_bytes();assert data==git('show',repair+':'+path) and sha(data)==digest
# The cross-component test only adds assertions/calls to the existing witness.
diff=git('diff','--unified=0',base,candidate['revision'],'--','crates/hypersolve/src/solver_contract_tests.rs').decode()
assert not any(l.startswith('-') and not l.startswith('---') for l in diff.splitlines())
assert diff.count('@@')==2
rows=json.loads((s/'commands.json').read_text());assert len(rows)==completion['commands']
failed=[row for row in rows if row['exit_code']]
assert len(failed)==10 and all(row['exit_code']==row['expected_exit_code']==101 for row in failed)
assert not any(row['timed_out'] for row in rows)
for row in rows:assert (s/(row['name']+'.log')).is_file()
assert '0 passed; 4 failed;' in (s/'baseline-residual-regressions.log').read_text()
assert '0 passed; 1 failed;' in (s/'baseline-composition-witness.log').read_text()
assert 'assertion failed: row.status.is_unknown()' in (s/'baseline-composition-witness.log').read_text()
for i in range(8):assert 'approximate or unknown evidence must not count as an exact residual certificate' in (s/f'baseline-residual-{i}-witness.log').read_text()
assert (s/'baseline-trace/dispatch_trace.md').read_bytes()==(s/'candidate-trace/dispatch_trace.md').read_bytes()
assert (s/'baseline-trace-run.log').read_bytes()==(s/'candidate-trace-run.log').read_bytes()
trace_rows=[l for l in (s/'candidate-trace/dispatch_trace.md').read_text().splitlines() if l.startswith('| `') and l.count('|')==13]
assert len(trace_rows)==11
for case in range(8):
 assert (s/f'baseline-residual-{case}-control.log').read_bytes()==(s/f'candidate-residual-{case}-control.log').read_bytes()
 for mode in ['control','witness']:
  a=[l for l in (s/f'baseline-residual-{case}-{mode}.log').read_text().splitlines() if l.startswith('TRACE ')]
  b=[l for l in (s/f'candidate-residual-{case}-{mode}.log').read_text().splitlines() if l.startswith('TRACE ')]
  assert a==b and len(a)==2 and all('dispatch: []' not in l for l in a)
# Public fixtures are copied without editing assertions or input construction.
for label,old in [('public-witnesses',Path('/tmp/interval-refactor/solver-combined-admission/public-witnesses')),('residual-public',Path('/tmp/interval-refactor/residual-certainty-review/candidate/harness'))]:
 for p in (s/label).glob('*.rs'):assert p.read_bytes()==(old/p.name).read_bytes()
 assert (s/label/'Cargo.lock').read_bytes()==(old/'Cargo.lock').read_bytes()
 assert (s/label/'Cargo.toml').read_text()==(old/'Cargo.toml').read_text().replace('/mnt/development/interval-solver-combined/csgrs/',str(r)+'/').replace('/mnt/development/interval-residual-certainty/csgrs/',str(r)+'/')
for p in s.glob('*-artifact.json'):
 a=json.loads(p.read_text());assert sha(Path(a['path']).read_bytes())==a['sha256']
counts={}
for name in ['owner-all-features','owner-no-default','owner-doctests','public-witnesses','hyperpath','hyperdynamics']:
 text=(s/(name+'.log')).read_text();results=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;',text);assert results
 counts[name]=dict(suites=len(results),passed=sum(int(a) for a,_,_ in results),failed=sum(int(b) for _,b,_ in results),ignored=sum(int(c) for _,_,c in results))
 assert counts[name]['failed']==0
assert counts['public-witnesses']['passed']==36
assert 'solver_contract_tests::numerical_proposal_domain_and_alpha_reports_preserve_their_distinct_claims ... ok' in (s/'owner-all-features.log').read_text()
warnings=[]
for row in rows:
 for line in (s/(row['name']+'.log')).read_text().splitlines():
  if line.startswith(('warning:','warning[')):warnings.append(dict(command=row['name'],line=line))
assert not warnings,warnings
result=dict(candidate=candidate['revision'],changed_paths=changed,original_residual_files_identical=True,existing_composition_assertions_preserved=True,baseline_failed_regressions=4,baseline_failed_composition=1,baseline_failed_public_witnesses=8,owner_full_trace_workloads=11,residual_trace_policy_rows=32,full_exact_control_outputs=8,test_results=counts,strict_owner_clippy_configurations=2,strict_public_clippy_harnesses=2,formatting=True,warnings=warnings,original_format_failure_preserved=True,original_total_deadline_preserved=True,total_elapsed_including_first_attempt=finished-original_start,admitted=False,runtime_claim=False)
(s/'verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
