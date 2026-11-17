"""Synthetic adversarial controls, never benchmark evidence."""
from pathlib import Path
import copy
import importlib.util
import json
import tempfile
import time

STAGE = Path(__file__).parent
spec = importlib.util.spec_from_file_location('analyzer', STAGE/'analyze-successive.py')
a = importlib.util.module_from_spec(spec)
spec.loader.exec_module(a)


def write(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data)+'\n')


def mutate(path, change):
    data = json.loads(path.read_text())
    change(data)
    write(path, data)


def fixture(stage, mode):
    expected = json.loads((STAGE/'successive-runtime-corpus-review.json').read_text())['expected']
    write(stage/'successive-runtime-corpus-review.json', dict(expected=expected))
    write(stage/'progress.json', dict(base='baseline-revision'))
    write(stage/'candidate.json', dict(revision='candidate-revision'))
    write(stage/'successive-source-review.json', [dict(files={'scripts/successive-operations.py': 'driver-hash'})]*7)
    write(stage/'successive-builds.json', [dict(label=label, revision=rev, size={'sha256':label+'-hash'}) for label, rev in [('current','baseline-revision'), ('combined','candidate-revision')]])
    folder = stage/f'successive-{mode}-results'
    write(folder/'plan.json', dict(mode=mode, expected_steps=expected, order=a.ORDER, per_process_budget_seconds=900, driver_kill_grace_seconds=5))
    write(folder/'completion.json', dict(terminal=True, commands=8, full_rows_per_command=200, all_geometric_rows_identical=True))
    runs = []
    write(stage/f'successive-{mode}-timing-host-preflight.json', dict(competing=[]))
    for i, label in enumerate(a.ORDER):
        name=f'{i}-{label}'
        cost=100 if label=='current' else 200
        rows=[]
        for chain, length in expected.items():
            for step in range(1,length+1):
                identity=[chain,str(step),'certified','yes' if mode=='validated' else '-', '12','8','24','0','1','1','1']
                values=[str(cost),str(cost) if mode=='validated' else '-', '0',str(cost),'7','11','1']
                rows.append('\t'.join(identity+values))
        path=folder/name/'rows.tsv';path.parent.mkdir()
        path.write_text('\t'.join(a.COLUMNS)+'\n'+'\n'.join(rows)+'\n# completed\n')
        write(path.with_name('run.json'), dict(status='completed', completion_marker=True, rows=200, outcomes={'certified':200}, exit_code=0, process_returncode=0, driver_exit_code=0, build={'source':{'revision':'baseline-revision' if label=='current' else 'candidate-revision'}}, binary_sha256=label+'-hash', driver_sha256='driver-hash', arguments=[] if mode=='validated' else ['--untouched'], host={'affinity':[0]}, timeout_seconds=900, rows_sha256=a.digest(path)))
        runs.append(dict(index=i,label=label,exit_code=0,full_rows=200,geometric_rows_identical=True,seconds=1 if label=='current' else 2,sha256=label+'-hash'))
        for boundary in ['before','after']:
            write(stage/f'successive-{mode}-timing-host-{name}-{boundary}.json',dict(competing=[]))
    write(folder/'runs.json',runs)
    return folder


def change_journal(folder, edit, repair_hash=True):
    path=folder/'0-current/rows.tsv'
    path.write_text(edit(path.read_text()))
    if repair_hash:
        mutate(path.with_name('run.json'),lambda r:r.update(rows_sha256=a.digest(path)))


start=time.time();checks=[]
for mode in ['validated','untouched']:
    with tempfile.TemporaryDirectory(prefix='successive-synthetic-') as tmp:
        stage=Path(tmp);folder=fixture(stage,mode);result=a.analyze(stage,mode)
        assert len(result['step_rows'])==200 and len(result['chains'])==21
        assert not result['adopted'] and not result['memory_account_adopted']
        square=result['chains'][0]['metrics']
        assert square['step_ns_sum']['values_in_process_order'][0]==3200
        assert square['peak_growth_bytes_maximum']['values_in_process_order']==[7]*8
        assert square['requested_live_during_steps_maximum']['values_in_process_order']==[18]*8
        assert result['step_rows'][0]['metrics']['step_ns']['geometric_mean_ratio']==2
        assert result['step_rows'][0]['metrics']['drop_ns']['zero_baseline_pairs']==[0,1,2,3]
        assert result['step_rows'][0]['metrics']['drop_ns']['geometric_mean_ratio'] is None
        assert bool('validation_ns' in result['step_rows'][0]['metrics']) == (mode=='validated')
        assert result['adverse_steps'] and result['adverse_chains']
        json.dumps(result,allow_nan=False)
        checks.append(mode+': exact 2x adverse controls, complete rows, absent/zero distinction, maxima not sums, no admission')

