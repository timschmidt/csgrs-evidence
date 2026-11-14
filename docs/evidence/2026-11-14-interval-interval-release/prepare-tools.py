from pathlib import Path
import urllib.request,json,hashlib,subprocess
s=Path(__file__).parent;dest=Path('/mnt/development/.interval-refactor-build/release-tools');dest.mkdir(exist_ok=True);rows=[]
def fetch(url):
 with urllib.request.urlopen(url,timeout=120) as r:return r.read()
releases=json.loads(fetch('https://go.dev/dl/?mode=json'));release=next(x for x in releases if x['stable']);go=next(x for x in release['files'] if x['os']=='linux' and x['arch']=='amd64' and x['kind']=='archive')
index=fetch('https://nodejs.org/dist/latest-v22.x/SHASUMS256.txt').decode();node=next(x.split() for x in index.splitlines() if x.endswith('-linux-x64.tar.xz'))
for name,url,digest in [('go','https://go.dev/dl/'+go['filename'],go['sha256']),('node','https://nodejs.org/dist/latest-v22.x/'+node[1],node[0])]:
 p=dest/url.rsplit('/',1)[1];data=fetch(url);assert hashlib.sha256(data).hexdigest()==digest;p.write_bytes(data);target=dest/(name+'-qualified');target.mkdir(exist_ok=True)
 subprocess.run(['tar','-xf',str(p),'--strip-components=1','-C',str(target)],check=True)
 command=[str(target/'bin'/name),'version' if name=='go' else '--version'];version=subprocess.check_output(command,text=True).strip();rows.append(dict(name=name,url=url,sha256=digest,bytes=len(data),installation=str(target),version=version));(s/'tools.json').write_text(json.dumps(rows,indent=2)+'\n');print(version,flush=True)
