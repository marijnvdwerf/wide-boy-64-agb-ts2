#include "common.h"
#include <PR/gu.h>
#include <PR/os_convert.h>

extern Gfx* D_80133368[3];
extern u16* nuGfxCfb_ptr;
extern Gfx* D_801AB9F4;
extern int D_800522D0;
extern Gfx D_800522E8[];
extern Gfx D_80052308[];

void func_800265D0(void)
{
    gSPSegment(D_801AB9F4++, 0x00, 0x00000000);
    gSPDisplayList(D_801AB9F4++, OS_K0_TO_PHYSICAL(D_80052308));
    gSPDisplayList(D_801AB9F4++, OS_K0_TO_PHYSICAL(D_800522E8));
}

void func_80026634(s32 arg0)
{
    D_80133368[D_800522D0] = D_801AB9F4;

    gDPSetColorImage(D_801AB9F4++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 320, osVirtualToPhysical(nuGfxCfb_ptr));

    if (arg0) {
        gDPSetFillColor(D_801AB9F4++, (GPACK_RGBA5551(0, 0, 255, 1) << 16 | GPACK_RGBA5551(0, 0, 255, 1)));
        gDPFillRectangle(D_801AB9F4++, 0, 0, 319, 239);
    }
}
