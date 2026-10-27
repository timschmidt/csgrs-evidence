from pathlib import Path
import hashlib,json,re,subprocess
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-polynomial-regions')
base='5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==base
results=json.loads((root/'polynomial-region-final-results.json').read_text())
assert len(results)==15 and all(r['exit_code']==0 and r['source_stable'] for r in results)
files_before=json.loads((root/'polynomial-region-final-files-before.json').read_text())
assert files_before==json.loads((root/'polynomial-region-final-files-after.json').read_text())
for name,mode,digest in files_before:
 if mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
archive=json.loads((root/'polynomial-region-evidence-archive.json').read_text())
record,files,size,digest=archive['manifest_row'].split('\t');commit=archive['commit']
assert archive['parent']=='98fd9084af3539fabee8dbedc1ffe300935f46e9'
rows=re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', (root/'polynomial-region-final-dependent-packages.log').read_text())
assert rows and all(row[0]=='ok' and row[2]=='0' for row in rows)
passed=sum(int(row[1]) for row in rows);ignored=sum(int(row[3]) for row in rows)
assert passed==3009
text=f'''**Polynomial shared-region increment (2026-10-27).** The unchanged H08
parabola boundary first reproduced `Construction/ImplicitPolynomial/Unsupported`
for orientation and admission. Its selected branches now remain supporting
fragments in the existing `CurveRegion2` arrangement. P12–P13, P15 and P17–P20
require the original equation, ordered root, exact domain, traversal and contact
points to survive splitting and publication. A Boolean introduces no new supports.
No rational fit or alternate region authority is introduced.

**API migration:** `CurveError` gains
`UnsupportedFiniteCurveProjection {{ family }}`. External exhaustive Rust
matches must add this arm or an appropriate catch-all, preserving an unsupported
family outcome and returning no sampled geometry. Exact-operation adapters map
it to `ExactCurveError::Blocked` with `UncertaintyReason::Unsupported` and the
affected family. This is a breaking Rust API addition for exhaustive matches
and requires appropriate package release versioning; package publication is
not part of this increment.

Initial carrier admission still produced two loops instead of one for a clip.
The retained original fixture now passes through the existing exact boundary
probe. Selected point incidence is reused before unrelated probes; polynomial
fragment classification retains its exact interior point. The same authority
handles reconstructed path points and open authored/generated clipping. The
original second quintic cut at `x=3/4` is retained with its correct five-piece
expectation (`f(3/4)=-461/1024`), followed by a cut at `7/8` yielding four pieces
(`f(7/8)=21415/32768`). This corrects the test oracle without dropping the case.

Sixteen new public witnesses and the promoted original H08 fixture cover exact
point and path classification, all four Booleans, holes and reversal under both
fill rules, disconnected material, rational similarities, regularized empty
contact, `2^-80` separation, degree-five selected trims, checked point replay,
reconstruction and further operation, mixed circular supports, open clipping,
cusp and node incidence, zero offset, and actually reached budget exhaustion
with a larger retry. STRICT/APPROXIMATE_512/STRICT receipts remain Certified.
Independent equations, source/root/domain assertions and topology accompany the
set identities; sampled membership alone is not the oracle.

The first complete suite exposed one existing error-contract regression:
an unsupported polynomial pair returned a partial result instead of its prior
typed error after region-carrier admission. The generic support fallback now
preserves that representation failure. The original assertion remains unchanged,
and the failed full-suite output is retained with the other attempts.

Final checks on `{base[:10]}` plus the frozen increment pass: 2,754 Hypercurve
tests (81 suites, 34 existing ignored), 43 root downstream tests and {passed:,}
tests across six dependent packages ({ignored} existing ignored). Strict Hypercurve
all-target/all-feature MSRV Clippy, formatting, 16 matrix guards, 107 capability
witnesses, typos, repository budget and diff checks pass. All earlier failed
attempts, diagnostic sources and the interrupted prototype are retained. Raw
evidence is in `{record}`, SHA-256
`{digest}`. All non-receipt bytes remain identical after adding this record.

This is bounded A3 progress. Arbitrary coefficient fields, general image maps,
vertical/repeated components and every singular local sector remain open.
Nonzero polynomial-support offsets, fillets, chamfers and finite projection
still return typed Unsupported; those guard tests do not count as geometric
completion. Checked point definitions do not establish fresh-process native
replay or full BRep trim support. Counted work and external timeouts do not bound
all arithmetic, coefficient growth, retained memory or cancellation. No
performance improvement is claimed. The separate publication candidate through
`b1c011a070` excludes this increment; full repository pre-push qualification is
still required before publishing it.

'''
p=checkout/'crates/hypercurve/FUTURE_WORK.md';s=p.read_text()
assert '**Polynomial shared-region increment' not in s
pos=s.index('**Open, in dependency order:**',s.index('## 8. Polynomial-branch sections'))
p.write_text(s[:pos]+text+s[pos:])
p=checkout/'docs/evidence-archive.md';s=p.read_text()
text=f'''The separate local `hypercurve-polynomial-region-evidence-2026-10-27`
branch ends at `{commit}`, adding
`{record}` ({int(files):,} files,
{int(size):,} bytes), SHA-256
`{digest}`.
It records selected polynomial supports in the shared filled arrangement:
2,754 Hypercurve tests, 43 root downstream tests, {passed:,} tests across six
dependent packages, strict MSRV Clippy, formatting, 16 matrix guards and 107
capability witnesses pass. The unchanged H08 boundary and original failing
Boolean/open-clip cases remain, alongside holes, disconnected material,
reversal, mixed circles, exact selected trims, cusp/node incidence and actual
exhaustion/retry. Qualification used `{base[:10]}` plus the frozen region
increment; non-receipt bytes remain unchanged. The original failed attempts and
the corrected quintic test oracle remain archived. General implicit operations,
nonzero offsets/corners and fresh-process replay remain open. This record is
local and unpushed; the separate complete repository publication run excludes
this increment, whose full pre-push validation remains pending.

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
(root/'polynomial-region-receipt-prepared.json').write_text(json.dumps({'archive':archive,'parent':base,'dependent_passed':passed,'dependent_ignored':ignored,'receipt_files':receipts},indent=2)+'\n')
print('Prepared three qualification receipts; all non-receipt bytes unchanged.')
