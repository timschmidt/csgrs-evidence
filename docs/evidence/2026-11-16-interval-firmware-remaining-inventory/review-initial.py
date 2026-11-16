from pathlib import Path
import csv,json,re,hashlib,io
s=Path(__file__).parent;root=Path('/mnt/development/csgrs');fw=Path('/mnt/development/alumina-firmware')
original=list(csv.DictReader(io.StringIO((s/'initial-inventory.tsv').read_text()),delimiter='\t'));rows=[dict(x) for x in original];todo=json.loads((s/'remaining-declarations.json').read_text());index={(x['path'],x['symbol']):x for x in todo}
# Explicit review assignments; no classification inferred from the word range.
reviews={
'read_verified_range':('u32 offset/length; caller-owned u8 output','half-open byte window in a canonical digest-verified capability document','no heap in path; borrowed output capped by MAX_CAPABILITY_CHUNK_BYTES','alumina-service capability read dispatch; RangeSink streaming payload encoder','canonical V4 capability bytes and CapabilityRead identity/complete receipt','retain authenticated byte-stream ownership; not a closed numeric set','range validation precedes streaming; offset==length with empty output succeeds'),
'RangeSink':('u32 cursor/offset and usize written count; mutable byte slice','half-open source/destination overlap while streaming one canonical document','borrowed output; fixed counters; no heap','read_verified_range; complete-document fixture generator; ByteSink encoding','private state has no codec; emits unchanged capability bytes','retain byte-slice streaming accumulator; not a mathematical interval carrier','checked cursor/output end and exact requested byte count; overlap copying remains byte-owned'),
'validate_retained_interval':('u64 actual/requested cycle counts; bool truncated','capture duration/quality-flag consistency, not endpoint arithmetic','primitive values only; no heap','digital capture structural validator, pretrigger and posttrigger branches','private validation of canonical digital-capture evidence','retain diagnostic completeness relation; generic interval migration inapplicable','actual<=requested and truncated iff actual<requested; empty/partial evidence is not guessed'),
'validate_chunk_range':('u32 record/offset; usize chunk length; u32 configured limits','nonempty half-open waveform record chunk with bounded transfer size','primitive values only; no heap','waveform chunk encode/decode and response validation in transport owner','waveform transport offsets and canonical record identity remain authoritative','retain byte transport validation; no scalar interval carrier','reject empty/oversized chunks and records; checked offset+length; distinguish Range from conversion Length'),
'finite_difference_first_bounds':('i64 finite-difference coefficients; u32 nonzero update count; i128 extrema','exact attained extrema of discrete first differences over updates 0..count-1','fixed integer locals; at most 32 binary-search iterations for u32 domain; no heap','FiniteDifferenceSegment::validate after update_count>0 validation; summary/rate/direction admission','private tuple is consumed by canonical machine-IR validation; does not define a new codec','retain discrete-recurrence proof and vertex selection in machine-IR; not generic interval evaluation','endpoints plus neighbors of the affine second-difference sign transition; both curvature signs; no continuous-extremum substitution'),
'queue_slot_range':('u32 channel layout/capacity/index; usize returned start/end','half-open arena byte span of one typed Boolean queue slot','primitive offsets and borrowed arena; no heap','queue_slot and queue_slot_mut; slice get/get_mut recheck actual arena bounds','private derived offsets; canonical GraphIrChannel stays authoritative','retain graph arena ownership and typed bounds checks; no closed-set migration','checked multiply/add and channel extent; invalid shape distinct from arithmetic overflow'),
'StackBounds':('usize aligned bottom/top addresses','owned downward-growing stack memory extent and protected reserve; not geometric uncertainty','two fixed addresses; no heap in this carrier','same-core initializer and target watermark sampler; CPU0 linker symbols and CPU1 permanent HAL stack','private target state; exported measurements use StackWatermarkSnapshot, not raw authority','retain target provenance/alignment/interrupt ownership; do not replace with generic interval proof','alignment, top>bottom, minimum guard+reserve; volatile accesses require separate core/SP/exclusive-access proof'),
'graph:Range':('u64 minimum/maximum of strictly positive picosecond durations','host measurement hull; zero minimum means no positive sample yet','two primitive counters; enclosing parser uses std/BTreeMap/file IO','graph EdgeAnalyzer release pulse-width and release-period summaries','private accumulator feeds canonical TinyBeeGraphVcdAnalysis report; empty ranges rejected','retain distinct positive-duration domain; generic migration is optional pending cost/contract evidence','zero-width pulse rejected before observe; ordered events plus a positive completed pulse imply positive successive-rise periods'),
'pcm:Range':('Option<u64> minimum/maximum picosecond observations','host measurement hull with explicit unobserved state; zero measurements preserved','two optional primitive values; enclosing parser uses std/BTreeMap/file IO','PCM EdgeAnalyzer bclk/frame timing summaries','private accumulator; report conversion uses zero for absent measurements in explicitly supported failure-marker reports','retain report/failure semantics; generic migration is optional pending cost/contract evidence','Option accumulation preserves zero; absence-to-zero is a report contract, not exact interval arithmetic'),
}
test_roles={
'board_explorer_decoder_fails_closed_on_bounds_and_trailing_or_bad_records':'capability decoder limits, canonical record validity and complete consumption',
'verified_ranges_require_the_compiled_digest':'capability read requires the compiled identity before exposing document bytes',
'no_output_at_exact_end_is_a_complete_range':'empty byte read at document end has a complete receipt',
'incomplete_axis_wrong_range_and_wrong_digest_are_rejected':'machine configuration axis completeness, record layout and digest authority',
'overview_rejects_order_provenance_ratio_bounds_and_trailing_bytes':'resource-overview order, provenance, ratio validity and exact record length',
'waveform_configuration_record_status_and_ranges_round_trip':'waveform configuration/status/chunk codec and bounded byte-range round trips',
'finite_difference_bounds_find_the_discrete_velocity_vertex':'independent known cubic recurrence summary including interior velocity minimum',
'health_request_returns_both_stacks_and_queue_bounds':'health snapshot stack-domain freshness and queue occupancy/capacity fields',
'waveform_service_retains_exact_record_and_exposes_loss_recoverable_ranges':'simulated waveform record identity, retention and recoverable chunk delivery',
'authenticated_capability_ranges_use_the_shared_production_dispatcher':'authenticated simulator capability-byte reads use production dispatch',
'authenticated_visual_range_is_capability_bound_and_byte_exact':'authenticated visual asset reads retain capability identity and exact bytes',
'invalid_interface_echo_and_out_of_range_block_fail_closed':'mock SD initialization echo and block-address rejection',
'dma_refill_actor_bounds_turns_and_names_interrupt_fallback':'bounded DMA refill management turns and explicit interrupt fallback',
'duplicate_reordered_noncanonical_and_out_of_range_fields_reject':'canonical host HIL log field order, uniqueness, integer spelling and enum domains',
}
reviewed=[]
for row in rows:
 key=(row['path'],row['symbol'])
 if row['repository']!='alumina-firmware' or key not in index:continue
 x=index[key];row['line']=str(x['current_line']);source=(fw/row['path']).read_text();assert hashlib.sha256(source.encode()).hexdigest()==x['source_sha256']
 if x['test_attribute']:
  role=test_roles[row['symbol']];row.update(endpoint_representation='test-local fixtures; no independent production carrier',semantics='acceptance witness: '+role,allocation='host unit-test allocations; no target allocation claim',platform='host Rust test harness; target runtime is not exercised',visibility='private test',serialization='test exercises owner format; no new format or carrier',consumers='owning crate unit-test harness',disposition='retain existing assertion corpus; not a generic interval implementation',baseline_tests='existing #[test] '+row['symbol']+'; declaration/purpose inspected; no new execution claimed except machine-IR and xtask commands recorded in this audit',baseline_benchmarks='not a benchmark; no runtime performance claim',review_status='test role and declaration reviewed at firmware 7e0d5a4; see firmware-remaining-interval-audit.md')
 else:
  name=row['symbol']
  if name=='Range':name=('graph:' if 'graph_vcd' in row['path'] else 'pcm:')+name
  endpoints,semantics,allocation,consumers,serialization,disposition,invariant=reviews[name]
  row.update(endpoint_representation=endpoints,semantics=semantics,allocation=allocation,platform=('host std xtask; no firmware dependency added' if row['path'].startswith('xtask/') else 'Xtensa no_std target driver; no HIL execution claimed' if name=='StackBounds' else 'portable no_std owner; Rust1.88 workspace minimum'),visibility='pub' if name=='read_verified_range' else 'private',serialization=serialization,consumers=consumers,disposition=disposition,baseline_tests=('qualification-only recurrence oracle:21952cases/362208points on Rust1.88 and1.95; existing23machine-IR tests' if name=='finite_difference_first_bounds' else 'existing xtask tests rerun on Rust1.88; no physical capture/HIL execution' if name.endswith(':Range') else 'existing owner fixtures located; no new execution or hardware claim in this audit'),baseline_benchmarks='no implementation change; no new cost claim; hardware/whole-call stack obligations remain separate',review_status='body and selected callers reviewed at firmware 7e0d5a4; '+invariant+'; see firmware-remaining-interval-audit.md')
 reviewed.append(dict(row,source_sha256=x['source_sha256'],is_test=x['test_attribute']))
