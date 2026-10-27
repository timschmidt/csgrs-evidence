from pathlib import Path
import hashlib,json,subprocess,time
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-chord-replay')
source=(checkout/'crates/hypercurve/tests/svg_chord_replay.rs').read_text()
old='''    assert_eq!(replay.paths().len(), 3);
    for (source, decoded) in original.iter().zip(replay.paths()) {'''
new='''    // Native line/arc strokes are returned as wires by the established SVG
    // API. Reassemble all three exact boundaries without using display chords.
    assert_eq!(replay.paths().len(), 2);
    let [hole_wire] = replay.wires() else {
        panic!("one exact native circular wire")
    };
    let decoded_hole = CurvePath2::try_new(
        hole_wire
            .segments()
            .iter()
            .map(|segment| match segment {
                hypercurve::Segment2::Line(line) => Curve2::from(line.clone()),
                hypercurve::Segment2::Arc(arc) => Curve2::from(arc.clone()),
            })
            .collect(),
    )
    .unwrap();
    let decoded = vec![replay.paths()[0].clone(), decoded_hole, replay.paths()[1].clone()];
    assert_eq!(decoded.len(), 3);
    for (source, decoded) in original.iter().zip(&decoded) {'''
assert source.count(old)==1
source=source.replace(old,new)
marker='fn mixed_replay_preserves_a_hole_and_disconnected_material_through_operations()'
pos=source.index(marker)
source=source[:pos]+source[pos:].replace('CurveRegion2::try_from_boundary_paths(replay.paths(), FillRule::NonZero)','CurveRegion2::try_from_boundary_paths(&decoded, FillRule::NonZero)').replace('replay.paths().to_vec(),','decoded,')
filename=root/'chord-replay-mixed-recovery.rs';filename.write_text(source)
lib=Path('/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-chord-replay-admission/release/deps/libhypercurve-aea14b5efa8be1b7.rlib')
binary=root/'chord-replay-mixed-recovery'
command=['rustc','+1.98.1','--edition=2024','--test','--cfg','feature="svg"','-C','opt-level=3',str(filename),'--crate-name','chord_replay_mixed_recovery','-L','dependency='+str(lib.parent),'--extern','hypercurve='+str(lib),'-o',str(binary)]
with (root/'chord-replay-mixed-recovery-compile.log').open('w') as out:
 subprocess.run(command,stdout=out,stderr=subprocess.STDOUT,check=True,timeout=120)
started=time.time()
run=[str(binary),'--exact','mixed_replay_preserves_a_hole_and_disconnected_material_through_operations','--nocapture']
with (root/'chord-replay-mixed-recovery.log').open('w') as out:
 result=subprocess.run(run,stdout=out,stderr=subprocess.STDOUT,timeout=300)
d={'compile_command':command,'run_command':run,'source_file':str(filename),'source_sha256':hashlib.sha256(filename.read_bytes()).hexdigest(),'library':str(lib),'library_sha256':hashlib.sha256(lib.read_bytes()).hexdigest(),'exit_code':result.returncode,'elapsed_seconds':time.time()-started,'interpretation':'Prototype5 incorrectly assumed native circular strokes are returned among paths; the established API returns them as wires. This recovery consumes both exact carriers and retains all original geometric/serialization assertions. No library edit.'}
(root/'chord-replay-mixed-recovery.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps({k:d[k] for k in ['exit_code','elapsed_seconds','interpretation']}))
assert result.returncode==0
