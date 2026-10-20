#define _DEFAULT_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <sys/resource.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char **argv) {
    if (argc < 3) return 2;
    pid_t child = fork();
    if (child < 0) return 3;
    if (child == 0) { execvp(argv[2], argv + 2); _exit(127); }
    struct rusage usage;
    int status;
    if (wait4(child, &status, 0, &usage) < 0) return 4;
    FILE *output = fopen(argv[1], "w");
    if (output == NULL) return 5;
    fprintf(output, "{\"max_rss_kib\":%ld,\"user_seconds\":%.6f,\"system_seconds\":%.6f,\"wait_status\":%d}\n",
            usage.ru_maxrss, usage.ru_utime.tv_sec + usage.ru_utime.tv_usec / 1e6,
            usage.ru_stime.tv_sec + usage.ru_stime.tv_usec / 1e6, status);
    fclose(output);
    return WIFEXITED(status) ? WEXITSTATUS(status) : 128 + WTERMSIG(status);
}
