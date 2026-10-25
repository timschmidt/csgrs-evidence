"""Reproduce original serde tree bytes from retained graph without storing a tree."""
from pathlib import Path
import hashlib,json,os,resource,signal,subprocess,time
raw=Path(__file__).resolve().parent;record=raw/('graph-tree-replay-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
source=raw/'capture-graph-1792957978018326410/stroke_fillet_stroke_of_a_cubic_arc_path_completes'
cases=[(0,5874413454,'872905f8b1a1320f36ec83b0d102e0f97551878c7ce0003b1dd4f5f7af9555c3',False),(1,476352512,'5e061707eeb4dbee499fb683d435f2454c9ddb8b687b0f55922ec0c694101dc8',True)]
wire=lambda x:json.dumps(x,separators=(',',':'))
def rational(q):return {k:q[k] for k in ['sign','numerator','denominator']}
results=[]
for number,expected_bytes,expected_sha,partial in cases:
 path=source/f'real-{number:06}.json';d=json.loads(path.read_text());nodes=d['computable']['nodes'];rows=[]
 for i,node in enumerate(nodes):
  kind,args=next(iter(node.items()));assert len(node)==1
  def ref(v):
   assert set(v)=={'r16_node_ref'} and 0<=v['r16_node_ref']<i
   return v['r16_node_ref']
  a=b=-1;middle=suffix=''
  if kind=='Int':prefix=wire(node)
  elif kind=='Ratio':prefix=wire({'Ratio':rational(args)})
  elif kind in ['Add','Multiply']:
   a,b=map(ref,args);prefix='{"'+kind+'":[{"internal":';middle='},{"internal":';suffix='}]}'
  elif kind in ['Negate','Inverse','Sqrt']:
   a=ref(args);prefix='{"'+kind+'":{"internal":';suffix='}}'
  elif kind=='Offset':
   a=ref(args[0]);prefix='{"Offset":[{"internal":';suffix='},'+str(args[1])+']}'
  else:raise AssertionError(kind)
  rows.append('{'+','.join([json.dumps(prefix),json.dumps(middle),json.dumps(suffix),str(a),str(b)])+'}')
 prefix=wire({'rational':rational(d['rational']),'class':d['class']})[:-1]+',"computable":{"internal":'
 code=r'''#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
struct Node {const char *prefix,*middle,*suffix;int a,b;};
static const struct Node nodes[] = {NODE_ROWS};
static uint64_t written=0;
static const uint64_t limit=BYTE_LIMIT;
static void put(const char *s){
 size_t n=strlen(s);if(limit && n>limit-written)n=(size_t)(limit-written);
 if(n && fwrite(s,1,n,stdout)!=n)exit(3);written+=n;
 if(limit && written==limit){if(fflush(stdout))exit(4);exit(0);}
}
static void emit(int i){const struct Node *n=&nodes[i];put(n->prefix);if(n->a>=0)emit(n->a);put(n->middle);if(n->b>=0)emit(n->b);put(n->suffix);}
int main(void){static char buffer[1048576];setvbuf(stdout,buffer,_IOFBF,sizeof(buffer));put(ROOT_PREFIX);emit(ROOT_ID);put("}}");return fflush(stdout)?5:0;}
'''.replace('NODE_ROWS',',\n'.join(rows)).replace('BYTE_LIMIT',str(expected_bytes if partial else 0)).replace('ROOT_PREFIX',json.dumps(prefix)).replace('ROOT_ID',str(d['computable']['root']))
 c=record/f'graph-{number}.c';c.write_text(code);binary=record/f'graph-{number}-binary'
 subprocess.run(['cc','-O2',str(c),'-o',str(binary)],check=True,stdout=subprocess.DEVNULL,stderr=(record/f'compile-{number}.stderr').open('w'))
 start=time.monotonic();digest=hashlib.sha256();count=0
 def limits():resource.setrlimit(resource.RLIMIT_AS,(1024**3,1024**3))
 with (record/f'replay-{number}.stderr').open('w') as err:
  p=subprocess.Popen(['timeout','120',str(binary)],stdout=subprocess.PIPE,stderr=err,preexec_fn=limits,start_new_session=True)
  while chunk:=p.stdout.read(1024*1024):
   count+=len(chunk);digest.update(chunk)
   if count>expected_bytes:os.killpg(p.pid,signal.SIGKILL);break
  status=p.wait()
 result={'source':str(path),'graph_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'partial_prefix':partial,'status':status,'bytes':count,'sha256':digest.hexdigest(),'expected_bytes':expected_bytes,'expected_sha256':expected_sha,'matches':status==0 and count==expected_bytes and digest.hexdigest()==expected_sha,'seconds':time.monotonic()-start}
 results.append(result);(record/'results.json').write_text(json.dumps(results,indent=2)+'\n');print(json.dumps(result),flush=True)
 assert result['matches']
(record/'completion.json').write_text(json.dumps({'complete':True,'scope':'Exact original serde tree and aborted second-prefix bytes regenerated from retained compact graphs. Output streamed to SHA-256 only; no large tree file created. Existing compressed exports remain untouched until archive retention is decided.','results':results},indent=2)+'\n')
print('TREE REPLAY COMPLETE',record,flush=True)
