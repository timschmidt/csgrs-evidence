from pathlib import Path
import subprocess,re,json,hashlib
out=Path('/tmp/interval-refactor/dynamics-feed-join');root=Path('/mnt/development/csgrs');revision='0d17fe178839b002b95173adf1f05137291639f3'
files=['crates/hyperpath/src/routing/feed.rs','crates/hyperpath/src/routing.rs','crates/hyperpath/src/solve.rs']
names=[['build_jerk_limited_report','certify_corner_lookahead_join_candidate','peak_feed_limit_constraint','peak_acceleration_limit_constraint','corner_feed_cap_constraint','corner_centripetal_limit_constraint','require_positive_corner_radius'],['classify_acceleration_limited_profile','acceleration_limited_feed_time_equation'],['constant_feed_time_equation','symmetric_jerk_limited_feed_time_equation']]
current=(root/'crates/hyperdynamics/src/feed.rs').read_text();rows=[]
def extract(s,name):
 m=re.search(r'^(?:pub(?:\([^\n]*\))? )?fn '+name+r'\(',s,re.M);assert m,name
 end=re.search(r'^}',s[m.start():],re.M);assert end
 return s[m.start():m.start()+end.end()]+'\n'
def normalized(s):
 s=re.sub(r'^pub(?:\([^\n]*\))? ','',s).replace('RouteCertificationError','DynamicsError')
 s='\n'.join(l for l in s.splitlines() if not l.lstrip().startswith('//'))+'\n'
 p=subprocess.run(['rustup','run','1.95.0','rustfmt','--edition','2024','--config-path',str(root/'crates/.rustfmt.toml'),'--emit','stdout'],input=s,text=True,capture_output=True);assert p.returncode==0,p.stderr
 return p.stdout
for path,functions in zip(files,names):
 original=subprocess.check_output(['git','show',revision+':'+path],cwd=root,text=True)
 for name in functions:
  a=normalized(extract(original,name));b=normalized(extract(current,name));assert a==b,name
  rows.append(dict(function=name,original=path,equal_after_stated_transforms=True,sha256=hashlib.sha256(a.encode()).hexdigest()))
(out/'source-equivalence.json').write_text(json.dumps(dict(source_revision=revision,transforms=['visibility removed for item comparison','RouteCertificationError renamed DynamicsError','whole-line comments removed','rustfmt 1.95 crates configuration'],scope='eleven scalar helper functions only; generic provider and receipt transport reviewed separately and covered by differential fixtures',functions=rows),indent=2)+'\n')
print('11 scalar helper bodies match after stated transforms')
