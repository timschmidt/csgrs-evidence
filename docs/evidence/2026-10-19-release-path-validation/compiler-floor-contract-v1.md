# Compiler-floor package verification

Keep the full E100 independent fourteen-package selection, source revision,
all features, native Cargo verification, resource ceilings and failure history.
After the stable run terminates, run that complete package command with the
installed, hash-pinned Cargo/rustc/rustdoc 1.95.0 in a fresh target and Cargo home.
The official registry children are mounted read-only under writable parent
directories, allowing Cargo to create separate temporary-registry extractions.
No existing registry file, source, dependency requirement or feature changes.

Retain both independently generated archive sets, every source-member comparison,
generated lockfile and command. Compare complete archive bytes and normalized
manifests/locks rather than assuming two Cargo versions generate identical
artifacts. Only identical archives may share the two-compiler validation claim;
otherwise qualify each result against its actual generated graph separately.
This is a prepublication compiler-floor check. It does not turn an unavailable
public version into a shipped dependency or complete the external root pipeline.
