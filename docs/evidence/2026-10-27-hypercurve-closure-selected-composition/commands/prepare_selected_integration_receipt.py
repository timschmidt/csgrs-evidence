from pathlib import Path
import hashlib
import json
import re
import subprocess

root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-selected-integration')
base = 'b6da97710cbc124f243f969c5f224b06826c18d6'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'selected-integration-final-results.json').read_text())
assert len(results) == 16 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'selected-integration-final-files-before.json').read_text())
assert before == json.loads((root / 'selected-integration-final-files-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name
archive = json.loads((root / 'selected-integration-evidence-archive.json').read_text())
record, files, size, digest = archive['manifest_row'].split('\t')
commit = archive['commit']
assert archive['parent'] == 'de84df74612abfd1e4d447e4827e42ef46f302a6'
rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', (root / 'selected-integration-final-dependent-packages.log').read_text())
assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows)
passed = sum(int(row[1]) for row in rows)
ignored = sum(int(row[3]) for row in rows)
assert passed == 3010
text = f'''**Selected-branch composition increment (2026-10-27).** This integration
retains all three qualified parents: polynomial regions (`b6da97710c`), closed
horizontal boundary components (`e49c24719f`) and algebraic similarity sections
(`f2d0071114`). Their individual qualification did not establish composition.
The combined closed-rectangle clip/reconstruct/subtract/intersect witness
reproduced an Unsupported Boolean face decision. Existing exterior probes now
also reuse an available exact coordinate while retaining its selected companion
and original point relations. Complete pair replay and the shared winding
authority still establish incidence and the retained face.

Three composition witnesses preserve both fill rules and traversal directions,
exact source and root identities, checked point replay, a selected quintic
ordinate and its quarter-turn image, disconnected side components, and canonical
empty results consumed by further union. A retained rational identity with
denominator guard `3+x`, followed by an algebraic similarity, preserves contact
coordinates, signs, overlap correspondence and subsequent intersection. The
original failing cases remain unchanged. Adding boundary-regularization probe
directions alone did not resolve the rotated case; that experiment was removed
and its failed results remain archived. The rotated failure occurs in the
APPROXIMATE_512 iteration: polynomial/chord intersection replaced the caller
context with its strict counterpart. It now uses the existing strict-predicate
scope, preserving replay authority while suppressing terminal approximation.
No construction-policy barrier is removed.

Final checks pass: 1,223 Hypersolve tests (24 suites), 2,770 Hypercurve tests
(84 suites, 34 existing ignored), 43 root downstream tests and {passed:,} tests
across six dependent packages ({ignored} existing ignored). Strict
all-target/all-feature MSRV Clippy for Hypersolve, Hypercurve and HyperBRep,
formatting, 16 matrix guards, 123 capability witnesses, typos, repository budget
and diff checks pass. Raw attempts and qualification are in `{record}`,
SHA-256 `{digest}`. All non-receipt bytes remain identical to the qualified
snapshot after this receipt.

These are bounded composition cases, not general algebraic closure or a new
native region archive format. Broader selected supports, coefficient fields,
nonlinear maps, offsets and corner edits retain their recorded gaps. Counted
work and external fixture timeouts do not establish total arithmetic, expression
growth, retained-memory or cancellation bounds. No performance improvement is
claimed. The separate publication candidate is excluded, and full repository
pre-push qualification of this integration remains pending.

'''
path = checkout / 'crates/hypercurve/FUTURE_WORK.md'
source = path.read_text()
assert '**Selected-branch composition increment' not in source
pos = source.index('**Open, in dependency order:**', source.index('## 8. Polynomial-branch sections'))
path.write_text(source[:pos] + text + source[pos:])
path = checkout / 'docs/evidence-archive.md'
source = path.read_text()
text = f'''The local `hypercurve-selected-integration-evidence-2026-10-27` branch
ends at `{commit}`, adding `{record}`
({int(files):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It retains all three parent evidence histories and qualifies their combined
selected-branch compositions through exact face probes, original source/root/map
relations, transforms, disconnected components and further operation on empty
results. 1,223 Hypersolve tests, 2,770 Hypercurve tests, 43 root downstream tests,
{passed:,} dependent-package tests, strict MSRV Clippy, formatting, 16 matrix
guards and 123 capability witnesses pass. Failed attempts and rejected probe
changes remain archived. This record is local and unpushed; full repository
pre-push validation remains pending. General algebraic closure and native
region replay remain open.

'''
marker = '## Follow-on records\n\n'
assert marker in source and commit not in source
path.write_text(source.replace(marker, marker + text, 1))
path = checkout / 'docs/evidence-archive.tsv'
excluded = [row for row in path.read_text().splitlines() if row.startswith('excluded:')]
assert len(excluded) == 4
manifest = subprocess.check_output(['python3', 'scripts/evidence_archive.py', 'manifest', '/tmp/csgrs-closure-evidence.git', commit], cwd=checkout, text=True).splitlines()
assert len(manifest) == 353 and not any(row.startswith('excluded:') for row in manifest)
path.write_text('\n'.join(manifest + excluded) + '\n')
receipts = ['crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv']
for name, mode, digest in before:
    if name not in receipts and mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name
(root / 'selected-integration-receipt-prepared.json').write_text(json.dumps({'archive': archive, 'parent': base, 'dependent_passed': passed, 'dependent_ignored': ignored, 'receipt_files': receipts}, indent=2) + '\n')
print('Prepared three qualification receipts; all non-receipt bytes unchanged.')
