"""Close manuscript evidence in the isolated documentation worktree."""
import ast
import gzip
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tarfile
from pathlib import Path

sys.dont_write_bytecode = True
ORIGIN = Path('/home/tim/Documents/GitHub/workspace/csgrs')
V = Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
ROOT = V / 'paper-worktree-v1'
W = V / 'control/paper-v1'
R = V / 'manuscript-v1'
O = Path('/run/user/1000/csgrs-scientific-manuscript-v1')
P = ORIGIN / 'docs/evidence/2026-10-17-package-license-texts'
E = ROOT / 'docs/evidence/2026-10-17-scientific-manuscript'
PREFIX = str(E.relative_to(ROOT)) + '/'
BASE = '7ed43501755fd64a01f54c3078d12229cbc0129d'
GIT = ['git', '-c', 'core.splitIndex=true', '-c', 'index.version=4',
       '-c', 'maintenance.auto=false', '-c', 'gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS'] = '0'
sys.path.insert(0, str(ORIGIN / 'docs/evidence/2026-10-16-physical-build-requalification'))
from load_expectations_v1 import load


def sha(path):
    with Path(path).open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def read(path):
    return json.loads(Path(path).read_text())


def dump(path, value):
    Path(path).write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')


def span(raw):
    start = re.search(rb'"current_work"\s*:\s*', raw).end()
    value, count = json.JSONDecoder().raw_decode(raw[start:].decode())
    return start, start + len(raw[start:].decode()[:count].encode()), value