mutations = {
 'missing-completion':lambda s,f:(f/'completion.json').unlink(),
 'incomplete-campaign':lambda s,f:mutate(f/'completion.json',lambda r:r.update(commands=7)),
 'reordered-processes':lambda s,f:mutate(f/'runs.json',lambda r:r.reverse()),
 'failed-process':lambda s,f:mutate(f/'runs.json',lambda r:r[0].update(exit_code=1)),
 'zero-duration':lambda s,f:mutate(f/'runs.json',lambda r:r[0].update(seconds=0)),
 'wrong-source':lambda s,f:mutate(f/'0-current/run.json',lambda r:r['build']['source'].update(revision='wrong')),
 'wrong-binary':lambda s,f:mutate(f/'0-current/run.json',lambda r:r.update(binary_sha256='wrong')),
 'wrong-driver':lambda s,f:mutate(f/'0-current/run.json',lambda r:r.update(driver_sha256='wrong')),
 'filtered-command':lambda s,f:mutate(f/'0-current/run.json',lambda r:r.update(arguments=['square'])),
 'wrong-affinity':lambda s,f:mutate(f/'0-current/run.json',lambda r:r['host'].update(affinity=[0,1])),
 'changed-budget':lambda s,f:mutate(f/'plan.json',lambda r:r.update(per_process_budget_seconds=1800)),
 'wrong-journal-hash':lambda s,f:change_journal(f,lambda t:t.replace('100','101',1),False),
 'missing-marker':lambda s,f:change_journal(f,lambda t:t.replace('# completed\n','')),
 'trailing-after-marker':lambda s,f:change_journal(f,lambda t:t+'junk\n'),
 'schema-change':lambda s,f:change_journal(f,lambda t:t.replace('step_ns','time_ns',1)),
 'missing-row':lambda s,f:change_journal(f,lambda t:'\n'.join(t.splitlines()[:1]+t.splitlines()[2:])+'\n'),
 'uncertified':lambda s,f:change_journal(f,lambda t:t.replace('certified','approximate',1)),
 'invalid-topology':lambda s,f:change_journal(f,lambda t:t.replace('\tyes\t','\tno\t',1)),
 'negative-cost':lambda s,f:change_journal(f,lambda t:t.replace('\t100\t','\t-1\t',1)),
 'geometry-mismatch':lambda s,f:change_journal(f,lambda t:t.replace('\t12\t8\t','\t14\t8\t',1)),
 'competing-host':lambda s,f:mutate(s/'successive-validated-timing-host-0-current-after.json',lambda r:r.update(competing=[{'pid':1}])),
 'missing-host-record':lambda s,f:(s/'successive-validated-timing-host-preflight.json').unlink(),
 'changed-corpus':lambda s,f:mutate(s/'successive-runtime-corpus-review.json',lambda r:r['expected'].update({'square drills':31})),
}
for name, mutation in mutations.items():
    with tempfile.TemporaryDirectory(prefix='successive-synthetic-') as tmp:
        stage=Path(tmp);folder=fixture(stage,'validated');mutation(stage,folder)
        try:a.analyze(stage,'validated')
        except (ValueError,FileNotFoundError):checks.append(name+': rejected')
        else:raise AssertionError(name+' was accepted')
# Unequal four pairs preserve order; candidate may improve or regress, including zero.
x=a.comparison([1,2,3,1,0,1,0,5])
assert [p['delta'] for p in x['adjacent_pairs']]==[1,2,-1,5]
assert [p['positive_growth'] for p in x['adjacent_pairs']]==[1,2,0,5]
assert x['zero_baseline_pairs']==[3] and x['geometric_mean_ratio'] is None
checks.append('mixed and zero baseline pairs preserve positive growth without offsets')
report=dict(scope='Synthetic analysis controls only; no measured runtime, geometric qualification or source admission',checks=checks,passed=len(checks),seconds=time.time()-start,analyzer_sha256=a.digest(STAGE/'analyze-successive.py'),test_sha256=a.digest(Path(__file__)))
write(STAGE/'successive-analysis-controls.json',report)
print(json.dumps(report,indent=2))
