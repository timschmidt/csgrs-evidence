# Retain checked proofs at construction and import

The query-only candidate passes all three direct graph-proof tests, owned
folding and the predicate regression. It still fails both lazy interchange
matrices and cold reciprocal composition. Bounded ring quotient reduction
intentionally reads immediate retained facts instead of walking a graph;
that contract must remain intact.

Reuse the same checked pi-multiple witness in native prescaled sine/tangent
construction and Node deserialization. Imported nodes retain only facts
proved from their actual immutable expression. Keep all other imported
metadata defaults, the exact-sign query fallback, the wire representation,
and the constant-time immediate-sign query unchanged. Do not trust a Real
class tag or imported cache hints. No new cache allocation or field is needed.

The proof has at most 32 graph-node inspections including rational leaf
lookahead, not a coefficient-byte or total-work bound. Deserialization gains
this bounded graph inspection for each sine/tangent node. Large coefficient
work and existing arbitrary graph import are externally contained, as in the
original contract. Preserve the failed query-only candidate and all outcomes.
Strengthen import tests to require the proof already retained before queries.
