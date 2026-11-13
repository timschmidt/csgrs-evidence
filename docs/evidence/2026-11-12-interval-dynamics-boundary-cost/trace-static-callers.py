"""Reproduce the bounded direct-call graph for the recorded control binary."""
from pathlib import Path
import subprocess,re,json,sys,hashlib
exe=Path(sys.argv[1]);assert hashlib.sha256(exe.read_bytes()).hexdigest()=='d331496d666548da7e9c90d790d2bc1ff683cd75a8c8c20460a76536c43f3c36'
p=subprocess.Popen(['objdump','-d','-C',str(exe)],stdout=subprocess.PIPE,text=True);names={};parents={};current=None
for line in p.stdout:
 m=re.match(r'^([0-9a-f]+) <(.+)>:',line)
 if m: current=int(m[1],16);names[current]=m[2]
 m=re.search(r'\bcall\s+([0-9a-f]+)\s',line)
 if m and current is not None:parents.setdefault(int(m[1],16),set()).add(current)
assert p.wait()==0
seen=set();front={0x5b3d00};rows=[]
for depth in range(5):
 nxt=set()
 for addr in sorted(front):
  if addr in seen:continue
  seen.add(addr);ps=parents.get(addr,set());rows.append(dict(depth=depth,address=hex(addr),name=names.get(addr),callers=[dict(address=hex(a),name=names.get(a)) for a in sorted(ps)]));nxt.update(ps)
 front=nxt
print(json.dumps(rows,indent=2))
