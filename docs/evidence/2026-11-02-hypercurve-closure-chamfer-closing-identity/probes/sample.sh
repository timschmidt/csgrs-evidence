#!/bin/bash
# usage: sample.sh BIN FILTER OUTDIR DELAY COUNT INTERVAL
B=$1; F=$2; O=$3; D=$4; N=$5; I=$6
mkdir -p $O; rm -f $O/s*.txt
cd $O; $B --ignored --nocapture --test-threads=1 --exact $F > $O/run.log 2>&1 &
PID=$!
sleep $D
for i in $(seq 1 $N); do eu-stack -p $PID > $O/s$i.txt 2>&1; sleep $I; done
kill $PID; wait $PID 2>/dev/null
python3 - $O <<'PY'
import sys,glob,re,collections
d=sys.argv[1]; samples=[]
for f in sorted(glob.glob(d+'/s*.txt')):
    txt=open(f).read(); threads=txt.split('TID ')
    best=max(threads,key=lambda t:t.count('\n#'))
    fr=[re.sub(r'^#\d+\s+0x[0-9a-f]+\s+','',l).strip() for l in best.splitlines() if l.startswith('#')]
    samples.append([re.sub(r'::h[0-9a-f]{16}','',x) for x in fr])
cnt=collections.Counter()
for s in samples:
    for x in set(s): cnt[x]+=1
def short(x):
    m=re.findall(r'(?:\d+)([A-Za-z_][A-Za-z0-9_]*)',x)
    return '::'.join(m[-3:]) if m else x[:120]
s=samples[len(samples)//2]
for x in reversed(s): print(cnt[x], short(x))
PY
