from pathlib import Path
import json,subprocess,re,hashlib,shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-flow-noise');source=json.loads((s/'SOURCE.json').read_text())
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==source['commit']
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
assert set(subprocess.check_output(['git','diff','--name-only',source['implementation_commit'],source['commit']],cwd=r,text=True).splitlines())=={'crates/hyperdynamics/tests/flow_noise_witness.rs','crates/hyperdynamics/README.md'}
before=subprocess.check_output(['git','show',source['implementation_commit']+':crates/hyperdynamics/README.md'],cwd=r,text=True)
assert before.replace('arithmetic instrumentation when `field` is enabled.\n\n\nEnable','arithmetic instrumentation when `field` is enabled.\n\nEnable')==(r/'crates/hyperdynamics/README.md').read_text()
for file in ['prototype-checks.json','review-checks.json','final-checks.json','delivery-checks.json','delivery-final-tests.json','cost-builds.json']:
 assert all(v['returncode']==0 for v in json.loads((s/file).read_text())),file
for compiler in ['msrv','stable']:
 assert 'test result: ok. 14 passed; 0 failed; 0 ignored;' in (s/('delivery-final-'+compiler+'-tests.log')).read_text()
assert 'test result: ok. 14 passed; 0 failed; 0 ignored;' in (s/'algebraic-focused.log').read_text()
counts={}
for name in ['final-owner','final-physics']:
 text=(s/(name+'.log')).read_text();assert 'test result: FAILED' not in text
 rows=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;',text)
 counts[name]={'harness_summaries':len(rows),'passed':sum(int(x[0]) for x in rows),'failed':sum(int(x[1]) for x in rows),'ignored':sum(int(x[2]) for x in rows)}
timings=json.loads((s/'timing-bootstrap.json').read_text());memory=json.loads((s/'memory-summary.json').read_text());assert len(timings)==8 and len(memory)==16
assert all(x['no_post_first_workload_growth'] for x in memory)
assert len(json.loads((s/'timing-samples.json').read_text()))==480
sizes=json.loads((s/'cost-builds.json').read_text());old=next(x for x in sizes if x['name']=='boxes');new=next(x for x in sizes if x['name']=='timing')
size={'box_binary_bytes':old['bytes'],'noise_binary_bytes':new['bytes'],'binary_growth_ratio':new['bytes']/old['bytes'],'boxes_elf_text':int(old['size'].splitlines()[1].split()[0]),'noise_elf_text':int(new['size'].splitlines()[1].split()[0])}
shutil.copy2('/tmp/interval-refactor/release-curve-consumer-final-frozen-check.json',s/'prior-frozen-check.json');assert all(x['matched'] for x in json.loads((s/'prior-frozen-check.json').read_text()))
q={'source_commit':source['commit'],'implementation_commit':source['implementation_commit'],'base':source['base'],'retention':'accept opt-in proposed-step correlated endpoint API; no automatic controller replacement','production_sources_unchanged_since_cost_and_archives':True,'post_measurement_diff':['crates/hyperdynamics/tests/flow_noise_witness.rs','crates/hyperdynamics/README.md'],'readme_post_archive_difference':'one stray blank line removed; all other README bytes unchanged','counts':counts,'focused_tests':14,'archive_packages':7,'archive_compilers':['Rust 1.95','Rust stable 1.99'],'archive_scope':'actual shipped example, final focused tests with fresh process replay, all-feature owner documentation, archive path resolution','costs':timings,'sizes':size,'memory_post_source_range':[min(x['after_source'] for x in memory),max(x['after_source'] for x in memory)],'limitations':['finite qualification corpus; no universal trajectory or algebraic closure claim','scalar refinement, coefficient payload, total heap and within-scalar cancellation excluded from structural/native budgets','first-use 104/208/312 byte retention is reported, consistent with existing rational caches; not precisely attributed or leak-freedom proof','explicit proposed steps; no automatic noise-aware controller','WASM compilation only','seven-crate delivery subset; whole release workflow and hosted/platform/HIL not repeated','full goal and all phases remain open'],'push_or_publication':False}
(s/'QUALIFICATION.json').write_text(json.dumps(q,indent=2)+'\n');print(json.dumps({'counts':counts,'size':size},indent=2))
