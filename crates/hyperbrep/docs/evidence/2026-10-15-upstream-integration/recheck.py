"""Retry cache-blocked checks without overwriting the initial attempt."""
import sys
import qualify

qualify.OUT = qualify.OUT / "dependencies-ready"
qualify.OUT.mkdir(exist_ok=True)
sys.argv = [sys.argv[0], "--only", "root-acceptance", "foundations"]
qualify.main()
