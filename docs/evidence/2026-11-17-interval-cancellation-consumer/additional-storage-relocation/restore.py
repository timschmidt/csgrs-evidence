from pathlib import Path
import argparse,hashlib,json,subprocess
p=argparse.ArgumentParser();p.add_argument('--destination',type=Path);p.add_argument('--evidence',type=Path,default=Path('/mnt/development/csgrs-evidence'));args=p.parse_args();rows=json.loads(Path(__file__).with_name('map.json').read_text());sha=lambda b:hashlib.sha256(b).hexdigest()
for row in rows:
 data=subprocess.check_output(['git','-C',str(args.evidence),'show',row['archive_revision']+':'+row['archive_path']]);assert len(data)==row['bytes'] and sha(data)==row['sha256'];dest=args.destination/Path(row['ram_path']).name if args.destination else Path(row['ram_path']);dest.parent.mkdir(parents=True,exist_ok=True)
 if dest.exists():assert sha(dest.read_bytes())==row['sha256']
 else:
  with dest.open('xb') as f:f.write(data)
  dest.chmod(row['mode'])
 assert sha(dest.read_bytes())==row['sha256']
 if args.destination is None:assert sha(Path(row['original_path']).read_bytes())==row['sha256']
print(json.dumps(dict(files=len(rows),bytes=sum(x['bytes'] for x in rows),alternate_destination=str(args.destination) if args.destination else None,committed_archive_verified=True),indent=2))
