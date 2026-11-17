from pathlib import Path
import csv,hashlib,json,runpy,shutil,subprocess
s=Path(__file__).parent;root=Path('/mnt/development/csgrs');path='crates/hypersolve/src/certification.rs';ns=runpy.run_path(str(root/'scripts/interval_inventory.py'));text=(root/path).read_text();base=subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip();assert base=='4192d8c726d3333a31cb7eddc30cc0d464d61411'
shutil.copy2(root/'interval-inventory.tsv',s/'inventory-before.tsv');rows=list(csv.DictReader((root/'interval-inventory.tsv').open(),delimiter='\t'));declarations=[dict(symbol=m['name'],kind=m['kind'],line=str(text.count('\n',0,m.start())+1),visibility=(m['visibility'] or 'private').strip()) for m in ns['DECLARATION'].finditer(text)]
assert len(declarations)==20
roles={
 'CandidateCertificationConfig':('Precision-floor configuration for exact scalar replay; not a tolerance or total-work cap','Category4: retain solver certification configuration'),
 'default':('Choose existing MAX_REFINEMENT_PRECISION scalar floor; no predicate call','Category4: retain explicit solver configuration default'),
 'CertifiedCandidateStatus':('Exact scalar certificate, ball sign/certainty receipt, unknown, invalid radius, domain failure or lossy-only proposal status','Category5: retain certainty/proof report; approximate ball payload is not an exact certificate'),
 'is_certified_satisfied':('Current helper accepts satisfied BallCertified without inspecting certainty; reproduced approximate-certification gap','Category5: retain report interpretation; repair exact-certification claim in owner before migration'),
 'is_certified_violation':('Current helper accepts violated BallCertified without inspecting certainty; public status matrix baseline fails','Category5: retain report interpretation; require Exact/Filtered for exact violation claim'),
 'is_unknown':('Current helper includes BoundedUnknown/LossyAdapterOnly but omits approximate ball receipts','Category5: retain report interpretation; preserve approximate uncertainty in summaries'),
 'is_lossy_adapter_only':('Identify explicitly proposal-only status without treating approximation as a numerical proposal engine','Category5: retain distinct lossy-adapter evidence'),
 'CertifiedCandidateRow':('Source constraint identity/name/kind plus optional normalized exact residual and certification status','Category5: retain source-bound row evidence'),
 'CandidateCertificationReport':('Ordered active rows and separate satisfaction/violation/unknown/lossy/domain counters','Category5: retain report; summary counts inherit status-helper certainty bug'),
 'CandidateResidualBall':('Caller-selected active-row ordinal and exact Real radius; residual center comes from replay','Category4: retain solver active-row selector and radius wrapper; not a standalone general interval'),
 'all_satisfied':('Require nonempty rows and satisfaction count equal row count; current approximate counts can promote to true','Category5: retain report API; repair upstream count authority without weakening empty behavior'),
 'has_certified_violation':('Read certified violation count; correctness depends on status-helper certainty handling','Category5: retain report API; preserve exact violation meaning'),
 'has_only_uncertainty':('Require no certified violation or domain failure and at least one uncertain row','Category5: retain separate uncertainty summary'),
 'certify_candidate':('Delegate exact residual replay with existing default scalar refinement floor','Category4: retain exact replay entry point'),
 'certify_candidate_with_config':('Visit active source constraints in order, normalize >= by negation, classify exact scalar signs; preserve evaluation failures','Category4/5: retain solver row replay and certificate authority'),
 'report_lossy_adapter_only_candidate':('Emit active source rows with requested/used engine and precision but no exact residual; count as unknown and lossy','Category5: retain explicit non-certificate'),
 'certify_candidate_with_residual_balls':('Replay first; apply selected balls in supplied order; skip out-of-range or failed rows; last repeated selector wins; preserve raw Hyperlimit certainty','Category4/5: retain solver ball adapter; fix summary promotion while preserving predicate order and payload'),
 'normalize_residual':('Negate >= residual only; equality/soft/<= unchanged','Category4: retain constraint interpretation'),
 'classify_signed_residual':('Use certified_sign_until; exact zero satisfies equality/soft, nonpositive normalized inequality satisfies; preserve unknown floor','Category3/4: retain exact scalar proof adapter; no interval arithmetic'),
 'recompute_report_counts':('Recount status helpers; InvalidBallRadius joins domain failures; lossy status remains uncertain as well as separately counted','Category5: retain report aggregation and diagnostic distinctions'),
}
new=[]
for d in declarations:
 semantics,disposition=roles[d['symbol']]
 row=dict(repository='csgrs',path=path,**d,endpoint_representation='Exact point-valued Real residual centers and optional Real radii; scalar signs and source-row identities, no independent endpoint pair',semantics=semantics,allocation='Reports allocate row vectors, names and diagnostics; exact Real graphs retained; precision floor is not whole-work/lifetime/memory bound; no cost claim',platform='std Hypersolve host adapter; public probe reproduced on x86_64 Rust1.95',serialization='No serde derive or codec in this module; public constructed fields are not validated replay proof',consumers='lib.rs public reexports; interval affine/quadratic adapters and interval-box facade; batch and failed-constraint summaries; smoke tests and certification/dispatch_trace benches',owner='hypersolve',disposition=disposition,baseline_tests='8exact controls pass and8 public certainty witnesses fail at4192d8c;4maintained regressions fail unchanged baseline; raw evidence in residual-certainty-review',baseline_benchmarks='certify_affine_candidate_exact and certify_candidate_batch_affine in certification bench; dispatch_trace candidate cases; not timed in this review',review_status='All446lines and20declarations reviewed at4192d8c; certainty gap reproduced; isolated repair remains unaccepted')
 assert set(row)==set(ns['FIELDS']);new.append(row)
