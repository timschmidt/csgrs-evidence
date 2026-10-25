from pathlib import Path
import os, sys, json, subprocess, time, signal, hashlib, resource

variant=sys.argv[1]
assert variant in ['baseline','candidate']
root=Path('/tmp/csgrs-r15-'+variant)
record=Path(__file__).resolve().parent/('oracles-'+variant+'-'+str(time.time_ns()))
record.mkdir();(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r15-'+variant+'-target', CCACHE_DIR='/tmp/csgrs-r15-'+variant+'-ccache', CCACHE_TEMPDIR='/tmp/csgrs-r15-'+variant+'-ccache/tmp')
Path(env['CCACHE_TEMPDIR']).mkdir(parents=True,exist_ok=True)
def inventory():
    names=subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard'],cwd=root,text=True).splitlines()
    return {n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names if (root/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock'])}
before=inventory();(record/'sources-before.json').write_text(json.dumps(before,indent=2)+'\n')
(record/'source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
metadata={'variant':variant,'compiler':subprocess.check_output(['rustc','-Vv'],text=True),'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR']},'runs':[]}
def memory_limit():
    resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
def run(name,cmd,timeout,bounded=False):
    print('START',name,flush=True);start=time.time()
    with (record/(name+'.log')).open('w') as log:
        proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True,preexec_fn=memory_limit if bounded else None)
        try:status=proc.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
    metadata['runs'].append({'name':name,'command':cmd,'status':status,'seconds':time.time()-start,'timeout_seconds':timeout,'address_space_bytes':8*1024**3 if bounded else None})
    (record/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n');print('FINISH',name,status,flush=True);return status
status=run('build',['cargo','test','--locked','--offline','--release','-p','hypercurve','--all-features','--lib','--no-run','--message-format=json'],1200)
if status==0:
    bins=[row['executable'] for line in (record/'build.log').read_text().splitlines() if line.startswith('{') and (row:=json.loads(line)).get('reason')=='compiler-artifact' and row.get('executable') and row['target']['name']=='hypercurve']
    assert len(bins)==1
    binary=Path(bins[0]);metadata['binary']={'path':str(binary),'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'bytes':binary.stat().st_size}
    for label,name in [
        ('equivalent-oracle','bezier_offset::conversion_tests::recursive_formula_roots_compare_in_equivalent_rebuilt_fields'),
        ('typed-controls','bezier_offset::conversion_tests::recursive_formula_rebasing_keeps_foreign_sources_and_denominators_typed'),
        ('cache-controls','bezier_offset::conversion_tests::recursive_native_equality_cache_saturates_and_separates_changed_charts'),
        ('budget-controls','bezier_offset::conversion_tests::recursive_native_comparison_exhaustion_retries_without_caching_failure'),
        ('multiplicity-controls','bezier_offset::conversion_tests::recursive_native_comparison_preserves_odd_and_even_multiplicity'),
        ('terminal-controls','bezier_offset::conversion_tests::recursive_native_approximate_terminal_never_caches_exact_equality'),
        ('original-workflow','curve_region_boolean::certified_successor_tests::curve_trim_retains_selected_field_algebraic_chord_overlaps'),
    ]:
        run(label,[str(binary),name,'--exact','--nocapture','--test-threads=1'],180,True)
after=inventory();assert before==after
(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n');metadata['sources_unchanged']=True
(record/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
print('ORACLES COMPLETE',record,flush=True)
