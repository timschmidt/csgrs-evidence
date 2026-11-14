from pathlib import Path
import subprocess,json,re,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-interval-release');source=json.loads((s/'SOURCE.json').read_text());text=(r/'scripts/release-check.sh').read_text();names=re.search(r'^crates=\(\n(.*?)\n\)',text,re.S|re.M).group(1).split();assert len(names)==21
runs={}
for label in ['final','stable','clean']:
 assert (s/f'{label}-release.exit').read_text().strip()=='0'
 log=(s/f'{label}-release.log').read_text();counts={}
 for action in ['Packaging','Verifying','Documenting']:
  found=[name for name in re.findall(r'^\s*'+action+r' (\S+) v',log,re.M) if name in names];assert sorted(found)==sorted(names),(label,action,found);counts[action]=len(found)
 clients=re.findall(r'^(\S+)\s+ok\s*$',log,re.M);expected=['user_path','ffi_smoke','cpp_smoke','python_bindings','go_bindings','typescript_bindings']+['quickstart_'+n.replace('-','_') for n in names if n!='csgrs-ffi'];assert sorted(clients)==sorted(expected),(label,clients)
 assert log.rstrip().endswith('release check passed');assert 'resolution: 21 released crates from packages' in log
 runs[label]=dict(returncode=0,counts=counts,clients=clients,client_count=len(clients),log_sha256=hashlib.sha256(log.encode()).hexdigest())
for record,expected in [('fixed-package-checks.json',6),('focused-checks.json',5),('packaged-feature-checks.json',4),('each-feature-checks.json',3)]:
 rows=json.loads((s/record).read_text());assert len(rows)==expected and all(x['returncode']==0 for x in rows),record
assert (s/'format.exit').read_text().strip()=='0';assert not (s/'final-shellcheck.log').read_text();assert json.loads((s/'package-reproducibility.json').read_text())['all_clean_archives_identical']
changes=subprocess.check_output(['git','diff','--name-only',source['base'],source['commit']],cwd=r).decode().splitlines();assert sorted(changes)==sorted(source['paths']);assert all('/src/' not in p and not p.startswith('.github/') for p in changes)
for directory in [r,Path('/mnt/development/csgrs-interval-release-clean'),Path('/mnt/development/csgrs-interval-release-reproduce')]:assert not subprocess.check_output(['git','status','--porcelain'],cwd=directory)
result=dict(source_commit=source['commit'],release_runs=runs,feature_checks=sum(x['count'] for x in json.loads((s/'each-feature-coverage.json').read_text()).values()),clean_source_reproduction_count=21,production_rust_sources_unchanged=True,ci_configuration_unchanged=True,full_pre_push_not_run=True,push_or_publication=False);(s/'QUALIFICATION.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
