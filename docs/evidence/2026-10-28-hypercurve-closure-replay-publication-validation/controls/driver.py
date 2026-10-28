from pathlib import Path
import argparse, hashlib, json, os, re, shutil, signal, subprocess, time, tomllib

HERE=Path(__file__).resolve().parent
parser=argparse.ArgumentParser()
parser.add_argument('--checkout',type=Path,required=True)
parser.add_argument('--phase',choices=['quick','lint','workflow','release','all'],default='all')
parser.add_argument('--only',help='regular expression selecting step identifiers')
parser.add_argument('--build-root',type=Path,default=Path('/home/tim/Documents/GitHub/workspace/csgrs/target/research-closeout-builds'))
parser.add_argument('--online',action='store_true',help='Allow the unchanged workflow command to use its normal registry network access')
args=parser.parse_args()
root=args.checkout.resolve()
matrix=json.loads((HERE/'matrix.json').read_text())
reuse=json.loads((HERE/'verified-reuse.json').read_text()) if (HERE/'verified-reuse.json').exists() else {}
stable_channel=tomllib.loads((HERE/'rust-stable-channel.toml').read_text())
nightly_channel=tomllib.loads((HERE/'rust-nightly-channel.toml').read_text())
stable_version=stable_channel['pkg']['rust']['version'].split()[0]
nightly_version='nightly-'+nightly_channel['date']
record=HERE/f'validation-{args.phase}-{time.time_ns()}'
record.mkdir();(record/'driver.py').write_bytes(Path(__file__).read_bytes())
build_root=args.build_root.resolve()
tool_root=Path('/home/tim/Documents/GitHub/workspace/csgrs/target/research-closeout-tools')
def source_inventory():
    names=subprocess.check_output(['git','ls-files'],cwd=root,text=True).splitlines()
    return {n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names if (root/n).is_file()}
before=source_inventory()
assert subprocess.check_output(['git','status','--porcelain'],cwd=root,text=True)==''
generated_reports={
    'crates/hyperreal/dispatch_trace.md','crates/hyperreal/benchmarks.md',
    'crates/hyperlattice/api_dispatch_trace.md','crates/hyperlattice/dispatch_trace.md','crates/hyperlattice/benchmarks.md',
    'crates/hyperlimit/dispatch_trace.md','crates/hyperlimit/benchmarks.md',
    'crates/hypersolve/dispatch_trace.md','crates/hypersolve/benchmarks.md',
    'crates/hypertri/dispatch_trace.md','crates/hypertri/benchmarks.md',
}
(record/'sources-before.json').write_text(json.dumps(before,indent=2)+'\n')
head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip()
(record/'runner-temp').mkdir()
(record/'revision.json').write_text(json.dumps({'head':head,'root':str(root)},indent=2)+'\n')
env=os.environ.copy()
# Trunk parses NO_COLOR as a boolean; the local terminal sets the incompatible value 1.
# The Pages workflow already sets TRUNK_COLOR=never. Do not inject terminal-only flags.
env.pop('NO_COLOR',None)
real_cargo=shutil.which('cargo')
shim=record/'shims';shim.mkdir()
shutil.copyfile(HERE/'cargo_audit.py',shim/'cargo');(shim/'cargo').chmod(0o755)
if args.phase=='release':
    shutil.copyfile(HERE/'rm_audit.py',shim/'rm');(shim/'rm').chmod(0o755)
    (record/'temporary-consumers').mkdir()
    env['CSGRS_CLOSEOUT_TEMP_EVIDENCE']=str(record/'temporary-consumers')
