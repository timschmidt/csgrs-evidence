import subprocess, os, json, hashlib
from pathlib import Path
r=Path(__file__).resolve().parent/'openscad-2021.01'
r.mkdir(exist_ok=True)
version=subprocess.run(['openscad','--version'],capture_output=True,text=True)
assert '2021.01' in version.stderr+version.stdout
(r/'version.txt').write_text(version.stdout+version.stderr)
cases={f'negative-{angle}': f'rotate_extrude(angle={angle}, $fn=3) translate([-2,0]) square([1,1]);' for angle in [90,-90,360,-360,720,-720,1080,450]}
cases['negative-omitted-angle']='rotate_extrude($fn=3) translate([-2,0]) square([1,1]);'
cases['mixed-disjoint']='rotate_extrude(angle=360, $fn=3) union() {translate([-2,0]) square([1,1]); translate([1,2]) square([1,1]);}'
with (r/'results.jsonl').open('w',buffering=1) as out:
 for name,source in cases.items():
  scad=r/(name+'.scad');scad.write_text(source+'\n')
  off=r/(name+'.off')
  cmd=['openscad','-o',str(off),str(scad)]
  result=subprocess.run(cmd,env={**os.environ,'QT_QPA_PLATFORM':'offscreen'},capture_output=True,text=True,timeout=60)
  (r/(name+'.log')).write_text(result.stdout+result.stderr)
  row={'case':name,'source':source,'command':cmd,'exit_code':result.returncode}
  if result.returncode==0:
   lines=off.read_text().splitlines();header=lines[0].split();assert header[0]=='OFF'
   nv=int(header[1]);points=[list(map(float,line.split())) for line in lines[1:1+nv]]
   row['bounds']=[[min(p[i] for p in points),max(p[i] for p in points)] for i in range(3)]
   row['vertices']=nv;row['sha256']=hashlib.sha256(off.read_bytes()).hexdigest()
   if name in ['negative-360','negative-omitted-angle']:
    assert abs(row['bounds'][0][0]+1)<1e-5 and abs(row['bounds'][0][1]-2)<1e-5
  out.write(json.dumps(row)+'\n')
  print(name,result.returncode,row.get('bounds'),flush=True)
