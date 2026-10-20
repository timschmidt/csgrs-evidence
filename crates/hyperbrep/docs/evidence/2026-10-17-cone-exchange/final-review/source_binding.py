"""Admit only checks on identical consumed inputs, with explicit WASM correction."""
import json
from pathlib import Path

OUT = Path(__file__).resolve().parents[1]

def admit(row, current):
    assert row['source_unchanged']
    before = json.loads((OUT/row['source']).read_text())
    if before == current:
        return dict(kind='identical-full-guarded-source', snapshot=row['source'])
    correction = json.loads((OUT/'wasm-consumer-correction.json').read_text())
    assert before == correction['before'] and current == correction['after']
    allowed = set(correction['changes'])
    prefix = 'crates/hyperbrep/docs/evidence/2026-10-17-cone-exchange/'
    assert allowed == {prefix+p for p in ['wasm-probe/lib.rs', 'analysis-recipes/prepare_validation.py', 'analysis-recipes/qualify.py']}
    changed = {p for p in before.keys()|current.keys() if before.get(p)!=current.get(p)}
    assert changed == allowed
    assert row['label'] not in ['wasm-build', 'wasm-runtime'], 'WASM must be rerun after its edit'
    assert row['command'][0] in ['cargo', 'python3', 'git']
    # These earlier commands do not compile the standalone consumer or execute
    # its preparation/qualification driver; their actual arguments are logged.
    assert not any('wasm-probe' in str(arg) for arg in row['command'])
    return dict(kind='identical-consumed-inputs-before-wasm-consumer-correction',
                snapshot=row['source'], differences=correction['changes'],
                evidence='wasm-consumer-correction.json')
