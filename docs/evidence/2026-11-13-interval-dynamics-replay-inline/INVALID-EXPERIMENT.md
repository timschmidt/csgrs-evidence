# Invalid duplicate-attribute experiment

Source inspection missed the existing #[inline] on the private helper. The
added attribute duplicates it, and strict Clippy correctly fails with both
duplicated_attributes and unused_attributes. The warning is not suppressed.
This is not a valid distinct optimization design or cost-gate experiment.
The duplicate is removed; source equals the provider-control snapshot.

The independent baseline/extraction/provider-control rebuilds, 194-case result
and allocation comparisons, and instruction observations remain valid current
reproductions. Do not describe metadata-only identity for the duplicate as a
qualified new optimization result. No change was made to main or Interface.
