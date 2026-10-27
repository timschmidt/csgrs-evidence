from pathlib import Path
import json
checkout = Path('/tmp/hypercurve-closure-circle-replay')
p = checkout / 'crates/hypercurve/src/svg.rs'
s = p.read_text()
s = s.replace('//! Auxiliary chord contacts and other generated curve carriers remain unsupported.', '''//! Chord-normal selected circles retain their center, directed frame chord,
//! nonzero signed radius, selected angular contacts and finite oriented ranges.
//! Independent incident points re-prove circle incidence and the selected half.
//! Non-cardinal transported chord directions retain checked unit-vector witnesses;
//! replay proves unit length, parallelism and orientation before retaining them.
//! Other circle frames, general contact charts and auxiliary chord contacts
//! remain unsupported.''')
s = s.replace('/// Maximum nested rational-image, similarity, chord-displacement or supporting-line point\n    /// constructions', '/// Maximum nested rational-image, similarity, chord-displacement, supporting-line point\n    /// or selected-circle frame constructions')
p.write_text(s)
p = checkout / 'crates/hypercurve/README.md'
s = p.read_text()
anchor = '  Filled-region native replay, other generated supports and sharing across'
assert anchor in s
s = s.replace(anchor, '''  Chord-normal selected circles retain their center, directed frame chord,
  signed nonzero radius, scalar or selected normal-contact parameters and finite
  oriented range. Independently supplied incident points retain their own
  definition and re-prove incidence and the selected half on replay. A transported
  oblique chord direction is checked for unit length, parallelism and orientation;
  a stored certification flag is insufficient. Construction-time tangent flags
  are not serialized. The retained relations support fresh-process splitting,
  reversal, algebraic similarities and the named region reconstruction witnesses.
  A circle frame adds one dependency level to the point-depth limit.
  Filled-region native replay, other generated supports and sharing across''')
