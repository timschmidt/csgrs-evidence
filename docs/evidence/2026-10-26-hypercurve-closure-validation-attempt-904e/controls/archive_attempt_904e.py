from pathlib import Path
import gzip,hashlib,importlib.util,json,os,shutil,subprocess,time
root=Path(__file__).resolve().parent
subprocess.run(['python3',str(root/'audit_validation.py'),],check=True)
code='904e5408e128a4f4b35ed0ce028f176023d7eadd'
checkout=root/'normal'
record='docs/evidence/2026-10-26-hypercurve-closure-validation-attempt-904e'
staging=Path('/tmp/hypercurve-closure-validation-attempt-904e-archive');out=staging/record
out.mkdir(parents=True,exist_ok=False)
manifest=[];excluded=[]
def copy_file(source,dest):
    payload=source.read_bytes();digest=hashlib.sha256(payload).hexdigest()
    target=out/dest;compressed=len(payload)>8*1024*1024
    if compressed:
        target=target.with_name(target.name+'.gz');data=gzip.compress(payload,compresslevel=9,mtime=0)
        assert gzip.decompress(data)==payload
    else:data=payload
    target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(data)
    manifest.append({'source':str(source),'path':str(target.relative_to(out)),'uncompressed_sha256':digest,'uncompressed_bytes':len(payload),'gzip':compressed})
def exclude(source,reason):
    if source.is_symlink():
        excluded.append({'source':str(source),'symlink':os.readlink(source),'reason':reason});return
    payload=source.read_bytes();excluded.append({'source':str(source),'sha256':hashlib.sha256(payload).hexdigest(),'bytes':len(payload),'reason':reason})
controls=['archive_attempt_904e.py','driver.py','prepare_matrix.py','matrix.json','workflow-inventory.json','rust-stable-channel.toml','rust-nightly-channel.toml','cargo_audit.py','rm_audit.py','audit_validation.py','validation-status.json','setup.json','phase-results.json','run_phases.py','run_remaining.py','resume-workflow-plan.json','symbolica-sandbox-bind.json','symbolica-host-bind.json','hosted-action-review.json']
for name in controls:
    p=root/name
    if p.exists():copy_file(p,Path('controls')/name)
for p in sorted(root.glob('*.log')):copy_file(p,Path('controls')/p.name)
for p in sorted((root/'setup-failures').rglob('*')):
    if p.is_file():copy_file(p,Path('setup-failures')/p.relative_to(root/'setup-failures'))
for validation in sorted(root.glob('validation-*')):
    if not validation.is_dir():continue
    assert (validation/'summary.json').exists(),validation
    for source in sorted(validation.rglob('*')):
        if not source.is_file() and not source.is_symlink():continue
        rel=source.relative_to(validation);dest=Path('commands')/validation.name/rel
        if 'packages' in rel.parts and source.name not in ['Cargo.toml','Cargo.toml.orig','.cargo_vcs_info.json','Cargo.lock']:
            exclude(source,'Packaged repository source is identified by commit and file digests; do not duplicate the source tree.');continue
        if source.is_symlink():
            exclude(source,'Symlink target is recorded without copying external state.');continue
        with source.open('rb') as f:magic=f.read(4)
        if magic in [b'\x7fELF',b'\x00asm'] or source.suffix=='.crate':
            exclude(source,'Compiled consumers and package archives are retained by digest; original source, manifests, commands and outcomes are retained.');continue
        copy_file(source,dest)
campaign_checkout=root/'directed'
for source_dir in sorted((campaign_checkout/'target').glob('hyperspatial-*')):
    for source in sorted(source_dir.rglob('*')):
        if source.is_file():copy_file(source,Path('campaigns')/source.relative_to(campaign_checkout/'target'))
artifacts=campaign_checkout/'crates/hyperspatial/fuzz/artifacts'
for source in sorted(artifacts.rglob('*')):
    if source.is_file():copy_file(source,Path('campaigns/fuzz-artifacts')/source.relative_to(artifacts))
verification=checkout/'crates/hyperreal/target/verification'
for source in sorted(verification.rglob('*')):
    if source.is_file():copy_file(source,Path('verification')/source.relative_to(verification))
build_root=Path('/home/tim/Documents/GitHub/workspace/csgrs/target/research-closeout-builds')
for group in ['1.99.1-hyperspatial-coverage','1.99.1-hypersolve-coverage','1.99.1-hypertri-coverage']:
    for name in ['coverage.json','coverage.txt','test-objects.txt']:
        p=build_root/group/name
        if p.exists():copy_file(p,Path('coverage')/group/name)
    for p in (build_root/group).glob('*.profdata'):exclude(p,'Reproducible instrumented profile; measured reports, source/configuration and profile digest retained.')
