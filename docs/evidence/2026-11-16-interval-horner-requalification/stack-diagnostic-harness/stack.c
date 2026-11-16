#define _GNU_SOURCE
#include <pthread.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdio.h>
static unsigned long measurement;
static volatile unsigned char snapshot[8192];
static uintptr_t snapshot_address;
static size_t snapshot_length;
struct job {
    void (*callback)(void *);
    void *context;
    unsigned char *low, *high;
    unsigned char pattern;
    int warm;
    size_t peak;
};
static void *run(void *opaque) {
    struct job *job = opaque;
    if (job->warm) job->callback(job->context);
    volatile unsigned char marker;
    /* Preserve this frame and the ABI red zone. The callback may use all
       deeper mapped bytes. Volatile loops cannot become a memset call. */
    const uintptr_t end = (uintptr_t)&marker - 512;
    for (uintptr_t address = (uintptr_t)job->low; address < end; ++address)
        *(volatile unsigned char *)address = job->pattern;
    job->callback(job->context);
    uintptr_t first = (uintptr_t)job->low;
    while (first < end && *(volatile unsigned char *)first == job->pattern) ++first;
    job->peak = first == end ? 0 : (size_t)((uintptr_t)job->high - first);
    /* Diagnostic only: retain stale bytes AFTER the measured callback/scan.
       This is not an active backtrace and cannot replace acceptance samples. */
    if (++measurement == 49) {
        snapshot_address = first;
        snapshot_length = end - first < sizeof(snapshot) ? end - first : sizeof(snapshot);
        for (size_t index = 0; index < snapshot_length; ++index)
            snapshot[index] = *(volatile unsigned char *)(first + index);
    }
    return NULL;
}
size_t measure_stack(void (*callback)(void *), void *context, int warm, unsigned char pattern) {
    const size_t bytes = 2 * 1024 * 1024;
    const size_t guard = (size_t)sysconf(_SC_PAGESIZE);
    void *memory = mmap(NULL, bytes, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (memory == MAP_FAILED || mprotect(memory, guard, PROT_NONE)) abort();
    struct job job = {callback, context, (unsigned char *)memory + guard,
                      (unsigned char *)memory + bytes, pattern, warm, 0};
    pthread_attr_t attr;
    pthread_t thread;
    if (pthread_attr_init(&attr) || pthread_attr_setguardsize(&attr, 0) ||
        pthread_attr_setstack(&attr, job.low, bytes - guard) ||
        pthread_create(&thread, &attr, run, &job) || pthread_join(thread, NULL) ||
        pthread_attr_destroy(&attr)) abort();
    if (measurement == 49) {
        const char *prefix = getenv("HORNER_STACK_SNAPSHOT");
        if (!prefix) abort();
        char path[4096];
        if (snprintf(path, sizeof(path), "%s.stack", prefix) >= (int)sizeof(path)) abort();
        FILE *output = fopen(path, "wb");
        if (!output || fwrite((const void *)snapshot, 1, snapshot_length, output) != snapshot_length || fclose(output)) abort();
        if (snprintf(path, sizeof(path), "%s.maps", prefix) >= (int)sizeof(path)) abort();
        output = fopen(path, "w"); FILE *maps = fopen("/proc/self/maps", "r");
        if (!output || !maps) abort();
        int byte; while ((byte = fgetc(maps)) != EOF) fputc(byte, output);
        if (ferror(maps) || ferror(output) || fclose(maps) || fclose(output)) abort();
        fprintf(stderr, "snapshot address=%lu length=%lu peak=%lu measurement=%lu\n",
            (unsigned long)snapshot_address, (unsigned long)snapshot_length,
            (unsigned long)job.peak, measurement);
    }
    if (munmap(memory, bytes)) abort();
    return job.peak;
}
