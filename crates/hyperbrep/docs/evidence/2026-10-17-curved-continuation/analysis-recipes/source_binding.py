"""Admit only the exact test-module wiring correction after the first suites."""
import hashlib
import json
from pathlib import Path
import sys
import tarfile

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT

REPLACEMENTS = {
    'crates/hyperbrep/benches/sectors.rs': ('mod acceptance;\n', 'mod acceptance;\nuse acceptance::seam;\n'),
    'crates/hyperbrep/tests/rotated_reconstruction.rs': (
        '#[allow(dead_code)]\n#[path = "support/rotated_reconstruction.rs"]\nmod acceptance;\n',
        '#[allow(dead_code)]\n#[path = "support/rotated_reconstruction.rs"]\nmod acceptance;\n#[allow(dead_code)]\n#[path = "support/seam_cuts.rs"]\nmod seam;\n'),
    'crates/hyperbrep/tests/support/rotated_reconstruction.rs': (
        'use hyperbrep::{BodySet, Matrix4, Model, Point3, Real, SolidPointLocation, boolean, builder};\n#[allow(dead_code)]\n#[path = "seam_cuts.rs"]\nmod seam;\nuse seam::{equal, point as p, ratio as q};\n',
        'use super::seam::{equal, point as p, ratio as q};\nuse hyperbrep::{BodySet, Matrix4, Model, Point3, Real, SolidPointLocation, boolean, builder};\n'),
}

def original(relative, expected):
    for directory in OUT.glob('overlay-*'):
        path = directory / relative
        if path.is_file() and hashlib.sha256(path.read_bytes()).hexdigest() == expected:
            return path.read_bytes()
    metadata = OUT / 'source-reconstruction.json'
    if metadata.exists():
        record = json.loads(metadata.read_text())
        with tarfile.open(OUT / record['archive'], 'r:gz') as packed:
            for name, digest in record['members'].items():
                if digest == expected and name.endswith('/' + relative):
                    return packed.extractfile(name).read()
    raise AssertionError(('unavailable original source', relative, expected))

def admit(row, current):
    before = json.loads((OUT / row['source']).read_text())
    assert row['source_unchanged'] and before.keys() == current.keys()
    changed = {p for p in before if before[p] != current[p]}
    if not changed:
        return dict(exact_source_match=True)
    assert changed == REPLACEMENTS.keys(), changed
    files = {}
    for relative, (old, new) in REPLACEMENTS.items():
        data = original(relative, before[relative]).decode()
        assert data.count(old) == 1
        final = (ROOT / relative).read_text()
        assert data.replace(old, new, 1) == final
        assert hashlib.sha256(final.encode()).hexdigest() == current[relative]
        files[relative] = dict(before=before[relative], after=current[relative])
    return dict(exact_source_match=False, files=files,
        scope='Only module imports change: benchmark reuses acceptance::seam, standalone test declares that same seam module at its parent, and reconstruction imports its parent seam helpers. Every test/workflow/assertion body and every production scalar/geometry/dependency byte is unchanged. New replay tests and native/benchmark Clippy plus complete WASM runtime are rerun on final wiring.')
