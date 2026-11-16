from pathlib import Path
import csv, hashlib, io, json, re, subprocess

stage = Path(__file__).parent
repo = Path('/mnt/development/interval-profile-static/csgrs')
firmware = repo.parent / 'alumina-firmware'
revision = '2d68e82b7341db7b747b20e4ad1455a4c1113a00'
assert subprocess.check_output(['git', '-C', str(firmware), 'rev-parse', 'HEAD']).decode().strip() == revision
original = subprocess.check_output(['git', '-C', str(repo), 'show', '71b3e06b651fd91e6f3e56ea2ee80063c6b86a58:interval-inventory.tsv'])
(stage / 'inventory-before.tsv').write_bytes(original)
rows = list(csv.DictReader(io.StringIO(original.decode()), delimiter='\t'))
fields = list(rows[0])
# representation, semantics, retained role / migration, selected immediate consumer
roles = {
 'expand_unit_interval': ('Q30 bounds widened in i64', 'outward error expansion intersected with independently known sine/cosine range [-1,1]', 'retain analytic range/error proof; generic expansion remains a delegation candidate', 'angle::rotation_from_estimate'),
 'widen_interval': ('Q30 bounds and nonnegative Q30 error', 'symmetric outward expansion; reject negative error and endpoint overflow', 'retain calibration policy; generic expansion remains a delegation candidate', 'TwoShuntCurrentCalibration::derive_phases'),
 'interval_within_limit': ('Q30 bounds and symmetric Q30 limit', 'full-enclosure containment; negative or unnegatable limit rejects', 'retain physical current limit admission', 'current calibration validation and derive_phases'),
 'position_interval': ('checked i128 products/quotients; i64 Q31.32 endpoints', 'encoder count uncertainty mapped to configured position units with directed rounding', 'retain units/reference/count evidence; quotient/scalar-image delegation remains open', 'ServoEncoderEstimator::new and observe_inner'),
 'velocity_interval': ('checked i128 products/quotients; i32 Q2.30 endpoints', 'two-sample count uncertainty and model error mapped to normalized velocity', 'retain cadence/model/range evidence; quotient/scalar-image delegation remains open', 'ServoEncoderEstimator::observe_inner'),
 'Q30Interval': ('two private i32 Q2.30 numerators', 'nonempty ordered closed real enclosure; const construction, width and membership', 'retain public wrapper/const API; arithmetic and floor midpoint delegated to FixedInterval<i32,30>', 'Clarke/Park transforms; rotation; current calibration; servo; modulation'),
 'DqInterval': ('two Q30Interval components', 'direct/quadrature Cartesian enclosure', 'retain coordinate-domain carrier; component arithmetic owned by Q30Interval/Hyperinterval', 'Park transform and deterministic controller input'),
 'interval_max': ('two Q30Interval operands/result', 'endpointwise image of independent real max', 'generic arithmetic migration candidate; currently manual and not completed', 'space_vector_modulate'),
 'interval_min': ('two Q30Interval operands/result', 'endpointwise image of independent real min', 'generic arithmetic migration candidate; currently manual and not completed', 'space_vector_modulate'),
 'scale_wide_interval': ('i64 Q2.30 source bounds; Q30 scale; i32 output', 'widened product rounded outward once before checked narrowing', 'retain wrapper; FixedInterval<i64,30> owns multiply and conversion', 'Clarke beta component'),
 'clamp_i64_to_i32_bounds': ('i64 point; i32 Q30 clamp endpoints', 'selected controller point saturation; not interval intersection', 'retain explicit PI/anti-windup control law', 'PiController::update_error_bits'),
 'ServoPositionInterval': ('two private i64 Q31.32 numerators', 'nonempty ordered position enclosure; full u64 width and floor midpoint', 'retain units/const API; width and midpoint delegated to FixedInterval<i64,32>', 'encoder observations and outer-loop position error'),
 'ServoPositionIntervalError': ('typed enum; no endpoint storage', 'Order versus Arithmetic', 'retain domain failure vocabulary', 'ServoPosition and ServoPositionInterval checked construction'),
 'ServoPositionErrorInterval': ('two i128 Q31.32 numerators', 'exact target-minus-observation enclosure including full u64 difference', 'retain widened meaning; FixedInterval endpoints currently only i32/i64; further generic ownership review open', 'position_velocity_target'),
 'ServoQ30ErrorInterval': ('two i64 Q2.30 numerators', 'exact target-minus-observation enclosure including full u32 difference', 'retain widened domain carrier; subtraction delegated to FixedInterval<i64,30>', 'servo velocity error / controller'),
 'Q30': ('one i32 numerator over 2^30', 'exact point carrier; multiplication/division select nearest ties-even lattice point', 'retain explicit point arithmetic; not interchangeable with outward enclosures', 'Q30Interval endpoints and deterministic controller'),
 'Phase3': ('three Q30Interval components', 'phase-domain Cartesian enclosure', 'retain coordinate-domain carrier', 'current calibration, Clarke and inverse Clarke, modulation'),
 'AlphaBeta': ('two Q30Interval components', 'stationary orthogonal Cartesian enclosure', 'retain coordinate-domain carrier', 'Clarke/Park transforms and inverse transforms'),
 'Rotation': ('private sine/cosine/norm Q30Interval values', 'unit-vector enclosure validated by component and norm bounds', 'retain angle/norm evidence; component arithmetic delegates through Q30Interval', 'angle reconstruction and Park/inverse Park'),
 'Duty3': ('three Q30Interval components', 'normalized PWM duty enclosures; carrier alone does not establish admissibility', 'retain domain carrier and downstream PWM admission', 'space_vector_modulate result'),
 'ModulationResult': ('Duty3, Q30Interval common mode, Phase3', 'retained modulation outputs and common-mode/centered-phase evidence', 'retain domain result; no clipping fallback on invalid modulation', 'space_vector_modulate'),
 'ServoPosition': ('one i64 numerator over 2^32', 'exact point in configuration-defined position units', 'retain unit-bearing point and checked addition', 'ServoPositionInterval and encoder reference position'),
}
tests = {
 'pi_and_factorial_intervals_have_integer_certificates': ('i128 scaled rational bounds and integer products', 'independent Machin/factorial/sqrt certificates for constants'),
 'atan_reciprocal_bounds': ('i128 rational terms scaled by 2^96', 'test-only alternating-series oracle with bounded remainder for the fixed tested arguments'),
 'complete_actor_and_prepared_transition_have_fixed_small_bounds': ('usize layout sizes', 'actor/prepared-transition storage ceilings; not numerical interval arithmetic'),
 'forward_wrap_produces_outward_position_and_velocity_intervals': ('encoder counts; Q31.32/Q30 expected bounds', 'forward-wrap selected count and outward position/velocity regression'),
 'non_power_of_two_negative_position_and_velocity_bounds_are_outward': ('i128 independent cross products', 'negative non-power-of-two scaling and exact endpoint inequalities'),
 'precision_and_range_policies_fail_before_state_advances': ('encoder state and typed errors', 'failed width/range policy preserves sequence and unwrapped count'),
 'interval_arithmetic_is_outward_and_division_rejects_zero': ('Q30 endpoints and typed errors', 'outward arithmetic and zero-containing divisor rejection'),
 'transform_constant_intervals_have_integer_certificates': ('i128 exact squared products', 'independent integer certificates for transform constants'),
 'min_max_modulation_contains_known_duties_and_rejects_overrange': ('Q30 duty enclosures and typed errors', 'known-duty containment and out-of-range rejection'),
 'range_pulse_and_quantization_policies_fail_closed': ('duty/compare bounds and PWM errors', 'PWM range, pulse-width and quantization policy rejection'),
 'q31_32_intervals_preserve_extreme_width_and_midpoint': ('i64 position endpoints; u64 width', 'full-range width, floor midpoint, and wide target difference'),
}
added = {'Q30':'lib.rs', 'Phase3':'lib.rs', 'AlphaBeta':'lib.rs', 'Rotation':'lib.rs', 'Duty3':'lib.rs', 'ModulationResult':'lib.rs', 'ServoPosition':'servo.rs'}
selected = [r for r in rows if r['repository']=='alumina-firmware' and r['path'].startswith('crates/alumina-foc/')]
assert len(selected)==27
for name, file in added.items():
 r = dict.fromkeys(fields, '')
 r.update(repository='alumina-firmware', path='crates/alumina-foc/src/'+file, symbol=name, kind='struct', visibility='pub', owner='alumina-foc')
 rows.append(r); selected.append(r)
