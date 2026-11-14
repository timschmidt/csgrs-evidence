# Automatic QR evolution — retained opt-in capability

Source: `0603beace59f538e581d14dcf31dc237a39c42c4`, parent
`8d1a99ded577e44e36668fb540599c6d9c609ad9`. Eight paths are recorded in
SOURCE.json. This is a new bounded strategy, not a performance refactor or a
claim of general wrapping reduction. Nothing was pushed.

## Completed contract

Hyperdynamics now owns finite-window automatic QR proposals and certified
selection between a proposed and incoming chart. It delegates QR, chart
inversion/reconstruction and direct transport to existing Hypersolve authority;
existing native Picard or trajectory Taylor evolution certifies both branches.
The exact midpoint Jacobian Euler basis is a proposal, never a flow certificate.
Both branches and their source projections must finish. Exact maximum source
endpoint diameter chooses the smaller enclosure; ties choose the recentered
proposal. The next window consumes the chosen chart's native endpoint.

The report retains source identity, incoming chart, original request/options,
Jacobian/midpoint selection, exact proposed basis/origin, QR/transport proofs,
both native attempts, prepared coefficients, projections and exact comparison.
Whole-request endpoint access is separate from stopped-window stages and the
complete-window prefix. No failure silently becomes a retained-chart success.
The configured finite window/native limits, original domain/QR/transport/Taylor
failures, cancellation and actual resource exhaustion remain typed.

The shared budget covers native arithmetic, charged graph work and aggregate
record counts. Exact scalar payload/refinement, nested retained proof/transform
graphs, vector capacity, heap bytes and within-scalar cancellation remain outside
that bound. A singular proposed basis can stop an otherwise solvable ODE. The
strategy promises neither a globally best frame nor whole-horizon non-widening,
exact reachable-set equality, arbitrary-field completeness or lower cost.

## Qualification

The missing method was reproduced on the parent before implementation. Twelve
new maintained tests cover exact constant/affine flows, two rational-series
rotation oracles, uncertain rotating input, selected basis/transport relations,
output as next input, singular proposals and original domain failures,
empty/unit/identity and invalid-empty inputs, limits, explicit Picard/Taylor
strategies, budget cutoffs, cancellation and retry, fresh-process replay,
zero-dispatch proof inspection and longer certified steps for a tilted field.

After the final test/benchmark edit, isolated owner all-feature tests passed:
128 tests across16 groups. Strict all-feature/all-target Clippy, warnings-denied
rustdoc, disabled-feature check, qr-evolution WASM check, workspace formatting
and nine downstream Hyperphysics certified-flow tests passed. These physics
checks establish compatibility of the affected feature combination; they are
not a new physical-law or QR-specific physics consumer claim.

After integration, the combined main checkout passed139 owner tests across19
groups, strict owner Clippy, the same nine physics tests, formatting and the
repository budget. Its extra11 tests belong to the preexisting staged extraction.
The isolated budget check predates staging new untracked paths; the main budget
is authoritative for retained files:4217 files/143799878 bytes before the ledger.
The full pre-push/release matrix was not run. No CI configuration changed.

REVIEW.json records unchanged existing coordinate method bodies and byte-identical
QR, transition and evolution modules. Only the coordinate carrier's description
and a gated module declaration change there. No kernel predicate order changed.
The initial review script used an empty Git glob pathspec and failed; its original
script/log remain. The corrected review filters the complete changed-path list.

## Preserved failures and decisions

- Forced QR with ordinary Picard, then displacement-based Picard, failed the
  unchanged point-rotation width<1 fixture. The displacement result width was
  approximately3.05386677658. Both candidates and logs remain.
- A temporary extraction of the source-projection wrapper was rejected and
  restored byte-for-byte. Its patch remains as rejected evidence.
- The first Taylor test mistakenly required a narrow true enclosure to contain
  a complete coarse decimal oracle bracket. The old source/log remain. The
  correction uses12 rational alternating-series terms plus the next-term bound,
  independently checks the old coarse bracket, and preserves the original field,
  initial data, horizon, native cap and width<1 assertion.
- Unconditional Taylor/QR adoption then failed the uncertain rotating-line
  fixture's width<10 requirement. The final two-branch selector preserves that
  fixture and requirement. Its selected retained chart completes with the same
  widths as the fixed-chart baseline. Both branch costs are paid and retained.
- An earlier cost build was deliberately interrupted with exit130 after the
  failed uncertainty case changed the candidate. Final measurements use the
  corrected implementation. Initial compilation/Clippy failures remain logged.