assert not E.exists()
assert shutil.disk_usage(ROOT).free > 512 * 1024**2 + 2 * 1024**2
assert subprocess.check_output(GIT + ['rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == BASE
subprocess.run(GIT + ['diff', '--quiet'], cwd=ROOT, check=True)
subprocess.run(GIT + ['diff', '--cached', '--quiet'], cwd=ROOT, check=True)
previous = read(P / 'checkpoint-v1.json')
assert sha(P / 'checkpoint-v1.json') == 'be68a9f6561b73f22909055f05daa2e4bc57d3ec7b43fa6e79f076018967c3c5'
assert all(sha(ORIGIN / p) == h for p, h in previous['evidence_files_sha256'].items())
prior, missing = load(ORIGIN / previous['artifact_expectations'], allow_unqualified=True)
assert len(prior) == 1233327 and len(missing) == 27093
inherited = previous['inherited_implementation_sha256'] | previous['implementation_sha256']
live = previous['restored_native_sha256'] | inherited
for pins in [live, previous['extra_unchanged_inputs_sha256'], previous['live_source_dependency_pins_sha256']]:
    assert all(sha(ORIGIN / p) == h for p, h in pins.items())
continuation = read(O / 'continuation-v1.json')
assert sha(O / 'continuation-v1.json') == 'fd4dfd941af2437b4814b490f237930a49b6545ffafe088b4e3510d72c1a258d'
assert all(sha(p) == h for p, h in continuation['prepared_file_sha256'].items())
assert sha(ROOT / 'docs/properties-status.json') == previous['ledger_after_sha256']
assert sha(ORIGIN / 'docs/properties-status.json') == previous['ledger_after_sha256']
render = read(R / 'build-v3-result.json')
analysis = read(R / 'analysis.json')
preparation = read(R / 'preparation-result.json')
static = read(O / 'static-review.json')
assert render['complete'] and render['output_closed'] and render['source_unchanged']
assert render['pages'] == 9 and not render['final_log_diagnostics']
assert sha(R / 'build-v3/hyper-stack.pdf') == render['pdf_sha256']
assert preparation['complete'] and preparation['raw_process_observations_recomputed'] == 476
assert preparation['selected_members_verified'] == 959
assert static['recorded_certified_receipts_verified'] == 476
assert sha(R / 'analysis.json') == continuation['analysis_sha256']
assert all(sha(p) == h for p, h in analysis['source_and_evidence_sha256'].items())
expected_text = (O / 'source-v2/hyper-stack.tex').read_text().replace(
    r'\newcommand{\den}[1]{\llbracket #1\rrbracket}',
    r'\newcommand{\den}[1]{[\![#1]\!]}').replace(
    '\\begin{thebibliography}{10}\n', '\\begin{thebibliography}{10}\n\\small\\setlength{\\itemsep}{2pt}\n')
assert (R / 'source-v3/hyper-stack.tex').read_text() == expected_text
assert sha(R / 'source-v3/results.tex') == preparation['tables_sha256']
for command in render['commands']:
    assert command['exit_code'] == 0 and not command['not_run'] and not command['resource_stops']
    matches = []
    for path in R.glob('build-v3-*/result.json'):
        if read(path) == command:
            matches.append(path)
    assert len(matches) == 1
    for name, digest in command['outputs_sha256'].items():
        assert sha(matches[0].parent / name) == digest
assert read(R / 'build-v1-result.json')['complete'] is False
assert read(R / 'build-v2-result.json')['pages'] == 10
for page in [1, 6]:
    assert sha(R / f'build-v3-preview-{page}.png') == sha(R / f'build-v2-preview-{page}.png')
review = {
    'status': 'working scientific manuscript retained; publication preparation remains open',
    'base_revision': BASE, 'document_pages': 9,
    'render_result_sha256': sha(R / 'build-v3-result.json'),
    'pdf_path': str(R / 'build-v3/hyper-stack.pdf'), 'pdf_sha256': render['pdf_sha256'],
    'reviewed_preview_sha256': {str(R / f'build-v3-preview-{p}.png'): sha(R / f'build-v3-preview-{p}.png') for p in [1, 6, 9]},
    'visual_review': 'Title and results pages inspected; final bibliography page inspected. No clipping or orphan reference on the inspected pages. Pages 1 and 6 match the previously inspected build-v2 previews byte for byte.',
    'visual_review_complete_for_declared_pages': True, 'all_pages_visually_reviewed': False,
    'recomputed_process_observations': 476, 'verified_archive_members': 959,
    'verified_certified_receipts': 476, 'citation_keys_checked': 10,
    'independent_new_geometry_execution': False, 'runtime_tests_rerun_for_manuscript': False,
    'publication_ready': False, 'full_plan_complete': False, 'cache_index_admitted': False,
    'original_repository_updated': False, 'isolated_worktree': str(ROOT),
    'branch': 'codex/properties-paper-20261017',
    'preserved_attempts': ['analysis helper floating aggregation mismatch', 'original storage preflight refusal',
        'original render preflight refusal', 'build-v1 undefined delimiter command', 'build-v2 ten-page render with final orphan reference'],
    'remaining_publication_work': ['authorship', 'venue and scope', 'independent technical review', 'distributable reproducibility bundle', 'broader replication'],
    'parallel_validation': 'Separate baseline Cargo run has open source/target/log roots and is outside this manuscript closure.'}
dump(W / 'final-review-v1.json', review)
paper = ROOT / 'docs/paper'
paper.mkdir(parents=True)
for name, digest in render['source_sha256'].items():
    assert sha(R / 'source-v3' / name) == digest
    shutil.copy2(R / 'source-v3' / name, paper / name)
(paper / 'README.md').write_text('''# Hyper stack scientific manuscript

[LaTeX source](hyper-stack.tex) and [generated tables](results.tex) for
*Exact Geometry as a Compositional Contract: Design and Admission in the Hyper
Stack*. This is a working scientific and educational draft, not a submitted or
publication-ready paper. Authorship, venue, independent technical review,
a distributable reproducibility bundle and broader replication remain open.

The nine-page draft distinguishes desired contracts, inspected implementation,
elementary proofs and historical experimental observations. Its tables were
recomputed from 476 retained process observations. Unfavorable measurements,
interrupted runs, missing historical artifacts, rejected native changes and
open downstream/release work remain explicit.

From this directory, create a fresh output directory and run:

```sh
pdflatex -no-shell-escape -halt-on-error -interaction=nonstopmode \\
  -output-directory=NEW_OUTPUT hyper-stack.tex
```

Repeat in the same open build directory to resolve references; inspect the final
log before accepting the render. Byte-identical PDF metadata is not promised.
The rendered PDF and previews remain in the physical locations pinned by the
[document evidence](../evidence/2026-10-17-scientific-manuscript/README.md).
They are not duplicated in Git. Rendering this paper does not validate geometry,
admit the cache candidate or complete the plan.
''')
implementation = {str(p.relative_to(ROOT)): sha(p) for p in paper.iterdir() if p.is_file()}
E.mkdir(parents=True)
for name in ['contract-v1.md', 'render_v1.py', 'close_v1.py', 'input-proof.json', 'final-review-v1.json']:
    shutil.copy2(W / name, E / name)
for source, name in [(O / 'control/contract-v1.md', 'original-contract-v1.md'),
                     (O / 'static-review.json', 'static-review-v1.json'),
                     (R / 'build-v3-result.json', 'render-result-v3.json'),
                     (R / 'preparation-result.json', 'preparation-result.json')]:
    shutil.copy2(source, E / name)
archive = E / 'raw-evidence-v1.tar.gz'
members = {}
excluded = {}
physical = {}
for prefix, root in [('prepared', O), ('rendered', R), ('control', W)]:
    for path in sorted(root.rglob('*')):
        if not path.is_file():
            continue
        assert not path.is_symlink()
        before = path.stat()
        digest = sha(path)
        after = path.stat()
        assert (before.st_size, before.st_mtime_ns, before.st_ctime_ns) == (after.st_size, after.st_mtime_ns, after.st_ctime_ns)
        physical[str(path)] = digest
        row = {'sha256': digest, 'bytes': before.st_size, 'physical_path': str(path)}
        name = prefix + '/' + str(path.relative_to(root))
        if path.suffix in {'.pdf', '.png'}:
            excluded[name] = row
        else:
            members[name] = row
with tarfile.open(archive, 'w:gz') as output:
    for name, row in members.items():
        output.add(row['physical_path'], arcname=name, recursive=False)
with tarfile.open(archive, 'r:gz') as source:
    assert set(source.getnames()) == set(members)
    for name, row in members.items():
        with source.extractfile(name) as stream:
            assert hashlib.file_digest(stream, 'sha256').hexdigest() == row['sha256']
dump(E / 'archive-members-v1.json', {'members': members, 'archive_sha256': sha(archive),
    'excluded_rendered_binaries_physically_preserved': excluded,
    'archive_bytes': archive.stat().st_size, 'all_members_content_verified': True})
(E / 'README.md').write_text('''# Scientific manuscript acceptance

The working manuscript in docs/paper was prepared from inspected source and
retained experiments at revision 7ed43501755fd64a01f54c3078d12229cbc0129d.
It distinguishes mathematical arguments, the acceptance contract, implementation
observations and recorded results. No new geometry result is established by the
paper. Publication preparation and the complete properties plan remain open.

The table analysis independently recomputed 476 raw process observations and
verified 959 archive members, 476 recorded Certified receipts, exact decimal
arithmetic, ten citation keys, local references and two library-suite summaries.
The manuscript retains unfavorable measurements, the unqualified overlapping
run, interrupted attempts, the rejected native bundle and release blockers.

Three final LaTeX passes, text extraction, PDF metadata checks and preview
rendering passed. The final document has nine pages and no rejected log
diagnostics. The title page, results page and bibliography were visually
reviewed. This is not independent technical review or an all-page visual audit.
The first numerical helper failure, original storage refusals, undefined LaTeX
delimiter failure and ten-page layout are retained beside the successful render.

The original repository remains below its declared free-space reserve. Sources,
evidence and this ledger entry are therefore installed only in the isolated
Disk B documentation worktree named in final-review-v1.json. Its parent objects
come from the original repository read-only. Integration into the original
worktree remains pending. The concurrent baseline Cargo build and tests have
separate open roots and are not qualified by this document checkpoint.

See the contracts, final-review-v1.json, render-result-v3.json, retained raw
archive and its verified member index. PDF and preview PNG files are excluded
from the compact archive but physically retained and independently hashed. No
closed attempt was overwritten. Inherited expectations are loaded from the
original repository; their 27,093 missing paths remain unqualified. This is not
a complete historical artifact audit, cache admission or release qualification.
Only current_work changes in the ledger. No Rust source is changed here.
''')
ledger = ROOT / 'docs/properties-status.json'
raw = ledger.read_bytes()
reference = subprocess.check_output(GIT + ['show', '9025de62:docs/properties-status.json'], cwd=ROOT)
start, end, current = span(raw)
rs, re_, _ = span(reference)
assert (raw[:start], raw[end:]) == (reference[:rs], reference[re_:])
assert 'scientific_manuscript' not in current
current['scientific_manuscript'] = {
    'status': review['status'], 'base_revision': BASE, 'source': 'docs/paper/hyper-stack.tex',
    'contract': PREFIX + 'contract-v1.md', 'qualification': PREFIX + 'final-review-v1.json',
    'checkpoint': PREFIX + 'checkpoint-v1.json', 'artifact_expectations': PREFIX + 'artifact-expectations-v1.json.gz',
    'render_complete': True, 'pages': 9, 'recomputed_process_observations': 476,
    'visual_review_complete_for_declared_pages': True, 'publication_ready': False,
    'isolated_worktree': str(ROOT), 'original_worktree_integration_pending': True,
    'rust_sources_changed': False, 'cache_index_admitted': False, 'full_plan_complete': False}
updated = raw[:start] + json.dumps(current, indent=2).encode() + raw[end:]
us, ue, _ = span(updated)
assert (updated[:us], updated[ue:]) == (reference[:rs], reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k != 'current_work'} == {
    k:v for k,v in json.loads(reference).items() if k != 'current_work'}
ledger.write_bytes(updated)
assert prior.keys().isdisjoint(physical)
expectations = {
    'schema_version': 3, 'kind': 'scientific manuscript preparation, failures and final render',
    'parent_expectations': previous['artifact_expectations'],
    'parent_expectations_sha256': previous['artifact_expectations_sha256'],
    'parent_repository_during_closure': str(ORIGIN),
    'inherited_expected_artifact_paths': len(prior), 'inherited_missing_artifact_paths': len(missing),
    'added_physical_artifacts_sha256': physical, 'new_physical_artifacts_verified': len(physical),
    'physical_roots': [str(O), str(R), str(W)], 'directory_inventory': [str(O), str(R), str(W)],
    'local_tool_symlink_targets': {}, 'expected_artifact_paths': len(prior) + len(physical),
    'inherited_artifacts_reverified': False, 'complete_artifact_audit_passed': False,
    'historical_preservation_complete': False,
    'scope': 'Every new manuscript physical path independently hashed; broader validation roots remain open.'}
with gzip.open(E / 'artifact-expectations-v1.json.gz', 'wt') as stream:
    json.dump(expectations, stream, sort_keys=True)
for path in [*E.iterdir(), *paper.iterdir()]:
    if path.suffix in {'.py', '.md', '.json', '.tex'}:
        content = path.read_text()
        assert all(line == line.rstrip() for line in content.splitlines()) and not content.endswith('\n\n'), path
        if path.suffix == '.py':
            ast.parse(content)
with (E / 'whitespace.stdout').open('wb') as out, (E / 'whitespace.stderr').open('wb') as err:
    checked = subprocess.run(GIT + ['diff', '--check', '--', 'docs/properties-status.json'], cwd=ROOT, stdout=out, stderr=err)
assert checked.returncode == 0
files = {str(p.relative_to(ROOT)): sha(p) for p in E.rglob('*') if p.is_file()}
record = dict(previous)
record.update({
    'status': review['status'], 'checkpoint_kind': 'working scientific manuscript and reviewed render',
    'previous_closure': str((P / 'checkpoint-v1.json').relative_to(ORIGIN)),
    'previous_closure_sha256': sha(P / 'checkpoint-v1.json'),
    'evidence_files_sha256': files, 'artifact_expectations': PREFIX + 'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256': sha(E / 'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths': len(prior), 'inherited_missing_artifact_paths': len(missing),
    'new_physical_artifacts_verified': len(physical), 'implementation_sha256': implementation,
    'inherited_implementation_sha256': inherited,
    'ledger_before_sha256': hashlib.sha256(raw).hexdigest(), 'ledger_after_sha256': sha(ledger),
    'only_current_work_changed': True, 'source_changes_applied': True,
    'production_prefixes_unchanged': True, 'production_rust_sources_unchanged': True,
    'original_repository_updated': False, 'isolated_worktree': str(ROOT),
    'original_worktree_integration_pending': True, 'evidence_parent_repository': str(ORIGIN),
    'documentation_retention_decision': 'kept working draft', 'publication_ready': False,
    'manuscript_render_passed': True, 'runtime_tests_rerun': False, 'readme_tests_rerun': False,
    'format_rerun': False, 'format_exit_code': None, 'whitespace_exit_code': 0,
    'full_library_qualification_complete': False,
    'library_qualification_scope': 'No library execution in this manuscript checkpoint; E51 remains preserved and separate fresh baseline validation is still open.',
    'cache_index_admitted': False, 'full_cargo_matrix_qualified': False,
    'downstream_native_qualification_complete': False, 'release_qualification_complete': False,
    'full_plan_complete': False})
dump(E / 'checkpoint-v1.json', record)
assert all(sha(p) == h for p, h in physical.items())
assert all(sha(ORIGIN / p) == h for p, h in live.items())
assert sha(ORIGIN / 'docs/properties-status.json') == previous['ledger_after_sha256']
assert all(sha(ROOT / p) == h for p, h in implementation.items())
print(json.dumps({'new_physical_paths': len(physical), 'expected_physical_paths': len(prior) + len(physical),
    'archive_members': len(members), 'excluded_physical_binaries': len(excluded), 'archive_bytes': archive.stat().st_size,
    'source_files': len(implementation), 'evidence_files': len(files) + 1,
    'ledger_sha256': sha(ledger), 'original_repository_updated': False}))
