from pathlib import Path
import json
root=Path(__file__).resolve().parent
p=root/'matrix.json';m=json.loads(p.read_text())
m['steps']=[x for x in m['steps'] if x['id']!='ci-audit-zizmor-0-0']
assert len(m['steps'])==131 and len(m['extra_clippy'])==124
m['extra_clippy'].append(json.loads((root/'nightly-fuzz-release-clippy.json').read_text()))
m['steps'].append({'id':'ci-audit-zizmor-0-0','origin':{'repository_rule':'AGENTS.md pre-push CI configuration changes'},'cwd':'.','command':'zizmor --pedantic --strict-collection .','env':{'RUSTUP_TOOLCHAIN':'stable'},'target_group':'stable-normal','kind':'workflow','timeout_seconds':21600})
p.write_text(json.dumps(m,indent=2)+'\n')
