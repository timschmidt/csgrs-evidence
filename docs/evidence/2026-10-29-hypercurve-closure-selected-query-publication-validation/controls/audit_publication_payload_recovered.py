from pathlib import Path
import gzip,hashlib,json,re,subprocess,time
root=Path(__file__).resolve().parent
repo='/home/tim/Documents/GitHub/workspace/csgrs-evidence.git'
targets=json.loads((root/'publication-targets.json').read_text())
base=targets['published_evidence_base']
head=json.loads((root/'publication-final-commit.json').read_text())['evidence']
subprocess.run(['git','--git-dir='+repo,'merge-base','--is-ancestor',base,head],check=True)
paths=subprocess.check_output(['git','--git-dir='+repo,'diff','--name-only',base,head],text=True).splitlines()
allowed=[n+'/' for n in targets['unpublished_evidence_records']] + [targets['record']+'/']
assert paths and all(any(p.startswith(a) for a in allowed) for p in paths)
patterns={
 'private-key':rb'-----BEGIN (?:RSA |EC |OPENSSH |DSA |PGP )?PRIVATE KEY',
 'github-token':rb'\b(?:gh[pousr]_[A-Za-z0-9]{30,}|github_pat_[A-Za-z0-9_]{40,})\b',
 'aws-access-key':rb'\b(?:AKIA|ASIA)[A-Z0-9]{16}\b',
 'openai-project-key':rb'\bsk-(?:proj-|svcacct-)[A-Za-z0-9_-]{30,}',
 'url-credential':rb'https?://[^\s/@:]+:[^\s/@]+@',
 'credential-assignment':rb'(?i)(?:authorization|password|passwd|secret_access_key|github_token|gh_token|api_key)["\']?\s*[:=]\s*["\']?[^\s"\'${}\[\],:;]{16,}',
}
proc=subprocess.Popen(['git','--git-dir='+repo,'cat-file','--batch'],stdin=subprocess.PIPE,stdout=subprocess.PIPE)
findings=[];total=0;inflated=0;files=[]
for path in paths:
 proc.stdin.write((head+':'+path+'\n').encode());proc.stdin.flush();meta=proc.stdout.readline().split();assert len(meta)==3 and meta[1]==b'blob',(path,meta)
 size=int(meta[2]);data=proc.stdout.read(size);assert len(data)==size;assert proc.stdout.read(1)==b'\n';total+=size
 if path.endswith('.gz'):data=gzip.decompress(data)
 inflated+=len(data)
 matches=[]
 for label,pattern in patterns.items():
  for m in re.finditer(pattern,data):matches.append({'kind':label,'byte_offset':m.start(),'match_sha256':hashlib.sha256(m.group()).hexdigest()})
 if matches:findings.append({'path':path,'matches':matches})
 files.append({'path':path,'bytes':size,'blob':meta[0].decode()})
proc.stdin.close();assert proc.wait()==0
result={'head':head,'already_published_parent':base,'recorded_epoch':time.time(),'changed_files':len(files),'changed_bytes':total,'inspected_bytes_after_decompression':inflated,'credential_pattern_findings':findings,'allowed_paths':allowed,'scope':'Only task-generated Hypercurve qualification records from the aggregate manifest; no unrelated worktree or home-directory export. This signature scan supplements reviewed capture scopes and cannot prove absence of every possible secret.','files':files}
(root/'publication-payload-audit.json').write_text(json.dumps(result,indent=2)+'\n')
assert not findings, 'Potential credentials require scope review before publication'
print({k:result[k] for k in ['head','changed_files','changed_bytes','inspected_bytes_after_decompression','credential_pattern_findings']})