def target(r):return r['repository']=='csgrs' and r['path']==path
old=[r for r in rows if target(r)];assert len(old)==2
index=next(i for i,r in enumerate(rows) if target(r));after=[r for r in rows if not target(r)];after[index:index]=new
with (root/'interval-inventory.tsv').open('w') as f:
 writer=csv.DictWriter(f,fieldnames=ns['FIELDS'],delimiter='\t',lineterminator='\n');writer.writeheader();writer.writerows(after)
shutil.copy2(root/'interval-inventory.tsv',s/'inventory-after.tsv')
files=[path,'crates/hypersolve/src/failed_constraints.rs','crates/hypersolve/src/interval.rs','crates/hypersolve/src/batch.rs','crates/hypersolve/src/eval.rs','crates/hypersolve/src/lib.rs','crates/hypersolve/tests/smoke.rs','crates/hyperlimit/src/predicates/filters.rs','crates/hypersolve/Cargo.toml']
review=dict(base=base,module=path,lines=len(text.splitlines()),declarations=declarations,files=[dict(path=p,sha256=hashlib.sha256((root/p).read_bytes()).hexdigest()) for p in files])
(s/'source-review.json').write_text(json.dumps(review,indent=2)+'\n')
change=dict(before_rows=len(rows),after_rows=len(after),unchanged_other_rows=len(rows)-len(old),updated=len(old),added=len(new)-len(old),before_sha256=hashlib.sha256((s/'inventory-before.tsv').read_bytes()).hexdigest(),after_sha256=hashlib.sha256((s/'inventory-after.tsv').read_bytes()).hexdigest())
(s/'inventory-change.json').write_text(json.dumps(change,indent=2)+'\n')
config=dict(repository=str(root),allowed_changes=['INTERVAL_REFACTOR_PROGRESS.md','interval-inventory.tsv','docs/research/residual-certification-ownership-review.md','docs/evidence-archive.tsv'],accepted_ledger_hashes={n:hashlib.sha256((root/'docs/research'/n).read_bytes()).hexdigest() for n in ['interval-size-accounts.json','interval-memory-accounts.json']})
(s/'review-config.json').write_text(json.dumps(config,indent=2)+'\n');shutil.copy2(s.parent/'verify-inventory-review.py',s/'verify-review.py');print(json.dumps(change))
