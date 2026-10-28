from pathlib import Path
import gzip,hashlib,importlib.util,json,os,shutil,subprocess,time
root=Path(__file__).resolve().parent
subprocess.run(['python3',str(root/'audit_validation.py'),'--require-complete'],check=True)
publication={**json.loads((root/'publication-source.json').read_text()), **json.loads((root/'publication-targets.json').read_text())}
code=publication['head']
checkout=root/'normal'
record=publication['record']
staging=root.parent/'replay-publication-validation-archive';out=staging/record
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
for p in sorted(root.iterdir()):
    if p.is_file() and p.suffix in ['.py','.json','.toml']:
        copy_file(p,Path('controls')/p.name)
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
for source in sorted((root/'interrupted-directed-campaigns').rglob('*')):
    if source.is_file():copy_file(source,Path('interrupted-directed-campaigns')/source.relative_to(root/'interrupted-directed-campaigns'))
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
assert status['source_revision']==code and status['completed_successfully']==328 and status['source_attribution_complete'] and status['execution_complete']
campaigns=json.loads((campaign_checkout/'target/hyperspatial-asan/report.json').read_text())['campaigns']
assert len(campaigns)==13 and all(c['returncode']==0 and c['mutation_evidence']['mutated'] for c in campaigns)
(out/'source.json').write_text(json.dumps({
    'final_code':code,'recorded_epoch':time.time(),
    'owner':'Hypercurve closure increments and complete repository pre-push qualification',
    'properties':['P12','P15','P17','P18','P19','P20','P35','P37'],
    'result':'All 131 locally executable workflow command groups, 196 strict Clippy groups and the required CI security audit completed in fresh source-attributed executions. All 13 ASan fuzz targets completed with mutation evidence.',
    'limitations':[
        'This validates the frozen replay publication candidate through retained fiber-point order, including its prior exact closure and native replay increments. Selected-circle point queries, circle differentials, rational point images and the later region, compound replay, contact and corner increments are excluded.',
        'The complete Hypercurve exact curve closure plan remains open; individual support domains and blockers are retained in the capability records.',
        'Hosted configuration/upload/deployment actions were reviewed separately. Local builds and packaging do not establish publication or deployment.',
        'Benchmarks ran under concurrent validation load; no performance improvement is claimed.',
        'Every recovered-run unsuccessful attempt is retained, including the Cargo workspace-discovery failure followed by relocation and a fresh complete normal run. Pre-restart raw runs were lost and are not credited. Successful command/source attribution identifies the exact qualification inputs.',
    ],
    'historical_results_reused':0,'required_command_groups':328,
    'host_restart_recovery':'All 328 command groups executed freshly after recovery; no pre-restart result reused.',
    'source_attribution':'controls/validation-status.json',
    'publication_inputs':publication,
},indent=2)+'\n')
repo=Path('/home/tim/Documents/GitHub/workspace/csgrs-evidence.git');branch='refs/heads/'+publication['evidence_branch']
parent=subprocess.check_output(['git','--git-dir='+str(repo),'rev-parse',branch],text=True).strip()
assert parent==publication['evidence']
env={**os.environ,'GIT_INDEX_FILE':str(root.parent/'replay-publication-validation.index')}
cmd=['git','--git-dir='+str(repo),'--work-tree='+str(staging)]
subprocess.run(cmd+['read-tree',parent],env=env,check=True);subprocess.run(cmd+['add','--',record],env=env,check=True)
tree=subprocess.check_output(cmd+['write-tree'],env=env,text=True).strip()
commit=subprocess.check_output(cmd+['commit-tree',tree,'-p',parent,'-m','Record complete replay publication pre-push validation'],env=env,text=True).strip()
subprocess.run(cmd+['update-ref',branch,commit,parent],check=True)
changed=subprocess.check_output(cmd+['diff-tree','--no-commit-id','--name-only','-r',commit],text=True).splitlines();assert changed and all(n.startswith(record+'/') for n in changed)
spec=importlib.util.spec_from_file_location('evidence_archive',checkout/'scripts/evidence_archive.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);module.ROOTS={record:False}
rows=module.manifest(str(repo),commit);assert len(rows)==2
result={'commit':commit,'parent':parent,'record':record,'manifest_row':rows[1]}
(root/'validation-evidence.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
