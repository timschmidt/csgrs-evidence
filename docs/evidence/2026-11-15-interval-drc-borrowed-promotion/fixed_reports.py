from pathlib import Path
import subprocess,json,hashlib,time,zipfile
s=Path(__file__).parent;source=Path('/mnt/development/interval-profile-static/csgrs');fixture_root=Path('/mnt/development/.interval-refactor-build/drc-borrowed-promotion-fixtures');fixture_root.mkdir(exist_ok=False)
fixtures=[('cparti-fpga','CPArti FPGA dev board.zip','CPArti FPGA dev board.kicad_pcb'),('hvp109a','HVP109A.zip','HVP109A.kicad_pcb')]
inputs=[]
for label,archive_name,board_name in fixtures:
 archive=source/'crates/hyperdrc/docs'/archive_name;destination=fixture_root/label;destination.mkdir();subprocess.run(['unzip','-q','-o',str(archive),'-d',str(destination)],check=True);board=destination/board_name;assert board.is_file();inputs.append({'label':label,'archive':str(archive),'archive_sha256':hashlib.sha256(archive.read_bytes()).hexdigest(),'board':str(board),'board_sha256':hashlib.sha256(board.read_bytes()).hexdigest()})
(s/'fixed-inputs.json').write_text(json.dumps(inputs,indent=2)+'\n')
rows=[]
for label in ['baseline','candidate']:
 info=json.loads((s/(label+'-cli-binaries.json')).read_text())['hyperdrc'];binary=Path(info['path']);assert hashlib.sha256(binary.read_bytes()).hexdigest()==info['sha256']
 for fixture in inputs:
  command=[str(binary),'--kicad-pcb',fixture['board'],'--check','layer-sanity','--check','board-outline-sanity','--check','min-copper-neck','--check','drill-spacing','--min-width','0.0762','--format','text'];name=f"fixed-{label}-{fixture['label']}";start=time.monotonic()
  with (s/(name+'.txt')).open('w') as out,(s/(name+'.log')).open('w') as err:p=subprocess.run(command,cwd=source/'crates/hyperdrc',stdout=out,stderr=err,timeout=600)
  report=(s/(name+'.txt')).read_bytes();row={'label':label,'fixture':fixture['label'],'command':command,'cwd':str(source/'crates/hyperdrc'),'exit_code':p.returncode,'wall_seconds':time.monotonic()-start,'binary_sha256':info['sha256'],'report_bytes':len(report),'report_sha256':hashlib.sha256(report).hexdigest(),'normalization':'none','claim':'full rendered-report identity at fixed inputs, not an exact-geometry proof by itself'};rows.append(row);(s/(name+'.json')).write_text(json.dumps(row,indent=2)+'\n');(s/'fixed-reports.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True);assert p.returncode==1
for fixture in inputs:
 a=s/f"fixed-baseline-{fixture['label']}.txt";b=s/f"fixed-candidate-{fixture['label']}.txt";assert a.read_bytes()==b.read_bytes(),fixture
(s/'fixed-report-equality.json').write_text(json.dumps({'all_report_bytes_identical':True,'normalization':'none','fixtures':[x['label'] for x in inputs]},indent=2)+'\n')
print('full fixed-input report bytes, including finding IDs, match',flush=True)
