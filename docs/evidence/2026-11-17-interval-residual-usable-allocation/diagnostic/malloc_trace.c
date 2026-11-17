#define _GNU_SOURCE
#include <link.h>
#include <malloc.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

extern void *__libc_malloc(size_t);
extern void *__libc_realloc(void *, size_t);
extern void __libc_free(void *);

static const unsigned char *enabled;
static uintptr_t symbol_offset;
static __thread int logging;

static void emit(char kind, uintptr_t old_pointer, uintptr_t new_pointer,
                 size_t requested, size_t old_usable, size_t new_usable) {
    char buffer[256];
    int n = snprintf(buffer, sizeof buffer, "EVENT %c %lx %lx %zu %zu %zu\n",
                     kind, (unsigned long)old_pointer,
                     (unsigned long)new_pointer, requested, old_usable,
                     new_usable);
    if (n < 0 || (size_t)n >= sizeof buffer) _exit(121);
    size_t done = 0;
    while (done < (size_t)n) {
        ssize_t result = write(STDERR_FILENO, buffer + done, (size_t)n - done);
        if (result <= 0) _exit(122);
        done += (size_t)result;
    }
}

static int locate(struct dl_phdr_info *info, size_t size, void *data) {
    (void)size;
    (void)data;
    if (info->dlpi_name[0]) return 0;
    for (ElfW(Half) i = 0; i < info->dlpi_phnum; ++i) {
        const ElfW(Phdr) *p = &info->dlpi_phdr[i];
        if (p->p_type == PT_LOAD && (p->p_flags & PF_W) &&
            symbol_offset >= p->p_vaddr &&
            symbol_offset - p->p_vaddr < p->p_memsz) {
            enabled = (const unsigned char *)(info->dlpi_addr + symbol_offset);
            return 1;
        }
    }
    return 1;
}

__attribute__((constructor)) static void setup(void) {
    const char *value = getenv("RESIDUAL_ENABLED_OFFSET");
    char *end = NULL;
    if (!value || !*value) _exit(123);
    symbol_offset = strtoull(value, &end, 16);
    if (!end || *end || !symbol_offset) _exit(124);
    dl_iterate_phdr(locate, NULL);
    if (!enabled || __atomic_load_n(enabled, __ATOMIC_RELAXED)) _exit(125);
    const char marker[] = "INTERPOSER_READY flag=0\n";
    if (write(STDERR_FILENO, marker, sizeof marker - 1) != sizeof marker - 1)
        _exit(126);
}

static int active(void) {
    return !logging && enabled && __atomic_load_n(enabled, __ATOMIC_RELAXED);
}

void *malloc(size_t size) {
    int record = active();
    void *p = __libc_malloc(size);
    if (record && p) {
        logging = 1;
        emit('A', 0, (uintptr_t)p, size, 0, malloc_usable_size(p));
        logging = 0;
    }
    return p;
}

void free(void *p) {
    if (active() && p) {
        logging = 1;
        emit('D', (uintptr_t)p, 0, 0, malloc_usable_size(p), 0);
        logging = 0;
    }
    __libc_free(p);
}

void *realloc(void *p, size_t size) {
    int record = active();
    uintptr_t old_pointer = (uintptr_t)p;
    size_t old_usable = record && p ? malloc_usable_size(p) : 0;
    void *q = __libc_realloc(p, size);
    if (record && q) {
        logging = 1;
        emit('R', old_pointer, (uintptr_t)q, size, old_usable,
             malloc_usable_size(q));
        logging = 0;
    }
    return q;
}
