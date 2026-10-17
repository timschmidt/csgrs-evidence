"""Run a fresh process observation under the same audit output guards."""
from pathlib import Path
import runpy
import sys

sys.dont_write_bytecode = True
W = Path(__file__).resolve().parent
scope = runpy.run_path(str(W / 'runner_v1.py'))
scope['run']('process-observation-v1', ['python3', str(W / 'observe_process_v1.py')], scope['ROOT'])
