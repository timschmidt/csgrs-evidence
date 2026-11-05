from pathlib import Path
import hashlib,json,urllib.request,time
root=Path(__file__).resolve().parent/'tools'
name='OpenSCAD-2026.11.01-x86_64.AppImage'
url='https://files.openscad.org/snapshots/'+name
checksum=urllib.request.urlopen(url+'.sha256',timeout=30).read()
(root/(name+'.sha256')).write_bytes(checksum)
expected=checksum.decode().split()[0].lower()
assert len(expected)==64 and all(c in '0123456789abcdef' for c in expected)
path=root/name
with urllib.request.urlopen(url,timeout=30) as response,path.open('wb') as output:
 while block:=response.read(1024*1024):output.write(block)
actual=hashlib.sha256(path.read_bytes()).hexdigest()
assert actual==expected,(actual,expected)
path.chmod(0o755)
record={'time':time.time(),'url':url,'sha256_url':url+'.sha256','bytes':path.stat().st_size,'sha256':actual,'checksum_verified':True,'scope':'Isolated portable comparison tool; no global install or settings mutation. Exclude third-party AppImage bytes from research evidence; preserve name/URLs/digest.'}
(root/'download.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record,indent=2))
