from pathlib import Path
root=Path(__file__).resolve().parent
s=(root/'archive_parallel_replay_evidence.py').read_text()
s=s.replace('parallel-replay','chord-replay').replace('parallel_replay','chord_replay')
s=s.replace('8eea456ceec297833e727212183581e3cd43527b','2eb55c5dd5a17dd7b9fb5731ea02b0ac62b38431')
s=s.replace("'suites': 88, 'passed': 2799", "'suites': 89, 'passed': 2809")
s=s.replace("downstream['suites'] == 8 and downstream['passed'] == 61", "downstream['suites'] == 9 and downstream['passed'] == 62")
s=s.replace("len(report['fixtures']) == 151", "len(report['fixtures']) == 160")
s=s.replace("'e0d8165fae971704511ba1f27fd6286eff408f6b'", "'368840d8c3c4e3ca489870a56f8642c10122ff42'")
s=s.replace('refs/heads/hypercurve-native-replay-evidence-2026-10-27','refs/heads/hypercurve-parallel-replay-evidence-2026-10-27')
s=s.replace("copy(root / 'native-restriction-replay-n-baseline.rs', Path('commands/native-restriction-replay-n-baseline.rs'))", "copy(root / 'parallel-replay-next-baseline.rs', Path('commands/parallel-replay-next-baseline.rs'))")
start=s.index('for name in [\n')
end=s.index("patch = (root / 'chord-replay-final-candidate.patch')",start)
s=s[:start]+"""changed = subprocess.check_output(['git', 'diff', '--name-only'], cwd=checkout, text=True).splitlines()
untracked = subprocess.check_output(['git', 'ls-files', '--others', '--exclude-standard'], cwd=checkout, text=True).splitlines()
for name in sorted(set(changed + untracked)):
    copy(checkout / name, Path('source') / name)
"""+s[end:]
start=s.index("    'owner':")
end=s.index("    'full_suite':",start)
s=s[:start]+"""    'owner': 'Hypercurve selected chord and point definitions, exact SVG graph and deterministic finite projection; CSGRS adapter qualification',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P27', 'P28', 'P29', 'P30'],
    'domain': 'Selected straight chords with exact coordinate, rational-source, rational-expression or native-parallel endpoints at Bezier scalar/selected-root parameters. Preserve directed support ranges, validated coordinate charts and shared curve endpoint relations. Stroke-path replay only; broader recursive point and generated-circle definitions remain open.',
"""+s[end:]
s=s.replace("'matrix_fixtures': 151", "'matrix_fixtures': 160")
start=s.index("    'baseline_findings':")
end=s.index("}, indent=2)",start)
s=s[:start]+"""    'baseline_findings': 'Committed 2eb55c5dd5 passes the procedural parallel export control but rejects an exact degree-seven selected chord after construction, midpoint incidence and split. On that same unchanged library, exact point queries pass but finite projection changes from 82 to 83 vertices at tolerance 0.01. Commands, original source, library digest and equality to qualified parent implementation bytes are retained in chord-replay-committed-r-baseline.json.',
    'change': 'HCP4 adds checked point, support, directed range and prior-curve endpoint records. The chord owner proves chart order and retained support incidence, including exterior ranges, before retaining the supplied chart. Graph records preserve shared immutable sources and root selectors. Point-local bounds used by finite projection follow the requested refinement sequence, independent of stronger cached predicate bounds; exact predicate caches remain available. docs/MIGRATIONS.md identifies the new tags, repeated retained-curve sharing and affected display bytes.',
    'closure_argument': 'Two distinct exact points determine a straight support. Its selected directed endpoints, certified monotone coordinate chart and source relation determine the retained oriented segment. Replay reconstructs each point from its original native definition and selected parameter, then proves support incidence and chart order through the existing chord kernel. Exterior ranges do not silently become bounded subranges of a finite witness. Prior typed references exclude cycles, forward references and wrong dependency types. Exact selectors and denominator guards remain authoritative. Allocation keys only memoize owned immutable storage within one encode call; they do not define mathematical equality. Known auxiliary contact definitions require their own replay records and remain explicit blockers.',
    'qualification': 'Nine public Hypercurve witnesses cover a separate-process degree-seven selected chord before further incidence, overlap and splitting; algebraic-coordinate region construction and round offset; a hand-encoded alternative chart and exterior range; invalid unused support and point definitions; correlated rational-expression endpoints; shared parallel/chord endpoints with independent exact coordinates and full SVG determinism; bounded graph growth and reached-byte-limit retry; original denominator poles; and mixed native/generated boundaries with a circular hole and disconnected material through reconstruction, Boolean identities and offset. A direct unit regression retains the original cache-dependent projection case and coarse/fine/coarse requests. One CSGRS adapter witness reloads a selected chord before split and a second archive.',
    'attempts': 'The initial baseline setup incorrectly expected RationalExpression instead of Rational; its assertion is preserved but is not credited as a geometric finding. The corrected baseline reaches the actual SVG rejection. Prototypes2 and3 preserve the original mixed parallel/chord failure: native metadata and exact incidence pass but full SVG changes after point queries. Adding a curve endpoint reference retains incidence but does not alone fix the display issue. Prototype4 fixes the independently reproduced bounds-cache cause without changing tolerances or weakening assertions. Prototype sources, logs and each parent transition remain available. Final qualification uses the committed R parent plus the complete frozen S patch.',
    'limitations': [
        'The named fixtures do not establish universal chord or generated-curve replay across arbitrary correlated fields and all degeneracies.',
        'Recursive point definitions, selected joint fibers, auxiliary tangent/contact definitions, generated circles, filled-region archives, scalar-expression DAG serialization and cross-path dependencies remain open.',
        'Point-location samples and self-Boolean identities alone do not prove the entire intended offset set; the fixtures separately preserve exact source relations, directed endpoints and stated topology invariants.',
        'The deterministic projection fix is demonstrated for the selected analytic parallel endpoint domain. It does not establish canonical display for every independently equivalent definition or selected point family.',
        'Extension-byte, display-segment and subdivision-depth limits do not bound total arithmetic, coefficient/system growth, temporary/retained memory or cooperative cancellation.',
        'External timeouts and process RSS observations are containment and measurements, not a kernel resource bound or controlled performance comparison.',
        'Full repository pre-push qualification and published-package delivery remain pending; earlier pushed revisions do not qualify these source bytes.',
    ],
"""+s[end:]
s=s.replace('Record procedural parallel replay qualification','Record selected chord replay qualification')
p=root/'archive_chord_replay_evidence.py';assert not p.exists();p.write_text(s);compile(s,str(p),'exec')
print('Prepared selected-chord evidence archiver; not executed.')
