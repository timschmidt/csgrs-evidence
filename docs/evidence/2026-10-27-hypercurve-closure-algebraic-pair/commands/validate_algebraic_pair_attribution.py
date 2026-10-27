from pathlib import Path
import hashlib
import json


def validate(root):
    def read(path):
        return json.loads((root / path).read_text())

    prior_name = 'algebraic-pair-qualification-attempt2'
    prior = root / prior_name
    for attempt in ['algebraic-pair-qualification-attempt1', prior_name]:
        preserved = read(attempt + '/preservation.json')
        for row in preserved['artifacts']:
            data = (root / attempt / row['path']).read_bytes()
            assert len(data) == row['bytes'] and hashlib.sha256(data).hexdigest() == row['sha256'], row['path']
    results = read('algebraic-pair-final-results.json')
    old = read(prior_name + '/algebraic-pair-final-results.json')
    assert len(results) == 19 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
    assert len(old) == 14 and old[-1]['name'] == 'dependent-comparisons' and old[-1]['exit_code'] == 101
    transition = read('algebraic-pair-metadata-transition.json')
    before = read(prior_name + '/algebraic-pair-final-files-before.json')
    after = read('algebraic-pair-final-files-before.json')
    assert before == read(prior_name + '/algebraic-pair-final-files-after.json')
    assert after == read('algebraic-pair-final-files-after.json')
    old_map = {r[0]: r[1:] for r in before}
    new_map = {r[0]: r[1:] for r in after}
    changed = sorted(p for p in old_map.keys() | new_map.keys() if old_map.get(p) != new_map.get(p))
    assert changed == transition['changed_paths'] == ['crates/comparisons/COMPARISON_REPORT.md', 'crates/comparisons/coverage/hyper-crates.tsv']
    assert transition['changed_file_records'] == {p: {'before': old_map[p], 'after': new_map[p]} for p in changed}
    assert transition['before_source'] == read(prior_name + '/algebraic-pair-final-source-before.json') == read(prior_name + '/algebraic-pair-final-source-after.json')
    assert transition['after_source'] == read('algebraic-pair-final-source-before.json') == read('algebraic-pair-final-source-after.json')
    for index, row in enumerate(results):
        prefix = prior_name + '/' if index < 13 else ''
        assert row['tested_source_record'] == prefix + 'algebraic-pair-final-source-before.json'
        assert row['tested_files_record'] == prefix + 'algebraic-pair-final-files-before.json'
        if index < 13:
            assert {k: v for k, v in row.items() if k not in ['tested_source_record', 'tested_files_record']} == old[index]
            name = 'algebraic-pair-final-' + row['name'] + '.log'
            assert (root / name).read_bytes() == (prior / name).read_bytes()
    assert [r['name'] for r in results[13:]] == ['dependent-comparisons', 'matrix-guards', 'matrix', 'typos', 'budget', 'diff']
    assert results[13]['oracle_stable']
    assert read('algebraic-pair-final-oracle-before.json') == read('algebraic-pair-final-oracle-after.json')
    return transition


if __name__ == '__main__':
    validate(Path(__file__).resolve().parent)
    print('Per-command source attribution and both failed qualification records verified.')
