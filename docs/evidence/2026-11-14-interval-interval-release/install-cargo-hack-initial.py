from pathlib import Path
import urllib.request,json,subprocess,os,hashlib
s=Path(__file__).parent;url='https://crates.io/api/v1/crates/cargo-hack'
with urllib.request.urlopen(urllib.request.Request(url,headers={'User-Agent':'csgrs-release-qualification'}),timeout=60) as r:data=json.load(r)
version=data['crate']['max_stable_version'];record=next(v for v in data['versions'] if v['num']==version);root=Path('/mnt/development/.interval-refactor-build/release-tools/cargo-hack');cmd=['cargo','+stable','install','cargo-hack','--version',version,'--locked','--root',str(root)];row=dict(metadata_url=url,version=version,registry_checksum=record['checksum'],command=cmd)
with (s/'install-cargo-hack.log').open('w') as out:p=subprocess.run(cmd,env=os.environ|{'CARGO_BUILD_JOBS':'3'},stdout=out,stderr=subprocess.STDOUT)
row['returncode']=p.returncode
if p.returncode==0:
 binary=root/'bin/cargo-hack';row['binary_sha256']=hashlib.sha256(binary.read_bytes()).hexdigest();row['reported_version']=subprocess.check_output([str(binary),'--version'],text=True).strip();link=Path('/home/tim/.local/bin/cargo-hack');assert not link.exists() and not link.is_symlink();link.symlink_to(binary);row['link']=str(link)
(s/'cargo-hack-tool.json').write_text(json.dumps(row,indent=2)+'\n');print(row)
