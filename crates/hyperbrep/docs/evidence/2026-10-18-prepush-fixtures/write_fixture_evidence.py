"""Retain source-bound fixture corrections without claiming a full push gate."""
from pathlib import Path
import gzip,hashlib,json,re,shutil,subprocess,textwrap
ROOT=Path('/mnt/development/csgrs')
OUT=Path('/tmp/hyperbrep-prepush-20261018')
DEST=ROOT/'crates/hyperbrep/docs/evidence/2026-10-18-prepush-fixtures'
BASE='7dec1b08caa8722691e932972a084120759ade88'
UPSTREAM='dbe99e3cc145e8ca58a53ade6e79fd46311972fb'
ID='prepush-fixture-maintenance-2026-10-18'
rows=json.loads((OUT/'results.json').read_text())
by_label={r['label']:r for r in rows}
passed=['fixture-01-root-native','fixture-02-root-reproductions','fixture-03-tri-all-tests','fixture-03-mesh-reproductions','fixture-03-hypersdf','fixture-03-csgrs-ffi','fixture-03-tri-minimal-clippy','fixture-04-drc-reproductions','fixture-04-clippy-changed-tests','fixture-04-clippy-drc-tests','fixture-04-brep-downstream-clippy']
for label in passed: assert by_label[label]['exit_code']==0,label
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip()==BASE
assert not DEST.exists()
DEST.mkdir(parents=True)
(DEST/'logs').mkdir();(DEST/'patches').mkdir()
def digest(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def pack(source,destination):
 with source.open('rb') as inp,destination.open('wb') as out:
  with gzip.GzipFile(fileobj=out,mode='wb',filename='',mtime=0,compresslevel=6) as zipped:shutil.copyfileobj(inp,zipped)
 return dict(path=str(destination.relative_to(DEST)),sha256=digest(destination),uncompressed_sha256=digest(source),uncompressed_bytes=source.stat().st_size)
labels=[r['label'] for r in rows if r['label'].startswith(('fixture-','focused-','upstream-focused-','extra-','upstream-extra-')) or r['label'] in ['root-test-default-retry-space','diagnostic-root-remaining-uncertainty','diagnostic-wasm-certainty','diagnostic-wasm-bindings','upstream-root-remaining-uncertainty','upstream-wasm-certainty','upstream-wasm-bindings','upstream-clippy-tri-all','diagnostic-spelling','upstream-spelling','upstream-ring_cache_keeps_only_strict_success_and_owned_identity','upstream-approximate_sweep_reports_consumed_terminal_point_equality']]
checks=[]
for label in labels:
 row=dict(by_label[label]);log=Path(row.pop('log'));assert digest(log)==row.pop('log_sha256'),label
 row['retained_log']=pack(log,DEST/'logs'/(label+'.log.gz'))
 patch=row.pop('source_patch',None);row.pop('source_patch_sha256',None)
 upstream=row.get('cwd','').startswith('target/hyperbrep-prepush-upstream')
 row['source_role']='upstream snapshot' if upstream else 'branch working tree'
 row['effective_base_revision']=UPSTREAM if upstream else BASE
 if patch and not upstream:
  row['retained_source_patch']=pack(Path(patch),DEST/'patches'/(label+'.patch.gz'))
 if upstream:row['source_note']='An isolated git archive of the pinned upstream revision supplies source; the runner records its own branch HEAD separately.'
 checks.append(row)
(DEST/'checks.json').write_text(json.dumps(checks,indent=2)+'\n')
for name in ['fixture-correction-contract.json','consumer-fixture-migration.json','root-fixture-migration.json','drc-fixture-contract.json','drc-failure-inventory.json','spelling-attribution.json','preliminary-diagnostic-interruptions.json','matrix-interrupted-for-fixture-correction.json','disk-recovery.json','new-object-sizes.json','workflow-inputs.json','full.json','exclusions.json','tool-downloads.json']:
 shutil.copyfile(OUT/name,DEST/name)
partial=[]
for label in ['fixture-01-root-default-diagnostic','upstream-root-default-diagnostic','diagnostic-hypermesh','upstream-diagnostic-hypermesh']:
 partial.append(dict(label=label,status='intentionally interrupted before source correction; not a completed suite or gate',log=pack(OUT/(label+'.log'),DEST/'logs'/(label+'.log.gz'))))
(DEST/'interrupted-diagnostics.json').write_text(json.dumps(partial,indent=2)+'\n')
summary=dict(
 id=ID,base_revision=BASE,upstream_revision=UPSTREAM,
 admitted_scope='Validation fixtures and explicit certified/undecided controls only. No production algorithm, public API, policy, fixture assertion, or tolerance is weakened.',
 properties=['P4','P8','P9','P11','P18','P19','P25','P28','P30','P35','P36'],
 mathematical_domain='sin(e)^2 + cos(e)^2 - 1 is now certified. Each migrated fixture preserves a proof check for that original expression, then uses sin(e+1) - sin(e)cos(1) - cos(e)sin(1), an independent exact zero that remains undecided under STRICT. Offset-one and offset-three fixtures retain their exact values. Existing failure, receipt, cache, handle, topology, and recovery assertions stay in place.',
 positive_controls=['A new root test retains canonical empty profiles and exact swept volume 4 with certified receipts under both policies for the original unit-circle expression.','The DRC affine policy test exercises both the original certified zero and the unresolved zero.'],
 validation={'native_curve_tests':19,'root_and_native_wasm_reproductions':59,'hypertri_all_feature_library_and_integration_tests':196,'mesh_reproductions':17,'hypersdf_tests':114,'ffi_tests':10,'drc_reproductions_and_affine_control':87,'strict_clippy':'Changed library/test/benchmark configurations, DRC release library/tests, minimal Hypertri targets, and all-feature/all-target BRep/IO pass. The separate full all-target command fails on an unchanged upstream example.','wasm_consumers':'Actual JS and TS workflow scripts pass on branch and upstream before the final test-only edits; these are not claimed as a new final complete workflow run.'},
 blockers=[{'gate':'typos .','inherited_findings':188020,'source':'Same findings reproduced on the pinned upstream snapshot. Two additional abbreviated-commit findings are corrected by retaining the full commit ID. A focused post-correction check still finds an inherited abbreviated baseline ID in the shared ledger.','action':'Preserve archived evidence and leave unrelated upstream findings to their owner.'},{'gate':'all-target Clippy -D warnings','source':'crates/hypertri/examples/allocation_profile.rs:83','finding':'AtomicUsize::fetch_update is deprecated by the installed stable compiler. The same failure occurs on unchanged upstream source.','action':'No lint suppression or unrelated API-floor change.'}],
 full_pre_push_complete=False,publication_qualified=False,all_work_packages_remain_open=True,
 limits=['Full pre-push validation was interrupted to repair reproduced branch-dependent failures; the complete final workflow matrix remains outstanding.','Focused checks do not waive inherited failures or replace full workflow commands.','No new performance, memory-bound, release, package, formal-proof, or whole-workspace admission claim.','All prior BRep semantic and adverse-cost evidence remains tied to its recorded revision.'],
 storage='Move the existing reproducible build cache to the expanded repository disk and retain /tmp paths via symlinks; preserve evidence and logs. No source or captured baseline binaries were removed in this recovery.')
(DEST/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
status_path=ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status=json.loads(status_path.read_text());assert not any(x['id']==ID for x in status['increments'])
status['increments'].append(dict(id=ID,work_packages=['WP21','WP23'],properties=summary['properties'],change='Restore downstream uncertainty coverage after stronger scalar proofs, retaining the original exact cases and every outcome assertion.',evidence='evidence/2026-10-18-prepush-fixtures/manifest.json',validation='19 native curve tests; 59 reproduced root/native-WASM cases; 196 Hypertri tests; 17 reproduced mesh cases; 114 Hypersdf tests; 10 FFI tests; 87 DRC cases. Changed-test Clippy, minimal Hypertri Clippy, and all-target BRep/IO Clippy pass. Actual JS/TS consumers also pass at their recorded source epoch.',limits='Full final pre-push qualification remains incomplete and blocked by reproduced upstream spelling and deprecated-API lint failures. Preliminary full diagnostics were explicitly interrupted for source correction, not counted as passing. No runtime algorithm, API, performance, resource, package, formal-proof, release or work-package completion claim.'))
status['next_actions'].insert(0,'Retain evidence/2026-10-18-prepush-fixtures/manifest.json. Future proof extensions must keep newly certified original fixtures and independently unresolved controls. Complete the final pre-push matrix and resolve required failures before publishing unless the user explicitly authorizes an exception; focused checks do not waive AGENTS.md.')
status_path.write_text(json.dumps(status,indent=2)+'\n')
ledger_path=ROOT/'docs/properties-status.json';text=ledger_path.read_text();old=json.loads(text)
key='hyperbrep_pre_push_fixture_maintenance_2026_10_18';assert key not in old['current_work']
record=dict(base_revision=BASE,upstream_revision=UPSTREAM,evidence='crates/hyperbrep/docs/evidence/2026-10-18-prepush-fixtures/manifest.json',scope=summary['admitted_scope'],validation=summary['validation'],blocking_gates=summary['blockers'],full_pre_push_complete=False,publication_qualified=False,runtime_algorithms_changed=False,work_packages_completed=[])
start=re.search(r'^  "current_work": ',text,re.M).end();_,end=json.JSONDecoder().raw_decode(text,start)
encoded=json.dumps({key:record},indent=2).splitlines()[1:-1]
new=text[:end-1].rstrip()+',\n'+textwrap.indent('\n'.join(encoded),'  ')+'\n  }'+text[end:]
expected=dict(old);expected['current_work']=dict(old['current_work'],**{key:record});assert json.loads(new)==expected
ledger_path.write_text(new)
paths=subprocess.check_output(['git','diff','--name-only','HEAD'],cwd=ROOT,text=True).splitlines()
source_paths=[p for p in paths if p.endswith('.rs')]
source_patch=subprocess.check_output(['git','diff','--binary','HEAD','--',*source_paths],cwd=ROOT)
(DEST/'source.patch').write_bytes(source_patch)
shutil.copyfile(Path(__file__),DEST/'write_fixture_evidence.py')
manifest=dict(id=ID,base_revision=BASE,upstream_revision=UPSTREAM,source_files={p:digest(ROOT/p) for p in source_paths},documentation={str(p.relative_to(ROOT)):digest(p) for p in [status_path,ledger_path]},source_patch_sha256=digest(DEST/'source.patch'),evidence={str(p.relative_to(DEST)):dict(sha256=digest(p),bytes=p.stat().st_size) for p in sorted(DEST.rglob('*')) if p.is_file()},full_pre_push_complete=False,publication_qualified=False)
(DEST/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
print('Retained',len(checks),'completed command records and',len(partial),'explicitly incomplete diagnostics; source files:',len(source_paths),flush=True)
