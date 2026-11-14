from pathlib import Path
import subprocess,json,hashlib,textwrap
s=Path(__file__).parent;r=Path('/mnt/development/alumina-interface-validation');base=json.loads((s/'BASELINE.json').read_text());expected=json.loads((s/'browser-extraction.json').read_text());rows={}
for name,start,end,tail in [('src/browser_worker.rs','    fn apply_capability_transfer(', '    fn apply(&mut self, envelope:', '    }\n\n'),('src/lib.rs','fn show_live_network_scan(', '#[cfg(target_arch = "wasm32")]\nfn erase_secret_text','}\n\n')]:
 text=(r/name).read_text();block=text[text.index(start):text.index(end,text.index(start))];body=block[block.index(' {\n')+3:-len(tail)];digest=hashlib.sha256(textwrap.dedent(body).encode()).hexdigest();assert digest==expected[name]['extracted_body_sha256'],(name,digest);rows[name]=dict(formatted_body_exact=True,sha256=digest)
paths=[line[3:] for line in base['alumina-interface']['status'].splitlines()];pending=subprocess.check_output(['git','diff','--binary','--',*paths],cwd=r);assert pending==(s/'interface-pending.patch').read_bytes()
rows['inherited_eight_paths_identical']=True
for repo in base:
 root=Path('/mnt/development')/repo
 def git(*args):return subprocess.check_output(['git',*args],cwd=root)
 assert git('rev-parse','HEAD').decode().strip()==base[repo]['head']
 assert hashlib.sha256(git('diff','--cached','--binary')).hexdigest()==base[repo]['staged_sha256']
 assert hashlib.sha256(git('diff','--binary')).hexdigest()==base[repo]['unstaged_sha256']
rows['main_repositories_unchanged']=True
(s/'preservation.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(rows,indent=2))
