# CSGRS evidence archive

Generated evidence for the [CSGRS / Hyper geometry stack](https://github.com/timschmidt/csgrs).
It holds raw command logs, benchmark samples, source snapshots, audit corpora,
replay bundles and checkpoint archives. This material moved out of the CSGRS
repository on 2026-10-20 to keep that repository small. See its
[evidence archive index](https://github.com/timschmidt/csgrs/blob/main/docs/evidence-archive.md).

Paths are unchanged, so a path such as `docs/evidence/<record>/README.md`
cited by a CSGRS ledger or admission record resolves here. Each archived root
keeps its commit history; commit IDs differ from CSGRS because the history was
filtered to these paths.

CSGRS keeps one SHA-256 digest per record in `docs/evidence-archive.tsv`.
To check this archive against it from a CSGRS checkout:

```sh
python3 scripts/evidence_archive.py verify /path/to/csgrs-evidence.git <commit>
```

Five files under `crates/comparisons/audits/continuation/calcium/results/` are
stored with Git LFS. Run `git lfs pull` after cloning to fetch their content.
Four downloaded third-party package archives (`*.crate`) are not
redistributed. Their digests are recorded by CSGRS so they can be fetched
again from crates.io.

First-party content is MIT licensed, like CSGRS. Copied third-party sources
keep their original licences and notices.
