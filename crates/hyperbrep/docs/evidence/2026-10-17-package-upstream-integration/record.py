"""Record package-boundary progress without replacing earlier runtime evidence."""
import hashlib,importlib.util,json,subprocess
from pathlib import Path
from check import ROOT,OUT,hashes,sha

read=lambda p:json.loads(p.read_text())
write=lambda p,x:p.write_text(json.dumps(x,indent=2)+'\n')
b=read(OUT/'baseline.json');q=read(OUT/'qualification.json');assert q['source']==hashes()
assert all(sha(ROOT/n)==h for n,h in b['runtime'].items())
latest={r['label']:r for r in read(OUT/'attempts.json')}
before=read(OUT/latest['baseline-metadata']['stdout']);after=read(OUT/latest['merged-metadata']['stdout']);assert before==after
old=read(OUT/'baseline-package-files.json')
expected_license='cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
for crate in ['hyperbrep','hyperbrep-io']:
 assert sha(ROOT/'crates'/crate/'LICENSE-APACHE')==expected_license
 rows=(OUT/latest['merged-package-'+crate]['stdout']).read_text().splitlines()
 original=set(old[crate]['files'])|set(old[crate]['generated'])
 assert set(rows)=={n for n in original if not n.startswith('docs/evidence/')}|{'LICENSE-APACHE'}
root_package=latest.get('merged-package-csgrs')
if root_package and root_package['exit_code']==0:
 assert not any(n.startswith('docs/evidence/') for n in (OUT/root_package['stdout']).read_text().splitlines())
prior=OUT.parent/'2026-10-17-axial-shells'
artifacts=[]
for p in sorted((OUT/'consumer-artifacts').glob('*')):
 previous=prior/'final-artifacts'/p.name;assert p.read_bytes()==previous.read_bytes()
 artifacts.append(dict(path=str(p.relative_to(OUT)),baseline=str(previous.relative_to(ROOT)),bytes=p.stat().st_size,sha256=sha(p)))
assert len(artifacts)==16
write(OUT/'consumer-artifacts.json',artifacts)
relative='evidence/'+OUT.name;location=str(OUT.relative_to(ROOT))
validation='Merged seven upstream commits without changing production Rust or dependency locks. HyperBRep package membership drops from 13,119 to 184 by excluding only 12,936 historical evidence members and adding the declared Apache text; HyperBRep IO adds the same text (129 to 130 members). All other members persist. Exact resolved Cargo metadata is unchanged. Both README tests, direct warning-denied Clippy, formatting and eight complete frozen native/STEP workflows pass; all sixteen output files match the preceding qualification byte-for-byte. Source identity justifies reusing the frozen runtime executable; this is not a fresh whole-library build or timing campaign.'
limits='Package lists are not built/published packages or installed-consumer qualification. Registry availability, all feature/MSRV/binding/provenance gates and all 28 work packages remain open. Historical evidence stays in the repository. The preceding BREP cost regressions and thin-layer OCCT limitation remain recorded; this merge does not resolve them. Unrelated upstream source-history and deferred-index admission gaps remain with their owner. No push.'
if root_package and root_package['exit_code']:
 limits+=' The root csgrs package listing reached the retained external timeout; its merged payload is not independently requalified here. BREP package lists complete. Do not treat that unrelated root listing as a BREP implementation failure or rerun it without a new reason.'
