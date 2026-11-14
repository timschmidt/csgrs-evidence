import yaml,subprocess
from pathlib import Path
p=Path('/mnt/development/csgrs/.github/workflows/hyperdynamics.yml');w=yaml.safe_load(p.read_text())
for step in w['jobs']['quality']['steps']:
 if 'run' in step:subprocess.run(['bash','-n','-c',step['run']],check=True)
print('all workflow shell bodies parse')
