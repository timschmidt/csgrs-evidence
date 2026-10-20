"""Source-pinned commands for the package/documentation merge boundary."""
import hashlib,json,os,subprocess,sys,time
from pathlib import Path
ROOT=Path(__file__).resolve().parents[5];OUT=Path(__file__).resolve().parent
ENV=os.environ|dict(PYTHONDONTWRITEBYTECODE='1',PATH='/tmp/hyperbrep-upstream-tools/usr/bin:/home/tim/.cargo/bin:'+os.environ['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target',GMP_MPFR_SYS_CACHE='/tmp/hyperbrep-upstream-tools/gmp-cache')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def hashes():
 b=json.loads((OUT/'baseline.json').read_text())
 paths=[ROOT/n for n in b['runtime']]+[ROOT/n for n in ['Cargo.toml','readme.md','tests/readme.rs','examples/basic.rs']]
 for pattern in ['crates/*/Cargo.toml','crates/*/README.md','crates/*/LICENSE*']:paths+=list(ROOT.glob(pattern))
 return {str(p.relative_to(ROOT)):sha(p) for p in sorted(set(paths)) if p.is_file()}
def run(label,command,seconds=300,extra=None):
 source=hashes();identity=hashlib.sha256(json.dumps(source,sort_keys=True).encode()).hexdigest()
 (OUT/('source-'+identity+'.json')).write_text(json.dumps(source,indent=2)+'\n')
 p=OUT/'attempts.json';rows=json.loads(p.read_text()) if p.exists() else []
 attempt=1+sum(r['label']==label for r in rows);stem=f'{label}-{attempt}'
 print('running',stem,flush=True);start=time.monotonic()
 with (OUT/(stem+'.stdout')).open('w') as stdout,(OUT/(stem+'.stderr')).open('w') as stderr:
  result=subprocess.run(['timeout','--signal=TERM','--kill-after=30s',str(seconds)+'s',*command],cwd=ROOT,env=ENV|(extra or {}),stdout=stdout,stderr=stderr)
 unchanged=source==hashes()
 row=dict(label=label,attempt=attempt,command=command,environment=extra or {},source='source-'+identity+'.json',exit_code=result.returncode,elapsed_seconds=time.monotonic()-start,source_unchanged=unchanged,stdout=stem+'.stdout',stderr=stem+'.stderr',external_timeout_seconds=seconds)
 rows.append(row);p.write_text(json.dumps(rows,indent=2)+'\n');print('finished',stem,result.returncode,flush=True)
 assert unchanged
 return row
if __name__=='__main__':sys.exit(run(sys.argv[1],sys.argv[2:])['exit_code'])