assert len(reviewed)==23
assert sum(x['is_test'] for x in reviewed)==14
assert len(rows)==len(original)==1532
for a,b in zip(original,rows):
 if (a['path'],a['symbol']) not in index or a['repository']!='alumina-firmware':assert a==b
assert sum(a!=b for a,b in zip(original,rows))==23
for row in reviewed:
 assert not any('requires ' in row[k] or 'not yet audited' in row[k] for k in ['endpoint_representation','semantics','allocation','platform','serialization','consumers','baseline_tests','baseline_benchmarks','review_status'])
with (root/'interval-inventory.tsv').open('w',newline='') as f:
 w=csv.DictWriter(f,fieldnames=list(original[0]),delimiter='\t',lineterminator='\n');w.writeheader();w.writerows(rows)
(s/'reviewed-inventory.json').write_text(json.dumps({'firmware_commit':'7e0d5a43d01706fe619234d8b174beb1ebe45dc6','rows':reviewed,'remaining_lexical_firmware_rows':sum(x['repository']=='alumina-firmware' and 'not yet audited' in x['review_status'] for x in rows),'scope':'All23previously provisional entries in existing70-row firmware subset; not a proof of exhaustive firmware inventory or full migration'},indent=2)+'\n')
print('Reviewed23rows;1509otherrows preserved')
