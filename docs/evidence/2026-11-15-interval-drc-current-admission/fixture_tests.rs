    #[test]
    fn complex_fixture_requirement_and_extractor_failures_are_explicit() {
        const CHILD: &str = "HYPERDRC_FIXTURE_FAILURE_CHILD";
        const REQUIRED: &str = "HYPERDRC_REQUIRE_COMPLEX_FIXTURES";
        if let Some(mode) = std::env::var_os(CHILD) {
            let root = complex_zip_temp_root("fixture-failure-child");
            fs::create_dir_all(&root).unwrap();
            let archive = root.join("fixture.zip");
            if mode == "unavailable-extractor" {
                // The extractor must be invoked for an existing input. Its
                // absence is independent of whether these bytes form a zip.
                fs::write(&archive, b"fixture input").unwrap();
            }
            let result = std::panic::catch_unwind(|| {
                extract_complex_project_zip(&root, "out", archive.to_str().unwrap())
            });
            fs::remove_dir_all(&root).unwrap();
            if mode == "optional-missing" {
                assert_eq!(result.unwrap(), None);
            } else {
                let failure = result.expect_err("required fixture work was silently skipped");
                let message = failure.downcast_ref::<String>().unwrap();
                assert!(message.contains("complex project fixture"), "{message}");
                assert!(message.contains(archive.to_str().unwrap()), "{message}");
            }
            return;
        }
        let mut failures = Vec::new();
        for mode in ["required-missing", "optional-missing", "unavailable-extractor"] {
            let mut command = process::Command::new(std::env::current_exe().unwrap());
            command.args([
                "--exact",
                "app::tests::complex_fixture_requirement_and_extractor_failures_are_explicit",
                "--nocapture",
            ]).env(CHILD, mode);
            if mode == "optional-missing" {
                command.env_remove(REQUIRED);
            } else {
                command.env(REQUIRED, "1");
            }
            if mode == "unavailable-extractor" {
                command.env("PATH", "");
            }
            let output = command.output().unwrap();
            if !output.status.success() {
                failures.push(format!("{mode}: {}\n{}", String::from_utf8_lossy(&output.stdout), String::from_utf8_lossy(&output.stderr)));
            }
        }
        assert!(failures.is_empty(), "{}", failures.join("\n"));
    }

    #[test]
    fn complex_fixture_corruption_fails_and_valid_extraction_retains_contents() {
        use std::io::Write as _;
        let root = complex_zip_temp_root("fixture-corruption");
        fs::create_dir_all(&root).unwrap();
        let archive = root.join("fixture.zip");
        fs::write(&archive, b"not a zip archive").unwrap();
        let failed = std::panic::catch_unwind(|| {
            extract_complex_project_zip(&root, "corrupt", archive.to_str().unwrap())
        });
        let failure_message = failed.err().and_then(|error| error.downcast::<String>().ok());
        let file = fs::File::create(&archive).unwrap();
        let mut zip = zip::ZipWriter::new(file);
        zip.start_file("nested/board.kicad_pcb", zip::write::SimpleFileOptions::default()).unwrap();
        zip.write_all(b"exact fixture payload\n").unwrap();
        zip.finish().unwrap();
        let extracted = extract_complex_project_zip(&root, "valid", archive.to_str().unwrap()).unwrap();
        let contents = fs::read(extracted.join("nested/board.kicad_pcb")).unwrap();
        fs::remove_dir_all(&root).unwrap();
        let message = failure_message.expect("malformed fixture was silently skipped");
        assert!(message.contains("complex project fixture"), "{message}");
        assert!(message.contains(archive.to_str().unwrap()), "{message}");
        assert_eq!(contents, b"exact fixture payload\n");
    }