- The tilted equilibrium fixture was added without replacing either earlier
  fixture. The old two-fixture artifacts/observer/measurements remain separately.

## Measured completed-workload costs

All benchmarks use EnclosurePolicy::default: precision -64, graph entries1e6,
graph work1e8, scalar bits16384, scalar work1e12. The new benchmark reconstructs
Taylor coefficients/frames each operation, materializes every source tube/endpoint,
checks independent analytic expectations and width limits, then destroys output.
Field construction is outside both operation timers. Both exact source sets and
horizons agree; selected proofs have additional evidence that the fixed flow does
not generate. This is a capability-cost comparison, not equal-proof speedup.

| Fixture | Fixed / automatic median ms | Ratio | Fixed / automatic allocated bytes | Fixed / automatic retained bytes |
| --- | ---: | ---: | ---: | ---: |
| constant, uncertain line |4.252397 /8.854451|2.082|2283256 /4808920|377472 /849436|
| rotating uncertain line |13.561274 /34.745927|2.562|6131872 /21441244|586208 /1596364|
| tilted exact equilibrium |2.742795 /25.760872|9.392|1506082 /12742237|175168 /532836|

The first two horizons are3/2 with two3/4 windows and native cap1/16; the tilted
field is J=[[7,24],[24,-7]]/25 at zero over7/4, two7/8 windows, native cap7/8.
All use order3. Constant widths are[2,0]; rotating widths approximately
[4.704830624985338,4.258571489176396]; tilted widths[0,0]. Fixed and selected
widths agree in all three. The tilted fixed chart takes4segments; the selected
QR proofs take1segment per window. This is a certified-step-capacity witness,
not total runtime improvement. The first incumbent branch alone takes2segments.

Allocation peaks fixed/automatic are378416/852636,592352/1604828 and
193720/552932 bytes. Six independent retention epochs return to zero after drop.
These are operation-owned allocator payloads; held source/fixture state and the initial validation proofs,
allocator overhead and the process are excluded. Graph/scalar counts in the
allocation log describe automatic runs only, not matched fixed-run work ratios.

Three warm timing trials used100 operations after4 warmups, CPU0, ASLR disabled,
one stable executable pathname. Compiler1.95.0 and Xeon E5-2680v2 are recorded.
The separate fresh-process driver reproduces the same full contracts, including
checks/destruction, from newly constructed source/chart state. Three cold single
operations per fixture/mode and three warm100-operation runs after4warmups used
that one driver binary. Cold fixed/automatic median ms:5.894810/10.861102,
16.378018/36.215249,3.665838/29.934389. Warm medians there:
4.275262/8.902673,13.556893/34.500162,2.686831/26.287056.
Fresh-process loader/startup is outside the operation timer. Driver layout differs
from the maintained benchmark; compare cold/warm only within that driver.

Existing six QR-coordinate controls ran baseline/default/enabled then reversed,
10 samples,0.2s warmup,0.5s measurement, pinned CPU0 with ASLR disabled and common
executable path. Their exact COMPLETED transcripts agree. Median-of-trial-median
ratios were0.9914–1.0027 for default and0.9853–1.00595 with the new feature enabled.
These short controls show no material regression in this corpus, not a universal
performance result. Raw Criterion samples and both adverse/new costs are retained.

Baseline/default/enabled old control binary sizes are6665448/6665472/6677992 bytes.
Default's allocated ELF sections and addresses match baseline except build ID;
raw size still grows24bytes. Enabled .text grows6816bytes; its raw size grows
12544bytes. The new three-fixture benchmark is6962512bytes, .text3969527bytes.
Common source-path remapping, full section/symbol records and hashes are retained.
No claim is made about all binaries, firmware size or general monomorphization.

## Preservation and open work

Main's41 staged paths were preserved by alternate-index integration and exact
reverse-patch reconstruction. The pending diff is unchanged except blob IDs and
hunk offsets; its new SHA256 is
7fb21ee90a685a7050b0336331cf4f1b2c5e40c3c2f8d41e358efa54f3b66009.
Interface's8 unstaged paths and Firmware's clean state are unchanged. All37 prior
frozen stage digests match. The evidence archive receives only this new record.

Retain the bounded opt-in feature for automatic certified proposal/selection and
composition. Reject the unconditional-adoption strategies and any general
speedup/narrowing claim. Independent-noise/sensitivity retention, automatic frame
strategies with better useful-work cost, cross-order preparation sharing, wider
consumers, competitive external portfolios, remaining migrations, Phase11
performance gates, embedded flash/stack/cycles/HIL and coordinated release remain
open. This increment does not complete Phase13 or the overall goal.
