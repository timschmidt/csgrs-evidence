# E90: rational logarithm range enforcement

Imported rational logarithm nodes previously published coarse enclosures that
exclude their represented values, including binary-scaled logarithms. The
shared kernel now proves its small residual range before the series shortcut
and reuses native exact-rational log reduction outside that range. Stored
graphs and following arithmetic retain their meaning.

The [review](review-v1.json) records independent bounds, directed MPFR tests,
local and downstream checks, matched costs, failures and remaining limitations.
The [contract](contract-v1.md) predates implementation. The explicit
[storage authorization](storage-allowance-v1.json) permits Disk B use as needed.
The [checkpoint](checkpoint-v1.json) pins the source and evidence.

General domains, typed native evaluation/cancellation, full resource contracts,
release acceptance and the complete properties plan remain open. Historical
missing artifacts were not reaudited or recovered.
