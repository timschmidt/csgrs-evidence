from pathlib import Path
import subprocess,re,json
root=Path('/mnt/development/csgrs-dynamics-whole');out=Path('/tmp/interval-refactor/dynamics-whole-cost')
for relative in ['crates/hyperpath/src/routing/dynamics.rs','crates/hyperpath/src/routing/feed.rs','crates/hyperdynamics/src/metric.rs']:
 (root/relative).write_bytes(subprocess.check_output(['git','show',':'+relative],cwd=root))
subprocess.run(['python3',str(out/'attributes.py'),'inline'],check=True);rows=[]
for name in ['axis_projection','feed','jerk_schedule','lookahead']:
 relative='crates/hyperdynamics/src/'+name+'.rs';p=root/relative;source=p.read_text();functions=re.findall(r'^    pub fn (\w+)',source,re.M)
 changed=re.sub(r'^    pub fn ', '    #[inline]\n    pub fn ',source,flags=re.M);assert changed.replace('    #[inline]\n','')==source;p.write_text(changed);rows.append(dict(path=relative,functions=functions))
(out/'inline-reports-transforms.json').write_text(json.dumps(rows,indent=2)+'\n');(out/'inline-reports.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root));print(sum(len(r['functions']) for r in rows),'report methods additionally annotated')
