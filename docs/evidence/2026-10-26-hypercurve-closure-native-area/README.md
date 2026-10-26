# Native and retained circular area qualification

Base a6ecca9149 plus test.patch. Production code is unchanged. Owner: Hypercurve circular-boundary qualification, P12 and P17–P19. Domain: the original full-scale CPArti J1 A5/A6 finite input pair, including its original tiny displacement.

The full release/all-feature unit suite finished with 1788 passing, 1 failing, and 7 existing ignored tests. Its single failure asserted that the Boolean result must have non-native algebraic fragments. The retained-circle transform repair lets this result stay native. The focused diagnostic reproduces the failure and confirms that the original result still has an exact area and admits a native contour. This was an assertion of a storage variant, not evidence of an incorrect represented set.

The qualification now retains the identical complete Boolean boundary in explicit source charts as an additional view. It still asserts that this view has algebraic fragments. Both the public result and retained view must provide exact area, satisfy the unchanged positive/rectangle-upper-bound expectations, admit native contours, and reconstruct regions whose subsequent exact XOR with the original result is empty. Original coordinates, scales, bounds, and selected-cap/reversal/exterior-traversal controls remain unchanged. No kernel path is disabled to force the old storage choice.

An exploratory equality check between two closed-form area expressions returned undecided (cparti-both-carriers.log). Circle-sector integrals include transcendental functions; that scalar identity is not used as an algebraic set-equality oracle. The retained/native boundary identity and following exact XOR establish the intended geometric agreement. The final test keeps the original analytic area bounds on both views. No general transcendental decision support is claimed.

Final commands:
- cargo test --locked -p hypercurve --lib retained_circular_tests -- --nocapture: all 4 passed (cparti-both-carriers-final.log).
- cargo clippy --locked -p hypercurve --all-targets --all-features -- -D warnings: passed.
- cargo fmt --all -- --check: passed.

The complete final-source release/all-feature suite and repository pre-push matrix are still running. This incremental record does not claim their completion or performance improvement. The prior unit failure, exploratory failed assertion and passing focused result are retained separately.
