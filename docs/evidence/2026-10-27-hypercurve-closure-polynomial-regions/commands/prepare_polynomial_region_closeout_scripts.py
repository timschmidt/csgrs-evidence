from pathlib import Path
root=Path(__file__).resolve().parent
s=(root/'archive_polynomial_location_evidence.py').read_text()
s=s.replace('polynomial-locations','polynomial-regions').replace('polynomial-location','polynomial-region').replace('polynomial_location','polynomial_region')
s=s.replace('09ce6777463e0e3464ce628fe038f4cc17bfda90','5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec')
s=s.replace("'suites': 80, 'passed': 2738", "'suites': 81, 'passed': 2754").replace("len(report['fixtures']) == 91", "len(report['fixtures']) == 107")
s=s.replace("root / 'rational-section-evidence-archive.json'", "root / 'polynomial-location-evidence-archive.json'")
s=s.replace('refs/heads/hypercurve-rational-section-evidence-2026-10-26','refs/heads/hypercurve-polynomial-location-evidence-2026-10-26')
s=s.replace('hypercurve-polynomial-region-evidence-2026-10-26','hypercurve-polynomial-region-evidence-2026-10-27').replace('docs/evidence/2026-10-26-hypercurve-closure-polynomial-regions','docs/evidence/2026-10-27-hypercurve-closure-polynomial-regions')
start=s.index("for name in ['src/polynomial_curve_abscissa.rs'")
end=s.index("patch = ",start)
s=s[:start]+"for name in ['tests/polynomial_region_admission.rs']:\n    copy(checkout / 'crates/hypercurve' / name, Path('source') / name)\n"+s[end:]
start=s.index("    'prerequisite':")
end=s.index("}, indent=2) + '\\n')",start)
s=s[:start]+'''    'prerequisite': 'Committed point-location increment 5de7f0cb05 includes all qualified section and selected-abscissa prerequisites. The region prototype parent transition preserved every non-receipt source byte.',
    'owner': 'Hypercurve retained polynomial supporting fragments and the existing CurveRegion2 arrangement',
    'properties': ['P12', 'P13', 'P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Selected polynomial graph slabs with closed exact domains and retained invertible similarities, complete pair incidence and decidable original selected-field queries. The maintained cases include rational boundaries, an independently selected degree-five trim, mixed circles, holes, disconnected material, cusps and a node.',
    'full_suite': full, 'root_downstream_passed': 43, 'dependent_package_tests': dependent,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'guard_tests': 16, 'matrix_fixtures': 107, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'The unchanged H08 parabola boundary reproduced Construction/ImplicitPolynomial/Unsupported for orientation and region admission.',
        'Retaining polynomial supports initially admitted the boundary but returned two loops instead of one for clipping. The original failing fixture remains; reusing existing exact boundary probes restored correct orientation and Boolean geometry.',
        'Selected boundary points require their retained point-on-branch authority before an unrelated probe; reconstructed native-point paths and open authored/generated clipping reproduced further Unsupported failures and now reuse the same classification authority.',
        'Complete pair replay permits selected interior point witnesses for polynomial fragments. This fixes contact-only intersection and subsequent Boolean consumption without projecting coordinates.',
        'The original second quintic cut at x=3/4 correctly retains five pieces, because f(3/4)=-461/1024. The mistaken four-piece test expectation was corrected while retaining that cut and adding a further x=7/8 cut, where f(7/8)=21415/32768 and four pieces are correct.',
        'One prototype build was externally interrupted with SIGTERM and did not qualify. Temporary diagnostics, all failed attempts and the later successful retry are retained. An initial all-target Clippy build exposed one missing test-only diagnostic enum label; the complete qualification was restarted after fixing it.',
    ],
    'qualification': 'Sixteen public region witnesses plus the unchanged promoted H08 fixture cover selected supports, source/root/domain identity, exact point and path location, all four Boolean operations, holes and reversed boundaries under both fill rules, disconnected components, rational similarity transport, contact-only regularized empty, 2^-80 separation, degree-five selected trims and checked point replay, open authored/generated clipping, mixed circular supports, cusp/node incidence, zero offset, explicit remaining operation gaps, actually reached counted exhaustion with larger retry, and Certified policy transitions.',
    'limitations': [
        'This is bounded progress on A3, not arbitrary algebraic region closure. General coefficient fields, rational image preimages, different pair images, vertical/repeated components and all singular local sectors remain open.',
        'Nonzero polynomial-support offsets, fillets, chamfers and finite projection still return Unsupported. Their typed boundary witnesses establish honest failure, not completed geometry support.',
        'Checked point definitions are in-memory replay, not fresh-process native archive replay. BRep trimming of the entire declared domain is not established.',
        'The separate full repository publication candidate b1c011a070 excludes this increment. Full pre-push validation remains required before publishing these source changes.',
        'Counted refinements/promotions and external 300-second fixture allowances do not bound total arithmetic, coefficient/system growth, retained memory or cooperative cancellation.',
        'Concurrent timings and time(1) peak RSS are qualification observations, not controlled performance comparisons or aggregate memory bounds.',
    ],
'''+s[end:]
s=s.replace('Record selected polynomial point-location qualification','Record selected polynomial shared-region qualification')
(root/'archive_polynomial_region_evidence.py').write_text(s)
compile(s,str(root/'archive_polynomial_region_evidence.py'),'exec')
s=(root/'close_polynomial_location_increment.py').read_text().replace('polynomial-locations','polynomial-regions').replace('polynomial-location','polynomial-region').replace('polynomial_location','polynomial_region')
s=s.replace('d7ae8ea21865ddaa414f913f8cdf38afefcaf6fd','5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec').replace('Retain exact point incidence on selected polynomial branches','Admit selected polynomial branches to the shared region arrangement')
start=s.index('deadline = ');end=s.index('\nfor command in [',start)
s=s[:start]+'''results = json.loads((root / 'polynomial-region-final-results.json').read_text())
assert len(results) == 15 and all(row['exit_code'] == 0 and row['source_stable'] for row in results)
assert (root / 'polynomial-region-final-files-after.json').exists()
'''+s[end:]
(root/'close_polynomial_region_increment.py').write_text(s)
compile(s,str(root/'close_polynomial_region_increment.py'),'exec')
s=(root/'persist_polynomial_location_increment.py').read_text().replace('polynomial-locations','polynomial-regions').replace('polynomial-location','polynomial-region')
(root/'persist_polynomial_region_increment.py').write_text(s)
compile(s,str(root/'persist_polynomial_region_increment.py'),'exec')
print('Prepared region archive, closeout and local persistence scripts; not executed. Receipt writer still required.')
