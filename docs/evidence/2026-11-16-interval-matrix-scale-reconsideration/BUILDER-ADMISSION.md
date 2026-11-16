# Owning fallible-array construction review

The matrix API candidate's five-backend final client has +15,504 file bytes,
+7,232 text bytes and +6,990 named-text bytes. Its matched completed-operation
ABBA medians are 8.45--29.26% slower than the explicit four-scalar control, with
identical materialized outputs and allocation counts. The current size exception
does not waive this cost issue or yet qualify the proposed larger client budget.

Attribution names existing hyperlattice-interval::array_result (4,821 newly
instantiated text bytes), standard array mapping and cleanup paths. The owning
helper first constructs an array of None, then fills it with f(index), then maps
Some values to the result. All vector/matrix and affine callers use this helper.
Search found no second owner helper to reuse. Evaluate a construction algorithm
that forms Option slots in one array::from_fn pass, recording the first error
and never invoking f again after it, then preserves the existing successful
unwrap map. This is not an inlining/layout retry or an eager fallible map.

Properties P4/P5/P6/P10/P18/P20/P36: f must run in increasing index order exactly
until first error; preserve typed E, drop all owned partial values once in the
same order, publish only a complete array, allocate no heap in the helper and
support N=0. Before editing the helper, add/execute independent call/drop-order
witnesses, including nested partial rows. Preserve the original matrix corpus
and initial candidate measurements. Requalify all affected owner benchmark
paths, sizes, controls and downstream tests after the final helper edit. Restore
this helper change if it cannot satisfy the unchanged gates; do not tune fixtures
or silently enlarge its budget. No production retention decision yet.
