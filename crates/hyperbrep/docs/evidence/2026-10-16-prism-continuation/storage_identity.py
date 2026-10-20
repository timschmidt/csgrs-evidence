"""Bounded identity controls on the actual BREP build storage, without overlays."""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile
from check import ENV, OUT, ROOT

target = Path(ENV['CARGO_TARGET_DIR'])
probe = Path(tempfile.mkdtemp(prefix='prism-storage-identity-', dir=target))
(probe/'deps').mkdir()
observations = []

def metadata(path):
    stat = path.stat()
    return dict(path=str(path), realpath=str(path.resolve()), bytes=stat.st_size,
                device=stat.st_dev, inode=stat.st_ino, links=stat.st_nlink,
                sha256=hashlib.sha256(path.read_bytes()).hexdigest())

def observe(paths, expected, execute=False):
    for order in [paths, paths[::-1]]:
        for repeat in range(2):
            for path in order:
                row = metadata(path)
                row.update(order=[str(p) for p in order], repeat=repeat)
                assert row['sha256'] == expected[path], row
                if execute:
                    row['stdout'] = subprocess.check_output([str(path)], text=True).strip()
                    assert row['stdout'] == ('second' if path == paths[0] else 'first'), row
                observations.append(row)

root = probe/'library.rlib'
dep = probe/'deps/library-hash.rlib'
root.write_bytes(b'first\n' * 1024)
os.link(root, dep)
assert root.stat().st_ino == dep.stat().st_ino
replacement = probe/'replacement'
replacement.write_bytes(b'second\n' * 2048)
os.replace(replacement, root)
expected = {root: hashlib.sha256(b'second\n'*2048).hexdigest(), dep: hashlib.sha256(b'first\n'*1024).hexdigest()}
observe([root, dep], expected)

for label in ['first','second']:
    source = probe/(label+'.c')
    source.write_text('#include <stdio.h>\nint main(void) { puts("'+label+'"); return 0; }\n')
    subprocess.run(['cc','-O2','-Wall','-Wextra','-Werror',str(source),'-o',str(probe/label)], check=True)
root_exe = probe/'executable'
dep_exe = probe/'deps/executable'
os.link(probe/'first',root_exe)
os.link(root_exe,dep_exe)
expected = {root_exe: metadata(probe/'second')['sha256'], dep_exe: metadata(probe/'first')['sha256']}
os.replace(probe/'second',root_exe)
observe([root_exe,dep_exe],expected,True)
paths = [ROOT, ROOT/'crates/hyperreal/src/real/arithmetic/elementary_functions.rs', target,
         target/'release/deps', Path(ENV['CARGO_HOME']), Path(ENV['GMP_MPFR_SYS_CACHE'])]
mounts = []
for path in paths:
    data = json.loads(subprocess.check_output(['findmnt','--json','-T',str(path)],text=True))
    assert all('overlay' not in item['fstype'] for item in data['filesystems']), (path,data)
    mounts.append(dict(path=str(path), realpath=str(path.resolve()), result=data))
record = dict(passed=True, probe=str(probe), observations=observations, mount_observations=mounts,
    compiler=subprocess.check_output(['cc','--version'],text=True).splitlines()[0],
    environment={k:ENV[k] for k in ['CARGO_HOME','CARGO_TARGET_DIR','GMP_MPFR_SYS_CACHE']},
    scope='Current physical BREP source, dependency/cache paths and target. Sixteen reads cover hard-link replacement in both orders; eight also execute preserved distinct programs. This is not a whole-history artifact audit or qualification of unrelated nested FUSE builds.')
(OUT/'storage-identity.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record,indent=2))
