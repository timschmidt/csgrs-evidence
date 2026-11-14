from pathlib import Path
import hashlib, json, re, subprocess

s = Path(__file__).parent
r = Path('/mnt/development/csgrs-surface-interval-ranges')
owner = '014a082252da83d8d5d566253bcb598c7a456df3'
delivery = 'd625de5b8e93dcb34e481a99253b1bb3cdd77592'
def git(*args):
    return subprocess.check_output(['git', *args], cwd=r)
assert json.loads((s / 'qualification-driver-result.json').read_text())['exit_code'] == 0
commands = json.loads((s / 'qualification-commands.json').read_text())
assert len(commands) == 10 and all(row['returncode'] == 0 for row in commands)
assert all(row['source_commit'] == owner for row in commands)
for row in commands:
    assert hashlib.sha256((s / row['log']).read_bytes()).hexdigest() == row['sha256']
assert git('rev-parse', 'HEAD').decode().strip() == owner
assert not git('status', '--porcelain')
source = json.loads((s / 'qualification-source.json').read_text())
assert all(hashlib.sha256((r / p).read_bytes()).hexdigest() == digest
           for p, digest in source['tracked_files'].items())
assert json.loads((s / 'package-delivery/COMPLETE.json').read_text())['strict_packaged_docs_passed']
assert json.loads((s / 'DELIVERY-SOURCE.json').read_text())['all_rust_sources_tests_and_workloads_identical']
summaries = {}
for name in ['owner', 'downstream']:
    log = s / ('qualification-' + name + '-tests.log')
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', log.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows)
    summaries[name] = dict(reports=len(rows), passed=sum(int(x[1]) for x in rows),
                           failed=sum(int(x[2]) for x in rows), ignored=sum(int(x[3]) for x in rows),
                           log_sha256=hashlib.sha256(log.read_bytes()).hexdigest())
(s / 'release-summaries.json').write_text(json.dumps(summaries, indent=2)+'\n')
subprocess.run(['git', 'merge', '--ff-only', delivery], cwd=r, check=True)
assert not git('status', '--porcelain')

def replace(relative, old, new):
    path = r / relative
    text = path.read_text()
    assert text.count(old) == 1, relative
    path.write_text(text.replace(old, new))

replace('crates/hyperbrep/docs/SURFACE_INTERVAL_RANGES.md', '''Focused tests and measured ordinary/cold workloads
are available; full owner, downstream, WASM/stable and archive-consumer
qualification remains pending at this checkpoint. The
[existing implementation ledger](IMPLEMENTATION_STATUS.json) records progress.
This is not a released-package or universal algebraic closure claim.''',
f'''Expanded acceptance records 52 focused passes. Full Rust 1.95 release owner
and downstream runs report {summaries['owner']['passed']} and {summaries['downstream']['passed']} passes across
{summaries['owner']['reports']} and {summaries['downstream']['reports']} harness summaries, respectively, with no failures.
These are reported test/doctest results, not a unique coverage denominator.
Strict all-feature/all-target Clippy, strict documentation, the actual example,
disabled-feature checks, WASM library compilation and stable all-target checks
also pass on the fixed implementation revision.

Nine archives are verified. An external consumer builds, runs the unchanged
example and passes strict Clippy using only extracted Hyper archives. The same
archived example completes three sixteen-cell portfolios in WebAssembly with
zero host imports and the default linker stack. This debug Rust test export does
not qualify a public JavaScript binding. A metadata-only followup enables all
features for docs.rs; strict packaged documentation and the rendered API pages
are verified locally. Hosted docs.rs execution is not claimed.

The [existing implementation ledger](IMPLEMENTATION_STATUS.json) and
[interval refactor progress](../../../INTERVAL_REFACTOR_PROGRESS.md) identify
source-specific evidence. Full pre-push workflows, stable runtime suites,
hosted platforms, public bindings and universal algebraic closure remain open.
Local archive qualification is not a published release.''')

