"""Keep the reproduced scalar failure failed; qualify only unchanged subjects."""
import hashlib
import io
import json
import re
import subprocess
import tarfile
import tomllib

from check import OUT, ROOT

BASELINE = '5de4ffad7613cce1957319ff2e317526c69ecffb'
CASE = 'other_arities_keep_their_mathematical_values'
COMPLETE_LABELS = ['scalar-default-complete', 'scalar-all-features-complete']
# These controllers were updated after the completed Rust checks to report an
# independently reproduced inherited failure. They were not executed by those
# checks. Every tested source, test, manifest, README and probe must still match.
CONTROL_FILES = {str((OUT / name).relative_to(ROOT)) for name in
                 ['audit.py', 'post_qualify.py', 'inherited_scalar.py']}


def unchanged_subject(before, after):
    differences = sorted(path for path in before.keys() | after.keys()
                         if before.get(path) != after.get(path))
    assert set(differences) <= CONTROL_FILES, differences
    return differences


def failure_signature(log):
    assert re.findall(r'^test (\S+) \.\.\. FAILED$', log, re.M) == [CASE]
    counts = re.findall(r'^test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored;', log, re.M)
    assert sum(int(row[1]) for row in counts) == 1
    assert 'assertion failed: FACTORS > 0' in log
    assert 'rational/arithmetic/aggregate_products.rs:4606:' in log
    return [sum(int(row[i]) for row in counts) for i in range(3)]


def verify_baseline():
    metadata = json.loads((OUT / 'baseline-scalar-project.json').read_text())
    assert metadata['revision'] == BASELINE
    archive = subprocess.check_output(['git', 'archive', BASELINE, 'crates/hyperreal'], cwd=ROOT)
    with tarfile.open(fileobj=io.BytesIO(archive)) as packed:
        expected = {item.name.removeprefix('crates/hyperreal/'):
                    hashlib.sha256(packed.extractfile(item).read()).hexdigest()
                    for item in packed.getmembers() if item.isfile()}
    assert expected == metadata['source']
    from pathlib import Path
    project = Path(metadata['root'])
    assert all(hashlib.sha256((project / name).read_bytes()).hexdigest() == digest
               for name, digest in expected.items())
    lock = (OUT / 'baseline-scalar-Cargo.lock').read_bytes()
    assert hashlib.sha256(lock).hexdigest() == metadata['standalone_lock_sha256']
    assert (project / 'Cargo.lock').read_bytes() == lock
    identity = lambda item: (item['name'], item['version'], item.get('source'), item.get('checksum'))
    packages = lambda text: set(map(identity, tomllib.loads(text)['package']))
    assert packages(lock.decode()) <= packages((ROOT / 'Cargo.lock').read_text())
    attempts = json.loads((OUT / 'attempts.json').read_text())
    rows = []
    for label in ['baseline-scalar-zero-factor', 'baseline-scalar-zero-factor-all-features']:
        row = [r for r in attempts if r['label'] == label][-1]
        assert row['exit_code'] == 101 and row['source_unchanged']
        assert failure_signature((OUT / row['log']).read_text()) == [0, 1, 0]
        rows.append(row)
    return rows


def verify_complete_failure(row):
    assert row['label'] in COMPLETE_LABELS and '--no-fail-fast' in row['command']
    assert row['exit_code'] == 101 and row['source_unchanged']
    return failure_signature((OUT / row['log']).read_text())


if __name__ == '__main__':
    verify_baseline()
    for invalid in ['', 'test another_case ... FAILED\nassertion failed: FACTORS > 0']:
        try:
            failure_signature(invalid)
        except AssertionError:
            pass
        else:
            raise AssertionError('failure-signature negative control was accepted')
    print('baseline source/lock/failures verified; negative controls rejected; whole-scalar gate remains failed')
