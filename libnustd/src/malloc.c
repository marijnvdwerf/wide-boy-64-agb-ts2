#include "common.h"

INCLUDE_ASM(const s32, "libnustd/src/malloc", _malloc_memcheck);

INCLUDE_ASM(const s32, "libnustd/src/malloc", malloc_memcheck);

INCLUDE_ASM(const s32, "libnustd/src/malloc", _malloc_memdsp);

INCLUDE_ASM(const s32, "libnustd/src/malloc", malloc_memdsp);

INCLUDE_ASM(const s32, "libnustd/src/malloc", _InitHeap);

INCLUDE_ASM(const s32, "libnustd/src/malloc", InitHeap);

INCLUDE_ASM(const s32, "libnustd/src/malloc", _malloc);

INCLUDE_ASM(const s32, "libnustd/src/malloc", malloc);

INCLUDE_ASM(const s32, "libnustd/src/malloc", _free);

INCLUDE_ASM(const s32, "libnustd/src/malloc", free);

INCLUDE_ASM(const s32, "libnustd/src/malloc", realloc);

INCLUDE_ASM(const s32, "libnustd/src/malloc", calloc);

INCLUDE_ASM(const s32, "libnustd/src/malloc", memalign);