env.update(CARGO_BUILD_JOBS='2',RUST_TEST_THREADS='2',PROPTEST_RNG_SEED='20261025',CARGO_NET_OFFLINE='false' if args.online else 'true',
           CCACHE_DIR=str(tool_root/'ccache'),CCACHE_TEMPDIR=str(tool_root/'ccache/tmp'),
           GOCACHE=str(tool_root/'go-cache'),GOPATH=str(tool_root/'go-path'),
           NPM_CONFIG_CACHE=str(tool_root/'npm-cache'),NPM_CONFIG_OFFLINE='true',
           GITHUB_WORKSPACE=str(root),RUNNER_TEMP=str(record/'runner-temp'),
           CSGRS_CLOSEOUT_REAL_CARGO=real_cargo,CSGRS_CLOSEOUT_CARGO_AUDIT=str(record/'cargo-invocations.jsonl'),
           CSGRS_CLOSEOUT_STABLE=stable_version,CSGRS_CLOSEOUT_NIGHTLY=nightly_version,
           PATH=str(shim)+':'+str(tool_root/'bin')+':'+str(tool_root/'go/bin')+':'+str(root/'tests/wasm/node_modules/.bin')+':'+env['PATH'])
for k in ['CCACHE_DIR','CCACHE_TEMPDIR','GOCACHE','GOPATH']:Path(env[k]).mkdir(parents=True,exist_ok=True)
steps=matrix['steps']+matrix['extra_clippy']
metadata=json.loads(subprocess.check_output(['cargo','metadata','--locked','--no-deps','--format-version','1'],cwd=root,env=env,text=True))
released=['hyperreal','hyperlattice','hyperlimit','hypertri','hypersolve','hypercurve','hypermesh','hyperphysics','hypersdf','csgrs','csgrs-ffi','hypergraphics','hyperevolution','hyperpack','hyperparts','hyperpath','hyperdrc','hypercircuit']
for toolchain in ['stable','1.95.0']:
    for package in metadata['packages']:
        if package['name'] not in released:continue
        doc=((package.get('metadata') or {}).get('docs') or {}).get('rs') or {}
        flags=[]
        if doc.get('all-features'):flags+=['--all-features']
        if doc.get('no-default-features'):flags+=['--no-default-features']
        if doc.get('features'):flags+=['--features',','.join(doc['features'])]
        for kind,config in [('default',[]),('docs',flags)]:
            if kind=='docs' and not flags:continue
            steps.append({'id':f'release-clippy-{toolchain}-{package["name"]}-{kind}','cwd':'.',
                          'command':' '.join(['cargo','clippy','--locked','-p',package['name'],*config,'--','-D','warnings']),
                          'env':{'RUSTUP_TOOLCHAIN':toolchain},'kind':'strict-clippy','target_group':toolchain+'-normal','timeout_seconds':21600,
                          'origin':{'release_package_configuration':True}})
root_package=next(p for p in metadata['packages'] if p['name']=='csgrs')
features=sorted({f for t in root_package['targets'] if 'example' in t['kind'] for f in t.get('required-features',[])})
steps.append({'id':'examples-extra-clippy','cwd':'.','command':'cargo clippy --locked --examples --features '+','.join(features)+' -- -D warnings',
              'env':{'RUSTUP_TOOLCHAIN':'stable'},'kind':'strict-clippy','target_group':'stable-normal','timeout_seconds':21600,
              'origin':{'examples_configuration':True}})
def phase(step):
    if step['id'].startswith('rust-release-'):return 'release'
    if step['kind']=='strict-clippy':return 'lint'
    if any(x in step['command'] for x in ['cargo fmt','rustfmt --edition','typos','check-repository-budget','verify_verus.py','test_rejections.py','test_acceptance.py','zizmor']):return 'quick'
    return 'workflow'
steps=[s for s in steps if (args.phase=='all' or phase(s)==args.phase) and (not args.only or re.search(args.only,s['id']))]
for step in steps:
    if step['env'].get('RUSTUP_TOOLCHAIN')=='stable':step['env']['RUSTUP_TOOLCHAIN']=stable_version
    if step['target_group'].startswith('stable-'):step['target_group']=step['target_group'].replace('stable-',stable_version+'-',1)