status_path=ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json';status=read(status_path)
identity='package-upstream-2026-10-17';assert all(x['id']!=identity for x in status['increments'])
status['acceptance_contract']['upstream_revision']=b['upstream'];status['acceptance_contract']['latest_integration']=relative+'/README.md'
status['increments'].append(dict(id=identity,work_packages=['WP00','WP17','WP23'],properties=['P27','P35','P36','P37','P39'],change='Integrate upstream packaging/documentation/license corrections. Keep historical BREP acceptance evidence out of the crate payload and include the already-declared Apache text in both BREP packages, with production and dependency preservation.',source='../Cargo.toml',evidence=relative+'/manifest.json',validation=validation,limits=limits))
write(status_path,status)
plan_path=ROOT/'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md';plan=plan_path.read_text();needle='Upstream `3b69af324` corrects'
assert needle in plan
addition='''Upstream `7ed435017` adds package/license and README corrections. The
[package integration](evidence/2026-10-17-package-upstream-integration/README.md)
preserves production source and dependencies, excludes historical acceptance
archives from the HyperBRep crate payload, and supplies the already-declared
Apache text in both BREP packages. Keep evidence in the source repository.
Package lists, source-path examples and unchanged-runtime replay do not prove
registry availability, installed consumers, provenance or release readiness.
Carry these requirements into subsequent package and feature work while the
existing runtime and performance qualification remains tied to its source.

'''
plan_path.write_text(plan.replace(needle,addition+needle,1))
upstream=subprocess.check_output(['git','show',b['upstream']+':docs/properties-status.json'],cwd=ROOT,text=True)
old_ledger=json.loads(subprocess.check_output(['git','show',b['baseline']+':docs/properties-status.json'],cwd=ROOT,text=True))
brep=old_ledger['current_work']['hyperbrep']
brep.update(upstream_revision=b['upstream'],latest_evidence=location+'/manifest.json',latest_integration_evidence=location+'/README.md',integration_qualification=validation+' '+limits)
helper=OUT.parent/'2026-10-16-upstream-format-integration/ledger_spans.py';spec=importlib.util.spec_from_file_location('spans',helper);spans=importlib.util.module_from_spec(spec);spec.loader.exec_module(spans)
ledger=spans.replace_brep(upstream,brep);(ROOT/'docs/properties-status.json').write_text(ledger)
write(OUT/'ledger-update.json',dict(upstream_sha256=hashlib.sha256(upstream.encode()).hexdigest(),result_sha256=hashlib.sha256(ledger.encode()).hexdigest(),helper_sha256=sha(helper),scope='Only current_work.hyperbrep differs from upstream bytes; preceding runtime implementation/evidence remain named separately.'))
write(OUT/'result.json',dict(validation=validation,limits=limits,source=q['source'],metadata_identical=True,consumer_artifacts=16,work_packages_open=28,root_package_exit_code=root_package['exit_code'],kept=True))
(OUT/'README.md').write_text(f'''# Upstream package and documentation integration

Integrate upstream `{b['upstream']}` into `brep` after `{b['baseline']}`.
The source merge is automatic except for the shared property ledger. Preserve
every upstream byte outside the BREP value and retain its preceding runtime
feature record. Normative agent/property/admission instructions are unchanged.

{validation}

The baseline BREP file list included about 469 MB of physical historical evidence
files. These remain tracked in the repository and are excluded from the crate
payload with the same rule upstream applies to the root package. The final
[file inventory](package-comparison.json) reports actual membership, physical
bytes and every intentional metadata/documentation change. These are not
compressed archive sizes. The Apache text matches the upstream and pre-existing
Hyperreal text with SHA-256 `{expected_license}`. Existing license expressions
and notices are unchanged; this asset repair makes no new ownership or
historical provenance claim.

[The source bridge](consumer-source-bridge.json) identifies the frozen executable
and exact preserved runtime, dependency, feature and consumer inputs. All eight
workflows retain native/STEP construction, independently derived measures,
classification, replay and continued Booleans. [Their sixteen outputs](consumer-artifacts.json)
remain identical. Earlier full native/WASM qualification and all adverse costs
remain evidence on the preceding revision, not freshly executed suites here.

The first qualification source allowlist omitted the reviewed README test edit
and stopped before running a command. Its [recipe and failure](qualification-setup-failure.json)
remain. The broad initial source inventory also included historical snapshots;
its complete bytes are retained compressed while the production comparison uses
actual root/crate source paths. The original ledger conflict is retained as well.

See the [prospective contract](contract.md), [command attempts](attempts.json),
[qualification](qualification.json), [result](result.json),
[manifest](manifest.json) and [final audit](audit.json).

{limits}
''')
assert hashes()==q['source']
print('Recorded BREP package boundary and upstream integration.',flush=True)
