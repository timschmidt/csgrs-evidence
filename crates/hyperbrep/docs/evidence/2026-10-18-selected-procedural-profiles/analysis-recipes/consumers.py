"""Native and real WASM execution of new and preceding complete acceptance bodies."""
import hashlib
import json
import re
from pathlib import Path
import shutil
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, ENV, hashes, run

PREVIOUS = OUT.parent/'2026-10-18-measurement-admission'
source = hashes()
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
F = OUT.parent/'2026-10-18-spline-exchange'
I = OUT.parent/'2026-10-18-native-boundary-images'
P = OUT.parent/'2026-10-18-selected-profile-extrusion'
projects = [
    ('new', OUT/'consumer-project', OUT/'consumer-project', 'hyperbrep-selected-procedural-consumer', 'hyperbrep_selected_procedural_probe', 12),
    ('contacts', OUT.parent/'2026-10-18-retained-plane-contacts/consumer-project', OUT.parent/'2026-10-18-retained-plane-contacts/consumer-project', 'hyperbrep-plane-contact-consumer', 'hyperbrep_plane_contact_probe', 14),
    ('selected_planar', OUT.parent/'2026-10-18-selected-planar-images/consumer-project', OUT.parent/'2026-10-18-selected-planar-images/consumer-project', 'hyperbrep-selected-planar-consumer', 'hyperbrep_selected_planar_probe', 14),
    ('planar', OUT.parent/'2026-10-18-planar-curve-lift/consumer-project', OUT.parent/'2026-10-18-planar-curve-lift/consumer-project', 'hyperbrep-planar-lift-consumer', 'hyperbrep_planar_lift_probe', 12),
    ('parallel', OUT.parent/'2026-10-18-parallel-pcurve-replay/consumer-project', OUT.parent/'2026-10-18-parallel-pcurve-replay/consumer-project', 'hyperbrep-parallel-pcurve-consumer', 'hyperbrep_parallel_pcurve_probe', 7),
    ('selected', P/'consumer-project', P/'consumer-project', 'hyperbrep-selected-profile-consumer', 'hyperbrep_selected_profile_probe', 11),
    ('measurement', PREVIOUS/'consumer-project', PREVIOUS/'consumer-project', 'hyperbrep-measurement-consumer', 'hyperbrep_measurement_probe', 7),
    ('spline', F/'consumer-project', F/'consumer-project', 'hyperbrep-spline-exchange-consumer', 'hyperbrep_spline_exchange_probe', 9),
    ('images', I/'consumer-project', I/'wasm-probe', 'hyperbrep-native-images-consumer', 'hyperbrep_native_images_wasm_probe', 14),
    ('original', Path('/tmp/hyperbrep-axial-shell-consumer'), Path('/tmp/hyperbrep-axial-shell-wasm-probe'), 'hyperbrep-axial-shell-consumer', 'hyperbrep_axial_shell_wasm_probe', 138),
]
inputs = {str(p): sha(p) for p in [Path(__file__), *F.joinpath('diagnostic-project').glob('*')]
          if p.is_file()}
for _, native, wasm, *_ in projects:
    for directory in [native, wasm]:
        for p in directory.rglob('*'):
            if p.is_file() and ('target' not in p.relative_to(directory).parts) and '__pycache__' not in p.parts:
                inputs[str(p)] = sha(p)
def checked(label, command, seconds=1200, extra=None):
    assert run(label, command, seconds, extra) == 0, label
    assert hashes() == source and all(sha(p) == h for p, h in inputs.items())
def freeze(relative, suffix):
    path = Path('/tmp')/('hyperbrep-selected-procedural-v1-'+suffix)
    assert not path.exists(), path
    shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/relative, path)
    return dict(path=str(path), bytes=path.stat().st_size, sha256=sha(path))
binaries = {}
for label, native, wasm, binary, module, groups in projects:
    checked(label+'-consumer-clippy', ['cargo', 'clippy', '--offline', '--locked', '--all-targets', '--manifest-path', str(native/'Cargo.toml'), '--', '-D', 'warnings'])
    checked(label+'-consumer-build', ['cargo', 'build', '--offline', '--locked', '--release', '--manifest-path', str(native/'Cargo.toml')])
    binaries[label+'_native'] = freeze('release/'+binary, label+'-native')
    command = ['cargo', 'build', '--offline', '--locked', '--release', '--manifest-path', str(wasm/'Cargo.toml'), '--target', 'wasm32-unknown-unknown']
    if native == wasm:
        command += ['--lib']
    checked(label+'-wasm-build', command, extra={'RUSTFLAGS': '-D warnings'})
    checked(label+'-wasm-runtime', ['python3', str(wasm/'run.py')], 1800)
    binaries[label+'_wasm'] = freeze('wasm32-unknown-unknown/release/'+module+'.wasm', label+'.wasm')
    if label != 'original':
        checked(label+'-consumer-all', [binaries[label+'_native']['path'], 'all'], 900)
    if label in ['new', 'contacts', 'images']:
        checked(label+'-consumer-step', [binaries[label+'_native']['path'], 'step'], 900)
    (OUT/'consumers.json').write_text(json.dumps(dict(source=source, inputs=inputs, binaries=binaries,
        groups={p[0]:p[-1] for p in projects}, scope='Source-path native/WASM acceptance; original 138 are WASM groups, with eight native end-to-end workflows recorded separately. Zero module imports. Not published JS bindings or installed packages.'), indent=2)+'\n')

# Original seven retained-region recipes and all independent expectations are unchanged.
checked('original-profiles-build', ['cargo', 'build', '--offline', '--locked', '--release', '--manifest-path', str(F/'diagnostic-project/Cargo.toml')])
original = freeze('release/hyperbrep-retained-region-probe', 'profiles')
rows = []
for case in ['uncut', 'difference', 'xor', 'affine_difference', 'affine_xor', 'parallel_square', 'parallel_cap']:
    checked('original-profile-'+case, [original['path'], case], 300)
    row = json.loads((OUT/'attempts.json').read_text())[-1]
    log = (OUT/row['log']).read_text()
    if case in ['uncut', 'parallel_square']:
        before = (F/('final-original-'+case+'-1.log')).read_text()
        assert re.sub(r'archive_bytes=\d+', 'archive_bytes=<schema>', log) == re.sub(r'archive_bytes=\d+', 'archive_bytes=<schema>', before)
        # These native-only archives change solely from header 9 to header 10.
        assert int(re.search(r'archive_bytes=(\d+)', log)[1]) == int(re.search(r'archive_bytes=(\d+)', before)[1]) + 1
    if case != 'parallel_cap':
        assert 'area=available' in log and 'volume=available' in log and 'cold_replay=identical' in log
        assert 'extrusion_certainty=Certified' in log and 'independent_volume=' in log
    else:
        assert 'extrusion_certainty=Certified' in log and 'cold_replay=identical' in log and 'volume_error=' in log
    rows.append(dict(case=case, log=row['log'], outcome='native_result'))
(OUT/'original-profiles.json').write_text(json.dumps(dict(source=source, inputs=inputs, binary=original, rows=rows, counts=dict(native_result=7, unsupported=0), changed=True), indent=2)+'\n')
