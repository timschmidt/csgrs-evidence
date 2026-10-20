"""Publish only results derived after the full finite qualification succeeds."""
import hashlib
import importlib.util
import json
from pathlib import Path
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ROOT, hashes

read = lambda name: json.loads((OUT/name).read_text())
source = hashes()
qualification = read('qualification-summary.json')
assert qualification['source'] == source and not qualification['failures']
assert qualification['test_counts']['native-release'] == 691
assert qualification['test_counts']['native-minimal'] == 683
groups = sum(read('consumers.json')['groups'].values())
assert groups == 238
artifacts = read('artifact-preservation.json')
assert artifacts['preserved_files'] == 450
cost = read('resource-review.json')
upstream = read('upstream-refresh.json')['fetched']
validation = (
    'Spatial ParameterRange domains, signed planar source charts, retained-origin translations '
    'and coordinate side correspondences construct exact solids from selected procedural profiles. '
    'Hypercurve owns scalar charts, correlated affine point parameters, checked point definitions '
    'and finite membership; BRep owns spatial frames, complete edge/surface images and topology. '
    'The original nonlinear parallel cap keeps every quadratic closing segment after planar clipping. '
    'Eleven shared BRep groups cover selected domains and projection, reversal, affine reflection/shear, '
    'authored axial and selected profile splits, holes/components and reversed contours, repeated '
    'slab cuts/reunion, both directed set identities, empty recovery, 1e-12 gaps, forged archives, '
    'policy reuse, zero-work exhaustion and recovery. One shared IO group preserves attributed '
    'UnsupportedCurve(PlanarImage), cold replay and native classification. Existing represented '
    'endpoint facts are reused rather than replaced by opaque spatial reevaluations. '
    'Archive version 10 stores source-chart coefficients, point definitions, affine-field recipes '
    'and retained translations; all API callers migrate directly with no compatibility reader. '
    'Twelve new debug checks and 691 all-feature / 683 minimal-feature release tests pass. '
    'Unchanged owner inputs retain their executed 365 integration, 165 retained-region, 58 parameter, '
    '28 subdivision, four winding, 62 successor and five compatibility tests. Their original '
    'snapshots are distinguished from the newly executed BRep/IO checks. Warnings-denied affected '
    'Clippy/rustdoc, nine STEP examples, fuzz-target compilation and formatting pass. '
    'Source-path native consumers and 238 zero-import WASM groups pass. All 450 prior artifacts '
    'preserve their exact fields except the audited version header, source-chart schema and '
    'two explicit finite-source restrictions with identical coefficients and selected roots; '
    f'{artifacts["new_files"]} new native archives agree across two fresh processes. '
    'The 24 prism and 81 continuation outcomes, seven original complete profile recipes and '
    'original two-complete/two-unsupported path controls remain. Twenty prism OCCT reader '
    'observations were rerun. No additional STEP encoding capability is claimed.'
)
limits = (
    'Finite selected-profile construction and supported continuation, not general CAD completion. '
    'Independent selected axial parameters, arbitrary recursive/projective point fields, broader '
    'selected surface images and standalone patch construction, general curved arrangements/intersections, metrics, procedural STEP '
    'encoding and full semantic authoring history remain open. Metadata admission and partial '
    'solver-work accounting do not bound total work, retained heap, coefficient growth or cancellation. '
    'Source-path native/WASM qualification does not establish installed distribution, MSRV, production '
    'bindings, coverage/formal targets or runtime fuzz/ASan/lexicase campaigns. All 28 work packages '
    'and full pre-push qualification remain open/in-progress; no push. Supporting Hypercurve changes '
    'stay in their owning layer. Unrelated concurrent-thread repairs are untouched. Final evidence '
    f'includes upstream {upstream}; costs cannot isolate the BRep feature from that integration.'
)
status_path = ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = json.loads(status_path.read_text())
assert len(status['increments']) == 62 and not status['complete']
increment = dict(id='selected-procedural-profiles-2026-10-18',
                 work_packages=['WP02', 'WP05b', 'WP06', 'WP08', 'WP13'],
                 properties=['P'+str(i) for i in [*range(1,7),*range(8,12),*range(14,21),*range(24,28),*range(35,40)]],
                 change='Construct exact selected procedural-profile solids with retained domains, '
                 'point authority and complete side-image proofs; preserve native scalar facts through composition.',
                 evidence=f'evidence/{OUT.name}/manifest.json', validation=validation,
                 cost_evidence=cost['summary'], limits=limits)
status['increments'].append(increment)
status['updated_on'] = '2026-10-18'
status['next_actions'][0] = (
    f'Use evidence/{OUT.name}/manifest.json as the current finite baseline. Preserve all 238 WASM '
    f'groups, 450 migrated prior artifacts and {artifacts["new_files"]} new repeated archives, '
    '24 prism/81 continuation outcomes, seven original full profiles and every adverse cost. '
    'Retain the rejected scalar-fact candidate and upstream-only reproduction; do not waive native '
    'facts or replace the schema audit with approximate geometry comparisons.')
status['next_actions'][1] = (
    f'Follow evidence/{OUT.name}/next-domains.md for retained selected surface/contact/branch '
    'graphs, general arrangements and shell proofs, modeling features, exchange and release/resource '
    'gates. Hypercurve/Hypersolve own root, chart and field authority; BRep owns spatial images and '
    'topology; IO owns encoding. Independent selected axial translations remain unsupported.')
