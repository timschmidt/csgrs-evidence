        /^\/.*[.]rs:$/ {
            file = $0
            sub(/:$/, "", file)
            boundary = 999999
            source_line_number = 0
            pending_cfg_test = 0
            in_cfg_attribute = 0
            cfg_attribute_start = 0
            cfg_attribute_has_test = 0
            while ((getline source_line < file) > 0) {
                source_line_number++
                if (in_cfg_attribute != 0) {
                    if (source_line ~ /(^|[^[:alnum:]_])test([^[:alnum:]_]|$)/) {
                        cfg_attribute_has_test = 1
                    }
                    if (source_line ~ /\)\][[:space:]]*$/) {
                        in_cfg_attribute = 0
                        if (cfg_attribute_has_test != 0) {
                            pending_cfg_test = cfg_attribute_start
                        }
                    }
                    continue
                }
                if (source_line ~ /^[[:space:]]*#\[cfg\(/) {
                    cfg_attribute_start = source_line_number
                    cfg_attribute_has_test = source_line ~ /(^|[^[:alnum:]_])test([^[:alnum:]_]|$)/
                    if (source_line ~ /\)\][[:space:]]*$/) {
                        if (cfg_attribute_has_test != 0) {
                            pending_cfg_test = cfg_attribute_start
                        }
                    } else {
                        in_cfg_attribute = 1
                    }
                    continue
                }
                if (pending_cfg_test != 0 && source_line ~ /^[[:space:]]*$/) {
                    continue
                }
                if (pending_cfg_test != 0 && source_line ~ /^[[:space:]]*mod[[:space:]]+tests[[:space:]]*\{/) {
                    boundary = pending_cfg_test
                    break
                }
                if (pending_cfg_test != 0) {
                    pending_cfg_test = 0
                }
            }
            close(file)
            files[file] = 1
            boundaries[file] = boundary
            next
        }
        file != "" && $1 ~ /^[[:space:]]*[0-9]+$/ {
            line = $1 + 0
            count = $2
            gsub(/[[:space:]]/, "", count)
            if (line < boundaries[file] && count != "") {
                total[file]++
                if (count != "0") {
                    hit[file]++
                }
            }
        }
        END {
            for (file in files) {
                order[++file_count] = file
            }
            for (left = 1; left <= file_count; left++) {
                for (right = left + 1; right <= file_count; right++) {
                    if (order[left] > order[right]) {
                        temporary = order[left]
                        order[left] = order[right]
                        order[right] = temporary
                    }
                }
            }
            printf "%-42s %8s %8s %8s %9s\n", "Source", "Lines", "Hit", "Missed", "Coverage"
            for (row = 1; row <= file_count; row++) {
                file = order[row]
                relative = substr(file, length(prefix) + 1)
                missed = total[file] - hit[file]
                coverage = total[file] ? 100 * hit[file] / total[file] : 100
                printf "%-42s %8d %8d %8d %8.2f%%\n", relative, total[file], hit[file], missed, coverage
                sum += total[file]
                sum_hit += hit[file]
            }
            coverage = 100 * sum_hit / sum
            printf "%-42s %8d %8d %8d %8.2f%%\n", "TOTAL", sum, sum_hit, sum - sum_hit, coverage
            if (coverage < threshold) {
                printf "production line coverage %.4f%% is below required %.4f%%\n", coverage, threshold > "/dev/stderr"
                exit 2
            }
        }
