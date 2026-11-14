from pathlib import Path
import subprocess,json,hashlib
stage=Path('/tmp/interval-refactor/embedded-qualification');out=Path('/mnt/development/.interval-refactor-build/embedded-packaged')
boards=['mks-esp32-foc-v1','mks-tinybee','mks-tinybee-4mb','t-deck-pro','t-lora-pager'];rows=[]
for board in boards:
 caps={}
 for kind in ['baseline','candidate']:
  repo=Path('/mnt/development')/f'alumina-embedded-{kind}'
  raw=subprocess.check_output([str(repo/'target/debug/xtask'),'capabilities','--board',board,'--json'])
  (stage/f'{kind}-{board}-capabilities.json').write_bytes(raw);caps[kind]=raw
  cap=json.loads(raw);assert cap['armable'] is False and cap['capability_digest_verified'] is True
  subprocess.run(['python3',str(stage/'inspect-image.py'),kind,board],stdout=(stage/f'{kind}-{board}-inspection.log').open('w'),check=True)
  image=json.loads((stage/f'{kind}-{board}-image.json').read_text())
  flash=cap['flash_bytes'];assert flash in [4194304,8388608,16777216]
  path=out/f'{kind}-{board}.bin';assert not path.exists(),path
  command=['/tmp/interval-refactor/tools/espflash-v4.7.0','save-image','--chip','esp32' if board.startswith('mks-') else 'esp32s3','--flash-size',f'{flash//1048576}mb','--merge','--skip-padding',image['source_artifact'],str(path)]
  result=subprocess.run(command,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
  (stage/f'{kind}-{board}-package-final.log').write_bytes(result.stdout)
  row={'kind':kind,'board':board,'flash_bytes':flash,'command':command,'returncode':result.returncode,'partition_contract':'espflash default layout, not a board-declared partition-map qualification'}
  if result.returncode==0:
   row.update({'bytes':path.stat().st_size,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()});assert row['bytes']<=flash
  else:assert b'image_too_big' in result.stdout,(board,result.stdout)
  rows.append(row)
 assert caps['baseline']==caps['candidate'],board
 print(board,[(r['kind'],r['returncode'],r.get('bytes')) for r in rows if r['board']==board],flush=True)
(stage/'package-matrix.json').write_text(json.dumps(rows,indent=2)+'\n')
