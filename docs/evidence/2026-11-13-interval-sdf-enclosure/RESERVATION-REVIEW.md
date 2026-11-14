# Final resource review

On the initial retained source 61e9c5564, a constant source failed with a graph
entry budget of nine: compilation unconditionally reserved twelve additional
records for every traversal step. The stage requires only three bindings, four
nodes, one output and one retained traversal result. reservation-failure.log
reproduces the rejection. The final correction reserves the current task's
actual maximum additional live records, including operand consumption before
replacement, and charges initial binding/task construction. No proof or domain
assertion changed. The new nine-entry regression passes; all original budget
boundary/retry assertions remain. Final qualification/build/probe/ASan records
have final prefixes. Initial records remain preserved, not overwritten.
