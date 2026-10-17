"""Publish and audit the latest integration, preserving earlier source records."""
import gzip
import hashlib
import io
import json
from pathlib import Path
import re
import subprocess
import sys
import tarfile

OUT=Path(__file__).resolve().parent
ROOT=OUT.parents[4]
sys.path.insert(0,str(OUT))
from qualify import ENV, hashes
sys.path.insert(0,str(OUT.parent/'2026-10-16-upstream-format-integration'))
from ledger_spans import replace_brep
read=lambda path:json.loads(path.read_text())
write=lambda path,value:path.write_text(json.dumps(value,indent=2)+'\n')
digest=lambda path:hashlib.sha256(path.read_bytes()).hexdigest()
git=lambda *args:subprocess.check_output(['git',*args],cwd=ROOT)
merge=read(OUT/'merge-review.json')
source=hashes()

def checked_rows():
    attempts=read(OUT/'commands.json')
    labels=['format-debug','format-release','format-clippy','format-docs-with-curve','prism-continuation',
            'binding-shell','real-bindings','wasm-clippy','fmt','diff-check']
    result=[[row for row in attempts if row['label']==label][-1] for label in labels]
    for row in result:
        assert row['exit_code']==0 and row['source_unchanged'],row
        assert read(OUT/row['source'])==source
    return result

def doc_failure():
    row=[r for r in read(OUT/'commands.json') if r['label']=='format-docs'][-1]
    assert row['exit_code']==101 and row['source_unchanged']
    assert read(OUT/row['source'])==source
    assert 'unresolved link to `curve`' in (OUT/row['log']).read_text()
    for name,expected in read(OUT/'root-docs-failure.json')['unchanged_trigger_inputs'].items():
        assert digest(ROOT/name)==expected
        assert hashlib.sha256(git('show',merge['baseline']+':'+name)).hexdigest()==expected
    return row

