from pathlib import Path
import hashlib,json,re,subprocess
root=Path(__file__).resolve().parent
from validate_algebraic_pair_attribution import validate
validate(root)
checkout=Path('/tmp/hypercurve-closure-algebraic-similarities')
base='4519ec554d0bffdae3c7f45ffaac4a688c7663de'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==base
results=json.loads((root/'algebraic-pair-final-results.json').read_text())
assert len(results)==19 and all(r['exit_code']==0 and r['source_stable'] for r in results)
files_before=json.loads((root/'algebraic-pair-final-files-before.json').read_text())
assert files_before==json.loads((root/'algebraic-pair-final-files-after.json').read_text())
for name,mode,digest in files_before:
 if mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
archive=json.loads((root/'algebraic-pair-evidence-archive.json').read_text())
record,files,size,digest=archive['manifest_row'].split('\t');commit=archive['commit']
assert archive['parent']=='5c1494e708b19575a7616ee58443d4acf07350f1'
rows=re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', (root/'algebraic-pair-final-dependent-packages.log').read_text())
assert rows and all(row[0]=='ok' and row[2]=='0' for row in rows)
passed=sum(int(row[1]) for row in rows);ignored=sum(int(row[3]) for row in rows)
assert ignored==19 and passed>3010
text=f'''**Shared algebraic image incidence increment (2026-10-27).** On committed
`{base[:10]}`, all eight public pair/chord witnesses reproduce the original
rational-only image restrictions. The composed seventh-root scale also
reproduces `Undecided` in the selected common-fiber solver on that revision.
Earlier prototypes that admitted the common similarity but lacked the solver
fallback exceeded the unchanged public hard case’s 300-second external allowance;
those source snapshots and timeouts are retained.
A mutated root interval is also accepted as field evidence without an actual
selected root. These are P15 and
P17–P20 failures at the curve incidence and selected-field admission boundaries.

Polynomial pairs now compare their shared invertible similarity coefficients
by strict value. Chords admit algebraic inverse coordinate forms and consume
an already proved source-chart support directly, preserving selected endpoints
without a forward/inverse expansion. After an undecided common-fiber GCD,
Hypersolve can reuse its existing projective normalization when every
coefficient ratio has an exact rational proof. A proved nonzero scalar factor
preserves roots and multiplicities; parameter factors are retained. Field and
quotient-ring projection admission recheck point membership or exactly one
owned root in `(lower, upper]`. Uncached singleton endpoints remain supported,
and unavailable selection predicates remain undecided.

Eight curve witnesses cover seventh-root scale/reflection, translation,
independently equal maps, algebraic trims and overlaps, tangent and near-distinct
branches, changed transforms, actual zero-budget exhaustion and retry, policy
transitions, both fill rules, reconstruction, further Booleans, and oblique
chords with selected endpoints. Ten public solver witnesses cover composed
coefficients, signed/transposed equations, nearby distinct equations, vanishing
parameter factors, valid and invalid selectors, singleton membership, and
structural-negation handoff. The first full qualification exposed four valid
singleton regressions and a structural-negation generator regression. Their
original tests and minimized seed remain unchanged; selection replay now lives
at field admission, while structural witness arithmetic keeps its contract.

Final checks pass: 1,233 Hypersolve tests (25 suites, none ignored), 2,781
Hypercurve tests (86 suites, 34 existing ignored), 43 root downstream tests, and
{passed:,} tests across nine dependent packages. The six curve consumers account
for 3,010 of those tests; additional direct solver consumers are Hyperpath,
Hyperphysics and the standalone exactCore comparison package. Its 19 existing
oracle-defect cases remain ignored. ExactCore source hashes are recorded before
and after execution. Strict Hypersolve/Hypercurve all-target/all-feature MSRV
Clippy, formatting, 16 matrix guards, 133 capability witnesses, typos, repository
budget and diff checks pass. Raw failed attempts, source snapshots and commands
are in `{record}`, SHA-256 `{digest}`. Non-receipt source bytes remain unchanged
after this receipt.

The comparison inventory guard also failed on the unchanged parent because it
omitted HyperBRep I/O and Hyperspatial. Their domain dispositions are now explicit,
with historical audit measurements preserved. Earlier kernel checks retain
their original source attribution: only those two audit metadata files changed.
The complete comparison suite, matrix and hygiene checks ran after that repair;
both failed qualification attempts are archived.

This is a shared-image chart extension and optional projective rationalization,
not a general algorithm for unrelated maps or arbitrary coefficient fields.
Structural root representation validation is not a complete field certificate.
Checked point replay is in memory; fresh-process native interchange and general
algebraic offset/corner closure remain open. Counted limits and external timeouts
do not bound all arithmetic, coefficient growth, memory or cancellation. No
performance improvement is claimed. Full repository pre-push qualification
remains pending for this later increment.

'''
p=checkout/'crates/hypercurve/FUTURE_WORK.md';s=p.read_text()
assert '**Shared algebraic image incidence increment' not in s
pos=s.index('**Open, in dependency order:**',s.index('## 8. Polynomial-branch sections'))
p.write_text(s[:pos]+text+s[pos:])
p=checkout/'docs/evidence-archive.md';s=p.read_text()
text=f'''The local `hypercurve-algebraic-pair-evidence-2026-10-27` branch ends at
`{commit}`, adding `{record}`
({int(files):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records shared algebraic similarity incidence, selected-endpoint chord
source charts, projective common-fiber equations and strict selected-field
admission. All 1,233 Hypersolve tests, 2,781 Hypercurve tests, 43 root downstream
tests, {passed:,} tests across nine dependent packages, strict MSRV Clippy,
formatting, 16 matrix guards and 133 capability witnesses pass. The Hypercurve
suite retains 34 existing ignored cases; standalone exactCore comparisons retain
19 existing oracle-defect cases. Original unsupported, undecided and timeout
witnesses, both failed qualifications, unchanged regression tests, the minimized
generated seed, and the repaired two-crate comparison inventory are archived.
Per-command source snapshots distinguish the metadata repair from the unchanged
kernel inputs. This record is local and
unpushed; full pre-push qualification, general algebraic closure and native
fresh-process replay remain open.

'''
marker='## Follow-on records\n\n';assert marker in s and commit not in s
p.write_text(s.replace(marker,marker+text,1))
p=checkout/'docs/evidence-archive.tsv'
excluded=[row for row in p.read_text().splitlines() if row.startswith('excluded:')];assert len(excluded)==4
manifest=subprocess.check_output(['python3','scripts/evidence_archive.py','manifest','/tmp/csgrs-closure-evidence.git',commit],cwd=checkout,text=True).splitlines()
assert len(manifest)==355 and not any(row.startswith('excluded:') for row in manifest)
p.write_text('\n'.join(manifest+excluded)+'\n')
receipts=['crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv']
for name,mode,digest in files_before:
 if name not in receipts and mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
(root/'algebraic-pair-receipt-prepared.json').write_text(json.dumps({'archive':archive,'parent':base,'dependent_passed':passed,'dependent_ignored':ignored,'receipt_files':receipts},indent=2)+'\n')
print('Prepared three qualification receipts; all non-receipt bytes unchanged.')
