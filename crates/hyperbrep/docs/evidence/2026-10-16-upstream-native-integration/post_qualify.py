"""Preserve both complete diagnostic corpora; measure only after qualification."""
import argparse
import json
from pathlib import Path
import shutil
from check import OUT, hashes, run

parser=argparse.ArgumentParser()
parser.add_argument('--name',default='benchmark-v1')
args=parser.parse_args()
source=hashes()
rows=json.loads((OUT/'attempts.json').read_text())
for label in ['upstream-root-squares','upstream-eighth-angles','triangulation-consumer','triangulation-clippy','native-debug','native-release','native-minimal','native-clippy','native-minimal-clippy',
              'rustdoc','analytic-example','faceted-example','advanced-example','supplied-example',
              'circular-example','similarity-example','occt-reader','fuzz-check','wasm-build','wasm-runtime','fmt','diff-check']:
    row=[row for row in rows if row['label']==label][-1]
    assert row['exit_code']==0 and row['source_unchanged'],row
    assert json.loads((OUT/row['source']).read_text())==source,row['label']
probe=Path('/tmp/hyperbrep-upstream-native-probe')
for source_name,bin_name in [('frontier.rs.txt','frontier'),('preceding-frontier.rs.txt','preceding_frontier')]:
    shutil.copyfile(OUT/source_name,probe/'src/bin'/f'{bin_name}.rs')
for family in ['cylinder','cone','torus']:
    for rotation in ['identity','diagonal','rational']:
        command=['cargo','run','--offline','--locked','--release','--manifest-path',str(probe/'Cargo.toml'),'--bin','frontier','--',family,rotation]
        result=run(f'final-{family}-{rotation}',command,600)
        if result:raise SystemExit(result)
commands=[
    ('preceding-frontier',['cargo','run','--offline','--locked','--release','--manifest-path',str(probe/'Cargo.toml'),'--bin','preceding_frontier'],900),
    ('benchmark-build',['cargo','build','--offline','--locked','--release','--no-default-features',
        '--features','csgrs/curve,hyperreal/serde','-p','csgrs','-p','hypermesh','-p','hyperreal','-p','hyperbrep','-p','hyperbrep-io','-p','hypercurve',
        '--bench','export','--bench','faceted','--bench','advanced','--bench','circles','--bench','pcurves','--bench','analytic_export',
        '--bench','kernel','--bench','closed_edges','--bench','arc','--bench','edge_images','--bench','analytic_similarity',
        '--bench','seam_cuts','--bench','coplanar','--bench','sectors','--bench','oblique','--message-format=json'],900),
    ('benchmarks',['python3',str(OUT/'benchmark.py'),'--name',args.name],3600),
]
for label,command,seconds in commands:
    result=run(label,command,seconds)
    if result:raise SystemExit(result)
