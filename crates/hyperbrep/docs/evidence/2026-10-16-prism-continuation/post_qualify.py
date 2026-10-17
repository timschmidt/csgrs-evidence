"""Retain complete diagnostic and performance corpora after native qualification."""
import argparse,json,shutil
from pathlib import Path
from check import OUT,hashes,run
parser=argparse.ArgumentParser()
parser.add_argument('--name',default='benchmark-v1')
parser.add_argument('--skip-gates',action='store_true',help='Diagnostic troubleshooting only; does not admit a candidate.')
args=parser.parse_args()
source=hashes()
if not args.skip_gates:
    rows=json.loads((OUT/'attempts.json').read_text())
    for label in ['storage-identity','scalar-atan','scalar-release','scalar-minimal','scalar-clippy','scalar-consumers','native-debug','native-release','native-minimal','native-clippy','native-minimal-clippy','rustdoc','analytic-example','faceted-example','advanced-example','supplied-example','circular-example','similarity-example','occt-reader','fuzz-check','wasm-build','wasm-runtime','fmt','diff-check']:
        row=[r for r in rows if r['label']==label][-1]
        assert row['exit_code']==0 and row['source_unchanged'],row
        assert json.loads((OUT/row['source']).read_text())==source,label
probe=Path('/tmp/hyperbrep-prism-continuation-probe')
(probe/'src/bin').mkdir(parents=True,exist_ok=True)
for name in ['Cargo.toml','Cargo.lock']:shutil.copyfile(OUT/'diagnostic-project'/name,probe/name)
for source_name,bin_name in [('frontier.rs.txt','frontier'),('preceding-frontier.rs.txt','preceding_frontier')]:
    shutil.copyfile(OUT/source_name,probe/'src/bin'/f'{bin_name}.rs')
commands=[('inherited-reproduction',['python3',str(OUT/'inherited_gate.py')],1800),
          ('artifact-check',['python3',str(OUT/'artifact_check.py')],300)]
for family in ['cylinder','cone','torus']:
    for rotation in ['identity','diagonal','rational']:
        commands.append((f'final-{family}-{rotation}', ['cargo','run','--offline','--locked','--release','--manifest-path',str(probe/'Cargo.toml'),'--bin','frontier','--',family,rotation],600))
commands += [
    ('preceding-frontier',['cargo','run','--offline','--locked','--release','--manifest-path',str(probe/'Cargo.toml'),'--bin','preceding_frontier'],900),
    ('prism-frontier',['python3',str(OUT/'reproduce.py'),'--prefix','final-prism'],1800),
    ('prism-occt',['python3',str(OUT/'prism_occt.py'),str(OUT/'final-prism-artifacts'),str(OUT/'prism-occt.json')],300),
    ('benchmark-build',['cargo','build','--offline','--locked','--release','--no-default-features','--features','csgrs/curve,hyperreal/serde','-p','csgrs','-p','hypermesh','-p','hyperreal','-p','hyperbrep','-p','hyperbrep-io','-p','hypercurve',
       '--bench','export','--bench','faceted','--bench','advanced','--bench','circles','--bench','pcurves','--bench','analytic_export','--bench','kernel','--bench','closed_edges','--bench','arc','--bench','edge_images','--bench','analytic_similarity','--bench','seam_cuts','--bench','coplanar','--bench','sectors','--bench','oblique','--bench','prisms','--bench','prism_exchange','--message-format=json'],1200),
    ('benchmarks',['python3',str(OUT/'benchmark.py'),'--name',args.name],7200),
]
for label,command,seconds in commands:
    result=run(label,command,seconds)
    if result:raise SystemExit(result)
