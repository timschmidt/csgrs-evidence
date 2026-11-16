from pathlib import Path
import json,subprocess,re,shlex,hashlib,tomllib,time,importlib.util,sys
sys.dont_write_bytecode=True
s=Path(__file__).parent;root=Path('/mnt/development/interval-clippy-closure/csgrs')
metadata=json.loads(subprocess.check_output(['cargo','metadata','--locked','--no-deps','--format-version','1'],cwd=root,text=True));packages={p['name']:p for p in metadata['packages']};manifests={str(Path(p['manifest_path']).relative_to(root)):p['name'] for p in metadata['packages']}
script=(root/'scripts/release-check.sh').read_text();names=re.search(r'^crates=\(\n(.*?)\n\)',script,re.M|re.S)[1].split();spec=importlib.util.spec_from_file_location('release_docs',root/'scripts/release-docs.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
seen={};unparsed=[]
def key(tc,args,cwd):
 if '--' in args:args=args[:args.index('--')]
 def value(flag,default=None):return args[args.index(flag)+1] if flag in args else default
 if args.count('-p')>1 or '--workspace' in args:return None
 manifest=value('--manifest-path',str(Path(cwd)/'Cargo.toml'));package=value('-p',manifests.get(str(Path(cwd)/manifest) if '--manifest-path' in args else manifest))
 if package not in packages:return None
 all_features='--all-features' in args
 return (tc,package,False if all_features else '--no-default-features' in args,all_features,tuple(sorted(filter(None,re.split(r'[, ]+',value('--features',''))))),value('--target','native'))
for path in sorted((s/'runs').glob('*/result.json')):
 r=json.loads(path.read_text())
 if r['exit_code']!=0 or 'interval-distance-certainty' in r['id']:continue
 if r.get('source_boundaries_unchanged') is False:continue
 if r.get('tracked_diff_before_sha256') not in [None,hashlib.sha256(b'').hexdigest()]:
  patch_path=path.parent/'dirty.patch'
  if not patch_path.exists():continue
  patch=patch_path.read_bytes()
  if hashlib.sha256(patch).hexdigest()!=r['tracked_diff_before_sha256']:continue
  changed=set(re.findall(r'^diff --git a/(.*?) b/.*$',patch.decode(),re.M))
  if not changed or not changed <= {'crates/hyperreal/benchmarks.md','crates/hyperreal/dispatch_trace.md'}:continue
  r['source_scope_review']='Only generated Hyperreal benchmark/dispatch Markdown changed; actual patch hash verified. No include_str/include_bytes references to these generated report files in compiled source; Clippy does not execute benchmark report I/O.'
 env=r.get('env',{})|r.get('environment',{});body=r['run'].replace('\\\n',' ')
 def replace(m):
  name=m[1] or m[2];v=env.get(name);return str(v) if v is not None else m[0]
 body=re.sub(r'\$\{([A-Za-z_][A-Za-z_0-9]*)\}|\$([A-Za-z_][A-Za-z_0-9]*)',replace,body)
 for line in body.splitlines():
  line=line.strip()
  if not line.startswith('cargo ') or 'clippy ' not in line:continue
  if '$' in line:unparsed.append({'id':r['id'],'line':line});continue
  args=shlex.split(line);tc=r.get('toolchain','stable')
  if args[1].startswith('+'):tc=args.pop(1)[1:]
  if len(args)<2 or args[1]!='clippy':continue
  if not ('-D warnings' in line or '-Dwarnings' in line):continue
  k=key(tc,args,r.get('cwd',''))
  if k:seen.setdefault(k,[]).append({'id':r['id'],'record':str(path),'source_head':r['source_head'],'source_boundaries_unchanged':r.get('source_boundaries_unchanged'),'source_scope_review':r.get('source_scope_review'),'all_targets':'--all-targets' in args,'run':line})
requirements=[];missing=[]
for tc in ['stable','1.95.0']:
 for args,_ in module.documentation_plan(metadata,names):
  k=key(tc,['cargo','clippy',*args],'');matches=[entry for entry in seen.get(k,[]) if entry['all_targets']];row={'toolchain':tc,'package':k[1],'feature_key':list(k),'source_requirement':'scripts/release-docs.py documentation_plan called by scripts/release-check.sh in Rust release workflow','equivalent_strict_commands':matches,'status':'covered-command-scope' if matches else 'missing-command'};requirements.append(row)
  if not matches:
   missing.append({'id':f'extra-clippy.phase6.docs-{tc}-{k[1]}','repository':str(root),'cwd':'','toolchain':tc,'env':{'CARGO_BUILD_JOBS':'4','CARGO_TARGET_DIR':f'/mnt/development/.interval-refactor-build/coordinated-ci/clippy-closure-{tc}'},'run':shlex.join(['cargo','clippy','--locked','--all-targets',*args,'--','-D','warnings']),'local_timeout_seconds':1800,'workflow':'.github/workflows/rust.yml','source_requirement':row['source_requirement']})
report={'time_unix':time.time(),'source_head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),'source_hashes':{p:hashlib.sha256((root/p).read_bytes()).hexdigest() for p in ['scripts/release-docs.py','scripts/release-check.sh','.github/workflows/rust.yml']},'scope':'Exact42 compiler/package docs.rs feature configurations, recovered from the maintained workflow helper. Explicit completed strict commands only; unresolved loops/powersets not automatically credited. Does not yet qualify temporary generated consumer manifests or every workflow script. Missing earlier source-boundary evidence remains visible.','requirements':requirements,'missing_commands':missing,'unparsed_clippy_lines':unparsed,'all_targets_rule':'Every match must have explicit --all-targets. Library-only Clippy cannot qualify integration tests/examples/benches under that feature configuration.'}
(s/('release-clippy-feature-audit.final.json' if '--final' in sys.argv else 'release-clippy-feature-audit.json')).write_text(json.dumps(report,indent=2)+'\n')
for tc in ([] if '--final' in sys.argv else ['stable','1.95.0']):(s/f'extra-clippy-phase6-{tc}.json').write_text(json.dumps([r for r in missing if r['toolchain']==tc],indent=2)+'\n')
print('Requirements',len(requirements),'missing',len(missing));print('\n'.join(r['id'] for r in missing))
