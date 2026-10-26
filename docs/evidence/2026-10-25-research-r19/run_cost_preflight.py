from pathlib import Path
import hashlib,json,os,resource,signal,subprocess,time
from runtime_manifest import assert_runtime,runtime_sources
raw=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-r19-trace')
assert json.loads((raw/'latest-expanded-matched-builds.json').read_text())['complete']
record=raw/f'expanded-cost-preflight-{time.time_ns()}';record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes());rows=[]
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r19-target',CARGO_BUILD_JOBS='1',CARGO_PROFILE_RELEASE_DEBUG='0',RUSTFLAGS='',CCACHE_DIR='/tmp/csgrs-r19-ccache',CCACHE_TEMPDIR='/tmp/csgrs-r19-ccache/tmp')
def execute(name,command,timeout=900,contained=False):
    print('R19 COST PREFLIGHT START',name,flush=True);start=time.monotonic()
    def limits():
        resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3));resource.setrlimit(resource.RLIMIT_FSIZE,(64*1024**2,64*1024**2));resource.setrlimit(resource.RLIMIT_CORE,(0,0))
    with (record/f'{name}.log').open('x') as out:
        p=subprocess.Popen(command,cwd=raw,env=env,stdout=out,stderr=subprocess.STDOUT,start_new_session=True,preexec_fn=limits if contained else None)
        try:status=p.wait(timeout=timeout)
        except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
    rows.append({'name':name,'command':command,'status':status,'seconds':time.monotonic()-start})
    (record/'commands.json').write_text(json.dumps(rows,indent=2)+'\n')
    print('R19 COST PREFLIGHT FINISH',name,status,flush=True)
    assert status==0,(record,name,status)
for name in ['cost','construction','workflow']:
    execute(name+'-fmt',['cargo','fmt','--manifest-path',str(raw/name/'Cargo.toml'),'--','--check']+(['--config-path',str(root/'.rustfmt.toml')] if name=='workflow' else []))
    execute(name+'-clippy',['cargo','clippy','--locked','--offline','--release','--manifest-path',str(raw/name/'Cargo.toml'),'--all-features','--all-targets','--','-D','warnings'])
build=json.loads((raw/'latest-cost-build-baseline-native.json').read_text())
assert hashlib.sha256(Path(build['binary']).read_bytes()).hexdigest()==build['sha256']
assert_runtime(json.loads(Path(build['sources']).read_text()),'baseline')
matrix=Path(json.loads((raw/'latest-precision-matrix.json').read_text())['record'])
summary=json.loads((matrix/'summary.json').read_text())
assert summary['complete'] and not summary['baseline_exact_regressions'] and not summary['nonzero_processes']
assert summary['new_exact_consumer_cells']==180
boundary=json.loads((raw/'latest-boundary-matrix.json').read_text())
assert boundary['passed'] and boundary['new_exact']==123 and not boundary['regressions'] and not boundary['candidate_failures']
brep=json.loads((raw/'latest-brep-continuation.json').read_text());assert brep['passed']
assert not (raw/'cost-fixtures').exists()
execute('emit-fixtures',[build['binary'],'emit',str(raw/'cost-fixtures'),str(matrix)],120,True)
for scope in ['cost','construction','workflow']:
    execute(scope+'-functional',['python',str(raw/f'run_{scope}.py'),'functional'],3000)
eligibility={'created_ns':time.time_ns(),'eligible':True,'reason':'Private owner/downstream suites and all expanded matched harness functional controls pass. Four runtime files are frozen; exact public import/strict continuation matrices and cold BRep archive pass. No performance decision taken yet.',
             'preflight_record':str(record),'runtime_sources':runtime_sources('candidate'),
             'owner':json.loads((raw/'latest-private-validation.json').read_text()),
             'downstream':json.loads((raw/'latest-downstream-validation.json').read_text()),
             'precision_matrix':str(matrix),'boundary_matrix':boundary['record'],'brep':brep['record'],
             'limits':'External containment only; no new claim of cumulative internal arithmetic, heap or cancellation bounds.'}
(record/'cost-eligibility-before.json').write_bytes((raw/'cost-eligibility.json').read_bytes())
(record/'cost-eligibility.json').write_text(json.dumps(eligibility,indent=2)+'\n')
(raw/'cost-eligibility.json').write_text(json.dumps(eligibility,indent=2)+'\n')
from cost_gate import assert_cost_eligible
assert_cost_eligible()
(raw/'latest-expanded-cost-preflight.json').write_text(json.dumps({'record':str(record),'passed':True},indent=2)+'\n')
print('R19 EXPANDED COST PREFLIGHT COMPLETE',record,flush=True)