(record/'resolved-toolchains.json').write_text(json.dumps({'stable':stable_version,'nightly':nightly_version,'msrv':'1.95.0','default_toolchain_unchanged':True},indent=2)+'\n')
(record/'steps.json').write_text(json.dumps(steps,indent=2)+'\n')
results=[]
for step in steps:
    label=step['id'];command=step['command'];step_env={**env,**step['env']}
    step_env['CARGO_TARGET_DIR']=str(build_root/step['target_group'])
    # Preserve GitHub-hosted relative site assembly without polluting tracked
    # files. The site directory is untracked and removed only after recording.
    print('START',label,flush=True);started=time.time()
    row={**step,'started_epoch':started,'checkout':str(root),'target_dir':step_env['CARGO_TARGET_DIR']}
    if label in reuse:
        previous=reuse[label]
        assert command.strip()==previous['command'].strip(),(label,command,previous['command'])
        assert step['cwd']==previous['cwd']
        for name,digest in previous['source_sha256'].items():assert hashlib.sha256((root/name).read_bytes()).hexdigest()==digest,name
        previous_log=Path(previous['log'])
        assert hashlib.sha256(previous_log.read_bytes()).hexdigest()==previous['log_sha256']
        shutil.copyfile(previous_log,record/(label+'.log'))
        row.update(status=0,elapsed_seconds=0,covered_by=previous)
        results.append(row)
        with (record/'events.jsonl').open('a') as out:out.write(json.dumps({'event':'finish',**row})+'\n')
        print('COVERED',label,previous['record'],flush=True)
        continue
    with (record/'events.jsonl').open('a') as out:out.write(json.dumps({'event':'start',**row})+'\n')
    with (record/(label+'.log')).open('w') as out:
        process=subprocess.Popen(['bash','-e','-o','pipefail','-c',command],cwd=root/step['cwd'],env=step_env,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
        try:status=process.wait(timeout=step['timeout_seconds'])
        except subprocess.TimeoutExpired:
            os.killpg(process.pid,signal.SIGKILL);process.wait();status='timeout'
    row.update(status=status,elapsed_seconds=time.time()-started)
    # Existing harness-free benchmark targets write Markdown reports during
    # validation. Preserve those outputs, then restore only these known report
    # files in this isolated checkout; never mask a source or fixture change.
    report_outputs=[]
    changed_now=subprocess.check_output(['git','diff','--name-only'],cwd=root,text=True).splitlines()
    for name in changed_now:
        if name not in generated_reports:continue
        output=record/'generated-reports'/label/name;output.parent.mkdir(parents=True,exist_ok=True)
        payload=(root/name).read_bytes();output.write_bytes(payload)
        original=subprocess.check_output(['git','show','HEAD:'+name],cwd=root)
        assert hashlib.sha256(original).hexdigest()==before[name],name
        (root/name).write_bytes(original)
        report_outputs.append({'path':name,'sha256':hashlib.sha256(payload).hexdigest(),'bytes':len(payload),'preserved_at':str(output)})
    if report_outputs:row['generated_reports']=report_outputs
    if label=='pages-build-0-8' and status==0:
        site=root/'site';assert site.is_dir()
        site_files={str(p.relative_to(site)):{'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'bytes':p.stat().st_size} for p in site.rglob('*') if p.is_file()}
        (record/'assembled-site.json').write_text(json.dumps(site_files,indent=2)+'\n')
        destination=build_root/('assembled-site-'+record.name);assert not destination.exists()
        shutil.move(str(site),str(destination));row['assembled_site']=str(destination)
    results.append(row)
    with (record/'events.jsonl').open('a') as out:out.write(json.dumps({'event':'finish',**row})+'\n')
    print('FINISH',label,status,round(row['elapsed_seconds'],2),flush=True)
    if status!=0:
        print((record/(label+'.log')).read_text(errors='replace')[-5000:],flush=True)
        break
after=source_inventory()
(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n')
changed=[n for n in before if before[n]!=after.get(n)]
summary={'record':str(record),'head':head,'phase':args.phase,'selection':args.only,'planned':len(steps),'completed':len(results),
         'results':results,'source_changes':changed,'all_passed':len(results)==len(steps) and all(r['status']==0 for r in results) and not changed}
(record/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(HERE/('latest-'+args.phase+'.json')).write_text(json.dumps({'record':str(record),'all_passed':summary['all_passed']},indent=2)+'\n')
print('MATRIX COMPLETE',record,summary['all_passed'],flush=True)
raise SystemExit(0 if summary['all_passed'] else 1)
