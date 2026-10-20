"""Exact v9/v10 field audit, including the explicit finite-source representation.

The original narrow comparator and its failure are preserved. This comparison
admits no scalar-expression, topology, root-selector or source-coefficient change.
It is an evidence-only relation, not a production archive adapter.
"""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'analysis-recipes'))
from format_comparison import rational


def compare(old, new):
    old, new = Path(old), Path(new)
    before, after = old.read_bytes(), new.read_bytes()
    differences = []
    if before != after:
        assert old.suffix == new.suffix == '.json', (old, new)
        a, b = json.loads(before), json.loads(after)
        assert a['version'] == 9 and b['version'] == 10
        old_sources = a['selection']['pcurve_sources']
        new_sources = b['selection']['pcurve_sources']
        assert new_sources[:len(old_sources)] == old_sources
        appended = set(range(len(old_sources), len(new_sources)))
        consumed = set()

        def walk(x, y, path):
            if x == y:
                return
            if path == '$.version':
                assert (x, y) == (9, 10)
                differences.append(dict(path=path, migration='format_header', before=x, after=y))
                return
            if path == '$.selection.pcurve_sources':
                assert x == old_sources and y == new_sources
                # Every appended definition must be consumed by an independently
                # checked finite restriction below. No arbitrary extra node is ignored.
                return
            if isinstance(x, dict) and isinstance(y, dict):
                if 'source_range' in x and 'source_chart' in y and path.endswith('.PlanarImage'):
                    assert set(x)-{'source_range'} == set(y)-{'source_chart'}
                    start, end = map(rational, x['source_range'])
                    scale, offset = map(rational, y['source_chart'])
                    assert start != end and (scale, offset) == (end-start, start), path
                    differences.append(dict(path=path, migration='source_chart_coefficients',
                                            before=x['source_range'], after=y['source_chart']))
                    if x['source'] != y['source']:
                        assert set(x['source']) == {'RationalBezier'}
                        assert set(y['source']) == {'SourceRange'}
                        restriction = y['source']['SourceRange']
                        assert set(restriction) == {'source', 'range', 'reversed'}
                        index = restriction['source']
                        assert type(index) is int and index in appended
                        assert new_sources[index] == x['source'], path
                        assert restriction['reversed'] is False
                        expected = x['source_range'] if start < end else x['source_range'][::-1]
                        assert restriction['range'] == [{'Scalar': value} for value in expected]
                        # The old image has unit spatial domain and source map
                        # start+(end-start)*s. Restricting that same source to the
                        # sorted endpoint interval gives the same unit domain and
                        # image under the unchanged map, including reversal.
                        consumed.add(index)
                        differences.append(dict(path=path+'.source',
                            migration='explicit_finite_source_restriction', source_index=index,
                            original_source_sha256=hashlib.sha256(json.dumps(x['source'], sort_keys=True).encode()).hexdigest(),
                            finite_range=restriction['range'], spatial_domain=['0','1'],
                            proof='Identical source definition; exact old endpoint interval; identical affine source map; unchanged root/point records.'))
                    for key in x:
                        if key != 'source_range' and not (key == 'source' and x[key] != y[key]):
                            walk(x[key], y[key], path+'.'+key)
                    return
                assert set(x) == set(y), (path, set(x)^set(y))
                for key in x:
                    walk(x[key], y[key], path+'.'+key)
            elif isinstance(x, list) and isinstance(y, list):
                assert len(x) == len(y), (path, len(x), len(y))
                for i, (left, right) in enumerate(zip(x, y)):
                    walk(left, right, f'{path}[{i}]')
            else:
                raise AssertionError((str(new), path, x, y))

        walk(a, b, '$')
        assert consumed == appended, ('unconsumed_source_definitions', appended-consumed)
    return dict(baseline=str(old), candidate=str(new), baseline_bytes=len(before), bytes=len(after),
                baseline_sha256=hashlib.sha256(before).hexdigest(), sha256=hashlib.sha256(after).hexdigest(),
                unchanged=before == after, verified_schema_changes=differences)
