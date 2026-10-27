from pathlib import Path
import hashlib,json,re,subprocess
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-algebraic-similarities')
base='5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==base
results=json.loads((root/'algebraic-similarity-final-results.json').read_text())
assert len(results)==15 and all(r['exit_code']==0 and r['source_stable'] for r in results)
files_before=json.loads((root/'algebraic-similarity-final-files-before.json').read_text())
assert files_before==json.loads((root/'algebraic-similarity-final-files-after.json').read_text())
for name,mode,digest in files_before:
 if mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
archive=json.loads((root/'algebraic-similarity-evidence-archive.json').read_text())
record,files,size,digest=archive['manifest_row'].split('\t');commit=archive['commit']
assert archive['parent']=='98fd9084af3539fabee8dbedc1ffe300935f46e9'
rows=re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', (root/'algebraic-similarity-final-dependent-packages.log').read_text())
assert rows and all(row[0]=='ok' and row[2]=='0' for row in rows)
passed=sum(int(row[1]) for row in rows);ignored=sum(int(row[3]) for row in rows)
assert passed==3009
text=f'''**Algebraic similarity section increment (2026-10-27).** On committed
`{base[:10]}`, native-line queries against the selected quintic scaled by
`sqrt(2)` or translated by `(sqrt(3),sqrt(2))` reproduce
`Intersection/ImplicitPolynomial/Unsupported`. Original source-line controls
already succeed. The polynomial owner now lets the exact inverse similarity
feed the existing native-line section authority. P15 and P17–P20 require the
same original source equation, ordered fiber, parameter domain, selected
endpoints, overlap correspondence and retained image to survive the query.

A nonsingular similarity is bijective: contact and overlap pullbacks preserve
the original source abscissa, and its determinant transports oriented crossing
signs. Removing the rational-coefficient restriction adds no geometric carrier
or elimination path. Exact scalar and selected-field decisions remain required;
their undecided or exhausted outcomes keep their typed meaning.

Seven public witnesses cover the original failures, a seventh-root scale,
oblique maps using both `sqrt(2)` and `sqrt(3)`, reflection and all traversal
orders, tangency, selected trim endpoints, excluded parameters, common line
components, repeated overlap clipping and distinct `2^-80` source shifts.
Independent expanded world equations, exact source parameters and topology
assertions accompany checked in-memory point replay and further intersection.
Reached zero counted work returns exhaustion; a larger retry succeeds, and
STRICT/APPROXIMATE_512/STRICT retains Certified receipts after source drop.

Final checks pass: 2,745 Hypercurve tests (81 suites, 34 existing ignored),
43 root downstream tests and {passed:,} tests across six dependent packages
({ignored} existing ignored). Strict Hypercurve all-target/all-feature MSRV Clippy,
formatting, 16 matrix guards, 98 capability witnesses, typos, repository budget
and diff checks pass. Raw failures, source snapshots and exact commands are in
`{record}`, SHA-256 `{digest}`. All non-receipt source bytes remain identical
after this receipt.

General rational images, different-image polynomial pairs, broader topology
coefficient fields, repeated/vertical components and implicit offset/corner
closure remain open. Point-definition replay here is in memory, not a native
fresh-process archive. This branch excludes the separate region and horizontal
boundary increments. Counted work and external timeouts do not bound total
arithmetic, coefficient growth, retained memory or cancellation. No performance
improvement is claimed; full repository pre-push qualification remains pending.

'''

p=checkout/'crates/hypercurve/FUTURE_WORK.md';s=p.read_text()
assert '**Algebraic similarity section increment' not in s
pos=s.index('**Open, in dependency order:**',s.index('## 8. Polynomial-branch sections'))
p.write_text(s[:pos]+text+s[pos:])
p=checkout/'docs/evidence-archive.md';s=p.read_text()
text=f'''The local `hypercurve-algebraic-similarity-evidence-2026-10-27` branch
ends at `{commit}`, adding `{record}`
({int(files):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records native-line sections through retained algebraic similarities with
original selected polynomial sources preserved. 2,745 Hypercurve tests,
43 root downstream tests, {passed:,} tests across six dependent packages,
strict MSRV Clippy, formatting, 16 matrix guards and 98 capability witnesses
pass. Expanded equations, exact parameters, tangency, overlap continuation,
selected trims, distinct nearby supports and actual exhaustion/retry are covered.
Original failed witnesses and raw source-attributed commands remain archived.
This record is local and unpushed. General image and algebraic operation closure
and fresh-process native replay remain open; full pre-push qualification is
still required before publication.

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
(root/'algebraic-similarity-receipt-prepared.json').write_text(json.dumps({'archive':archive,'parent':base,'dependent_passed':passed,'dependent_ignored':ignored,'receipt_files':receipts},indent=2)+'\n')
print('Prepared three qualification receipts; all non-receipt bytes unchanged.')
