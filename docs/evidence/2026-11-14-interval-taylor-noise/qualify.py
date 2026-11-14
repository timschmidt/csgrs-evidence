from pathlib import Path
import subprocess,json,re,tomllib,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor-noise');source=json.loads((s/'SOURCE.json').read_text());assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r).decode().strip()==source['commit'];assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
result={}
for label in ['msrv','stable']:
 assert (s/f'{label}-driver.exit').read_text().strip()=='0';rows=json.loads((s/f'{label}-validation.json').read_text());assert len(rows)==8 and all(x['returncode']==0 for x in rows)
 text=(s/f'{label}-all-tests.log').read_text();counts=list(map(int,re.findall(r'test result: ok\. (\d+) passed;',text)));assert sum(counts)==1637 and len(counts)==77
 for suffix,count in [('noise-release',10),('consumer-release',1)]:
  log=(s/f'{label}-{suffix}.log').read_text();assert sum(map(int,re.findall(r'test result: ok\. (\d+) passed;',log)))==count
 result[label]=dict(validation_commands=8,all_feature_tests=sum(counts),suite_count=len(counts),release_owner_tests=10,release_consumer_tests=1)
rows=json.loads((s/'package-commands.json').read_text());assert len(rows)==5 and all(x['returncode']==0 for x in rows);assert (s/'package-driver.exit').read_text().strip()=='0';assert len(json.loads((s/'package-artifacts.json').read_text()))==7
names=['hyperreal','hyperinterval','hyperlattice-interval','hyperlattice','hyperlimit','hypersolve','hyperdynamics'];log=(s/'package-verified.log').read_text()
for action in ['Packaging','Verifying']:
 found=[x for x in re.findall(r'^\s*'+action+r' (\S+) v',log,re.M) if x in names];assert sorted(found)==sorted(names)
assert json.loads((s/'packaged-consumer-source.json').read_text())['all_seven_from_archives'];assert (s/'replay-driver.exit').read_text().strip()=='0';rows=json.loads((s/'replay-results.json').read_text())['rows'];assert len(rows)==7;assert all(x['returncode']==0 for x in rows[:3]);assert all(x['returncode']!=0 and x['no_success_output'] for x in rows[3:])
assert json.loads((s/'benchmark.json').read_text())['returncode']==0;timings=json.loads((s/'timing-summary.json').read_text());assert len(timings)==6 and all(x['samples']==30 for x in timings.values());assert (s/'cost-probe-final.exit').read_text().strip()=='0'
# Existing executable bodies and feature/dependency definitions are unchanged.
for rel in ['crates/hypersolve/src/expression_program.rs','crates/hypersolve/src/expression_program/taylor.rs','crates/hypersolve/src/expression_program/taylor/model.rs','crates/hypersolve/src/expression_program/taylor/model/affine.rs']:
 old=subprocess.check_output(['git','show',source['base']+':'+rel],cwd=r);assert (r/rel).read_bytes().startswith(old),rel
for name in ['hypersolve','hyperdynamics']:
 rel=f'crates/{name}/Cargo.toml';old=tomllib.loads(subprocess.check_output(['git','show',source['base']+':'+rel],cwd=r).decode());new=tomllib.loads((r/rel).read_text());assert old['dependencies']==new['dependencies'];assert all(new['features'][key]==value for key,value in old['features'].items());assert new['package']==old['package']
result.update(source_commit=source['commit'],verified_packages=7,archive_only_consumer=True,fresh_replays=3,invalid_replay_controls=4,existing_bodies_and_features_unchanged=True,benchmark_rows=6,samples_per_row=30,performance_scope='one shared-quadratic observation fixture; original Taylor/affine certificate common input; no universal speedup',goal_complete=False,push_or_publication=False)
(s/'QUALIFICATION.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
