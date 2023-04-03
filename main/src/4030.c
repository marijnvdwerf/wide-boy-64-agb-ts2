#include "common.h"

void func_80028C30(void) {
}

INCLUDE_ASM(const s32, "main/src/4030", init_gba_handle);

INCLUDE_ASM(const s32, "main/src/4030", try_init_gba_handle);

INCLUDE_ASM(const s32, "main/src/4030", gba_read);

INCLUDE_ASM(const s32, "main/src/4030", write_to_gba);

INCLUDE_ASM(const s32, "main/src/4030", nuPiReadRom);

INCLUDE_ASM(const s32, "main/src/4030", dmaFUN_80028db8);

INCLUDE_ASM(const s32, "main/src/4030", dma_some_stuff);

INCLUDE_ASM(const s32, "main/src/4030", func_80028E8C);

INCLUDE_ASM(const s32, "main/src/4030", dmaFUN_80028f1c);

INCLUDE_ASM(const s32, "main/src/4030", dma_read);

INCLUDE_ASM(const s32, "main/src/4030", dma_write);
