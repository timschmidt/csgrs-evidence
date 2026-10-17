# Preserve the executed runner and repair its whitespace classification

Owner: admission-evidence handling, P36/P37. The staged check for commit
af717ed75f8ff385787eb05a562cf79610212799 reported a blank line at EOF in the
byte-exact generated runner. An orchestration error started that commit even
though the check failed. The commit completed; preserve this history honestly.

The generated runner and its completed output roots are frozen. Do not normalize
or replace the runner. Its exact SHA-256 remains the integrity criterion,
including its final newlines. Add a Git whitespace attribute scoped only to
that raw artifact, disabling only the blank-at-EOF diagnostic. Other whitespace
checks remain enabled; ordinary authored files have no new exemption.

Reproduce and retain the original diagnostic with the default attributes before
applying the exception. Verify the exact attribute on the raw runner and its
absence on representative authored files. Recheck the whole previous commit's
authored diff, and independently hash every one of its 26 committed blobs.
Record that this verification happened after the premature commit. No semantic
test, policy, fixture, validation scope, geometry or resource gate changes.

The attribute lives at docs/evidence/.gitattributes, outside all closed evidence
roots and within the root crate's already-verified excluded directory. No
package-manifest, Rust-source, asset or public API edit is needed. Update only
current_work in the ledger. Preserve the earlier failure and previous checkpoint.
Use a fresh control root and new evidence directory; allow at most 2 MiB new
control/evidence data and retain at least 512 MiB repository free space.
