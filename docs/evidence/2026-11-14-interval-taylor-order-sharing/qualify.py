from pathlib import Path
import subprocess,json,re,tomllib,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor-order-sharing');source=json.loads((s/'SOURCE.json').read_text());assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r).decode().strip()==source['commit'];assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
result={}
for label in ['msrv','stable']:
 assert (s/f'{label}-driver.exit').read_text().strip()=='0';rows=json.loads((s/f'{label}-validation.json').read_text());assert len(rows)==8 and all(x['returncode']==0 for x in rows)
 counts=list(map(int,re.findall(r'test result: ok\. (\d+) passed;',(s/f'{label}-all-tests.log').read_text())));assert sum(counts)==139 and len(counts)==17
 assert 'test result: ok. 10 passed;' in (s/f'{label}-orders-release.log').read_text()
 result[label]=dict(validation_commands=8,owner_tests=139,suite_count=17,release_new_tests=10)
rows=json.loads((s/'package-commands.json').read_text());assert len(rows)==5 and all(x['returncode']==0 for x in rows);assert (s/'package-driver.exit').read_text().strip()=='0';assert len(json.loads((s/'package-artifacts.json').read_text()))==7
names=['hyperreal','hyperinterval','hyperlattice-interval','hyperlattice','hyperlimit','hypersolve','hyperdynamics'];log=(s/'package-verified.log').read_text()
for action in ['Packaging','Verifying']:
 found=[x for x in re.findall(r'^\s*'+action+r' (\S+) v',log,re.M) if x in names];assert sorted(found)==sorted(names)
assert json.loads((s/'packaged-consumer-source.json').read_text())['all_seven_from_archives'];assert (s/'package-replay-driver.exit').read_text().strip()=='0';assert 'test result: ok. 9 passed;' in (s/'packaged-replay-test.log').read_text();assert all(x['returncode']==0 for x in json.loads((s/'packaged-replay-commands.json').read_text()))
assert json.loads((s/'benchmark.json').read_text())['returncode']==0;timings=json.loads((s/'timing-summary.json').read_text());assert len(timings)==6 and all(x['samples']==30 for x in timings.values());assert (s/'cost-probe.exit').read_text().strip()=='0'
for name in ['constant','exponential','riccati']:
 a=timings['taylor_orders/'+name+'/independent']['mean']['confidence_interval'];b=timings['taylor_orders/'+name+'/shared']['mean']['confidence_interval'];assert b['upper_bound']<a['lower_bound'],(name,a,b)
# Existing executable bodies, dependencies, features and package metadata unchanged.
rel='crates/hyperdynamics/src/field/taylor_flow.rs';old=subprocess.check_output(['git','show',source['base']+':'+rel],cwd=r);assert (r/rel).read_bytes()==old+b'\n/// Reuse prepared coefficient graphs across polynomial orders.\npub mod orders;\n'
rel='crates/hyperdynamics/Cargo.toml';old=tomllib.loads(subprocess.check_output(['git','show',source['base']+':'+rel],cwd=r).decode());new=tomllib.loads((r/rel).read_text());assert old['dependencies']==new['dependencies'];assert new['features']==old['features'];assert new['package']==old['package'];assert len(source['paths'])==8
assert hashlib.sha256((s/'candidate.patch').read_bytes()).hexdigest()==source['patch_sha256']
result.update(source_commit=source['commit'],verified_packages=7,archive_only_consumer=True,archive_only_tests=9,existing_bodies_and_features_unchanged=True,benchmark_rows=6,samples_per_row=30,performance_scope='three completed four-order portfolios; all Taylor preparation/proofs/destruction; common original field excluded; no universal speedup',automatic_adaptive_order_sharing=False,goal_complete=False,push_or_publication=False)
(s/'QUALIFICATION.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