replace('crates/hyperbrep/PERFORMANCE.md', '''Raw final warm/cold samples, allocation observations, retained-state diagnostics,
build equivalence and original adverse attempts are held in the stage admission
record pending archival. Full owner/downstream, WASM/stable and archive-consumer
qualification remains pending. The finite ordinary completion envelope does not
establish arbitrary-degree performance, general surface operation closure or a
release qualification.''', '''For raw warm/cold samples, allocation observations, retained-state diagnostics,
build equivalence and original adverse attempts, consult the source-specific
[interval refactor progress](../../INTERVAL_REFACTOR_PROGRESS.md). Full Rust 1.95
owner/downstream release tests, strict lint/docs, stable compilation and WASM
library checks pass. Nine archives and the unchanged native example are verified;
the archived example also executes through a test-only WASM export. Packaged
documentation exposes every feature after a metadata-only followup. These checks
do not establish arbitrary-degree performance, general surface operation closure,
public JS binding support, hosted execution or the full coordinated release.''')

path = r / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
ledger = json.loads(path.read_text())
record, = [row for row in ledger['increments'] if row['id'] == 'native-surface-interval-ranges']
record['decision'] = 'retained finite capability extension after source-specific owner/downstream, completed cost and archive-consumer qualification; general closure and coordinated release remain open'
record['qualification_source_revision'] = owner
record['documentation_metadata_revision'] = delivery
record['validation'] = (
    f"52 focused tests pass. Full Rust 1.95 release owner runs report {summaries['owner']['passed']} passes across {summaries['owner']['reports']} harness summaries; HyperBrep IO reports {summaries['downstream']['passed']} across {summaries['downstream']['reports']}. "
    f"No failed tests; ignored reports: owner {summaries['owner']['ignored']}, downstream {summaries['downstream']['ignored']}. Counts sum explicit test/doctest summaries, including any subprocess reports, not a unique coverage denominator. "
    'All-feature/all-target strict Clippy, strict docs, actual example, disabled-feature checks, WASM library check and stable all-target check pass. Nine archives verify; an archive-only unchanged native example builds/runs/passes strict Clippy. The same example executes three sixteen-cell portfolios through a zero-import/default-stack debug WASM test export. Metadata-only docs.rs configuration changes no Rust source/dependencies/default features; packaged strict docs and five rendered API pages pass. '
    'Complete new lifecycle trace snapshots pin actual scalar warming; the old solver trace assertion remains unchanged. Original failed fixture, artifact-comparison and Cargo CLI premises remain in evidence.')
record['delivery_evidence'] = 'Nine verified archives; registry versions/checksums preserved. Archive comparison permits only revision receipts, docs metadata and dependent checksums individually matched to actual archive digests. Native/WASM implementation qualification and metadata-only documentation qualification retain distinct source revisions. No published release or hosted docs execution is claimed.'
record['limits'] = record['limits'].replace('release qualification remain open', 'full pre-push/coordinated release qualification remain open')
path.write_text(json.dumps(ledger, indent=2)+'\n')
assert not ledger['complete']
subprocess.run(['git', 'diff', '--check'], cwd=r, check=True)
subprocess.run(['git', 'add', 'crates/hyperbrep/docs/SURFACE_INTERVAL_RANGES.md',
                'crates/hyperbrep/PERFORMANCE.md', 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'], cwd=r, check=True)
subprocess.run(['git', 'commit', '-m', 'Record qualified native surface range capabilities and delivery evidence'], cwd=r, check=True)
head = git('rev-parse', 'HEAD').decode().strip()
assert not git('status', '--porcelain')
changed = git('diff', '--name-only', delivery, head).decode().splitlines()
assert all(p.endswith(('.md', '.json')) for p in changed)
record = dict(owner_source=owner, delivery_source=delivery, final_documentation_source=head,
              only_documentation_changed_after_delivery=True, changed_paths=changed,
              final_checks_pending=True, integration_performed=False)
(s / 'FINAL-SOURCE.json').write_text(json.dumps(record, indent=2)+'\n')
print(json.dumps(record), flush=True)
