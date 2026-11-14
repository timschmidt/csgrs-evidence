from pathlib import Path
import subprocess,os,json,tomllib,gzip,sys,hashlib
s=Path(__file__).parent;variant=sys.argv[1];r=Path('/mnt/development/alumina-interface-validation');dest=s/('hook-'+variant);dest.mkdir()
inputs={'index.html':b'<!doctype html><title>compression witness</title>\n','alumina-interface.js':b'export const witness = 42;\n','alumina-interface_bg.wasm':b'\0asm\x01\0\0\0'}
for name,data in inputs.items():(dest/name).write_bytes(data)
config=tomllib.loads((r/'Trunk.toml').read_text());hook=config['hooks'][0];cmd=[hook['command'],*hook['command_arguments']]
with (s/f'hook-{variant}.log').open('w') as out:code=subprocess.run(cmd,cwd=r,env=os.environ|{'TRUNK_STAGING_DIR':str(dest)},stdout=out,stderr=subprocess.STDOUT).returncode
assert code==0
rows=[]
for name in inputs:
 p=dest/name;gz=p.with_name(name+'.gz');br=p.with_name(name+'.br');gzip_ok=gz.exists() and gzip.decompress(gz.read_bytes())==p.read_bytes();br_result=subprocess.run(['brotli','-d','-c',str(br)],capture_output=True);brotli_ok=br_result.returncode==0 and br_result.stdout==p.read_bytes();rows.append(dict(name=name,gzip_exists=gz.exists(),gzip_roundtrip=gzip_ok,brotli_roundtrip=brotli_ok,uncompressed_sha256=hashlib.sha256(p.read_bytes()).hexdigest()))
(s/f'hook-{variant}.json').write_text(json.dumps(dict(command=cmd,hook_returncode=code,files=rows),indent=2)+'\n');print(rows)
if variant=='baseline':assert all(not x['gzip_exists'] and x['brotli_roundtrip'] for x in rows)
else:assert all(x['gzip_roundtrip'] and x['brotli_roundtrip'] for x in rows)
