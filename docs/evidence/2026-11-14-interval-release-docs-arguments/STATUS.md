# Release documentation argument transport retained

The original release loop silently omitted rustdoc-args while claiming to check
local docs.rs configurations. The actual loop at the recorded base failed the
pre-edit offline Rust fixture because its required docsrs cfg was absent. The
candidate fixes that reproduction without changing any production Rust source,
manifest, lockfile, runtime predicate, canonical format or CI configuration.

The maintained helper uses Cargo's encoded rustdoc flags, retains argument
boundaries, scopes each package's flags to its own subprocess and keeps -D warnings
independent of ambient rustdoc settings. It validates the complete requested
package set and rejects unhandled metadata before building any documentation.
Current support covers all-features, no-default-features, features and rustdoc-args.
This is a local configuration check; it does not emulate hosted docs.rs targets,
nightly compiler or service environment. Other metadata keys fail explicitly.

The maintained compiled fixture checks actual docsrs consumption, all-feature and
selected-feature/default suppression, a whitespace-bearing HTML-header path,
rendered HTML inclusion, per-package flag isolation, broken-link warning rejection,
missing packages and unsupported metadata. Intentional negative outcomes remain
failures. The fixture passes independently on Rust 1.95 and stable 1.99, in both
complete release runs, and after integration. The initial shellcheck invocation
without -x reported only its existing sourced helper; shellcheck -x passes.

Both full release checks use clean source, mandatory package verification and no
allow-dirty/no-verify flags. Each verifies 21 archives, passes all 21 local
workspace documentation configurations and passes all 27 existing client checks:
20 README programs, the modeling user path, the packaged interval-ranges example,
C, C++, Python, Go and TypeScript. TypeScript is compilation, not browser runtime.
The external consumer resolves every released crate from unpacked archives with
no workspace source paths. Archive digests and clean VCS revisions are retained.
Every documentation command and rustdoc argument list is recorded; HyperDRC gets
--cfg docsrs and every crate keeps -D warnings. The earlier package-cache regression
also remains in the release path. No second archive-reproducibility campaign is
claimed, and run durations are not matched performance measurements.

Integration verifies exact patch reversal and preserves all 41 staged extraction
paths byte for byte, plus Interface's eight pending paths and firmware's clean
revision. The six integrated fixture/shell/format/diff/budget checks pass. All 48
prior frozen evidence records verify unchanged. No kernel performance claim,
complete phase admission, full pre-push matrix, push or publication is made.

Phase 14 remains open for broader platform/feature/HIL and hosted distribution
qualification. The optional Hypervoxel publication blocker, cost-rejected interval
migrations, unaccepted dynamics extraction and other plan obligations remain open.
