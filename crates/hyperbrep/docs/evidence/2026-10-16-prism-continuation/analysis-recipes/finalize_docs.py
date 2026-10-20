"""Publish the reviewed increment without closing broader work-package gates."""
import json
from pathlib import Path

OUT = Path(__file__).resolve().parents[1]
ROOT = OUT.parents[4]
read = lambda path: json.loads(path.read_text())
write = lambda path, value: path.write_text(json.dumps(value, indent=2) + '\n')
m = read(OUT / 'manifest.json')
assert m['decision'] == 'kept' and m['retention_rationale'] and m['idea_ledger']
b = read(OUT / m['benchmark_summary'])
size = read(OUT / m['binary_size_comparison'])
changes = b['receipt_migrations']['changes']
changed_cases = sum(row['case'] != 'fixture facts' for row in changes)
changed_facts = len(changes) - changed_cases
frontier = m['frontier']['counts']
assert frontier == dict(native_result=74, undecided=5, resource_exhaustion=2)
assert m['prism_frontier']['counts'] == dict(native_result=18, unsupported=6)
validation = (
    'BREP/IO debug and release each pass 512 all-feature tests; minimal release '
    'passes 504, with none failed or ignored. Both warning-denied all-target '
    'Clippy configurations, rustdoc, six examples, eleven preceding optional '
    'OCCT checks, fuzz-target compilation and 83 zero-import source-path WASM '
    'groups pass (71 preserved plus 12 new). The necessary scalar extension '
    'passes 45 targeted atan tests, 908 all-feature and 837 minimal library tests; '
    'its curve/predicate/solver consumers pass 2600 library tests with six '
    'pre-existing ignored tests unexecuted. Both inherited scalar zero-factor '
    'reproductions still fail with FACTORS > 0; they remain failed gates, not '
    'pre-push exemptions. All 15 preceding workflows complete. The full 81-slot '
    'diagnostic frontier records 74 native results, five undecided and two '
    'resource-exhaustion outcomes, preserving every previously native body '
    'count. Diagnostic success/replay does not by itself admit new semantics. '
    'The 24 prism cases have 18 native results and six typed unsupported '
    'controls; all 14 emitted STEP samples pass optional OCCT validity, '
    'topology and mass-property checks. Independent native assertions cover '
    'metrics, material points, topology, replay, split, transforms and '
    'continued operations. All 22 preceding STEP artifacts stay byte-identical; '
    'all ten original prism artifacts remain, with seven explicit '
    'representation migrations and three unchanged files.')
cost = (
    f"The complete 96-process campaign measures 159 preserved cases in fifteen "
    f"corpora and eight new completed workflows. {changed_cases} old case receipts "
    f"and {changed_facts} fixture-fact records have individually reviewed "
    f"migrations. Maximum preserved-case median "
    f"latency ratio is {b['maximum_case_median_ratio']:.6f}; "
    f"{len(b['over_ten_percent'])} rows exceed 10%. "
    f"{len(b['allocation_changes'])} rows change allocation observations, "
    f"including {len(b['allocation_increases'])} increases in calls or "
    f"requested bytes. All raw samples, adverse rows, output receipts, "
    f"process resources and executable sizes remain. Native harness size "
    f"changes range from {min(r['delta_bytes'] for r in size['native_harnesses'])} "
    f"to {max(r['delta_bytes'] for r in size['native_harnesses'])} bytes; the "
    f"WASM harness grows {size['wasm']['delta_bytes']} bytes and includes "
    f"twelve new test groups. Shared-host observations do not establish a "
    f"general speedup, controlled-host performance, isolated scalar primitive "
    f"costs, shipped binary size or closure of earlier cost gates.")
migration = (
    'Borrowed Surface::extrusion_profile_and_direction; affine '
    'WrittenSurfaceParameters::origin and emitted WrittenAdvancedFace::orientation. '
    'Native circle carriers, cap metric expressions and contained-slab output '
    'charts can change exact artifacts; all observed changes are explicitly '
    'reviewed. No compatibility shim, archive schema version, weakened policy '
    'or raised admission limit is added. General durable Boolean source lineage '
    'is not established by the empty saved selection tables in the prism fixtures.')
limits = (
    'Production work is BREP/IO plus two necessary scalar identities with '
    'reproduced BREP blockers. Other runtime owners are unchanged. The source '
    'is physical ext4 and Cargo target/cache are physical tmpfs; the bounded '
    '16-read/eight-execution storage probe does not qualify historical nested-FUSE '
    'artifacts. All 28 work packages remain open. General embedding, partial-slab '
    'and nonparallel closure, cone/torus STEP, mandatory composed provenance and '
    'certainty, total-work/heap/cancellation, clean packaged consumers/MSRV, '
    'actual C/Python/JS bindings, runtime fuzz/ASan, lexicase, coverage, formal '
    'proof and full-workspace/pre-push gates remain open. No push was performed.')
entry = dict(id='prism-continuation-2026-10-16',
             work_packages=['WP03', 'WP07', 'WP08', 'WP09', 'WP12', 'WP13', 'WP14a', 'WP21', 'WP23'],
             properties=['P1', 'P2', 'P3', 'P5', 'P6', 'P8', 'P11', 'P16', 'P17', 'P18', 'P19', 'P20', 'P24', 'P25', 'P26', 'P27', 'P35', 'P36', 'P37', 'P39'],
             change='Retain native circular extrusion, signed analytic prism orientation and replay metrics; extend directed contained-slab difference and certified common-axis continuation; encode exact linear/circular extrusion charts to STEP. Add necessary principal rational atan and half-angle scalar certificates.',
             source='../src/boolean_kernel.rs', evidence='evidence/' + OUT.name + '/manifest.json',
             decision='kept', retention_rationale=m['retention_rationale'],
             validation=validation, cost_evidence=cost, migration=migration, limits=limits)
