# Paired boundary controls

The original owner suite keeps its source stable in interval-profile-static/csgrs.
The second checkout, interval-promotion-boundaries/csgrs, uses the same accepted
54e6337fe42ea4ac92f5585cde27349e1f7ad79c parent and the exact archived full candidate
patch. Each boundary comparison builds both variants at the same second-checkout
path, with the same target directory, compiler, options, and lockfiles.

boundary_controls.py builds the unchanged strict dispatch corpus, an external copy
of that complete corpus selecting APPROXIMATE_512, attributed successive_operations,
and the WASM UI. Native and WASM builds may overlap because these are build and
functional controls, not runtime benchmarks. The two source variants never overlap.
The script restores the second checkout to the clean parent before publishing its
terminal receipt. The original candidate checkout is untouched.

The initial candidate-only WASM and approximate dispatch results remain preserved.
Paired boundary comparisons use boundary-controls/ records, not cross-path size
comparisons. Attributed successive executables embed distinct compiler/source build
records; their raw binary sizes include that metadata. Report those sizes and code
sections separately. Native CLI and all 25 owner benchmark size comparisons remain
bound to the original same-path builds.

build_successive.py is an earlier, unexecuted sequential alternative. It is
superseded by boundary_controls.py and must not be run as an additional control.
Owner runtime benchmarks wait for the owner suite, supplemental checks, and all
boundary builds; they require successful controls and no WASM binary growth.
