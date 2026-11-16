from pathlib import Path
import subprocess,json,hashlib
s=Path(__file__).parent;art=Path('/mnt/development/.interval-refactor-build/path-dynamics-current-admission/artifacts');rows={}
for label in ['fixed','baseline','candidate']:
 p=art/(label+'-interface-release');sections=subprocess.check_output(['size','-A',str(p)],text=True);(s/(label+'-interface-sections.txt')).write_text(sections);sizes={a[0]:int(a[1]) for line in sections.splitlines() if len(a:=line.split())==3 and a[0].startswith('.')};hashes={}
 for section in ['.text','.rodata','.data','.eh_frame']:
  temp=s/('section-'+label+'-'+section[1:]+'.tmp');subprocess.run(['objcopy','--dump-section',section+'='+str(temp),str(p),'/dev/null'],check=True,capture_output=True);hashes[section]=hashlib.sha256(temp.read_bytes()).hexdigest();temp.unlink()
 rows[label]={'path':str(p),'file':p.stat().st_size,'text':sizes['.text'],'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'sections':sizes,'section_sha256':hashes}
assert rows['fixed']['sha256']==rows['baseline']['sha256']
caps={'file':{'incremental_bytes':4096,'incremental_percent':1,'cumulative_bytes':16384,'cumulative_percent':2},'text':{'incremental_bytes':1024,'incremental_percent':0.5,'cumulative_bytes':4096,'cumulative_percent':1}}
account={};failures=[]
for metric,cap in caps.items():
 fixed=rows['fixed'][metric];base=rows['baseline'][metric];candidate=rows['candidate'][metric];delta=candidate-base;total=candidate-fixed;ip=100*delta/base;cp=100*total/fixed;ok=delta<=cap['incremental_bytes'] and ip<=cap['incremental_percent'] and total<=cap['cumulative_bytes'] and cp<=cap['cumulative_percent']
 account[metric]={'baseline':fixed,'previous_retained':base,'retained':candidate,'incremental_growth_bytes':delta,'incremental_growth_percent':ip,'net_growth_bytes':total,'growth_percent':cp,'accepted_positive_growth_bytes':max(0,total),'remaining_cumulative_bytes':cap['cumulative_bytes']-max(0,total),'remaining_cumulative_percent':cap['cumulative_percent']-max(0,cp),'caps':cap,'passes_both_caps':ok}
 if not ok:failures.append(metric)
result={'artifact':'alumina-interface/crates/alumina-interface-core/src/lib.rs#release-tests','fixed_csgrs':'c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb','fixed_interface':'f5341f36803ad77c856313315d67ac8b3bb63f9a','fixed_firmware':'2d68e82b7341db7b747b20e4ad1455a4c1113a00','target':'x86_64-unknown-linux-gnu','role':'additional canonical digest assertion in existing test','code_metric':'complete final .text including emitted monomorphized code; no named-symbol claim for stripped artifact','variants':rows,'metrics':account,'failures':failures}
(s/'interface-size-account.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({'metrics':account,'failures':failures}));assert not failures
