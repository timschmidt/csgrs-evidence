from pathlib import Path
import subprocess,json,platform,os
s=Path(__file__).parent;out={}
for key,cmd in [('uname',['uname','-a']),('rustc',['rustc','+1.95.0','-Vv']),('cargo',['cargo','+1.95.0','-V']),('cpu',['lscpu']),('tool_versions',['objcopy','--version'])]:
 result=subprocess.run(cmd,text=True,capture_output=True);out[key]=dict(command=cmd,returncode=result.returncode,stdout=result.stdout,stderr=result.stderr)
out['affinity']=sorted(os.sched_getaffinity(0));out['timing_cpu']=0;out['timing_aslr']='disabled using setarch x86_64 -R';out['timing_concurrency']='No Cargo/rustc/test/profile workers active during measurements; timing driver sequential';out['warmup_new']=16;out['iterations_new']=10000
(s/'ENVIRONMENT.json').write_text(json.dumps(out,indent=2)+'\n')
