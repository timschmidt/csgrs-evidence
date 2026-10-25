from pathlib import Path
import hashlib
import json
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r17-trace')
folder = root / 'crates/hyperreal/src/rational/arithmetic'
record = raw / ('layout-edit-' + str(time.time_ns()))
record.mkdir()
files = ['representation.rs', 'construction.rs', 'ops.rs', 'squares_powers.rs']
old = {name: (folder / name).read_text() for name in files}
for name, source in old.items():
    (record / ('baseline-' + name)).write_text(source)

representation = old['representation.rs']
needle = '''    quaternary: OnceLock<CachedRationalLinearEntry>,
    quinary: OnceLock<CachedRationalLinearEntry>,
    square_reduction: OnceLock<CachedRationalSquareReduction>,
}'''
replacement = '''    later: CompactOnceBox<CachedRationalLateEntries>,
    square_reduction: OnceLock<CachedRationalSquareReduction>,
}

struct CachedRationalLateEntries {
    quaternary: OnceLock<CachedRationalLinearEntry>,
    quinary: OnceLock<CachedRationalLinearEntry>,
}

impl CachedRationalArithmetic {
    fn retain_later(&self, entry: CachedRationalLinearEntry) -> bool {
        if self.later.get().is_none() {
            let _ = self.later.set(Box::new(CachedRationalLateEntries {
                quaternary: OnceLock::new(),
                quinary: OnceLock::new(),
            }));
        }
        // Either this caller published the pair or a concurrent publisher did.
        // The owning arithmetic record keeps the installed pair alive.
        let later = self.later.get().expect("published rational cache slots");
        later
            .quaternary
            .set(entry)
            .or_else(|entry| later.quinary.set(entry))
            .is_ok()
    }
}'''
assert representation.count(needle) == 1
new = dict(old)
new['representation.rs'] = representation.replace(needle, replacement)
for name in files[1:]:
    source = old[name]
    needle = '                quaternary: OnceLock::new(),\n                quinary: OnceLock::new(),'
    assert source.count(needle) == (2 if name == 'ops.rs' else 1)
    new[name] = source.replace(needle, '                later: CompactOnceBox::new(),')

needle = '''            if cached.primary.kind.is_primary_placeholder() {
                return cached
                    .quaternary
                    .set(entry)
                    .or_else(|entry| cached.quinary.set(entry))
                    .is_ok();
            }
            return cached
                .tertiary
                .set(entry)
                .or_else(|entry| cached.quaternary.set(entry))
                .or_else(|entry| cached.quinary.set(entry))
                .is_ok();'''
replacement = '''            if cached.primary.kind.is_primary_placeholder() {
                return cached.retain_later(entry);
            }
            return match cached.tertiary.set(entry) {
                Ok(()) => true,
                Err(entry) => cached.retain_later(entry),
            };'''
for name in ['construction.rs', 'ops.rs']:
    assert new[name].count(needle) == 1
    new[name] = new[name].replace(needle, replacement)

needle = '        if let Some(inverse) = cached.quaternary.get() {'
assert new['construction.rs'].count(needle) == 1
new['construction.rs'] = new['construction.rs'].replace(needle,
    '        let later = cached.later.get()?;\n        if let Some(inverse) = later.quaternary.get() {')
new['construction.rs'] = new['construction.rs'].replace(
    'let inverse = cached.quinary.get()?;', 'let inverse = later.quinary.get()?;')
needle = '''        cached
            .quaternary
            .get()
            .and_then(Self::negation_from_entry)
            .or_else(|| cached.quinary.get().and_then(Self::negation_from_entry))'''
replacement = '''        let later = cached.later.get()?;
        later
            .quaternary
            .get()
            .and_then(Self::negation_from_entry)
            .or_else(|| later.quinary.get().and_then(Self::negation_from_entry))'''
assert new['ops.rs'].count(needle) == 1
new['ops.rs'] = new['ops.rs'].replace(needle, replacement)
for name, source in new.items():
    assert 'cached.quaternary' not in source and 'cached.quinary' not in source
    (folder / name).write_text(source)
    (record / ('candidate-' + name)).write_text(source)
metadata = {'record': str(record), 'files': files,
            'baseline_sha256': {n: hashlib.sha256(s.encode()).hexdigest() for n, s in old.items()},
            'candidate_sha256_before_fmt': {n: hashlib.sha256(s.encode()).hexdigest() for n, s in new.items()},
            'scope': 'Storage only: five entry capacity, write order, weak keys, square-reduction slot and public API unchanged.'}
(record / 'metadata.json').write_text(json.dumps(metadata, indent=2) + '\n')
(raw / 'latest-layout-edit.json').write_text(json.dumps(metadata, indent=2) + '\n')
print('PRIVATE LAYOUT EDIT', record)