if sys.argv[1]=='publish':
    rows=checked_rows()
    failed_gate=doc_failure()
    counts={}
    for row in rows:
        if row['command'][:2]!=['cargo','test']:continue
        groups=re.findall(r'^test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;',
                          (OUT/row['log']).read_text(),re.M)
        counts[row['label']]=dict(zip(['passed','failed','ignored'],
                                    [sum(int(x[i]) for x in groups) for i in range(3)]))
    for label,expected in [('format-debug',24),('format-release',24),('prism-continuation',11)]:
        assert counts[label]==dict(passed=expected,failed=0,ignored=0),(label,counts[label])
    binding_log=(OUT/next(row['log'] for row in rows if row['label']=='real-bindings')).read_text()
    for expected in ['WASM certainty, query status, geometry, and invalid-input checks passed',
        'WASM export projection, failure, cache and composition contracts passed',
        'TypeScript native STL pipeline and discriminated errors passed']:
        assert expected in binding_log,expected
    assert re.search(r'# tests 12\b',binding_log) and re.search(r'# pass 12\b',binding_log)
    assert re.search(r'# fail 0\b',binding_log)
    generated=Path(ENV['CARGO_TARGET_DIR'])/'wasm-bindings-node'
    names=['csgrs.js','csgrs.d.ts','csgrs_bg.wasm','csgrs_bg.wasm.d.ts',
           'geometry_certainty.ts','io_contracts.ts','io_contracts.js']
    artifacts={name:dict(bytes=(generated/name).stat().st_size,sha256=digest(generated/name)) for name in names}
    archive=OUT/'bindings.tar.gz'
    assert not archive.exists()
    with archive.open('wb') as raw,gzip.GzipFile(filename='',fileobj=raw,mode='wb',mtime=0) as compressed:
        with tarfile.open(fileobj=compressed,mode='w') as packed:
            for name in names:
                data=(generated/name).read_bytes();info=tarfile.TarInfo(name);info.size=len(data);info.mode=0o644
                packed.addfile(info,io.BytesIO(data))
    with tarfile.open(archive,'r:gz') as packed:
        assert all(packed.extractfile(name).read()==(generated/name).read_bytes() for name in names)
    write(OUT/'binding-artifacts.json',dict(directory=str(generated),files=artifacts,
        archive=archive.name,archive_sha256=digest(archive),scope='Actual generated bindings and TypeScript clients exercised by the retained harness; local source build, not a published package.'))
    validation=('The merged branch passes 24 native OBJ/STL/projection regressions in debug and release, '
        'targeted warning-denied Clippy and curve-enabled format documentation, and eleven BREP prism/STEP workflows. '
        'The actual upstream binding harness passes both preceding JavaScript consumers, all twelve new '
        'IO tests, the preceding TypeScript check and the new compiled/executed TypeScript consumer. '
        'Actual WASM-target Clippy and formatting pass. Counts overlap across configurations. '
        'BREP/dependency byte identity preserves the immediately preceding 512 all-feature, 504 minimal '
        'and 83 source-path WASM checks; those full suites are not claimed as newly executed here.')
    limits=('No local runtime correction is added. Exact text preserves the chosen finite binary64 '
        'projection; ASCII STL import still quantizes to binary32. Binary STL per-triangle '
        'nondegeneracy is separate from closed topology, manifoldness and analytic fidelity. '
        'Typed host errors preserve categories, not complete native proof witnesses or inherited '
        'construction intent. Earlier BREP costs, nineteen adverse timing rows, sixty allocation '
        'increases and two scalar zero-factor failures remain open. Upstream native timing/storage '
        'failures and all 28 BREP work packages remain open. The root no-curve rustdoc configuration '
        'fails on its unchanged curve link; the separate curve-enabled documentation check does not '
        'waive this upstream-owned failure. No new cost campaign, published-package, '
        'MSRV, whole-history, resource-bound, coverage, runtime-fuzz, formal-proof or full pre-push '
        'claim. No push.')
    manifest=dict(baseline=merge['baseline'],upstream=merge['upstream'],decision='kept',
        scope='Upstream projection/WASM integration, unchanged BREP continuation and downstream guidance.',
        retention_rationale='Retain the exact incoming correctness and typed-boundary extensions after their native and real JS/TS tests pass. BREP/dependency inputs and preceding full qualification are preserved. The independently exposed no-curve root documentation failure has unchanged trigger inputs and remains a failed upstream-owned gate; it is not hidden by the separate curve-enabled check. No local runtime workaround or performance admission is added.',
        source=rows[0]['source'],source_identity=hashlib.sha256(json.dumps(source,sort_keys=True).encode()).hexdigest(),
        qualification=rows,test_counts=counts,all_attempts='commands.json',environment='environment.json',
        open_failed_gates=[failed_gate],root_documentation_failure='root-docs-failure.json',
        preserved_brep_source='preserved-brep-source.json',tools='tools.json',tool_downloads='tool-downloads.json',
        tool_reproduction='tool-reproduction.json',
        bindings='binding-artifacts.json',javascript_io_tests=12,validation=validation,limits=limits,
        analysis_inputs={'finish.py':digest(Path(__file__))},
        idea_ledger=[dict(idea='Consume exact projection text and typed WASM IO directly',decision='kept',
            evidence='Incoming bytes match upstream; native and actual generated JS/TS contracts pass.'),
            dict(idea='Duplicate native STL topology or JS format validation inside BREP',decision='already-satisfied',
            evidence='Existing owning-layer implementations are exercised directly; no duplicate runtime path is added.'),
            dict(idea='Keep a string-error compatibility adapter or infer analytic fidelity from import validation',decision='rejected',
            evidence='Greenfield callers use the new error shape directly; numerical, topology and source-fidelity claims remain separate.')])
    write(OUT/'manifest.json',manifest)
    path=ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json';status=read(path)
    entry='upstream-wasm-integration-2026-10-16'
    assert all(item['id']!=entry for item in status['increments'])
    status['increments'].append(dict(id=entry,work_packages=['WP00','WP14a','WP17','WP21','WP23'],
        properties=['P6','P17','P18','P19','P20','P25','P26','P27','P28','P30','P35','P36','P37','P39'],
        change='Integrate exact export projections and typed WASM format errors/native STL import; preserve BREP ownership and current source qualification.',
        evidence='evidence/'+OUT.name+'/manifest.json',decision='kept',validation=validation,limits=limits))
    status['acceptance_contract']['upstream_revision']=merge['upstream']
    status['acceptance_contract']['latest_integration']='evidence/'+OUT.name+'/README.md'
    status['next_actions'][15]=('Upstream 99b88f707 is integrated, including exact binary64 decimal export, '
        'binary32 projected-triangle validation and typed WASM STL import/export errors. Preserve the '
        'native and real JS/TS consumers, text/error migrations and documented source-fidelity limits. '
        'Use message/code/cause.code directly; no compatibility shim. Fetch again at coherent checkpoints, '
        'freeze each qualification source and preserve both histories and ledger ownership. BREP/IO remain '
        'the implementation focus; unrelated native timing, storage and remaining boundary work stays upstream-owned.')
    write(path,status)
    path=ROOT/'docs/properties-status.json';work=read(path)['current_work']['hyperbrep']
    work.update(upstream_revision=merge['upstream'],latest_evidence=str((OUT/'manifest.json').relative_to(ROOT)),
                latest_integration_evidence=str((OUT/'README.md').relative_to(ROOT)),qualification=validation+' '+limits)
    path.write_text(replace_brep(git('show',merge['upstream']+':docs/properties-status.json').decode(),work))
    path=OUT/'README.md';path.write_text(path.read_text()+'\n## Completed qualification\n\n'+validation+'\n\n'+limits+
        '\n\nThe [manifest](manifest.json), [commands](commands.json), [binding artifacts](binding-artifacts.json), '
        '[retained generated bindings](bindings.tar.gz) and [final audit](audit.json) preserve the inputs and outcomes.\n')
    assert hashes()==source
    print(json.dumps(dict(tests=counts,javascript_io_tests=12,decision='kept'),indent=2))
