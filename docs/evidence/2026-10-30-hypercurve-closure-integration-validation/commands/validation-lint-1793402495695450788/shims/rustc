#!/usr/bin/env python3
"""Resolve the same channel aliases used by the audited Cargo invocation."""
import os,sys
arguments=[('+'+os.environ['CSGRS_CLOSEOUT_NIGHTLY']) if a=='+nightly' else ('+'+os.environ['CSGRS_CLOSEOUT_STABLE']) if a=='+stable' else a for a in sys.argv[1:]]
os.execv(os.environ['CSGRS_CLOSEOUT_REAL_RUSTC'],[os.environ['CSGRS_CLOSEOUT_REAL_RUSTC'],*arguments])
