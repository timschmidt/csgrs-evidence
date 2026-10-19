# E95: retained integral arctangent facts

Imported `IntegralAtan(n)` nodes now expose their exact `atan(1/n)` argument
to shared sine, cosine, cotangent and arithmetic consumers. The unchanged
72-case replay certifies both squared identities in 68 cases, up from 20.
All 48 imported cases are resolved. Four public native quarter-pi cases remain
undecided and are preserved separately.

The [review](review-v1.json) records the independent identities, legacy graph
compatibility, local/downstream checks, full cost samples and limitations.
The [contract](contract-v1.md) predates the implementation. Its
[composition addendum](composition-addendum-v2.md) records the preserved
first-attempt failure and the shared half-pi repair. Newly derived
algebraic outputs can use different existing wire representations; retained
input graphs and prior derived JSON/CBOR outputs remain supported. This
representation migration accompanies stronger proofs, not a performance-only
claim. The [checkpoint](checkpoint-v1.json) pins implementation and evidence.

General domains, fallible native evaluation/cancellation, internal resource
bounds, complete shipped-user-path validation and the full properties plan
remain open. Historical missing evidence was not reaudited or recovered.
