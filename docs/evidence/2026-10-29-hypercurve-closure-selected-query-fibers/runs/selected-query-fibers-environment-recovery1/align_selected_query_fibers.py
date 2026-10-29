from pathlib import Path
import hashlib,importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-query-fibers'
receipts={'crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv'}
implementation={'crates/hypersolve/src/ordered_field_roots/complete.rs', 'crates/hypercurve/tests/support/rational_point_forms.rs', 'crates/hyperbrep/tests/selected_query_archive.rs', 'crates/hypercurve/src/curve_point/definition.rs', 'crates/hypercurve/qualification/capabilities.json', 'crates/hypercurve/src/finite_projection.rs', 'crates/hypercurve/src/polynomial_curve_abscissa.rs', 'crates/hypercurve/tests/support/polynomial_curves.rs', 'crates/hyperbrep/tests/support/polynomial_points.rs', 'crates/hypercurve/CHANGELOG.md', 'crates/hypercurve/src/svg/exact/graph/points.rs', 'crates/hypercurve/tests/support/selected_fiber_images.rs', 'crates/hypercurve/tests/fiber_point_incidence.rs', 'tests/svg_region_replay.rs', 'crates/hypersolve/src/ordered_field_roots.rs', 'crates/hypercurve/tests/selected_polynomial_points.rs', 'crates/hypercurve/tests/support/polynomial_sections.rs', 'crates/hypersolve/CHANGELOG.md', 'crates/hyperbrep/src/persistence/planar_points.rs', 'crates/hypercurve/tests/polynomial_query_fibers.rs', 'crates/hypercurve/tests/svg_point_replay.rs', 'crates/hypercurve/src/polynomial_point/joint.rs', 'crates/hypercurve/src/polynomial_curve.rs', 'crates/hypersolve/tests/selected_polynomial_root_discovery.rs', 'crates/hypercurve/src/polynomial_point.rs', 'crates/hypercurve/src/polynomial_point/selected_fiber.rs', 'crates/hypersolve/src/lib.rs', 'crates/hyperbrep/tests/support/rational_surface_evaluation.rs', 'crates/hypercurve/src/bezier_offset/selected_fiber/image_tests.rs', 'crates/hypercurve/tests/support/joint_form_arithmetic.rs', 'docs/MIGRATIONS.md', 'crates/hypercurve/src/bezier_offset/cusp_semicircle/incident_point.rs'}
prepared=json.loads((c/'selected-query-fibers-prepared.json').read_text());point=json.loads((c/'selected-field-root-discovery-final-commit.json').read_text());run=c/'selected-query-fibers-qualification-final1';qualification=json.loads((run/'complete.json').read_text());rows=json.loads((run/'results.json').read_text())
assert qualification['all_passed'] and qualification['groups']==len(rows)==25 and all(row['exit_code']==0 and row['source_stable'] for row in rows)
assert point['user_checkout_unchanged'] and len(point['checks'])==5 and all(row['exit_code']==0 for row in point['checks'])
def git(*args):return subprocess.check_output(['git',*args],cwd=w,text=True).strip()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
before,files,patch=e.source_snapshot();assert before==qualification['source'] and files==json.loads((run/'files-before.json').read_text())
assert git('rev-parse','HEAD')==prepared['checkpoint']
assert set(git('diff','--name-only','HEAD').splitlines())==implementation
assert not git('ls-files','--others','--exclude-standard')
assert set(git('diff','--name-only',prepared['checkpoint'],point['commit']).splitlines())==receipts
record=c/'selected-query-fibers-parent-alignment.json';assert not record.exists()
seed_patch=subprocess.check_output(['git','diff','--binary',prepared['root_source_checkpoint_parent'],prepared['checkpoint']],cwd=w)
(c/'selected-query-fibers-seed.patch').write_bytes(seed_patch)
# This changes only the dedicated branch/index. All dependent fiber working files
# are retained and checked; only the finalized parent's three receipts are read.
subprocess.run(['git','reset','--mixed',point['commit']],cwd=w,check=True)
for name in receipts:(w/name).write_bytes(subprocess.check_output(['git','show',point['commit']+':'+name],cwd=w))
subprocess.run(['git','add','-N','crates/hypercurve/tests/polynomial_query_fibers.rs','crates/hypercurve/src/polynomial_point/selected_fiber.rs'],cwd=w,check=True)
after,af,_=e.source_snapshot()
assert [row for row in files if row[0] not in receipts]==[row for row in af if row[0] not in receipts]
assert set(git('diff','--name-only','HEAD').splitlines())==implementation
assert not git('ls-files','--others','--exclude-standard')
result={'qualified':before,'aligned':after,'root_parent':point['commit'],'root_evidence':point['evidence_commit'],'checkpoint':prepared['checkpoint'],'seed_parent':prepared['root_source_checkpoint_parent'],'seed_patch_sha256':hashlib.sha256(seed_patch).hexdigest(),'changed_since_qualification':sorted(receipts),'all_nonreceipt_bytes_unchanged':True,'source_reconstruction':'Apply selected-query-fibers-seed.patch to seed_parent, then the qualified candidate.patch. File digests and checkpoint tree are retained. The finalized root-discovery parent changes only the three receipt files from that checkpoint.','epoch':time.time()}
e.save_json(record,result);e.save_json(c/'selected-query-fibers-aligned-files.json',af);print(result)
