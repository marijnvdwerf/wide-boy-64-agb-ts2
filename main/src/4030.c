#include "common.h"
#include <PR/os_cache.h>
#include <PR/os_pi.h>

void func_80028C30(void)
{
}

INCLUDE_ASM(const s32, "main/src/4030", init_gba_handle);

INCLUDE_ASM(const s32, "main/src/4030", try_init_gba_handle);

INCLUDE_ASM(const s32, "main/src/4030", gba_read);

INCLUDE_ASM(const s32, "main/src/4030", write_to_gba);

INCLUDE_ASM(const s32, "main/src/4030", nuPiReadRom);

INCLUDE_ASM(const s32, "main/src/4030", dmaFUN_80028db8);

INCLUDE_ASM(const s32, "main/src/4030", dma_some_stuff);

INCLUDE_ASM(const s32, "main/src/4030", func_80028E8C);

void dmaFUN_80028f1c(s32 arg0, void* arg1, s32 arg2, s32 arg3)
{
    OSIoMesg sp20;
    OSMesgQueue sp38;
    void* sp50;

    osInvalDCache(arg1, arg2);
    osCreateMesgQueue(&sp38, &sp50, 1);
    osPiStartDma(&sp20, 0, arg3, arg0, arg1, arg2, &sp38);
    osRecvMesg(&sp38, 0, 1);
}

INCLUDE_ASM(const s32, "main/src/4030", dma_read);

INCLUDE_ASM(const s32, "main/src/4030", dma_write);