status_path.write_text(json.dumps(status, indent=2)+'\n')
spec = importlib.util.spec_from_file_location('ledger_spans', OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py')
spans = importlib.util.module_from_spec(spec)
spec.loader.exec_module(spans)
path = ROOT/'docs/properties-status.json'
before = path.read_text()
leaf = json.loads(before)['current_work']['hyperbrep']
leaf.update(latest_evidence=str((OUT/'manifest.json').relative_to(ROOT)),
            latest_feature_evidence=str((OUT/'manifest.json').relative_to(ROOT)),
            latest_implementation=increment['id'], upstream_revision=upstream,
            latest_integration_evidence=str((OUT/'contract.md').relative_to(ROOT)),
            qualification=validation+' '+cost['summary']+' '+limits,
            integration_qualification='Merged dbe99e3cc in 75b4aa7ab while preserving both histories '
            'and the pending feature diff. Upstream corrects sign publication, lazy named certificate '
            'folding/replay, checked trigonometry and known exact-rational undefined graph decoding. '
            'Normative admission files are unchanged. Full named-certificate/payload consistency '
            'and arbitrary graph-domain validation remain upstream-owned gaps. This increment '
            'qualifies the combined BRep consumer source; it does not qualify every upstream crate '
            'or close its release gates. All non-BRep ledger values match merged upstream.')
after = spans.replace_brep(before, leaf)
path.write_text(after)
(OUT/'ledger-update.json').write_text(json.dumps(dict(only='current_work.hyperbrep',
    before_sha256=hashlib.sha256(before.encode()).hexdigest(),
    after_sha256=hashlib.sha256(after.encode()).hexdigest(),
    other_bytes_preserved=after == spans.replace_brep(before, leaf)), indent=2)+'\n')
with (ROOT/'crates/hyperbrep/PERFORMANCE.md').open('a') as output:
    output.write('\n\n## Selected procedural-profile construction (2026-10-18)\n\n'
                 f'The [admission](docs/evidence/{OUT.name}/README.md) extends exact construction '
                 'and supported edit/replay/slab continuation, with direct API/archive migration.\n\n'
                 +cost['summary']+'\n\n'
                 f'[Complete costs](docs/evidence/{OUT.name}/costs.md) and '
                 f'[resource observations](docs/evidence/{OUT.name}/resource-review.json) '
                 'retain every adverse result. The capability-migrated control has no ratio. '
                 'Earlier adverse obligations and whole-operation resource gates remain open.\n')
path = OUT/'ideas.md'
text = path.read_text().replace('Candidate for retention', 'Retained in this finite domain')
text = text.replace('Final retention is conditional on the source-bound qualification and cost\nrecords.',
                    'Retention is supported by the source-bound qualification, artifact and cost\nrecords linked from README.md.')
text += '\nThe first broad image-proof bypass and opaque reevaluation of native endpoints '
text += 'were rejected by preserved full workflows and archive comparisons. The final implementation '
text += 'restores extrusion-side source proofs and reuses the original represented endpoint facts.\n'
path.write_text(text)
path = OUT/'attempt-review.md'
text = path.read_text()+'\n\n## Complete failed-command inventory\n\n'
text += '| Attempt | Exit | Preserved log |\n| --- | ---: | --- |\n'
for row in read('attempts.json'):
    if row['exit_code']:
        text += f'| {row["label"]} / {row["attempt"]} | {row["exit_code"]} | [{row["log"]}]({row["log"]}) |\n'
path.write_text(text)
(OUT/'README.md').write_text(
    '# Selected procedural-profile construction\n\n'
    'Baseline `ba7efd793b08073dea3e68d87c2d69d495933afe` on `brep`; upstream '
    f'`{upstream}` is integrated by merge `75b4aa7ab`. The feature constructs '
    'selected procedural profiles without materializing unavailable scalar coordinates.\n\n'
    '[Contract](contract.md), [proof obligations](proofs.md), [decisions](ideas.md) and '
    '[remaining work](next-domains.md) define this finite extension. Archive version 10 '
    'and public-domain API changes use direct migrations, with no compatibility reader.\n\n'
    '## Qualification\n\n'+validation+'\n\n'
    '[Raw qualification](qualification-summary.json), [native/WASM consumers](consumers.json), '
    '[artifact audit](format-migration.json), [STEP boundary](step-review.json) and '
    '[attempt review](attempt-review.md) distinguish executed evidence from open obligations. '
    'The first full run found six BRep preservation failures, five stale archive tests, '
    'rustdoc recursion overflow and one fuzz caller migration. All were corrected. An '
    'additional artifact preflight caught loss of native scalar facts; an isolated '
    'upstream-only build preserved the baseline, and BRep endpoint reuse restored it. '
    'No scalar exceptions were added to the artifact comparison. The original narrow artifact '
    'audit rejected two explicit finite-source encodings. Its failure is preserved, and '
    '[a supplemental exact proof](finite-source-proof.json) checks the same source, finite '
    'interval and affine map while rejecting 12 mutated encodings and the six earlier scalar '
    'losses. [The completion recipe](final-review/finish_stages.py) records its actual commands '
    'and separate evidence-script hashes; implementation qualification remains bound to '
    'the unchanged source.\n\n'
    '## Costs and limits\n\n'+cost['summary']+'\n\n'
    '[All observations](costs.md) and [resource records](resource-review.json) include '
    'every slower row, allocation increase, executable size and finite archive observation.\n\n'
    +limits+'\n\n'
    '[Source reconstruction](source-reconstruction.json), the [manifest](manifest.json) and '
    '[final audit](final-audit.json) bind the complete record. This does not complete '
    'the development goal or authorize a push without its separate required checks.\n')
assert hashes() == source
print(json.dumps(dict(increments=len(status['increments']), wasm_groups=groups,
                      new_archives=artifacts['new_files']), indent=2))
