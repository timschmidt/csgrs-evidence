from pathlib import Path
import gzip
import hashlib
import json
import shutil
import subprocess
import time

review = Path('/tmp/interval-refactor/residual-certainty-package-review')
stages = {
    'interrupted-attempt': Path('/tmp/interval-refactor/residual-certainty-packaged'),
    'completed-attempt': Path('/tmp/interval-refactor/residual-certainty-packaged-v2'),
}
evidence = Path('/mnt/development/csgrs-evidence')
record = 'docs/evidence/2026-11-17-interval-residual-certainty-packaged'
destination = evidence / record
previous = '8bc1f0256c0d8fe919cd7c0fd182ac94341145ac'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read(path):
    return json.loads(path.read_text())


def save(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')


assert read(stages['completed-attempt'] / 'packaged-build-completion.json')['exit_code'] == 0
assert read(stages['interrupted-attempt'] / 'packaged-build-completion.json')['exit_code'] == 1
assert read(review / 'verification.json')['workspace_full_output_trace_matches'] == 12960
assert read(stages['completed-attempt'] / 'packaged-summary.json')['controls'] == 12960
assert (stages['completed-attempt'] / 'packaged-hold-released.json').exists()
assert subprocess.check_output(['git', '-C', str(evidence), 'rev-parse', 'HEAD'], text=True).strip() == previous
assert not subprocess.check_output(['git', '-C', str(evidence), 'status', '--porcelain=v1'])
assert not destination.exists()
origins = []


def copy(source, relative):
    output = review / relative
    assert not output.exists()
    output.parent.mkdir(parents=True, exist_ok=True)
    data = source.read_bytes()
    encoding = 'identity'
    if source.suffix == '.jsonl':
        output = output.with_name(output.name + '.gz')
        output.write_bytes(gzip.compress(data, compresslevel=1, mtime=0))
        assert gzip.decompress(output.read_bytes()) == data
        encoding = 'gzip'
    else:
        shutil.copy2(source, output)
        assert output.read_bytes() == data
    origins.append(dict(source=str(source), source_bytes=len(data), source_sha256=hashlib.sha256(data).hexdigest(), destination=output.relative_to(review).as_posix(), stored_sha256=sha(output), encoding=encoding))


for label, stage in stages.items():
    package_paths = {Path(r['path']) for r in read(stage / 'package-archives.json')}
    for source in sorted(stage.rglob('*')):
        if not source.is_file() or '__pycache__' in source.parts:
            continue
        relative = Path(label) / source.relative_to(stage)
        if source.suffix == '.crate':
            # Only this repository's six verified first-party archives are copied.
            # The generic evidence manifest excludes registry *.crate files;
            # retain these byte-identical upload archives with an explicit suffix.
            assert source in package_paths
            relative = relative.with_name(relative.name + '.tar.gz')
        copy(source, relative)
    for row in read(stage / 'packaged-builds.json'):
        if 'artifact' not in row:
            continue
        source = Path(row['artifact']['path'])
        assert sha(source) == row['artifact']['sha256']
        copy(source, Path(label) / 'artifacts' / source.name)

copy(Path(__file__), Path('archive-driver.py'))
save(review / 'origins.json', origins)
(review / 'README.md').write_text('''# Residual-certainty packaged-consumer qualification

Fixed c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb, current
4192d8c726d3333a31cb7eddc30cc0d464d61411 and isolated, unaccepted candidate
aad7409a5928e309812d9a5cc361d46313685266. Primary documentation baseline
1449965cebd3994d8e730e31ea6a1fddd7373abf.

interrupted-attempt preserves the original optional-patch warning, controlled
interruption, six verified packages, first native image and 688 passing controls.
completed-attempt preserves the corrected actual-dependency patches, eighteen
verified upload archives, twelve final native/WASM consumers, full reports and
traces, source/metadata validation, image accounts, Clippy and formatting.
The original elapsed time is charged to the same campaign budget; the separate
quiet watcher is restored without resetting its finite horizon.

origins.json specifies every copied source and destination digest. Plain JSONL
is losslessly gzip encoded. First-party package archives are stored with an
additional .tar.gz suffix without changing their bytes. They contain only the
six repository crates; no third-party registry archives or caches are copied.
The independently repeated source/metadata/full-output checks are in
verification.json. Fixed-revision archives agree byte-for-byte across attempts.
Package exclusion notices remain recorded; the consumer has no compiler or
Clippy warnings. These notices are not silently counted as warning-free builds.

No quiet-host runtime result, native memory allowance, complete application
capacity, internal cancellation/work bound, or combined-repair admission is
established. Earlier resource failures, evidence records and positive charges
remain unchanged. The finite original package stages and this review snapshot
are frozen; the separate residual admission stage remains mutable.
''')

manifest = []
for file in sorted(review.rglob('*')):
    if file.is_file():
        assert '__pycache__' not in file.parts
        manifest.append(dict(path=file.relative_to(review).as_posix(), bytes=file.stat().st_size, sha256=sha(file)))
shutil.copytree(review, destination)
for row in manifest:
    file = destination / row['path']
    assert file.stat().st_size == row['bytes'] and sha(file) == row['sha256']
save(Path('/tmp/interval-refactor/residual-packaged-archive-prepared.json'), dict(record=record, previous_revision=previous, files=len(manifest), bytes=sum(r['bytes'] for r in manifest), files_verified=manifest, source_stages_frozen=True, created=time.time()))
print(json.dumps(dict(record=record, files=len(manifest), bytes=sum(r['bytes'] for r in manifest)), indent=2))
