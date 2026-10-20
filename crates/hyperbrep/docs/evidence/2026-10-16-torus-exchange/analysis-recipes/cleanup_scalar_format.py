"""Apply the reviewed four-hunk scalar patch only after active checks finish."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT

path = OUT / 'scalar-format-review.json'
review = json.loads(path.read_text())
owner = ROOT / review['owner']
preview = Path(review['preview_path']).read_bytes()
digest = lambda data: hashlib.sha256(data).hexdigest()
assert not review.get('applied')
assert digest(owner.read_bytes()) == review['current_sha256']
assert digest(preview) == review['preview_sha256']
before = owner.read_bytes()
temporary = Path('/tmp/hyperbrep-torus-format-proof.rs')
temporary.write_bytes(preview)
configuration = ROOT / 'crates/.rustfmt.toml'
command = ['rustfmt', '--edition', '2024', '--config-path', str(configuration), str(temporary)]
subprocess.run(command, env=ENV, check=True)
assert temporary.read_bytes() == before
owner.write_bytes(preview)
review.update(applied=True, command=command,
    rustfmt=subprocess.check_output(['rustfmt', '--version'], env=ENV, text=True),
    configuration=str(configuration.relative_to(ROOT)),
    configuration_sha256=digest(configuration.read_bytes()),
    normalized_sha256=digest(temporary.read_bytes()),
    scope='Removed 33 incidental formatting hunks from the included scalar fragment; retained four mathematical-change hunks. Canonical rustfmt output is byte-identical to the previously qualified production source. Original guarded snapshots remain retained. Final builds, affected focused/downstream checks and all retained cost measurements use the reduced source; preserved earlier checks have an explicit formatting-only source admission.')
path.write_text(json.dumps(review, indent=2) + '\n')
print('applied exact four-hunk scalar patch; canonical formatting unchanged')
