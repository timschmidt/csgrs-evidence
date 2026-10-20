# Adverse-cost review

This feature is retained for a higher-priority completeness gain: previously
unrepresentable selected meridian endpoints now produce exact native boundaries
that continue through transformation, subdivision and cold replay. It is not a
retained optimization, a speedup claim or a performance-release qualification.

Five preserved contact cases have observed median ratios above the 10% review
marker. Their allocation calls and requested bytes are unchanged, and the
complete artifact corpus retains exact values and bytes. The three samples per
side are preserved below and in `adverse-cost-samples.json`. All cases have
overlapping time ranges in these samples; overlap does not prove absence of a
regression, and it does not justify discarding slower medians. The source-level
cause is not established. Two other rows show small allocation-request changes;
they remain in the complete cost table and raw trials.

| Case | Baseline ms, in execution-pair order | Candidate ms, in execution-pair order | Median ratio | Ranges overlap |
| --- | --- | --- | ---: | --- |
| contact_parameters_split_shared_edges_and_replay_solid_operations | 271.996079, 340.705219, 282.131880 | 344.072350, 340.739346, 270.169026 | 1.207731 | True |
| plane_contact_policies_exhaustion_and_recovery_preserve_certainty | 0.387365, 0.499513, 0.390180 | 0.507330, 0.495931, 0.386148 | 1.271032 | True |
| plane_contacts_reject_poles_before_empty_or_contained_shortcuts | 10.096663, 12.847761, 10.226649 | 13.020118, 12.951478, 10.405417 | 1.266444 | True |
| collapsed_planar_spans_keep_parameter_components | 0.567118, 0.670919, 0.522018 | 0.669767, 0.673512, 0.534501 | 1.181002 | True |
| finite_cone_boundary_contacts_are_not_claimed_as_equation_roots | 0.027688, 0.035238, 0.027184 | 0.039949, 0.034096, 0.026653 | 1.231439 | True |

Follow-up must preserve these full fixtures, exact source identities, typed
controls, certainty receipts and output materialization. Investigate a concrete
cost cause before retaining any optimization. No extra samples are used to
replace this campaign, and no assertion, fixture, policy or validation is weakened.
The previous increment's adverse size/time record remains open independently.
