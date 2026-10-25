from pathlib import Path
import gzip,hashlib,json,shutil,time
raw=Path(__file__).resolve().parent;record=raw/'capture-full-real-1792956802844918019';case=record/'stroke_fillet_stroke_of_a_cubic_arc_path_completes'
# The test has panicked on ENOSPC and the outer runner then failed to write its
# resource journal. Preserve that failure; this is not a completed input capture.
assert 'Disk quota exceeded' in (case/'stderr').read_text()
target=Path('/tmp/csgrs-r16-trace-target');assert target.is_dir()
size=sum(p.stat().st_size for p in target.rglob('*') if p.is_file() and not p.is_symlink())
shutil.rmtree(target)
cleanup={'removed_trace_target':str(target),'trace_target_bytes':size,'removed_replay_target':'/tmp/csgrs-r16-replay-target','replay_target_bytes':94893241,'reason':'Both diagnostic processes and replay build completed or failed; all executable copies, source and build metadata retained. Recover compiler-cache space before lossless compression of failed export.'}
(raw/'quota-recovery-cleanup.json').write_text(json.dumps(cleanup,indent=2)+'\n');print('CACHE SPACE RECOVERED',size,flush=True)
rows=[]
for source in sorted(case.glob('real-*.json')):
 dest=source.with_suffix(source.suffix+'.gz');assert not dest.exists();sha=hashlib.sha256();original_size=source.stat().st_size
 with source.open('rb') as inp,dest.open('wb') as out:
  with gzip.GzipFile(filename='',mode='wb',fileobj=out,mtime=0,compresslevel=1) as packed:
   while chunk:=inp.read(1<<20):sha.update(chunk);packed.write(chunk)
 recovered=hashlib.sha256()
 with gzip.open(dest,'rb') as inp:
  while chunk:=inp.read(1<<20):recovered.update(chunk)
 assert recovered.digest()==sha.digest()
 row={'original':source.name,'original_bytes':original_size,'original_sha256':sha.hexdigest(),'gzip':dest.name,'gzip_bytes':dest.stat().st_size,'round_trip_verified':True,'serializer_completed':source.name=='real-000000.json'};rows.append(row)
 (record/'compression-recovery.json').write_text(json.dumps(rows,indent=2)+'\n');source.unlink();print('COMPRESSED',json.dumps(row),flush=True)
status={'status':'capture-failed-disk-quota','test_panicked_during_second_scalar_export':True,'outer_driver_failed_writing_resource_samples':True,'complete_fiber_input_written':False,'first_scalar_completed_only':True,'partial_second_scalar_preserved_losslessly':True,'no_original_solver_or_composition_result_inferred':True,'recovered_epoch_ns':time.time_ns()}
(record/'recovered-failure.json').write_text(json.dumps(status,indent=2)+'\n');print('RECOVERY COMPLETE',flush=True)
