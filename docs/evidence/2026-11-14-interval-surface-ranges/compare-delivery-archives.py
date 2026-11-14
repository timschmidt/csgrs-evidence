from pathlib import Path
import json, tomllib

s = Path(__file__).parent
build = Path('/mnt/development/.interval-refactor-build')
a = build / 'surface-interval-ranges-packages-final/packages'
b = build / 'surface-interval-ranges-packages-delivery/packages'
before = {r['name']: r['sha256'] for r in json.loads((s / 'package-final/package-artifacts.json').read_text())}
after = {r['name']: r['sha256'] for r in json.loads((s / 'package-delivery/package-artifacts.json').read_text())}
rows = []
for new in sorted(b.iterdir()):
    old = a / new.name
    original = {p.relative_to(old).as_posix() for p in old.rglob('*') if p.is_file()}
    current = {p.relative_to(new).as_posix() for p in new.rglob('*') if p.is_file()}
    assert original == current
    changed = [p for p in sorted(current) if (old / p).read_bytes() != (new / p).read_bytes()]
    allowed = {'.cargo_vcs_info.json', 'Cargo.lock'}
    if new.name == 'hyperbrep-0.2.0':
        allowed |= {'Cargo.toml', 'Cargo.toml.orig'}
        for name in ['Cargo.toml', 'Cargo.toml.orig']:
            x = tomllib.loads((old / name).read_text())
            y = tomllib.loads((new / name).read_text())
            assert y['package'].pop('metadata') == {'docs': {'rs': {'all-features': True}}}
            assert x == y
    assert set(changed) <= allowed, (new.name, changed)
    assert json.loads((old / '.cargo_vcs_info.json').read_text())['git']['sha1'] == '014a082252da83d8d5d566253bcb598c7a456df3'
    assert json.loads((new / '.cargo_vcs_info.json').read_text())['git']['sha1'] == 'd625de5b8e93dcb34e481a99253b1bb3cdd77592'
    checksums = []
    if 'Cargo.lock' in changed:
        x = tomllib.loads((old / 'Cargo.lock').read_text())
        y = tomllib.loads((new / 'Cargo.lock').read_text())
        assert len(x['package']) == len(y['package'])
        for previous, following in zip(x['package'], y['package']):
            if previous == following:
                continue
            name = previous['name']
            assert name == following['name'] and name in before
            assert previous['checksum'] == before[name]
            assert following['checksum'] == after[name]
            checksums.append(dict(package=name, before=previous['checksum'], after=following['checksum']))
            previous['checksum'] = following['checksum']
            assert previous == following
        assert x == y
    rust = [p for p in current if p.endswith('.rs')]
    rows.append(dict(package=new.name, changed_files=changed,
                     identical_rust_files=len(rust), archive_checksum_updates=checksums,
                     all_runtime_sources_and_fixtures_identical=True))
record = dict(previous_archive_source='014a082252da83d8d5d566253bcb598c7a456df3',
              delivery_archive_source='d625de5b8e93dcb34e481a99253b1bb3cdd77592',
              packages=rows,
              scope='Archive bytes differ in revision receipts, HyperBrep docs metadata and dependent archive checksums; every changed checksum equals its verified archive digest. All other bytes match. No new runtime execution implied.')
(s / 'package-delivery/archive-source-equivalence.json').write_text(json.dumps(record, indent=2)+'\n')
print('Nine archives: runtime sources identical; all changed lock checksums match the new archive bytes')
