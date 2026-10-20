#define _GNU_SOURCE
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/resource.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

/* A small launcher avoids measuring the Python collector's retained buffers. */
int main(int argc, char **argv) {
    if (argc < 3) {
        fprintf(stderr, "usage: %s resources.json command [args...]\n", argv[0]);
        return 125;
    }
    struct timespec start, end;
    if (clock_gettime(CLOCK_MONOTONIC, &start)) {
        perror("clock_gettime");
        return 125;
    }
    pid_t child = fork();
    if (child < 0) {
        perror("fork");
        return 125;
    }
    if (!child) {
        execvp(argv[2], argv + 2);
        perror("execvp");
        _exit(127);
    }
    struct rusage usage;
    int status;
    pid_t waited;
    do {
        waited = wait4(child, &status, 0, &usage);
    } while (waited < 0 && errno == EINTR);
    if (waited != child || clock_gettime(CLOCK_MONOTONIC, &end)) {
        perror("wait4/clock_gettime");
        return 125;
    }
    int code = WIFEXITED(status) ? WEXITSTATUS(status) : 128 + WTERMSIG(status);
    FILE *output = fopen(argv[1], "w");
    if (!output) {
        perror("fopen");
        return 125;
    }
    long long wall_ns = (long long)(end.tv_sec - start.tv_sec) * 1000000000LL
        + end.tv_nsec - start.tv_nsec;
    fprintf(output,
        "{\n"
        "  \"method\": \"Linux wait4 from small C launcher; ru_maxrss in KiB\",\n"
        "  \"exit_code\": %d,\n"
        "  \"wall_ns\": %lld,\n"
        "  \"max_rss_kib\": %ld,\n"
        "  \"user_seconds\": %.6f,\n"
        "  \"system_seconds\": %.6f,\n"
        "  \"minor_faults\": %ld,\n"
        "  \"major_faults\": %ld,\n"
        "  \"voluntary_context_switches\": %ld,\n"
        "  \"involuntary_context_switches\": %ld\n"
        "}\n",
        code, wall_ns, usage.ru_maxrss,
        usage.ru_utime.tv_sec + usage.ru_utime.tv_usec / 1e6,
        usage.ru_stime.tv_sec + usage.ru_stime.tv_usec / 1e6,
        usage.ru_minflt, usage.ru_majflt, usage.ru_nvcsw, usage.ru_nivcsw);
    if (fclose(output)) {
        perror("fclose");
        return 125;
    }
    return code;
}
