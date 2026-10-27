from pathlib import Path
import json
checkout=Path('/tmp/hypercurve-closure-point-replay')
p=checkout/'crates/hypercurve/src/svg.rs'; s=p.read_text(); old='''//! Replay rechecks point definitions, support incidence and strict chart order.
//! Other selected point definitions and auxiliary chord contacts remain unsupported.'''; new='''//! Polynomial fibers retain the base parameter, equation and singleton selector.
//! Rational images retain original denominator guards; similarities and unique
//! supporting-line intersections retain their checked point dependencies.
//! Replay rechecks point definitions, support incidence and strict chart order.
//! Auxiliary chord contacts and other generated curve carriers remain unsupported.
//! Chord displacements retain their selected source, origin, signed normal or
//! tangent displacement and translation, sharing one recipe for paired endpoints.
//! Point-definition nesting and extension bytes have separate configurable limits;
//! neither is a total arithmetic-work, memory or cancellation bound.'''; assert old in s; s=s.replace(old,new).replace('/// A configured finite projection or sampling bound was exceeded.','/// A configured projection, extension-byte or point-definition-depth bound was exceeded.'); p.write_text(s)
p=checkout/'crates/hypercurve/README.md'; s=p.read_text(); s=s.replace('  incidence and chart order, including for unused records. Recursive point\n  definitions, selected joint fibers and auxiliary chord contacts remain open.', '  incidence and chart order, including for unused records. Auxiliary chord\n  contacts and general joint-parameter charts remain open.'); anchor='  Filled-region native replay, other generated supports and sharing across'; idx=s.index(anchor); s=s[:idx]+'''  Point dependencies also retain polynomial fibers, rational maps, exact
  similarities and unique supporting-line intersections. Replay validates fiber
  selectors and optional exact-root witnesses, original denominator guards and
  line uniqueness. These points need no independently materialized scalar
  coordinates. Chord displacements retain the actual selected source, normal or
  tangent direction, signed distance, optional origin and exact translation;
  paired endpoints share one replayed recipe. `SvgOptions::max_point_definition_depth` defaults to 256 and
  counts nested map, similarity, displacement and supporting-line point definitions; leaves
  have depth zero. Endpoint and chord references carry their dependency depth.
  Reached depth limits return `SvgError::SizeOverflow` before publishing a path;
  callers may retry with a larger limit. This limit and extension bytes do not
  bound total arithmetic, coefficient growth, retained memory or cancellation.
'''+s[idx:]; p.write_text(s)
p=checkout/'docs/MIGRATIONS.md'; s=p.read_text(); anchor='- **Selected-chord SVG replay (2026-10-27).**'; idx=s.index(anchor); s=s[:idx]+'''- **Selected-point graph replay (2026-10-27).** Version 4 metadata adds
  polynomial-fiber, rational-image, similarity, supporting-line-intersection
  and shared chord-displacement point records (tags 14–19). Existing version 3 and version 4 records remain
  readable; older readers reject the new tags. Authored version 3 encoding is
  unchanged. Shared rational-map prefixes are encoded once per path. Check
  geometric equality separately when updating deterministic output expectations.
  `SvgOptions` adds `max_point_definition_depth` with default 256; complete Rust
  struct literals must set it or use `..SvgOptions::default()`. The new
  `CurvePointDefinition2::ChordDisplacement` variant requires exhaustive enum
  matches to add an arm. Zero allows leaf
  point definitions. The limit counts map, similarity, displacement and intersection nesting
  in the input graph, including dependencies reached through curve endpoints,
  even when a constructor can simplify the resulting point. It does not bound
  total arithmetic work, coefficient growth, heap use or cancellation.
'''+s[idx:]; p.write_text(s)
p=checkout/'crates/hypercurve/qualification/README.md'; s=p.read_text(); old='''Recursive point definitions, joint fibers, auxiliary contact records, generated
circles, filled-region archives and total resource bounds remain unqualified.'''; new='''The additional point-graph witnesses below extend that initial point vocabulary.
Auxiliary contact records, generated circles, filled-region archives and total
resource bounds remain unqualified.

The point-graph SVG witnesses encode polynomial fibers, rational images,
similarities and supporting-line intersections as prior validated dependencies.
The original degree-seven fillet yields a trimmed line whose selected contact
replays in another process before a further exact split and another archive.
This is a line-piece witness: replay of the complete generated fillet circle
remains open, with the original full failure retained in the evidence record.
Other witnesses retain a correlated cubic fiber over a quadratic base, an
original rational denominator, an algebraic reflection and independently
selected degree-seven/degree-five line supports with exterior intersections.
Defining relations and exact point queries are checked separately from complete
SVG determinism. Invalid references, multiple or missing fiber roots, false
exact-root witnesses, nonsimilar matrices, degenerate or parallel line pairs
and original poles are rejected even for an empty final path.

The point-definition depth limit is separate from extension bytes. A raw graph
with 300 nested similarities checks the default limit and a larger retry; an
endpoint/chord indirection cannot reset depth. Rational-map chains exercise
export limits and recovery. The 4/8/16-span prefix fixture checks linear native
record growth and byte exhaustion/retry. These checks do not bound solver work,
existing native prefix-vector allocations, scalar expression trees or total
memory. Chord-displacement witnesses additionally check signed tangent and normal
distances, arbitrary origins, exact translations, reversed sources, paired
endpoint sharing and malformed recipe references. Joint point definitions are distinct from general joint parameter
charts, whose interchange is still unsupported.'''; assert old in s; s=s.replace(old,new); p.write_text(s)
p=checkout/'crates/hypercurve/qualification/capabilities.json'; c=json.loads(p.read_text()); assert len(c['fixtures'])==160
common={
 'target':'svg_point_replay', 'owner':'Hypercurve selected point owners and native SVG dependency graph',
 'properties':['P15','P18','P19','P20','P27','P28','P29','P30'],
 'origins':['authored','generated','selected_implicit'], 'families':['Line','RationalBezier','ImplicitPolynomial'],
 'policies':['STRICT'],
 'semantics':'Version4 stroke metadata replays prior validated point dependencies through existing strict constructors. Polynomial fibers retain their base and singleton selector; rational maps retain original poles; similarities and line intersections re-establish their construction. Depth and byte limits are separate. No claim of generated-circle, general joint-parameter or filled-region replay, complete algebraic closure, total work or heap bounds; timeout is external containment.',
 'timeout_seconds':300,
}
rows=[
('point_replay_fillet_contact','a_fillet_trimmed_line_replays_in_a_fresh_process_before_further_split','The first line retained by the unique trim-only radius1/4 fillet of a right-angle path translated by the degree-seven root of 2t^7-1.', [('exact_replay','exact_success','A child process replays the line with its selected supporting-line intersection endpoint, then reproduces complete SVG bytes.'),('restriction_reconstruction','exact_success','Locate the exact midpoint, split, replay again and retain the independently derived cut at beta+3/4.')], 'The degree-seven defining root, exact rational chord setback and independently formed midpoint; the complete generated circle remains outside this witness.'),
('point_replay_fiber_map_similarity','polynomial_fibers_maps_and_algebraic_similarities_keep_their_defining_relations','Selected alpha^2=2, beta^3=alpha with positive isolators; map (alpha,beta)/(1+beta), followed by an algebraic reflection and translation.', [('exact_replay','exact_success','Retain both defining relations, the original rational map and similarity under strict/approximate/strict caller transitions; full SVG bytes agree.'),('incidence_order','exact_success','The inverse rational map returns the original correlated point, the similarity retains the mapped source, and reversal retains endpoints.')], 'Polynomial residuals are exactly zero and the inverse rational map recovers the original selected fiber, independently of finite projection.'),
('point_replay_independent_intersection','intersections_keep_independent_selected_supports_and_exterior_parameters','A vertical line at a degree-seven selected root and horizontal line at an independent degree-five selected root; their crossing lies outside both finite witnesses.', [('exact_replay','exact_success','Retain both finite support witnesses and exact selected coordinates, and reproduce complete SVG bytes.'),('incidence_order','exact_success','Both coordinate forms equal their independent selected roots without requiring Real coordinates.')], 'Independent degree-seven and degree-five root definitions and exact retained support endpoint comparisons.'),
('point_replay_invalid_nodes','new_point_records_reject_wrong_typed_forward_and_self_references','Handwritten unused point definitions with wrong, self or forward references; nonsimilar/singular matrices; degenerate, coincident and parallel line pairs.', [('exact_replay','invalid','Reject malformed references and invalid constructions before accepting an empty final path.')], 'Typed MalformedInput versus Exact Invalid assertions for known bad references and algebraically invalid matrices/line pairs.'),
('point_replay_fiber_selectors','polynomial_fiber_replay_proves_the_selector_and_exact_root_witness','y^2-2 at x=0 with singleton, multiple, empty, reversed and false-exact selectors; a linear fiber with an exact point interval.', [('exact_replay','exact_success','The valid selector gives (0,sqrt(2)); a valid exact point-interval witness is admitted.'),('exact_replay','invalid','Multiple or absent roots, reversed bounds and a forged exact root cannot become empty success.')], 'Independent positive sqrt(2) coordinates and known root counts/equation residuals; no serialized trusted count.'),
('point_replay_original_poles','original_rational_map_poles_are_checked_on_the_selected_fiber','A selected sqrt(2) fiber mapped through denominators y^2-2 or zero, including removable 0/0, followed by a valid translation.', [('exact_replay','invalid','Original poles retain ZeroRationalPointDenominator even when numerator factors could cancel.'),('exact_replay','exact_success','The non-pole translation replays to (1,sqrt(2)).')], 'The original defining polynomial vanishes at the selector; valid output has independently expressed exact coordinates.'),
('point_replay_depth_retry','point_depth_limits_cover_endpoint_indirection_and_retry_without_cached_failure','An endpoint/chord dependency bridge, 300 raw nested similarity definitions and eight/nine rational map prefixes.', [('exact_replay','exhausted','Configured point-depth limits reject import and export before path publication, including endpoint indirection.'),('exact_replay','exact_success','Larger retries succeed, mapped paths reproduce full SVG bytes and depth zero admits a leaf.')], 'Derived graph depth, distinct SizeOverflow label and exact larger-retry/determinism assertions; canonicalized similarities do not reset raw input depth.'),
('point_replay_prefix_sharing','shared_rational_map_prefixes_stay_linear_and_byte_exhaustion_recovers','4/8/16 consecutive line spans between shared rational-map prefixes of one correlated polynomial point.', [('exact_replay','exact_success','Record counts obey the published linear ceiling; import/re-export preserves full bytes.'),('exact_replay','exhausted','64-byte budgets reject import/export, then larger retries reproduce the original document.')], 'Count native definition records independently of draw commands; require <=4n+8 records and consecutive doubling bound. This is a serialization-growth assertion, not a timing or total-memory claim.'),
]
rows.extend([
('point_replay_chord_displacement','chord_displacements_preserve_direction_origin_translation_and_source','A degree-seven selected 3-4-5 direction with both normal/tangent conventions, positive/negative distances, reversed traversal, optional arbitrary origins and rational translations.', [('exact_replay','exact_success','Replay every named displacement and retain source, origin, distance, translation and direction; complete SVG bytes agree.'),('incidence_order','exact_success','Each endpoint equals the independently derived signed unit-direction formula in its original selected parameter.')], 'The exact 3-4-5 unit tangent and left normal, explicitly adjusted for source reversal and origin selection; no coordinate fitting.'),
('point_replay_displacement_sharing','displacement_recipes_validate_references_and_share_endpoint_selections','One displacement recipe over a retained 3-4-5 chord, its two endpoint selections, malformed source/origin/recipe references and a depth-zero budget.', [('exact_replay','exact_success','Two displaced endpoints share one recipe; nine native records replay to independently expressed rational endpoints with full SVG determinism.'),('exact_replay','invalid','Wrong/self/forward source, origin and recipe references are rejected even with no final path.'),('exact_replay','exhausted','A depth-zero budget rejects the displacement; default settings replay it successfully.')], 'Exact rational endpoint coordinates, the explicit nine-record shared graph and distinct malformed versus depth-limit errors.'),
])
for ident,test,domain,claims,oracle in rows:
 row={**common,'id':ident,'test':test,'domain':domain,'claims':[{'stage':stage,'outcome':outcome,'assertion':assertion} for stage,outcome,assertion in claims],'oracle':oracle}
 if ident=='point_replay_fiber_map_similarity': row['policies']=['STRICT','APPROXIMATE_512']
 c['fixtures'].append(row)
c['unqualified_targets'][1]='Native save/reload of generated supports and filled regions beyond authored-source restrictions, procedural parallels, selected chords and the named point-definition witnesses.'
p.write_text(json.dumps(c,indent=2)+'\n')
