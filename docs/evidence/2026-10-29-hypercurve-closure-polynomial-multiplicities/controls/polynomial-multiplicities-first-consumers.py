from pathlib import Path
import subprocess
c=Path(__file__).parent
for name, attempt in [("probe_polynomial_multiplicities.py", "fix2"), ("probe_polynomial_multiplicities_consumers.py", "baseline1")]:
 subprocess.run(["python3", str(c/name), "--attempt", attempt], check=True)
