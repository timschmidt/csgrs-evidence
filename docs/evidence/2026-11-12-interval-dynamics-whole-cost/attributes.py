from pathlib import Path
import subprocess,re,json,sys
root=Path('/mnt/development/csgrs-dynamics-whole');out=Path('/tmp/interval-refactor/dynamics-whole-cost');variant=sys.argv[1]
assert variant in ['inline','always'];attribute='#[inline]' if variant=='inline' else '#[inline(always)]';rows=[]
for name in ['axis_projection','feed','guards','jerk_schedule','lookahead']:
 relative='crates/hyperdynamics/src/'+name+'.rs';source=subprocess.check_output(['git','show',':'+relative],cwd=root,text=True)
 pattern=r'^(?:pub(?:\([^)]*\))? )?fn ([A-Za-z_][A-Za-z_0-9]*)'
 functions=re.findall(pattern,source,re.M);assert functions
 rewritten=re.sub(pattern,lambda m:attribute+'\n'+m[0],source,flags=re.M)
 assert rewritten.replace(attribute+'\n','')==source
 (root/relative).write_text(rewritten);rows.append(dict(path=relative,functions=functions,only_added_attribute=attribute))
(out/(variant+'-transforms.json')).write_text(json.dumps(rows,indent=2)+'\n');(out/(variant+'.patch')).write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root));print(sum(len(r['functions']) for r in rows),'top-level functions annotated')
