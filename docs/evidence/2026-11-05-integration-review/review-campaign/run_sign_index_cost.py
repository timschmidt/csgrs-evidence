from pathlib import Path
import hashlib,json,platform,statistics,subprocess,time,tomllib
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'target/final-prepush-20261105/sign-index-cost';OUT.mkdir(exist_ok=True)
roots={'baseline':Path('/tmp/csgrs-axis-acceptance-20261105'),'candidate':Path('/tmp/csgrs-sign-cache-20261105')}
build_rows=[json.loads(line) for line in (ROOT/'target/final-prepush-20261105/sign-index-cost-build.jsonl').read_text().splitlines() if line.startswith('{')]
new_executables={row['target']['name']:Path(row['executable']) for row in build_rows if row.get('executable') and row.get('reason')=='compiler-artifact'}
executables={
 ('baseline','coplanar'):ROOT/'target/brep-cost-candidate-build/release/deps/coplanar-c217888af0f7b471',
 ('baseline','prisms'):ROOT/'target/brep-cost-candidate-build/release/deps/prisms-a4846ba26db08b6e',
 ('candidate','coplanar'):new_executables['coplanar'],
 ('candidate','prisms'):new_executables['prisms']}

fixtures=['crates/hyperbrep/benches/coplanar.rs','crates/hyperbrep/benches/prisms.rs','crates/hyperbrep/tests/support/coplanar.rs','crates/hyperbrep/tests/support/prisms.rs','crates/hyperbrep/tests/support/seam_cuts.rs']
assert all((roots['baseline']/p).read_bytes()==(roots['candidate']/p).read_bytes() for p in fixtures)
locks={v:tomllib.loads((r/'Cargo.lock').read_text()) for v,r in roots.items()}
registry={v:{(p['name'],p['version'],p.get('source')):p for p in lock['package'] if p.get('source')} for v,lock in locks.items()}
assert registry['baseline']==registry['candidate']
manifest={'machine':platform.uname()._asdict(),'source':{v:subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip() for v,r in roots.items()},'fixtures':{p:hashlib.sha256((roots['baseline']/p).read_bytes()).hexdigest() for p in fixtures},'equal_external_dependency_versions_and_checksums':len(registry['baseline']),'implementation_lock_delta':'Exact Cargo.lock bytes identical; only selected-field proof indexing changes production code.','binaries':{v+'/'+b:{'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for (v,b),p in executables.items()},'scope':'Matched ordinary completion/allocation probes using unchanged maintained independent geometry checks, full output materialization and native replay in timing. Three fresh processes each variant/bench, alternating order. Contended host; no statistical speedup, whole-operation resource bound or peak-memory claim. Receipts and intra-process replay bytes are checked; cross-version full byte equality is not claimed.'}
(OUT/'recipe.json').write_text(json.dumps(manifest,indent=2)+'\n')
rows=[]
for round_index in range(3):
 for bench in ['prisms','coplanar']:
  for variant in (['baseline','candidate'] if round_index%2==0 else ['candidate','baseline']):
   exe=executables[variant,bench];stem=OUT/f'{round_index}-{bench}-{variant}';start=time.time();print('START',stem.name,flush=True)
   with stem.with_suffix('.out').open('w') as stdout,stem.with_suffix('.err').open('w') as stderr:
    r=subprocess.run([str(exe)],cwd=roots[variant],stdout=stdout,stderr=stderr)
   data=[json.loads(line) for line in stem.with_suffix('.out').read_text().splitlines() if line.startswith('{')]
   row={'variant':variant,'bench':bench,'round':round_index,'exit_code':r.returncode,'seconds':time.time()-start,'samples':data};rows.append(row)
   with (OUT/'results.jsonl').open('a') as f:f.write(json.dumps(row)+'\n')
   print('END',stem.name,r.returncode,'cases',len(data),flush=True)
   r.check_returncode()
checks={}
for row in rows:
 for sample in row['samples']:
  checks.setdefault(sample['case'],{}).setdefault(row['variant'],[]).append(sample)
summary={}
for case,variants in checks.items():
 assert set(variants)=={'baseline','candidate'}
 receipt={s['receipt'] for values in variants.values() for s in values};assert len(receipt)==1,(case,receipt)
 assert all(s['outcome']=='certified' for values in variants.values() for s in values)
 summary[case]={v:{k:statistics.median(s[k]/s['iterations'] for s in values) for k in ['elapsed_ns','allocation_calls','requested_bytes']} for v,values in variants.items()}
(OUT/'summary.json').write_text(json.dumps({'cases':len(summary),'all_processes_completed':True,'all_receipts_equal':True,'median_per_iteration':summary},indent=2)+'\n')
print('All',len(summary),'matched cases completed',flush=True)
