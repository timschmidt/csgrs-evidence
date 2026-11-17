#define _GNU_SOURCE
#include <execinfo.h>
#include <stddef.h>
#include <stdio.h>
#include <unistd.h>

extern void *__libc_malloc(size_t size);
static _Thread_local int recording;

void *malloc(size_t size) {
    void *result = __libc_malloc(size);
    if (size == 632 && !recording) {
        recording = 1;
        void *frames[24];
        int count = backtrace(frames, 24);
        char header[96];
        int length = snprintf(header, sizeof(header), "ALLOC632 pointer=%p frames=%d\n", result, count);
        if (length > 0 && (size_t)length < sizeof(header)) {
            (void)write(STDERR_FILENO, header, (size_t)length);
        }
        backtrace_symbols_fd(frames, count, STDERR_FILENO);
        (void)write(STDERR_FILENO, "END_ALLOC632\n", 13);
        recording = 0;
    }
    return result;
}
