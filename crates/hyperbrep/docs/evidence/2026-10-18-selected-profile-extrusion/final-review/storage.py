"""Bounded identity check in the actual physical Cargo target directory."""
import hashlib,json,os,shutil,subprocess,tempfile
from pathlib import Path
OUT=Path(__file__).resolve().parents[1]
ROOT=OUT.parents[4]
TARGET=Path('/tmp/hyperbrep-review-target')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
with tempfile.TemporaryDirectory(prefix='selected-profile-storage-',dir=TARGET) as directory:
 d=Path(directory);a=d/'a';b=d/'b';alias=d/'alias';replacement=d/'replacement'
 a.write_bytes(b'axial-source-A');b.write_bytes(b'axial-source-B')
 assert a.read_bytes()!=b.read_bytes()
 os.link(a,alias);replacement.write_bytes(b'axial-source-C');os.replace(replacement,a)
 assert alias.read_bytes()==b'axial-source-A' and a.read_bytes()==b'axial-source-C' and b.read_bytes()==b'axial-source-B'
 yes=d/'yes';no=d/'no';exe=d/'executable';retained=d/'retained'
 shutil.copy2('/usr/bin/true',yes);shutil.copy2('/usr/bin/false',no);shutil.copy2(yes,exe);os.link(exe,retained)
 assert sha(yes)!=sha(no) and subprocess.run([str(exe)]).returncode==0
 shutil.copy2(no,replacement);os.replace(replacement,exe)
 assert sha(exe)==sha(no) and sha(retained)==sha(yes)
 assert subprocess.run([str(exe)]).returncode==1 and subprocess.run([str(retained)]).returncode==0
 paths=[ROOT,TARGET,Path('/tmp/hyperbrep-review-cargo')]
 record=dict(passed=True,paths=[dict(path=str(p),resolved=str(p.resolve()),device=p.stat().st_dev,filesystem=subprocess.check_output(['stat','-f','-c','%T',str(p)],text=True).strip()) for p in paths],checks=['distinct reads','hard-link identity','atomic replacement','retained hard link','ELF execution before/after replacement'],executable_hashes=dict(true=sha(yes),false=sha(no)),recipe_sha256=sha(Path(__file__)),scope='Bounded current target identity check; not an audit of historical artifacts or concurrent source mutations.')
(OUT/'storage-identity.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True)
