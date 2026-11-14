from pathlib import Path
import subprocess,hashlib,json,shutil
base=Path('/mnt/development');stage=Path('/tmp/interval-refactor/servo-migration')
def git(repo,*args):return subprocess.check_output(['git','-C',str(base/repo),*args])
assert hashlib.sha256(git('csgrs','diff','--cached','--binary')).hexdigest()=='3a94cc96a5288b72ca3b90087996ff8c3c3d4f06e3fe0b7a18178f255ac726dd'
assert not git('csgrs','diff','--binary')
assert not git('alumina-firmware','status','--porcelain=v1')
core=['crates/hyperinterval/'+x for x in ['src/bounds.rs','src/fixed_arithmetic.rs','src/integer_arithmetic.rs','tests/fixed_midpoint.rs','tests/integer_midpoint.rs','README.md','CHANGELOG.md']]
firmware=['crates/alumina-foc/src/servo.rs']
for dest,source,paths in [('csgrs','csgrs-servo-migration',core),('alumina-firmware','alumina-servo-migration',firmware)]:
 for path in paths:
  target=base/dest/path
  tracked=git(dest,'ls-files','--',path)
  if tracked:assert target.read_bytes()==git(source,'show','HEAD:'+path),path
  else:assert not target.exists(),path
 for path in paths:shutil.copy2(base/source/path,base/dest/path)
 (stage/(dest+'-candidate.patch')).write_bytes(git(dest,'diff','--binary','--',*paths))
(stage/'source-paths.json').write_text(json.dumps({'csgrs':core,'alumina-firmware':firmware},indent=2)+'\n')
print('Transferred only seven core paths and one firmware path.')
