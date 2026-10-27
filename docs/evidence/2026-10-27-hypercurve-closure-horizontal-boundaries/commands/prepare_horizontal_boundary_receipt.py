from pathlib import Path
import hashlib,json,re,subprocess
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-horizontal-boundaries')
base='5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==base
results=json.loads((root/'horizontal-boundary-final-results.json').read_text())
assert len(results)==16 and all(r['exit_code']==0 and r['source_stable'] for r in results)
files_before=json.loads((root/'horizontal-boundary-final-files-before.json').read_text())
assert files_before==json.loads((root/'horizontal-boundary-final-files-after.json').read_text())
for name,mode,digest in files_before:
 if mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
archive=json.loads((root/'horizontal-boundary-evidence-archive.json').read_text())
record,files,size,digest=archive['manifest_row'].split('\t');commit=archive['commit']
assert archive['parent']=='98fd9084af3539fabee8dbedc1ffe300935f46e9'
rows=re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', (root/'horizontal-boundary-final-dependent-packages.log').read_text())
assert rows and all(row[0]=='ok' and row[2]=='0' for row in rows)
passed=sum(int(row[1]) for row in rows);ignored=sum(int(row[3]) for row in rows)
assert passed==3010
text=f'''**Horizontal boundary-component increment (2026-10-27).** On committed
`{base[:10]}`, the original `y+2=0` graph in `[-2,2]^2` and both components
of `y^2-4=0` reproduced `BoundaryComponent`. Hypersolve now keeps a horizontal
boundary factor in the original equation and closed fibers. Such a component
has no discrete boundary-entry event. Contacts with other branches are already
zeros of `resultant(F,F_y)`; existing root-free separators and closed strip
counts establish event incidence. P11, P15 and P17–P20 remain owned there.

Ten solver witnesses cover the original lower/upper cases and the documented
circle-plus-boundary fixture, tangent parabola/circle contacts, crossings with
one side outside, algebraic event fibers, `2^-80` distinct components, checked
source replay, and actual counted exhaustion/retry. Independent rational Sturm
counts include closed endpoints. Six Hypercurve witnesses consume these graphs
through degree-five selected trims, finite intersections and overlap, point
location, singular endpoint incidence, reversal, similarity transport and
fresh-process diagnostic source replay followed by another operation. The
original HyperBRep boundary tensor is retained as a positive section witness,
with both pcurves, whole-image validation, native archive replay and affine
transport/revalidation; its upper-boundary counterpart also completes.

The stronger spatial fixture also reproduced a directed pcurve correspondence
mismatch. Matching directed endpoints fixes that error on both the new section
and an already admitted rational source restriction. A further plane contact
then exposed a rational-map dispatch gap: exact similarities stored as quotients
now supply a checked view to the existing line-section algorithm. Original map
definitions and denominator guards remain, including removable factors. This
does not complete general rational images or nonuniform affine incidence.

Final checks pass: 1,223 Hypersolve tests (24 suites), 2,744 Hypercurve tests
(81 suites, 34 existing ignored), 43 root downstream tests and {passed:,} tests
across six dependent packages ({ignored} existing ignored). Strict
all-target/all-feature MSRV Clippy for Hypersolve, Hypercurve and HyperBRep,
formatting, 16 matrix guards, 97 capability witnesses, typos, repository budget
and diff checks pass. All failed attempts remain. Raw evidence is in
`{record}`, SHA-256 `{digest}`. All non-receipt bytes match the qualified
snapshot after this receipt.

No factor or multiplicity is discarded. Vertical/repeated components, broader
coefficient fields and general algebraic operations remain open. The diagnostic
source encoding is not a native Hypercurve archive format. This increment does
not include the separately qualified polynomial region work. Counted work and
external timeouts do not bound every arithmetic operation, coefficient growth,
retained byte or cancellation. No performance improvement is claimed; full
repository pre-push qualification remains pending.

'''
p=checkout/'crates/hypercurve/FUTURE_WORK.md';s=p.read_text()
assert '**Horizontal boundary-component increment' not in s
pos=s.index('**Open, in dependency order:**',s.index('## 8. Polynomial-branch sections'))
p.write_text(s[:pos]+text+s[pos:])
p=checkout/'docs/evidence-archive.md';s=p.read_text()
text=f'''The local `hypercurve-horizontal-boundary-evidence-2026-10-27` branch
ends at `{commit}`, adding `{record}`
({int(files):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records complete closed horizontal boundary components in the existing
finite-fiber topology, with original equations and branch incidence retained.
1,223 Hypersolve tests, 2,744 Hypercurve tests, 43 root downstream tests,
{passed:,} dependent-package tests, strict MSRV Clippy, formatting, 16 matrix
guards and 97 capability witnesses pass. Selected trims, overlap and further
intersection, exact source replay in a fresh process, and the original BRep
boundary section through native/affine replay are covered. Earlier failed
attempts remain archived. Vertical/repeated components, algebraic coefficient
fields and general closure remain open. This record is local and unpushed;
the full repository pre-push validation of this increment remains pending.

'''
marker='## Follow-on records\n\n';assert marker in s and commit not in s
p.write_text(s.replace(marker,marker+text,1))
p=checkout/'docs/evidence-archive.tsv'
excluded=[row for row in p.read_text().splitlines() if row.startswith('excluded:')];assert len(excluded)==4
manifest=subprocess.check_output(['python3','scripts/evidence_archive.py','manifest','/tmp/csgrs-closure-evidence.git',commit],cwd=checkout,text=True).splitlines()
assert len(manifest)==350 and not any(row.startswith('excluded:') for row in manifest)
p.write_text('\n'.join(manifest+excluded)+'\n')
receipts=['crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv']
for name,mode,digest in files_before:
 if name not in receipts and mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
(root/'horizontal-boundary-receipt-prepared.json').write_text(json.dumps({'archive':archive,'parent':base,'dependent_passed':passed,'dependent_ignored':ignored,'receipt_files':receipts},indent=2)+'\n')
print('Prepared three qualification receipts; all non-receipt bytes unchanged.')