locators=[]
for r in selected:
 name=r['symbol']; source=(firmware/r['path']).read_text()
 matches=list(re.finditer(r'^\s*(?:pub(?:\([^)]*\))?\s+)?(?:const\s+)?'+r['kind']+r'\s+'+re.escape(name)+r'\b',source,re.M))
 if name=='ratio_bounds':
  assert not matches
  r.update(line='0', endpoint_representation='removed helper; historical i128 ratio bounds', semantics='retired generic directed ratio helper', allocation='not present', platform='not present', serialization='not present', consumers='former Q30Interval ratio/arithmetic paths', disposition='removed by 953ed4b7e8059288abe5146cfd68400f0961587e; Q30 arithmetic delegates to Hyperinterval', review_status='retired symbol verified absent at firmware 2d68e82b7; line 0 denotes absence')
 else:
  assert len(matches)==1, (name,len(matches))
  # Count from the first nonblank declaration line, not leading regex whitespace.
  start=matches[0].start()
  while source[start].isspace(): start+=1
  r['line']=str(source.count('\n',0,start)+1)
  r.update(allocation='fixed primitive storage; reviewed production path has no heap allocation', platform='no_std; Rust 1.88; Hyperinterval fixed feature; no arbitrary precision', serialization='no direct serde/native codec; Q30 bounds also occur in explicit configuration wire fields', review_status='body audited at firmware 2d68e82b7; selected callers only; see firmware-foc-interval-audit.md')
  if name in tests:
   rep,sem=tests[name]
   r.update(endpoint_representation=rep, semantics=sem, allocation='test-only fixed values; not a production allocation measurement', platform='native cfg(test) harness', serialization='none; test/oracle', consumers='alumina-foc test harness', disposition='retain independent test/oracle or layout gate; not a production kernel migration')
  else:
   rep,sem,disp,cons=roles[name]
   r.update(endpoint_representation=rep, semantics=sem, disposition=disp, consumers=cons)
  if name=='ServoPositionIntervalError': r['serialization']='no direct serde/native codec on this error type'
 r.update(baseline_tests='current 2d68e82:86 FOC unit +2 q30_contract tests pass within602 firmware tests/doctests; evidence c390ef8e firmware-interval-inventory', baseline_benchmarks='no new timing/size/allocation claim; remaining arithmetic migrations require identical-contract owner/target cost gates and HIL')
 locators.append({'path':r['path'],'symbol':name,'kind':r['kind'],'line':int(r['line']),'source_sha256':hashlib.sha256(source.encode()).hexdigest()})
out=io.StringIO(); writer=csv.DictWriter(out,fieldnames=fields,delimiter='\t',lineterminator='\n'); writer.writeheader();writer.writerows(rows)
(repo/'interval-inventory.tsv').write_text(out.getvalue())
(stage/'locators.json').write_text(json.dumps(locators,indent=2)+'\n')
print(json.dumps({'original_rows':1525,'updated':27,'added':7,'result_rows':len(rows),'categories_original':{'production_support':15,'test_oracle_layout':11,'retired':1}}))
