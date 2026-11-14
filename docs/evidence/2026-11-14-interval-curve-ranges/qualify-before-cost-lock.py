from pathlib import Path
import subprocess,json,re,hashlib,tomllib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-curve-interval-ranges');source=json.loads((s/'SOURCE.json').read_text())
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r).decode().strip()==source['commit']
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
assert (s/'qualified-driver.exit').read_text().strip()=='0'
checks=json.loads((s/'qualified-validation.json').read_text());assert len(checks)==12 and all(x['returncode']==0 and x['source_commit']==source['commit'] for x in checks)
assert 'test result: ok. 12 passed;' in (s/'qualified-focused.log').read_text()
assert (s/'release-focused.exit').read_text().strip()=='0'
assert 'test result: ok. 12 passed;' in (s/'release-focused.log').read_text()
owner=(s/'qualified-owner-release.log').read_text();counts=[int(x) for x in re.findall(r'test result: ok\. (\d+) passed;',owner)];assert counts and sum(counts)>1800
assert 'interval_ranges::tests::high_degree_native_point_dispatch_is_unchanged_by_range_preparation ... ok' in owner
assert 'test result: FAILED' not in owner
assert 'test result: ok.' in (s/'qualified-downstream.log').read_text()
package=s/'package-final';assert (package/'package-driver.exit').read_text().strip()=='0'
commands=json.loads((package/'package-commands.json').read_text());assert len(commands)==5 and all(x['returncode']==0 for x in commands)
artifacts=json.loads((package/'package-artifacts.json').read_text());assert len(artifacts)==8
for a in artifacts:assert a['vcs']['git']['sha1']==source['commit'] and not a['vcs']['git'].get('dirty',False)
consumer=json.loads((package/'packaged-consumer-source.json').read_text());assert consumer['all_resolved_hyper_packages_from_archives'] and consumer['source_commit']==source['commit']
assert (s/'cost-probe.exit').read_text().strip()=='0'
cost=json.loads((s/'cost-summary.json').read_text());assert cost['source_commit']==source['commit'] and len(cost['rows'])==6
benchmark=json.loads((s/'benchmark.json').read_text());assert benchmark['returncode']==0 and benchmark['source_commit']==source['commit']
timings=json.loads((s/'timing-summary.json').read_text());assert set(timings)=={'polynomial','rational','degree8'}
for case,v in timings.items():
 assert v['shared']['samples']==v['independent']['samples']==30
 assert v['paired_speedup']['bootstrap_percentile_95'][0]>1,(case,v)
 a,b=cost['rows'][case+'/independent'],cost['rows'][case+'/shared'];assert a['native']==b['native'];assert b['graph']<a['graph'];assert b['allocations']<a['allocations'];assert b['peak_requested_live']<a['peak_requested_live']
def old(path):return subprocess.check_output(['git','show',source['base']+':'+path],cwd=r).decode()
path='crates/hypercurve/src/rational_bezier_general.rs';getter='    #[cfg(feature = "interval-ranges")]\n    pub(crate) fn cached_homogeneous_power_basis(&self) -> Option<&RationalParametricCurve2> {\n        self.data.homogeneous_power_basis.get()\n    }\n\n';text=(r/path).read_text();assert text.count(getter)==1 and text.replace(getter,'')==old(path)
path='crates/hypercurve/src/lib.rs';addition='/// Prepared native rational-span coordinate and tangent enclosures.\n#[cfg(feature = "interval-ranges")]\npub mod interval_ranges;\n\n';text=(r/path).read_text();assert text.count(addition)==1 and text.replace(addition,'')==old(path)
path='crates/hypercurve/Cargo.toml';before=tomllib.loads(old(path));after=tomllib.loads((r/path).read_text());assert before['features']['default']==after['features']['default'];assert all(after['dependencies'][k]==v for k,v in before['dependencies'].items());assert after['dependencies']['hyperinterval']['optional']
assert 'hyperinterval' not in (s/'disabled-tree.log').read_text()
assert len(source['paths'])==11
assert hashlib.sha256((s/'candidate.patch').read_bytes()).hexdigest()==source['patch_sha256']
result=dict(source_commit=source['commit'],validation_commands=len(checks),focused_tests=12,full_release_tests=sum(counts),full_release_suite_count=len(counts),owner_all_features=True,owner_worker_threads=2,strict_clippy_all_features_and_targets=True,strict_docs=True,stable_check_all_features_and_targets=True,stable_full_tests=False,downstream_work_budget=True,wasm_library_check=True,verified_packages=8,archive_only_actual_consumer=True,new_default_dependency=False,existing_native_bodies_unchanged=True,native_dispatch_preserved=True,allocation_rows=6,identical_allocation_observations_per_row=5,timing_rows=6,timing_samples_per_row=30,performance_scope='three complete16-cell range portfolios including native basis/expression preparation, C1 proofs, box projection, native broad-phase and report destruction; original source excluded; scalar caches warm; no universal speedup',scope='optional native rational-Bezier interval-range consumer; remaining Tier2/Phase13 targets stay open',goal_complete=False,push_or_publication=False)
(s/'QUALIFICATION.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
