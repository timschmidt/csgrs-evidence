from pathlib import Path
import json
p=Path('/tmp/hypercurve-closure-chord-replay/crates/hypercurve/qualification/capabilities.json')
d=json.loads(p.read_text())
assert len(d['fixtures'])==151
semantics='Version4 stroke metadata retains selected straight supports, validated coordinate charts, directed endpoints and shared prior point/source/root dependencies. Strict native constructors re-establish definitions, support incidence and order; display vertices never replace the exact object. This increment covers coordinate, rational-source, rational-expression and native parallel points with Bezier scalar/root selectors. Recursive point definitions, selected joint fibers, auxiliary chord contacts, generated circles, filled-region archives, cross-path sharing and total resource bounds remain open. The timeout is external containment.'
def claim(stage,assertion,outcome='exact_success'):
 return {'stage':stage,'outcome':outcome,'assertion':assertion}
def add(id,test,domain,families,claims,oracle):
 d['fixtures'].append({'id':id,'target':'svg_chord_replay','test':test,'owner':'Hypercurve selected chord/point definitions, exact SVG graph and finite projection','properties':['P15','P18','P19','P20','P27','P28','P29','P30'],'domain':domain,'origins':['authored','generated'],'families':families,'policies':['STRICT'],'semantics':semantics,'claims':claims,'oracle':oracle,'timeout_seconds':300})
add('chord_replay_fresh_process','selected_chord_split_replays_in_a_fresh_process_before_further_incidence',
 'A vertical chord at beta, the root of 2t^7-1 in (3/4,1), with y endpoints0 and2, split at y=1 and followed by its reversed whole support.', ['Line','RationalBezier'],[
 claim('exact_replay','A child process reloads the native archive and preserves the selected root, exact endpoint relations and complete deterministic SVG output.'),
 claim('incidence_order','The first subchord overlaps the reversed whole support; the midpoint has one exact location on that reversed support.'),
 claim('restriction_reconstruction','The reloaded reversed chord splits at y=1 and survives another archive with directed endpoints y=2 and0.')],
 'The defining degree-seven root and exact vertical-line coordinates are independent of SVG display; overlap and split endpoints establish the named retained portions. The child process has no original live caches.')
add('chord_replay_algebraic_region','algebraic_coordinate_chords_replay_before_region_boolean_and_offset',
 'Four generated chords bound the rectangle x in[sqrt(2),sqrt(2)+1],y in[0,2], followed by native replay, NonZero admission and round offset1/8.', ['Line'],[
 claim('exact_replay','All four exact authored coordinate endpoints survive as generated chord definitions.'),
 claim('region_admission','NonZero reconstruction admits the rectangle and distinguishes the explicitly specified inside/outside points.'),
 claim('booleans','The rectangle and its offset each produce canonical empty self-difference.','successful_empty'),
 claim('offsets','A round offset1/8 completes and contains the specified original interior point.')],
 'Independent radical endpoint coordinates and specified membership expectations, plus regularized self-difference identities; these finite assertions alone do not establish the entire offset set.')
add('chord_replay_chart_extension','replay_retains_a_valid_alternative_chart_and_exterior_support_range',
 'A hand-encoded root support(0,0)->(2,1) uses its y chart; a decreasing selected range(6,3)->(4,2) lies outside that finite support witness.', ['Line'],[
 claim('exact_replay','Decoded endpoints equal the independently supplied coordinates and re-encoded metadata equals the hand-built canonical graph.'),
 claim('restriction_reconstruction','The valid y chart and reversed exterior range are retained rather than silently reselected using the constructor x-chart heuristic.')],
 'Hand-built wire records, exact collinearity y=x/2, directed coordinates and separately asserted native metadata identity.')
add('chord_replay_invalid_support','invalid_chord_definitions_are_checked_before_an_empty_final_path',
 'Hand-encoded empty final paths containing a constant axis, incorrect coordinate direction, equal or reversed selected endpoints, an off-support point, and wrong-type/self/forward/missing support references.', ['Line'],[
 claim('exact_replay','Invalid geometric charts/domains produce ExactCurveError::Invalid; malformed references produce MalformedInput before an empty path can conceal them.','invalid')],
 'Explicit coordinate order and line-incidence violations, with independently assembled reference indices and assertions of the public failure categories.')
