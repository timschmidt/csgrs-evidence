#include <stdlib.h>
#include <string.h>
__attribute__((noinline)) void held_control(int release) {
  volatile unsigned char *value = malloc(4096);
  if (!value) abort();
  value[0] = 17; value[4095] = 29;
  if (release) free((void *)value);
  exit(0);
}
int main(int argc, char **argv) { held_control(argc > 1); }
