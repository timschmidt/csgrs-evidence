from pathlib import Path
import subprocess,re,json
root=Path('/mnt/development/csgrs-dynamics-whole');out=Path('/tmp/interval-refactor/dynamics-whole-cost')
subprocess.run(['python3',str(out/'attributes.py'),'inline'],check=True)
rows=[]
for relative in ['crates/hyperpath/src/routing/dynamics.rs','crates/hyperpath/src/routing/feed.rs','crates/hyperdynamics/src/metric.rs']:
 source=subprocess.check_output(['git','show',':'+relative],cwd=root,text=True);start=source.index('\nimpl');prefix=source[:start];body=source[start:]
 functions=re.findall(r'^    fn (\w+)',body,re.M);assert functions
 changed=prefix+re.sub(r'^    fn ', '    #[inline]\n    fn ',body,flags=re.M)
 assert changed.replace('    #[inline]\n','')==source
 (root/relative).write_text(changed);rows.append(dict(path=relative,functions=functions))
(out/'inline-adapters-transforms.json').write_text(json.dumps(rows,indent=2)+'\n');(out/'inline-adapters.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root));print(rows)
