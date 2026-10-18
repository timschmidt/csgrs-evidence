"""Audit the declared v9/v10 schema differences; never read old models into production.

All other fields and ordering must agree. Independent complete-workflow assertions
run in the generating consumers; this comparison is a representation audit.
"""
from fractions import Fraction
import hashlib
import json
from pathlib import Path


def rational(value):
    assert set(value) == {'rational', 'class', 'computable'}, value
    assert value['class'] == 'One' and value['computable'] is None, value
    value = value['rational']
    # num-bigint serializes magnitude as little-endian u32 limbs.
    integer = lambda limbs: sum(x << (32 * i) for i, x in enumerate(limbs))
    return Fraction(value['sign'] * integer(value['numerator']), integer(value['denominator']))


def compare(old, new):
    old, new = Path(old), Path(new)
    before, after = old.read_bytes(), new.read_bytes()
    differences = []
    if before != after:
        assert old.suffix == new.suffix == '.json', (str(old), str(new))
        a, b = json.loads(before), json.loads(after)
        assert a['version'] == 9 and b['version'] == 10, (old, new)
        def walk(x, y, path):
            if x == y:
                return
            if path == '$.version':
                assert (x, y) == (9, 10)
                differences.append(dict(path=path, migration='format_header', before=x, after=y))
                return
            if isinstance(x, dict) and isinstance(y, dict):
                if 'source_range' in x and 'source_chart' in y and path.endswith('.PlanarImage'):
                    assert set(x) - {'source_range'} == set(y) - {'source_chart'}, path
                    start, end = map(rational, x['source_range'])
                    scale, offset = map(rational, y['source_chart'])
                    assert (scale, offset) == (end - start, start), path
                    differences.append(dict(path=path, migration='source_chart_coefficients',
                        before=x['source_range'], after=y['source_chart']))
                    for key in x:
                        if key != 'source_range':
                            walk(x[key], y[key], path + '.' + key)
                    return
                assert set(x) == set(y), (path, set(x) ^ set(y))
                for key in x:
                    walk(x[key], y[key], path + '.' + key)
            elif isinstance(x, list) and isinstance(y, list):
                assert len(x) == len(y), (path, len(x), len(y))
                for i, (a, b) in enumerate(zip(x, y)):
                    walk(a, b, f'{path}[{i}]')
            else:
                raise AssertionError((str(new), path, x, y))
        walk(a, b, '$')
    return dict(baseline=str(old), candidate=str(new), baseline_bytes=len(before), bytes=len(after),
        baseline_sha256=hashlib.sha256(before).hexdigest(), sha256=hashlib.sha256(after).hexdigest(),
        unchanged=before == after, verified_schema_changes=differences)