add('chord_replay_correlated_point','correlated_rational_expression_endpoints_replay_their_shared_selected_root',
 'For beta the degree-seven root of2t^7-1, endpoints use x=beta/(1+beta),y=beta^2/(1+beta)+k with k=0,1; a selected midpoint uses k=1/2.', ['Line','RationalBezier'],[
 claim('exact_replay','Replay retains the numerator/denominator coefficient arrays, shared selected root and deterministic complete SVG.'),
 claim('incidence_order','The independently defined rational-expression midpoint has exactly one location on the replayed chord.'),
 claim('restriction_reconstruction','The chord splits at that midpoint and the retained pieces survive another native archive.')],
 'Literal defining rational expressions over one selected root; exact midpoint incidence is independent of emitted SVG display.')
add('chord_replay_parallel_endpoint','a_parallel_endpoint_and_its_incident_chord_replay_one_source_and_selector',
 'C(t)=(t,t^2) with signed left offset-1/4 on[0,beta], beta the root of2t^2-1 in(1/2,3/4), followed by an incident chord to(2,0). Both a lazy curve endpoint and a standalone checked parallel point are exercised.', ['Line','QuadraticBezier','AnalyticParallel'],[
 claim('representation','The replayed chord endpoint shares the parallel source/distance and retains beta as its selector.'),
 claim('incidence_order','The joint equals (t+t/(2sqrt(3)),1/2-1/(4sqrt(3))) with t=sqrt(1/2), coincides with the source endpoint and has exactly one chord location.'),
 claim('exact_replay','Complete SVG output remains identical after the exact incidence queries, including display vertices, for both endpoint forms.')],
 'Independently derived normal-offset coordinates and exact incidence; pointer assertions concern shared storage only. Full serialization equality separately detects cache-dependent display changes.')
add('chord_replay_sharing_retry','shared_chord_dependencies_stay_compact_and_byte_exhaustion_recovers',
 'A degree-seven selected vertical chord repeated4,8 and16 times with alternating traversal, plus import/export with a64-byte native-extension limit and larger retries.', ['Line','RationalBezier'],[
 claim('representation','Decoded endpoint roots share one retained polynomial; metadata growth for the named piece counts is linear and bounded by the explicit per-piece assertion.'),
 claim('resource_recovery','Both export and import reach the declared64-byte limit and report SizeOverflow.','exhausted'),
 claim('resource_recovery','A default-budget retry succeeds with the original exact selected endpoint.')],
 'Known selected-root identity, measured metadata lengths for three exact repeated-piece cases, actual configured byte-limit failures and an exact endpoint after retry. No general performance or memory bound is inferred.')
add('chord_replay_invalid_points','selected_point_records_reject_wrong_references_and_original_denominator_poles',
 'An empty final path with wrong-type curve-endpoint, rational-source, parameter and parallel references, a forward point source and a rational expression whose original denominator is zero.', ['Line','RationalBezier','AnalyticParallel'],[
 claim('exact_replay','Bad typed references are MalformedInput; the original denominator pole is ExactCurveError::Invalid even when its point is unused.','invalid')],
 'Independently assembled wire types and a literal zero denominator; no successful empty result can conceal these failures.')
add('chord_replay_mixed_topology','mixed_replay_preserves_a_hole_and_disconnected_material_through_operations',
 'At x origin sqrt(2), a mixed native/generated square[-3,3]^2 surrounds a clockwise unit circular hole; a separate generated rectangle[6,8]x[-1,1] supplies disconnected material. Replay precedes NonZero reconstruction and round offset1/4.', ['Line','CircularArc'],[
 claim('exact_replay','Every directed endpoint and native/generated representation choice survives, with complete deterministic SVG after further queries.'),
 claim('region_admission','The reconstructed region has two material loops, one owned hole and the specified exact inside/outside/boundary point locations.'),
 claim('restriction_reconstruction','Boundary paths reconstruct a region with empty symmetric difference from the replayed region.'),
 claim('booleans','Canonical empty self-difference/xor is consumed by union with the region and preserves its two material loops and one hole.','successful_empty'),
 claim('offsets','Round expansion1/4 retains the material/hole counts and has a hole boundary at radius3/4, with the explicitly tested inner and outer point locations.')],
 'Independently authored rectangle and circle coordinates, exact endpoints, winding/ownership invariants, regularized set identities and the specified offset radius. Finite point tests do not alone prove the entire offset set.')
d['unqualified_targets'][1]='Native save/reload of generated supports and filled regions beyond the authored-source restriction, procedural-parallel and named selected-chord witnesses.'
assert len(d['fixtures'])==160
p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n')
