from pathlib import Path
import re,time,subprocess,json,hashlib,os
s=Path(__file__).parent;log=s/'stable-release.log';seen=False
while not (s/'stable-release.exit').exists():
 matches=re.findall(r'/tmp/csgrs-release-check\.[A-Za-z0-9]+',log.read_text())
 if matches:
  work=Path(matches[-1]);consumer=work/'consumer'
  if (consumer/'Cargo.lock').is_file():
   for name in ['Cargo.toml','Cargo.lock']:(s/('stable-consumer-'+name)).write_bytes((consumer/name).read_bytes())
   sources={str(p.relative_to(consumer)):hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted((consumer/'src').rglob('*.rs'))};(s/'stable-consumer-source-hashes.json').write_text(json.dumps(sources,indent=2)+'\n')
   command=['cargo','+stable','metadata','--locked','--offline','--format-version','1'];p=subprocess.run(command,cwd=consumer,env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/interval-release-stable/release-check/consumer'},capture_output=True);(s/'stable-consumer-metadata.json').write_bytes(p.stdout);(s/'stable-consumer-metadata.stderr').write_bytes(p.stderr);(s/'stable-consumer-capture.json').write_text(json.dumps(dict(directory=str(consumer),command=command,returncode=p.returncode,lock_sha256=hashlib.sha256((consumer/'Cargo.lock').read_bytes()).hexdigest()),indent=2)+'\n');assert p.returncode==0
   print('captured actual external consumer lock, manifest, source hashes and locked resolution',flush=True);seen=True;break
 time.sleep(2)
if not seen:raise SystemExit('release command ended before consumer snapshot became available')
