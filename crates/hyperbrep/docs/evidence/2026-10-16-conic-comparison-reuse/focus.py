"""Check the preserved conic/pcurve domain before a focused matched cost probe."""
from check import OUT, run

commands = [
    ('focused-conics', ['cargo', 'test', '--offline', '--locked', '-p', 'hyperbrep',
                        '--all-features', '--release', '--test', 'oblique'], 900),
    ('focused-step', ['cargo', 'test', '--offline', '--locked', '-p', 'hyperbrep-io',
                      '--all-features', '--release', '--test', 'step_pcurves',
                      '--test', 'step_circles'], 900),
    ('benchmark-build', ['cargo', 'build', '--offline', '--locked', '--release', '--no-default-features',
                         '--features', 'csgrs/curve,hyperreal/serde', '-p', 'csgrs', '-p', 'hypermesh',
                         '-p', 'hyperreal', '-p', 'hyperbrep', '-p', 'hyperbrep-io', '-p', 'hypercurve',
                         '--bench', 'export', '--bench', 'faceted', '--bench', 'advanced', '--bench', 'circles',
                         '--bench', 'pcurves', '--bench', 'analytic_export', '--bench', 'kernel',
                         '--bench', 'closed_edges', '--bench', 'arc', '--bench', 'edge_images',
                         '--bench', 'analytic_similarity', '--bench', 'seam_cuts', '--bench', 'coplanar',
                         '--bench', 'sectors', '--bench', 'oblique', '--message-format=json'], 900),
    ('focused-benchmark', ['python3', str(OUT / 'benchmark.py'), '--name', 'focused-v1',
                           '--only', 'pcurves'], 900),
]
for label, command, seconds in commands:
    status = run(label, command, seconds)
    if status:
        raise SystemExit(status)