elif sys.argv[1]=='audit':
    manifest=read(OUT/'manifest.json');checked_rows();doc_failure()
    assert manifest['analysis_inputs']['finish.py']==digest(Path(__file__))
    assert git('rev-parse','HEAD').decode().strip()==merge['baseline']
    assert git('rev-parse','MERGE_HEAD').decode().strip()==merge['upstream']
    assert git('branch','--show-current').strip()==b'brep'
    assert not git('diff','--name-only','--diff-filter=U')
    incoming=git('diff','--name-only',merge['previous_upstream'],merge['upstream']).decode().splitlines()
    assert not git('diff',merge['upstream'],'--',*[name for name in incoming if name!='docs/properties-status.json'])
    status=read(ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
    assert not status['complete'] and len(status['work_packages'])==28
    assert all(row['status'] in ['open','in-progress'] for row in status['work_packages'])
    ledger_path=ROOT/'docs/properties-status.json';ledger=read(ledger_path)
    upstream=git('show',merge['upstream']+':docs/properties-status.json').decode()
    assert ledger_path.read_text()==replace_brep(upstream,ledger['current_work']['hyperbrep'])
    expected=json.loads(upstream);ledger['current_work'].pop('hyperbrep');expected['current_work'].pop('hyperbrep',None)
    assert ledger==expected
    changed=git('diff','--name-only',merge['baseline']).decode().splitlines()
    untracked=git('ls-files','--others','--exclude-standard').decode().splitlines()
    local=sorted(set(changed+untracked)-set(incoming))
    allowed={'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md','crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'}
    assert all(name in allowed or name.startswith(str(OUT.relative_to(ROOT))+'/') for name in local)
    preserved=read(OUT/'preserved-brep-source.json')['files']
    assert all(source[name]==value for name,value in preserved.items())
    artifacts=read(OUT/'binding-artifacts.json');archive=OUT/artifacts['archive']
    assert digest(archive)==artifacts['archive_sha256']
    with tarfile.open(archive,'r:gz') as packed:
        for name,record in artifacts['files'].items():
            data=packed.extractfile(name).read()
            assert len(data)==record['bytes'] and hashlib.sha256(data).hexdigest()==record['sha256']
            assert data==(Path(artifacts['directory'])/name).read_bytes()
    tools=read(OUT/'tools.json')
    for path,expected in tools['executable_sha256'].items():assert digest(Path(path))==expected
    for item in read(OUT/'tool-downloads.json'):assert digest(Path(item['path']))==item['sha256']
    stashes=git('stash','list','--format=%H').decode().splitlines()
    assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1','b00958cb640fedbe041c46581327df3e64deacf5'}<=set(stashes)
    documents=[OUT/'README.md',ROOT/'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md']
    for path in documents:
        for _,target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)',path.read_text()):
            if '://' in target or target.startswith('#'):continue
            dest=path.parent/target.split('#')[0]
            assert dest.exists() or dest==OUT/'audit.json',(path,target)
    for path in OUT.glob('*.json'):read(path)
    checks=[];raw=None
    for command in [['cargo','fmt','--all','--','--check'],['git','diff','--check'],
        ['git','diff','--cached','--check','--',*sorted(allowed),'docs/properties-status.json',str(OUT.relative_to(ROOT))]]:
        result=subprocess.run(command,cwd=ROOT,env=ENV,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,timeout=300)
        if '--cached' in command and result.returncode:
            names=sorted({line.rsplit(':',2)[0] for line in result.stdout.splitlines() if 'new blank line at EOF.' in line})
            assert names and all((ROOT/name).is_relative_to(OUT) and name.endswith('.log') for name in names)
            raw=dict(command=command,exit_code=result.returncode,diagnostics=result.stdout,
                     preserved_logs={name:digest(ROOT/name) for name in names})
            command=[*command,*[':(exclude)'+name for name in names]]
            result=subprocess.run(command,cwd=ROOT,env=ENV,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,timeout=300)
        assert result.returncode==0,(command,result.stdout)
        checks.append(dict(command=command,exit_code=result.returncode,output=result.stdout))
    write(OUT/'audit.json',dict(source_identity=manifest['source_identity'],all_qualification_sources_match=True,
        incoming_files_preserved=len(incoming)-1,other_upstream_ledger_bytes_and_keys_preserved=True,
        preserved_brep_inputs=len(preserved),local_changed_paths=local,open_work_packages=28,preserved_stashes=stashes,
        generated_bindings_reconstructible=True,tool_digests_unchanged=True,final_checks=checks,
        raw_log_whitespace=raw,documents={str(path.relative_to(ROOT)):digest(path) for path in documents},
        limits='Source-level integration audit; no whole-history, published-package or full pre-push admission.'))
    assert hashes()==source
    print(json.dumps(dict(incoming_files=len(incoming),local_paths=len(local),open_work_packages=28)))
else:
    raise SystemExit('expected publish or audit')
