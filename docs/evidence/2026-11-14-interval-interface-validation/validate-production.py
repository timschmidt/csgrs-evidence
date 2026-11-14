from pathlib import Path
import subprocess,os,json,hashlib,gzip
s=Path(__file__).parent;r=Path('/mnt/development/alumina-interface-validation');dist=r/'dist';tool='/mnt/development/.interval-refactor-build/interface-web-tools/bin/wasm-tools';rows=[]
commands=[[tool,'validate','dist/alumina-interface_bg.wasm'],['gzip','-t','dist/index.html.gz'],['gzip','-t','dist/alumina-interface.js.gz'],['gzip','-t','dist/alumina-interface_bg.wasm.gz'],['brotli','-t','dist/alumina-interface_bg.wasm.br']]
for i,cmd in enumerate(commands):
 p=subprocess.run(cmd,cwd=r,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True);(s/f'production-check-{i}.log').write_text(p.stdout);rows.append(dict(command=cmd,returncode=p.returncode));assert p.returncode==0,p.stdout
for name in ['index.html','alumina-interface.js','alumina-interface_bg.wasm']:
 data=(dist/name).read_bytes();assert gzip.decompress((dist/(name+'.gz')).read_bytes())==data
 # The installed CLI is also used by the build; avoid Python compressor dependency.
 decoded=subprocess.check_output(['brotli','--decompress','--stdout',str(dist/(name+'.br'))]);assert decoded==data
rows.append(dict(all_six_compressed_assets_round_trip=True))
(s/'production-validation.json').write_text(json.dumps(rows,indent=2)+'\n')
files=[dict(path=p.relative_to(dist).as_posix(),bytes=p.stat().st_size,sha256=hashlib.sha256(p.read_bytes()).hexdigest()) for p in sorted(dist.rglob('*')) if p.is_file()]
(s/'production-artifacts.json').write_text(json.dumps(files,indent=2)+'\n');print(json.dumps(files,indent=2))
