"""Require exact guarded source identity for every admitted final check."""
import json
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT


def admit(row, current):
    assert row['source_unchanged']
    before = json.loads((OUT / row['source']).read_text())
    assert before == current, sorted(p for p in before.keys() | current.keys() if before.get(p) != current.get(p))
    return dict(exact_source_match=True)
