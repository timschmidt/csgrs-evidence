#define _GNU_SOURCE
#include <pthread.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>
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
    if (munmap(memory, bytes)) abort();
    return job.peak;
}
