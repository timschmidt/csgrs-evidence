from pathlib import Path
import hashlib,json,re,subprocess
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-similarity-policy')
base='2395ba77d81a6eb172f62b99a13bef73a7235a43'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==base
results=json.loads((root/'similarity-policy-final-results.json').read_text())
assert len(results)==15 and all(r['exit_code']==0 and r['source_stable'] for r in results)
files_before=json.loads((root/'similarity-policy-final-files-before.json').read_text())
assert files_before==json.loads((root/'similarity-policy-final-files-after.json').read_text())
for name,mode,digest in files_before:
 if mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
archive=json.loads((root/'similarity-policy-evidence-archive.json').read_text())
record,files,size,digest=archive['manifest_row'].split('\t');commit=archive['commit']
assert archive['parent']=='04eccb7d4eccb1928dc4e1c2998174cd4a6f27c4'
rows=re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', (root/'similarity-policy-final-dependent-packages.log').read_text())
assert rows and all(row[0]=='ok' and row[2]=='0' for row in rows)
passed=sum(int(row[1]) for row in rows);ignored=sum(int(row[3]) for row in rows)
assert passed==3010 and ignored==0
text=f'''**Selected similarity point policy increment (2026-10-27).** On committed
`{base[:10]}`, two public witnesses produce Certified selected-quintic points
or similarity images under APPROXIMATE_512, then reproduce
`Classification/Unsupported` when the same returned points are queried under
STRICT. Independent STRICT reference constructions already succeed. P4, P8,
P9, P15 and P18–P20 require retained evidence to follow the actual consumed
policy and preserve selected source dependencies through subsequent operations.

The polynomial point and branch similarity construction sites now pass the
existing `retained_object_policy()` result to `BezierSimilarityPoint2::new`.
The generic constructor is unchanged. Locally exact images retain strict
replay authority; incompatible approximate source images remain nested, so a
new local certificate cannot upgrade inherited evidence. Checked point replay
continues to validate the original source definition and selected fiber.

Two public witnesses keep the same returned points across the policy boundary,
verify exact affine relations for the selected root of `y^5+5y+5`, replay point
definitions in memory, and consume them in generated-chord incidence and branch
subdivision. A new negative unit witness seeds an observed consumed-policy
receipt on a parent, constructs a locally Certified child, and verifies that
strict endpoint queries and replay remain blocked. The original generic
similarity policy-barrier regression passes unchanged. All four focused
checks pass; this negative witness tests receipt propagation, not a newly
rounded geometric construction.

Final checks pass: 2,773 Hypercurve tests (85 suites, 34 existing ignored),
43 root downstream tests and {passed:,} tests across six dependent packages
({ignored} ignored). Strict Hypercurve all-target/all-feature MSRV Clippy,
formatting, 16 matrix guards, 125 capability witnesses, typos, repository budget
and diff checks pass. Raw failures, source snapshots and exact commands are in
`{record}`, SHA-256 `{digest}`. All non-receipt source bytes remain identical
after this receipt.

This addresses selected polynomial similarity points, not every retained point
family. General algebraic operation closure and fresh-process native archive
replay remain open. Existing counted limits and external timeouts do not bound
total arithmetic, coefficient growth, retained memory or cancellation. No
performance improvement is claimed. Full repository pre-push qualification
remains pending; checks on the separate earlier publication candidate do not
validate this later source revision.

'''

p=checkout/'crates/hypercurve/FUTURE_WORK.md';s=p.read_text()
assert '**Selected similarity point policy increment' not in s
pos=s.index('**Open, in dependency order:**',s.index('## 8. Polynomial-branch sections'))
p.write_text(s[:pos]+text+s[pos:])
p=checkout/'docs/evidence-archive.md';s=p.read_text()
text=f'''The local `hypercurve-similarity-policy-evidence-2026-10-27` branch
ends at `{commit}`, adding `{record}`
({int(files):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records policy retention for selected polynomial similarity points and
endpoints: locally certified outputs remain usable under STRICT, while nested
approximate dependencies keep their replay barriers. 2,773 Hypercurve tests,
43 root downstream tests, {passed:,} tests across six dependent packages,
strict MSRV Clippy, formatting, 16 matrix guards and 125 capability witnesses
pass. Original failed witnesses, the unchanged generic policy-barrier check,
a consumed-receipt dependency witness and raw commands remain archived.
Point replay here is checked in memory. This record is local and unpushed;
full pre-push qualification and broader algebraic closure remain open.

'''

marker='## Follow-on records\n\n';assert marker in s and commit not in s
p.write_text(s.replace(marker,marker+text,1))
p=checkout/'docs/evidence-archive.tsv'
excluded=[row for row in p.read_text().splitlines() if row.startswith('excluded:')];assert len(excluded)==4
manifest=subprocess.check_output(['python3','scripts/evidence_archive.py','manifest','/tmp/csgrs-closure-evidence.git',commit],cwd=checkout,text=True).splitlines()
assert len(manifest)==354 and not any(row.startswith('excluded:') for row in manifest)
p.write_text('\n'.join(manifest+excluded)+'\n')
receipts=['crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv']
for name,mode,digest in files_before:
 if name not in receipts and mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
(root/'similarity-policy-receipt-prepared.json').write_text(json.dumps({'archive':archive,'parent':base,'dependent_passed':passed,'dependent_ignored':ignored,'receipt_files':receipts},indent=2)+'\n')
print('Prepared three qualification receipts; all non-receipt bytes unchanged.')
