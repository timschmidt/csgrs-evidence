from pathlib import Path
import ast
import collections
import hashlib
import json


def analyze(path, instrumented):
    groups = [[], [], []]
    fields = {}
    epoch = 0
    ready = 0
    for line in Path(path).read_text().splitlines():
        if line == 'INTERPOSER_READY flag=0':
            ready += 1
        elif line.startswith('EVENT '):
            assert instrumented and epoch < 3
            parts = line.split()
            assert len(parts) == 7 and parts[1] in ['A', 'D', 'R']
            _, kind, old_pointer, new_pointer, requested, old, new = parts
            event = (kind, int(old_pointer, 16), int(new_pointer, 16),
                     int(requested), int(old), int(new))
            if kind == 'A':
                assert event[1] == 0 and event[2] != 0 and event[4] == 0
            elif kind == 'D':
                assert event[1] != 0 and event[2] == 0 and event[3] == event[5] == 0
            else:
                assert event[1] != 0 and event[2] != 0
            groups[epoch].append(event)
        else:
            key, value = line.split(' ', 1)
            assert key not in fields
            fields[key] = value
            if key in ['USABLE', 'USABLE_CLEANUP', 'INPUT_USABLE_CLEANUP']:
                assert key == ['USABLE', 'USABLE_CLEANUP', 'INPUT_USABLE_CLEANUP'][epoch]
                epoch += 1
    assert ready == int(instrumented) and epoch == 3
    assert set(fields) == {'OUTPUT', 'TRACE', 'ALLOCATION', 'USABLE', 'CLEANUP',
                           'USABLE_CLEANUP', 'INPUT_CLEANUP', 'INPUT_USABLE_CLEANUP'}
    results = []
    histograms = []
    for events, ak, uk in zip(groups, ['ALLOCATION', 'CLEANUP', 'INPUT_CLEANUP'],
                             ['USABLE', 'USABLE_CLEANUP', 'INPUT_USABLE_CLEANUP']):
        original_allocation = ast.literal_eval(fields[ak])
        original_usable = ast.literal_eval(fields[uk])
        counts = collections.Counter()
        requested = traffic = live = peak = 0
        histogram = collections.Counter()
        for kind, _, _, n, old, new in events:
            counts[kind] += 1
            requested += n
            traffic += new
            live += new - old
            peak = max(peak, live)
            if kind in ['A', 'R']:
                histogram[(kind, n, new)] += 1
        if instrumented:
            assert (counts['A'], counts['D'], counts['R'], requested) == original_allocation[:4]
            assert (traffic, peak, live) == original_usable
        results.append(dict(epoch=ak, allocation=original_allocation, usable=original_usable,
                            events=len(events), reconciled=instrumented))
        histograms.append([dict(kind=k, requested=n, usable=u, count=c)
                           for (k, n, u), c in sorted(histogram.items())])
    signature = [(kind, n) for kind, _, _, n, _, _ in groups[0]]
    return dict(output=fields['OUTPUT'], trace=fields['TRACE'], epochs=results,
                histograms=histograms, event_request_sequence_sha256=(hashlib.sha256(
                    json.dumps(signature).encode()).hexdigest() if instrumented else None))


if __name__ == '__main__':
    import sys
    result = analyze(sys.argv[1], sys.argv[2] == 'interposed')
    result.pop('output')
    result.pop('trace')
    print(json.dumps(result, indent=2))