(out/'retained-files.json').write_text(json.dumps(manifest,indent=2)+'\n')
(out/'excluded-generated-files.json').write_text(json.dumps(excluded,indent=2)+'\n')
status=json.loads((root/'validation-status.json').read_text())
assert status['source_revision']==code and status['completed_successfully']==324 and status['missing']==['workspace-hypervoxel-0-4']
campaigns=json.loads((campaign_checkout/'target/hyperspatial-asan/report.json').read_text())['campaigns']
assert len(campaigns)==13 and all(c['returncode']==0 and c['mutation_evidence']['mutated'] for c in campaigns)
(out/'source.json').write_text(json.dumps({
    'final_code':code,'recorded_epoch':time.time(),
    'owner':'Repository pre-push qualification attempt for the frozen Hypercurve M1 increments',
    'properties':['P12','P15','P17','P18','P19','P35','P37'],
    'status':'incomplete_failed_validation',
    'result':'324 of 325 required groups completed successfully on unchanged 904e. The nested voxel workspace failed its random-write always-true assertion. Both release/package checks subsequently passed. This is not a passing pre-push qualification.',
    'failure':'validation-workflow-1793043797075278051/workspace-hypervoxel-0-4.log',
    'followup':'Commit 06708f1091802f061f40c1b4e34acdbf4eaa63e6 retains the full original random workload and adds a deterministic repeated-write regression, using the independent dense-array change oracle. Its targeted evidence is in the separate voxel-write-oracle record; a new complete pre-push run is required.',
    'completed_hypercurve':'2647 passed, 35 existing ignored, 72 suites',
    'asan':'All 13 ASan targets completed with mutation evidence; this does not override the failed required voxel test.',
    'limitations':[
        'No publication is authorized by this incomplete run. Frozen 904e coverage does not qualify later closure increments.',
        'Hosted configuration/upload/deployment actions were inspected; local builds and packaging do not establish publication or deployment.',
        'Benchmarks ran under concurrent validation load; no performance improvement is claimed.',
        'Failed Verus setup, sandbox LSan and Symbolica socket attempts remain with unchanged-command retries. No sanitizer or license mechanism was disabled.',
        'The original full arc-corner fixture remains blocked at 904e. Later successes are not attributed to this revision.'
    ],
    'historical_results_reused':0,'required_command_groups':325,
    'source_attribution':'controls/validation-status.json',
    'scope':'Three incremental commits 532e, 07f1 and 904e and their unchanged baseline.'
},indent=2)+'\n')
repo=Path('/tmp/csgrs-closure-evidence.git');branch='refs/heads/hypercurve-validation-attempt-904e-evidence-2026-10-26'
parent='e5b2ee8217a3b9254b30130aacbbccbc0001ccc6'
assert subprocess.check_output(['git','--git-dir='+str(repo),'rev-parse','refs/heads/hypercurve-voxel-write-oracle-evidence-2026-10-26'],text=True).strip()==parent
assert subprocess.run(['git','--git-dir='+str(repo),'show-ref','--verify','--quiet',branch]).returncode==1
env={**os.environ,'GIT_INDEX_FILE':'/tmp/hypercurve-closure-validation-attempt-904e.index'}
cmd=['git','--git-dir='+str(repo),'--work-tree='+str(staging)]
subprocess.run(cmd+['read-tree',parent],env=env,check=True);subprocess.run(cmd+['add','--',record],env=env,check=True)
tree=subprocess.check_output(cmd+['write-tree'],env=env,text=True).strip()
commit=subprocess.check_output(cmd+['commit-tree',tree,'-p',parent,'-m','Record incomplete 904e pre-push attempt and voxel regression'],env=env,text=True).strip()
subprocess.run(cmd+['update-ref',branch,commit,'0'*40],check=True)
changed=subprocess.check_output(cmd+['diff-tree','--no-commit-id','--name-only','-r',commit],text=True).splitlines();assert changed and all(n.startswith(record+'/') for n in changed)
spec=importlib.util.spec_from_file_location('evidence_archive',checkout/'scripts/evidence_archive.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);module.ROOTS={record:False}
rows=module.manifest(str(repo),commit);assert len(rows)==2
result={'commit':commit,'parent':parent,'branch':branch,'record':record,'manifest_row':rows[1]}
(root/'validation-attempt-evidence.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