p.write_text(s)
p = checkout / 'docs/MIGRATIONS.md'
s = p.read_text()
anchor = '- **Selected-point graph replay (2026-10-27).**'
assert anchor in s
s = s.replace(anchor, '''- **Selected-circle graph replay (2026-10-27).** Version 4 adds a chord-normal
  circle frame, scalar angular parameter, signed normal contact, finite circle
  range and independently incident point (tags 20–24). A checked chord unit
  direction (tag 25) preserves transported oblique frames; its reference retains
  the distinction between an infinite support and a finite chord. Native endpoint
  directions already reconstructed from represented coordinates keep their old
  encoding. Readers validate every unused definition, the literal signed
  displacement, circle incidence, selected half and ascending domain. No tangent
  or incidence Boolean is accepted as proof. Older readers reject the new tags;
  existing version 3 and version 4 records remain readable. Circle frames add one
  dependency level to `SvgOptions::max_point_definition_depth`. These witnesses
  cover named chord-normal frames, not all generated circle charts or filled
  region archives.

''' + anchor)
p.write_text(s)
p = checkout / 'crates/hypercurve/qualification/README.md'
s = p.read_text()
s = s.replace('Auxiliary contact records, generated circles, filled-region archives and total\nresource bounds remain unqualified.', 'Auxiliary contact records, other generated circle frames, filled-region archives\nand total resource bounds remain unqualified.')
s = s.replace('This is a line-piece witness: replay of the complete generated fillet circle\nremains open, with the original full failure retained in the evidence record.', 'This initial line-piece witness is extended by the selected-circle witnesses\nbelow; the original complete-circle failure remains in the evidence record.')
s += '''

The selected-circle graph witnesses retain a chord-normal frame and selected
angular domain without requiring independently materialized center coordinates.
The original degree-seven circular fillet replays in a separate process before
exact point location, splitting, reversal and a second archive. Algebraic
rotation/scaling and reflection preserve exact endpoints and an independently
transformed interior point, separately from full SVG determinism. Replayed
boundaries reenter the shared region arrangement, empty-set Boolean identities,
boundary reconstruction, and a mixed authored/generated fixture with a hole and
disconnected material. Changing a tangent neighbor to a transverse line must
recover both independently derived crossings in both operand orders.

Handwritten records reject wrong, forward and cross-circle references, zero
radii, invalid angular ranges, off-circle points, wrong half selections, incorrect
signed normal displacements and nonunit, nonparallel or reversed chord directions.
These checks include unused definitions. A reached circle dependency-depth or
extension-byte limit prevents publication; a larger retry succeeds. A private
unit test additionally checks consumed approximate-policy barriers.

This remains an incremental support qualification. Rational, parallel-normal
and selected-radial generated circle frames, other mapped angular contacts,
repeated-offset chart transport and filled-region archives remain open. A retained
probe with a correlated degree-seven/five fiber center imports and evaluates its
endpoints, but its exact midpoint query returns `Blocked(Ordering)`; that result
is an implementation gap, not geometric completion or resource exhaustion. The
finite witnesses and depth/byte limits do not prove universal algebraic closure,
total solver work, coefficient growth, heap bounds or cooperative cancellation.
'''
p.write_text(s)
p = checkout / 'crates/hypercurve/qualification/capabilities.json'
c = json.loads(p.read_text())
assert len(c['fixtures']) == 170
common = {
    'target': 'svg_circle_replay',
    'owner': 'Hypercurve retained chord direction and selected-circle owners; native dependency replay and shared region arrangement',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P27', 'P28', 'P29', 'P30'],
    'origins': ['authored', 'generated'], 'families': ['Line', 'CircularArc'],
    'policies': ['STRICT'], 'timeout_seconds': 300,
    'semantics': 'Version4 stroke metadata replays checked chord-normal circle frames, literal signed normal contacts or independently incident points, and finite oriented angular ranges. Retain and re-prove transported unit directions. No serialized tangency flag is authority. Named completion only: other circle frames, general mapped contacts, correlated fiber midpoint ordering, repeated-offset chart transport, filled-region replay and total resource bounds remain open. Timeout is external containment.',
}
rows = [
('circle_replay_fillet', 'selected_circular_fillet_replays_in_a_fresh_process_before_split_and_reversal',
 'Unique trim-only radius1/4 right-angle fillet translated by the positive degree-seven root beta of 2t^7-1.',
 [('exact_replay','exact_success','Fresh-process complete fillet replay, exact interior point, subdivision, reversal and a second deterministic full SVG.'),('incidence_order','exact_success','The point (beta+9/10,1/20) lies on the retained quarter circle and reenters exact evaluation and splitting.')],
 'Independent radius, endpoints and rational circle point with radial components (3/5,-4/5); no sampled geometry supplies incidence.'),
('circle_replay_region','replayed_fillet_reenters_region_boolean_and_boundary_reconstruction',
 'A closed square with one selected circular fillet, saved as an exact boundary path and re-admitted under NonZero fill.',
 [('region_admission','exact_success','Retain one material loop and independently derived inside/outside/boundary classifications.'),('booleans','exact_success','Empty union, difference, xor and intersection identities; exact self-difference after replay and reconstruction.'),('restriction_reconstruction','exact_success','Boundary extraction, another archive, and re-admission retain mutual empty differences.')],
 'Analytic quarter-circle equation, exact boundary point, loop roles and both directed set differences after reconstruction.'),
('circle_replay_changed_neighbor','changed_neighbors_replay_both_crossings_without_inheriting_tangency',
 'Replace the original tangent by a line of slope1/2 through the original selected endpoint; a second contact lies in the arc interior.',
 [('incidence_order','exact_success','Both operand orders return exactly two complete transverse contacts with no overlap.')],
 'Direct line substitution in the circle equation gives the endpoint and (beta+19/20,1/10); original tangent flags cannot suppress the second root.'),
('circle_replay_mixed_region','mixed_generated_circle_replay_preserves_holes_and_disconnected_material',
 'A selected filleted boundary, selected rectangular hole and disconnected authored native circle.',
 [('exact_replay','exact_success','Reassemble native wires and selected paths without display chords.'),('region_admission','exact_success','NonZero fill retains two material loops and one hole, with independent interior/exterior points.'),('booleans','exact_success','Empty union, self-difference, self-xor and boundary reconstruction retain the declared topology.')],
 'Independent rectangle and circle geometry, material/hole counts and exact Boolean empty identities.'),
('circle_replay_similarity','algebraic_similarity_and_reflection_keep_selected_circle_replay',
 'A degree-seven selected fillet under a rotation/scaling with sqrt(2) matrix entries and a reflected algebraic similarity.',
 [('exact_replay','exact_success','Preserve full SVG bytes after replay, including transported chord-frame directions.'),('incidence_order','exact_success','Every transformed endpoint matches and an independently transformed interior point remains on the arc.')],
 'Exact similarity applied independently to the original circle point; semantic equality is separate from complete document determinism.'),
('circle_replay_invalid_references','unused_circle_records_reject_wrong_typed_forward_and_cross_circle_references',
 'Unused raw frame, parameter, point, unit-direction and range definitions with wrong/self/forward references or a parameter from another circle.',
 [('exact_replay','invalid','Reject every malformed reference before publishing an empty final path.')],
 'Typed MalformedInput for deliberately invalid dependency identities and record kinds.'),
('circle_replay_unit_direction','chord_unit_direction_replay_checks_length_parallelism_and_orientation',
 'A 3-4-5 oblique circle frame and raw zero, nonunit, perpendicular and reversed direction witnesses.',
 [('exact_replay','exact_success','Re-prove and retain the oblique unit direction, its exact semicircle endpoints and deterministic replay.'),('exact_replay','invalid','Invalid directions cannot be accepted even when unused.')],
 'Independent unit tangent (3/5,4/5), its left normal and opposite endpoint; exact length and orientation counterexamples.'),
('circle_replay_normal_contact','chord_normal_contact_records_reprove_the_displacement_relation',
 'A right-half unit circle with a vertical normal-frame source; correct and incorrect signed contact recipes.',
 [('exact_replay','exact_success','The literal negative unit left normal selects (1,0).'),('exact_replay','invalid','Wrong direction, point, distance or signed side is proved Invalid rather than accepted or relabeled undecided.')],
 'Exact equation P=C+dN, unit circle radius and selected right half; no serialized incidence flag.'),
('circle_replay_point_location','retained_circle_point_queries_clip_the_arc_and_distinguish_nearby_points',
 'The selected quarter-circle endpoints, center, on-support points outside the arc and an independent point displaced by 2^-80.',
 [('incidence_order','exact_success','Both endpoints reenter evaluation; exterior and near-but-distinct points have no locations.')],
 'Independent exact circle equation, retained angular domain and nonzero rational displacement.'),
('circle_replay_domain_validation','replay_reproves_radius_incidence_selected_half_and_ascending_domain',
 'Raw zero-radius frames, angular endpoints outside [0,1], equal/reversed ranges and incident selectors on the wrong half or off support.',
 [('exact_replay','invalid','Reject invalid unused radius, range and selector definitions.'),('exact_replay','exact_success','Valid scalar and independently incident selectors retain exact unit-circle endpoints.')],
 'Known unit-circle coordinates and angular domain inequalities, independent of the SVG display path.'),
('circle_replay_resource_retry','circle_dependency_depth_is_reached_before_publication_and_retry_succeeds',
 'One selected-circle frame with leaf point dependencies, depth limits0/1 and a 64-byte extension budget.',
 [('exact_replay','exhausted','The configured dependency-depth and byte limits are actually reached during import and export.'),('exact_replay','exact_success','Larger retries recover deterministic full SVG without cached failure.')],
 'Explicit one-level dependency graph and encoded byte size; typed SizeOverflow is separate from unsupported geometry and solver budgets.'),
]
assert len(rows) == 11
for ident, test, domain, claims, oracle in rows:
    assert 'fn ' + test + '(' in (checkout / 'crates/hypercurve/tests/svg_circle_replay.rs').read_text(), test
    c['fixtures'].append({**common, 'id': ident, 'test': test, 'domain': domain,
                          'claims': [{'stage': stage, 'outcome': outcome, 'assertion': assertion} for stage, outcome, assertion in claims], 'oracle': oracle})
c['unqualified_targets'][1] = 'Native save/reload of generated supports and filled regions beyond authored-source restrictions, procedural parallels, selected chords, named point definitions and the demonstrated chord-normal circle frames; correlated-fiber midpoint ordering and general angular transports remain open.'
p.write_text(json.dumps(c, indent=2) + '\n')
