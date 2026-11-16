from pathlib import Path
import subprocess,time
s=Path(__file__).parent
while not (s/'owner-benchmarks-round0.json').exists():time.sleep(2)
raise SystemExit(subprocess.call(['python3','-u',str(s/'repeat_arc.py')]))
