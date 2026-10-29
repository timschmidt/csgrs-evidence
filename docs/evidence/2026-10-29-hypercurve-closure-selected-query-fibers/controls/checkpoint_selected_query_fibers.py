from pathlib import Path
import importlib.util,json,os,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-query-fibers'
focus=c/'selected-query-fibers-fix4';lint=c/'selected-query-fibers-preflight-2'
while True:
 if (focus/'results.json').exists() and any(row['exit_code']!=0 or not row['source_stable'] for row in json.loads((focus/'results.json').read_text())):raise SystemExit('Focused checks failed; no checkpoint')
 if (lint/'complete.json').exists():
  l=json.loads((lint/'complete.json').read_text());assert l['exit_code']==0 and l['source_stable']
 if (focus/'complete.json').exists() and (lint/'complete.json').exists():
  f=json.loads((focus/'complete.json').read_text());assert f['all_passed'] and f['groups']==12 and f['source']==l['source'];break
 time.sleep(10)
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();assert source==f['source']
def git(*args,env=None):return subprocess.check_output(['git',*args],cwd=w,env=env,text=True).strip()
assert not git('ls-files','--others','--exclude-standard')
index=c/'selected-query-fibers-source2.index';assert not index.exists();env={**os.environ,'GIT_INDEX_FILE':str(index)}
git('read-tree','HEAD',env=env);git('add','-A',env=env);tree=git('write-tree',env=env);parent=git('rev-parse','HEAD')
commit=git('commit-tree',tree,'-p',parent,'-m','Checkpoint dependent polynomial fibers with retained query roots and bounded discovery',env=env)
git('update-ref','refs/heads/checkpoint-selected-query-fibers-source2',commit,'0'*40)
assert e.source_snapshot()[0]==source
record={'commit':commit,'tree':tree,'parent':parent,'source':source,'focused_groups':f['groups'],'strict_msrv_passed':True,'scope':'Private incremental source checkpoint after focused acceptance and strict MSRV lint. Full owner/downstream qualification, evidence closeout and publication remain required. Dedicated worktree HEAD/index and all frozen source bytes are unchanged.','epoch':time.time()}
(c/'selected-query-fibers-checkpoint.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record,indent=2),flush=True)
