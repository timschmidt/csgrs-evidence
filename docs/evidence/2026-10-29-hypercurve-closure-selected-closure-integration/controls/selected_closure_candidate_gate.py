"""Shared readiness checks for the private integrated source, not admission."""
from pathlib import Path
import json
import time

r = Path(__file__).resolve().parents[1]
c = r / 'controls'

def alive(pid):
    try:
        return (Path('/proc') / str(pid) / 'stat').read_text().rsplit(')', 1)[1].split()[0] != 'Z'
    except FileNotFoundError:
        return False

def load(path):
    try:
        return json.loads(path.read_text())
    except (FileNotFoundError, json.JSONDecodeError):
        return None

def wait():
    requirements = [('selected-closure-integration-fix1', 'focus'), ('selected-closure-integration-preflight-1', 'lint')]
    while True:
        completed = []
        for name, kind in requirements:
            path = c / name
            rows = load(path / 'results.json') or []
            assert all(row['exit_code'] == 0 and row['source_stable'] for row in rows), name
            result = load(path / 'complete.json')
            if result:
                if kind == 'focus':
                    assert result['all_passed'] and result['groups'] == 16
                else:
                    assert result['exit_code'] == 0 and result['source_stable']
                completed.append(result)
            else:
                launch = load(c / (name + '-controller.json'))
                assert launch and alive(launch['pid']), name + ' stopped before completion'
        if len(completed) == len(requirements):
            assert all(result['source'] == completed[0]['source'] for result in completed)
            return completed[0]['source']
        time.sleep(10)
