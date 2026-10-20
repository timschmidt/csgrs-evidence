"""Compare standalone formatter findings to the pinned pre-change source."""
from collections import Counter
import difflib
import hashlib
import json
from pathlib import Path
import subprocess
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ENV, ROOT, hashes

BASELINE = '352fb486a9090c18f43a75b909fa60c4181ecb21'
RELATIVE = 'crates/hyperreal/src/computable/node/algebra.rs'
DEST = OUT / 'included-format-review'
DEST.mkdir(exist_ok=True)
source = hashes()
before = subprocess.check_output(['git', 'show', BASELINE+':'+RELATIVE], cwd=ROOT)
after = (ROOT / RELATIVE).read_bytes()
sha = lambda b: hashlib.sha256(b).hexdigest()
results = {}
changes = {}
for name, data in [('baseline', before), ('candidate', after)]:
    command = ['rustfmt', '--edition', '2024', '--emit', 'stdout']
    result = subprocess.run(command, input=data, capture_output=True, cwd=ROOT, env=ENV)
    assert result.returncode == 0 and not result.stderr, result.stderr
    (DEST / (name+'.rs')).write_bytes(data)
    (DEST / (name+'-formatted.rs')).write_bytes(result.stdout)
    a, b = data.decode().splitlines(keepends=True), result.stdout.decode().splitlines(keepends=True)
    edits = [dict(before=''.join(a[i:j]), after=''.join(b[k:l]), before_line=i+1, after_line=k+1)
             for kind,i,j,k,l in difflib.SequenceMatcher(a=a,b=b,autojunk=False).get_opcodes() if kind != 'equal']
    changes[name] = Counter((r['before'],r['after']) for r in edits)
    results[name] = dict(command=command, source_sha256=sha(data), formatted_sha256=sha(result.stdout), edits=edits)
assert changes['baseline'] and changes['baseline'] == changes['candidate'], results
assert hashes() == source
result = dict(source=source, baseline=BASELINE, relative=RELATIVE, results=results,
    same_formatter_edits=True, formatting_edits=len(results['candidate']['edits']),
    recipe_sha256=sha(Path(__file__).read_bytes()),
    scope='Standalone rustfmt check additionally inspected include! source files not visited by cargo fmt. Every algebra.rs formatting edit is byte-identical to an edit on the pinned baseline; moved/added implementation introduces no additional formatter edits. The failed supplemental check remains a failure. No unrelated baseline formatting is changed, and the repository-required cargo fmt check remains separate.')
(OUT / 'included-format-review.json').write_text(json.dumps(result, indent=2)+'\n')
print('identical inherited formatting edits:', result['formatting_edits'])
