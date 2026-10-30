from pathlib import Path
import subprocess
c=Path(__file__).parent
for phase, attempt in [("focus", "final3"), ("full", "final1")]:
    command=["python3",str(c/"qualify_polynomial_multiplicities.py"),"--phase",phase,"--attempt",attempt]
    print("START",command,flush=True)
    result=subprocess.run(command)
    print("FINISH",result.returncode,flush=True)
    if result.returncode:
        raise SystemExit(result.returncode)
print("Multiplicity affected qualification complete; no commit or push.",flush=True)
