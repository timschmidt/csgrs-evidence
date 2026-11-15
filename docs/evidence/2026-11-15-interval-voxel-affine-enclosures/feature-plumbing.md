The first draft added a direct optional Hyperinterval dependency. It was replaced
by explicit Hyperreal bridge feature forwarding through the existing Hyperlattice
interval re-export. This reuses the existing dependency graph and avoids changing
the primary root Cargo.lock blob while its 41-path extraction patch is pending.
Hyperlattice-interval/hyperreal and Hyperlattice/interval-hyperreal explicitly opt
into native Real conversions. Primitive no_std/default features stay unchanged.
Validate both bridge paths and the downstream consumer after this change. The
draft patch and first successful tests remain diagnostic, not final evidence.
