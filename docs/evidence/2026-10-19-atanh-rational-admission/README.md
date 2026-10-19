# E92: rational atanh range enforcement

Imported rational atanh nodes returned false coarse enclosures for valid
non-tiny arguments; warming the cache changed those answers. The evaluator
now proves its tiny range before the series or coarse-zero shortcut, and
reuses native exact logarithm reduction for other valid rational arguments.
Stored graphs and following arithmetic keep their meaning.

The [review](review-v1.json) records independent contradictions and enclosures,
local/downstream checks, costs, retained failures and remaining limitations.
The [contract](contract-v1.md) predates implementation; the
[checkpoint](checkpoint-v1.json) pins source and evidence.

General domains, fallible native evaluation/cancellation, full resource
contracts, release acceptance and the full properties plan remain open.
Historical missing artifacts were not reaudited or recovered.
