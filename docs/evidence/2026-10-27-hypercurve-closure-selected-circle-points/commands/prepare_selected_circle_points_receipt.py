from pathlib import Path
import hashlib,json,subprocess
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-selected-circle-points')
base=json.loads((root/'fiber-point-order-final-commit.json').read_text())['commit']
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==base
results=json.loads((root/'selected-circle-points-final-results.json').read_text());assert len(results)==18 and all(row['exit_code']==0 and row['source_stable'] for row in results)
files=json.loads((root/'selected-circle-points-final-files-before.json').read_text());assert files==json.loads((root/'selected-circle-points-final-files-after.json').read_text())
receipts=['crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv']
transition=json.loads((root/'selected-circle-points-parent-transition.json').read_text());assert transition['new']==base and transition['all_non_receipt_bytes_unchanged']
for name,mode,digest in files:
 if mode in ['file','executable']:
  if name in receipts:assert (checkout/name).read_bytes()==subprocess.check_output(['git','show',base+':'+name],cwd=checkout)
  else:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
archive=json.loads((root/'selected-circle-points-evidence-archive.json').read_text());record,count,size,digest=archive['manifest_row'].split('\t');commit=archive['commit']
assert archive['parent']==json.loads((root/'fiber-point-order-evidence-archive.json').read_text())['commit']
text=f'''**Selected circle-point angular authority increment (2026-10-27).** A fresh
unchanged-source build of the preceding common-field increment `{base[:10]}`
proves the independent unit-circle identity at `u=beta`, but its positive point
location returns `Blocked(Unsupported)`. The original program and all subsequent
split, reversal and replay assertions remain intact. Hypercurve's selected-circle
parameter and shared point-field owners implement this extension under P15,
P18–P20, P26, P27 and P29.

The parameter retains the exact incident point, its selected circle and both
radial-coordinate forms in a common field. Circle incidence and signed half
selection precede publication; diameter endpoints retain canonical ownership.
Exact linear signs order represented chart cuts, while the monotone normal
coordinate orders two points on one half. Similarities transport the shared
radial forms and original point. Native version 4 reuses its checked incident
point record and reconstructs the authority from defining relations; no new
wire tag, independent angular root or coordinate materialization is introduced.
Inherited qualification remains explicit. An earlier one-projection prototype
regressed an existing circular-fillet replay; its unchanged test is retained,
and requiring both radial coordinates resolves that failure.

Five new public witnesses and two private policy/validation tests cover the
original selected point; independent equal definitions and `2^-80` close cuts;
restriction, splitting and reversal; both signed radii and turns; excluded halves
and nearby off-support points; algebraic similarities and reflection; fresh-process
replay before another split; invalid incidence and half selection; reached zero
work limits and larger retries; and Certified strict/approximate/strict requests
when strict evidence suffices. Exact geometry and complete archive determinism
are checked separately. The close-cut fixture completes within 300 seconds, but
ordinary coordinate equality and projection remain measured cost frontiers.

All 18 final groups pass: 2,846 Hypercurve tests in 92 suites with 34 existing
ignored cases, 64 affected root tests in 11 suites, 3,012 tests across six dependent
packages, strict MSRV Clippy across all Hypercurve/CSGRS/Hyperbrep targets/features,
core builds, denied-warning API docs and fuzz Clippy, formatting, 16 matrix guards,
193 capability fixtures, typos, repository budget and diff checks. Evidence is
`{record}`, SHA-256 `{digest}`. Complete before/after source snapshots are identical;
after qualification, only the three parent receipts are imported and all other
bytes are proved unchanged. Both full and parent-relative patches are retained.

The original failed prototypes and interrupted host-quota attempts remain in the
archive. A missing test-harness dependency is corrected without adding a package
or weakening its fresh-process assertions. Interrupted checks are rerun on the
same source after verified storage recovery. A later execution-session interruption
preserves six completed groups and the partial downstream log; the interrupted
command and remaining checks resume on the identical source, with fresh recorded
exit statuses. Positive downstream probes still
report `Blocked(Unsupported)` for public selected-circle derivatives and for a
closed correlated-center circle's filled-region admission, before its offset
chain. These are implementation gaps, not geometric completion or exhaustion.
General fields, other frames, mixed regions, repeated offsets and corner edits
remain open. Instrumented refinement limits do not bound total work, growth,
heap use or cancellation. Full pre-push qualification and package delivery remain
pending; this finite corpus does not establish universal closure or a speedup.

'''
p=checkout/'crates/hypercurve/FUTURE_WORK.md';s=p.read_text();assert '**Selected circle-point angular authority increment' not in s
pos=s.index('**Open, in dependency order:**',s.index('## 8. Polynomial-branch sections'));p.write_text(s[:pos]+text+s[pos:])
p=checkout/'docs/evidence-archive.md';s=p.read_text();marker='## Follow-on records\n\n';assert marker in s and commit not in s
text=f'''The local `hypercurve-selected-circle-points-evidence-2026-10-27` branch ends at
`{commit}`, adding `{record}`
({int(count):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records selected circle-point angular authority, both radial coordinates in
one exact field, signed half selection, ordered close cuts, similarity transport
and native replay. All 2,846 Hypercurve tests, 64 affected root tests, 3,012
consumer tests, strict MSRV/fuzz Clippy, core builds, API docs, 16 matrix guards
and 193 capability witnesses pass; 34 existing ignored cases remain. Original
positive failures, the corrected replay regression, close-cut cost diagnostics,
policy and budget checks, and interrupted quota/session attempts are preserved. Every
non-receipt source byte matches final qualification. The record is local and
unpushed. Public selected-circle derivatives, correlated-center region admission,
general operation closure, total resource bounds and package delivery remain open.

''';p.write_text(s.replace(marker,marker+text,1))
p=checkout/'docs/evidence-archive.tsv';excluded=[row for row in p.read_text().splitlines() if row.startswith('excluded:')];assert len(excluded)==4
manifest=subprocess.check_output(['python3','scripts/evidence_archive.py','manifest','/tmp/csgrs-closure-evidence.git',commit],cwd=checkout,text=True).splitlines();assert len(manifest)==362 and not any(row.startswith('excluded:') for row in manifest)
p.write_text('\n'.join(manifest+excluded)+'\n')
for name,mode,digest in files:
 if name not in receipts and mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
(root/'selected-circle-points-receipt-prepared.json').write_text(json.dumps({'archive':archive,'parent':base,'receipt_files':receipts,'qualified_snapshot_preserved':True},indent=2)+'\n')
print('Prepared three W qualification receipts; all non-receipt bytes unchanged.')
