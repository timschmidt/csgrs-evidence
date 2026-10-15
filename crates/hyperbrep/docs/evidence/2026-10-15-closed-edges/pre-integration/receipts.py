"""Existing BREP reader plus a strict reader for the unchanged arc harness.

The arc harness has eleven value/count/checksum tails and one timing-only row.
These receipts preserve its assertions/observations, not a new geometry oracle.
"""
import importlib.util, re, sys
from pathlib import Path
root = Path('/mnt/development/csgrs')
spec = importlib.util.spec_from_file_location('brep_receipt', root / 'crates/hyperbrep/tools/benchmark_receipt.py')
brep = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = brep
spec.loader.exec_module(brep)

def expected(kind):
    if kind == 'arc':
        source = (root / 'crates/hypercurve/benches/arc.rs').read_text()
        before, main = source.split('fn main() {')
        labels = re.findall(r'"([a-z_{}]+): \{', main + before)
        labels = [x.replace('{arc_count}', '256') for x in labels]
        assert len(labels) == 12 and len(set(labels)) == 12
        return labels
    source = root / ('crates/hyperbrep/benches/' + kind + '.rs')
    names = brep.expected_cases(source.read_text())
    if kind == 'kernel':
        # Both frozen and candidate executables use default features. These
        # two rows are in the harness's #[cfg(feature = "tessellation")] block.
        omitted = ['derived_output/face_exact_vertex_chordal_approximation',
                   'derived_output/analytic_face_exact_vertex_chordal_approximation']
        assert len(names) == 66 and all(x in names for x in omitted)
        names = [x for x in names if x not in omitted]
    return names

def read(kind, text):
    names = expected(kind)
    if kind != 'arc':
        from dataclasses import asdict
        return [asdict(row) for row in brep.read_receipt(text, names)]
    rows = []
    for line in text.splitlines():
        if not re.match(r'^(?:arc_|major_arc_)', line):
            continue
        match = re.fullmatch(r'([a-z_0-9]+): (\d+) iterations in (\S+) \((\S+)/iter\)(.*)', line)
        if not match:
            raise ValueError('malformed arc row: ' + line)
        name, count, elapsed, each, tail = match.groups()
        count, elapsed, each = int(count), brep.nanoseconds(elapsed), brep.nanoseconds(each)
        if count == 0 or elapsed // count != each:
            raise ValueError('inconsistent arc duration: ' + name)
        if name != 'major_arc_cached_containment' and not re.search(r'(?:checksum|count)=\d+$', tail):
            raise ValueError('missing arc result: ' + name)
        if name == 'major_arc_cached_containment' and tail:
            raise ValueError('unexpected timing-only tail')
        rows.append(dict(name=name, iterations=count, unit='iter', result_tail=tail, elapsed_ns=elapsed, per_iteration_ns=each))
    if [row['name'] for row in rows] != names:
        raise ValueError('arc coverage/order/duplicate mismatch')
    return rows

def compare(first, second):
    strip = lambda rows: [{k:v for k,v in row.items() if k not in ('elapsed_ns','per_iteration_ns')} for row in rows]
    if strip(first) != strip(second):
        raise ValueError('benchmark observation changed')