status_path = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = read(status_path)
assert all(x['id'] != entry['id'] for x in status['increments'])
status['increments'].append(entry)
status['updated_on'] = '2026-10-16'
status['next_actions'][0] = (
    'Preserve the full 81-slot frontier, fifteen preceding workflows and newly '
    'qualified prism/STEP continuation. Promote additional native diagnostic '
    'results only with independent set/topology/composition tests. Five rational '
    'cone/torus decisions and two torus resource exhaustions remain explicit; '
    'the six partial-slab/reversed prism controls stay unsupported. Extend native '
    'arrangements and embedding evidence, not tolerances or sampled recognition. '
    'Only repair dependencies for a reproduced BREP blocker after checking upstream.')
status['next_actions'][1] = (
    'Use prism continuation as the next exact feature baseline, preserving all '
    'old receipts, reviewed migrations and adverse costs. Keep per-call conic '
    'comparison reuse and its earlier evidence. Investigate measured regressions '
    'without dropping validation or output materialization; persistent caches '
    'still require separate identity, lifetime, resource and state-matrix gates.')
status['next_actions'][13] = (
    'Preserve every historical feature/integration baseline and raw campaign. '
    'The prism increment extends exact extrusion STEP; cone/torus STEP writers '
    'remain an explicit exchange frontier. Close controlled-host, full dependency '
    'and shipped-consumer gates using their original contracts, not a successful subset.')
status['next_actions'][15] = (
    'Merge the fetched upstream format corrections at the next clean checkpoint '
    'and requalify affected consumers. Preserve typed text/distribution contracts, '
    'source qualification, structural concatenation versus union, material-set '
    'Minkowski semantics and protected-cell triangulation migrations. Native '
    'closed-PWN validation of parsed STL is not proof of manifoldness or exact '
    'analytic fidelity. Unrelated pending runtime and format defects remain '
    'upstream-owned; fresh physical builds do not repair historical storage evidence.')
status['acceptance_contract']['upstream_revision'] = m['upstream']
write(status_path, status)
ledger_path = ROOT / 'docs/properties-status.json'
ledger = read(ledger_path)
work = ledger['current_work']['hyperbrep']
work['latest_evidence'] = str((OUT / 'manifest.json').relative_to(ROOT))
work['qualification'] = validation + ' ' + cost + ' ' + migration + ' ' + limits
work['upstream_revision'] = m['upstream']
work['latest_implementation'] = entry['id']
write(ledger_path, ledger)

performance = ROOT / 'crates/hyperbrep/PERFORMANCE.md'
heading = '## Exact prism continuation (2026-10-16)'
assert heading not in performance.read_text()
text = '\n\n' + heading + '\n\n'
text += ('The [source-bound record](docs/evidence/' + OUT.name + '/README.md) '
         'retains original failures, the full preserved corpus and reviewed '
         'representation migrations.\n\n' + cost + '\n\n' + m['retention_rationale'] + '\n')
if b['over_ten_percent']:
    text += '\nEvery observed preserved-case median ratio above 10%:\n\n'
    text += '\n'.join(f"- `{r['corpus']}/{r['case']}`: {r['ratio']:.6f}." for r in b['over_ten_percent']) + '\n'
text += ('\nNew successful workflows have separate absolute costs, with exact '
         'checks and full archive/STEP materialization inside timing. A formerly '
         'failed operation is not a speedup baseline.\n\n'
         '| New workflow | Median milliseconds per iteration |\n'
         '| --- | ---: |\n')
text += ''.join(f"| `{r['corpus']}/{r['case']}` | {r['candidate_median_ns'] / 1e6:.6f} |\n"
                for r in b['costs'] if 'ratio' not in r)
text += ('\nRequested allocation bytes and process RSS do not bound retained '
         'heap or total work. Earlier archive, spline, cached-arc, pcurve and '
         'provenance timing gates remain open. All broader work-package and '
         'delivery gates remain open.\n')
performance.write_text(performance.read_text() + text)
readme = OUT / 'README.md'
text = readme.read_text()
text = text.replace('Admission is pending the complete diagnostic, cost and receipt review. This\nrecord must not be interpreted as release or work-package completion.',
                    'Retained for the exact capability and correctness extension described below.\nThis record does not establish release or work-package completion.')
text += ('\n## Final qualification and retention\n\n' + validation + '\n\n' + cost +
         '\n\n' + m['retention_rationale'] + '\n\n'
         'The [manifest](manifest.json), [receipt review](receipt-review.json), '
         '[source reconstruction](source-reconstruction.json), '
         '[lossless source overlays](source-overlays.tar.gz), '
         '[complete cost rows](benchmark-summary.json) and [final audit](audit.json) '
         'retain the source identities, raw evidence and limitations.\n')
readme.write_text(text)
print(json.dumps(dict(increment=entry['id'], frontier=frontier,
                      receipt_migrations=len(changes), open_work_packages=28)))
