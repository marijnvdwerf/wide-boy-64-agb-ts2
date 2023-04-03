#include "common.h"
#include <PR/gu.h>
#include <PR/os_convert.h>

typedef struct {
    u8 unk_0[0xCC0];
    Mtx var_CC0[0];
} UnkStruct;

extern u8 D_80052750[];
extern u8 D_80052450[];
extern u8 D_800527D0[];
extern u32 D_801AAB90;
extern Gfx* D_801AB9F4;

INCLUDE_ASM(const s32, "main/src/1AF0", dma_read_wideboy_buffer);

INCLUDE_ASM(const s32, "main/src/1AF0", func_8002671C);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80026768);

void func_80026948(void)
{
    D_80188A20[0] = 0;
    D_80188A20[1] = 0x1F;
    D_80188A20[2] = 0;
    D_80188A20[3] = 0x1F;
    D_80188A20[4] = 0;
    D_80188A20[5] = 0x1F;
    D_80188A20[6] = 0;
    D_80188A20[7] = 0x1F;
    D_80188A20[8] = 0;
    D_80188A20[9] = 0;
    D_80188A20[10] = 0;
    D_80188A20[11] = 0;
    D_80188A20[12] = 0x1F;
    D_80188A20[13] = 0;
    D_80188A20[14] = 0;
    D_80188A20[15] = 0;
    D_80188A20[16] = 0;
    D_80188A20[17] = 0x1F;
    D_80188A20[18] = 0;
    D_80188A20[19] = 0x1F;
    D_80188A20[20] = 0x1F;
    D_80188A20[21] = 0x1F;
}

INCLUDE_ASM(const s32, "main/src/1AF0", func_800269B0);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80026BFC);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80026CD0);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80026D58);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80026E08);

INCLUDE_ASM(const s32, "main/src/1AF0", send_buttons_to_gba);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80027064);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80027074);

INCLUDE_ASM(const s32, "main/src/1AF0", func_800270BC);

INCLUDE_ASM(const s32, "main/src/1AF0", func_8002710C);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80027178);

INCLUDE_ASM(const s32, "main/src/1AF0", func_800271F0);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80027230);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80027270);

INCLUDE_ASM(const s32, "main/src/1AF0", gfxFUN_800272c8);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80027BE0);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80027C04);

INCLUDE_ASM(const s32, "main/src/1AF0", read_gba_frame);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80027DE0);

void gfxFUN_80028088(UnkStruct* arg0, float x, float y, s32 arg3)
{
    guTranslate(&arg0->var_CC0[D_801AAB90], x, y, 0.0f);

    gSPMatrix(D_801AB9F4++, OS_K0_TO_PHYSICAL(&arg0->var_CC0[D_801AAB90++]), G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
    gDPPipeSync(D_801AB9F4++);
    gSPDisplayList(D_801AB9F4++, D_80052750);
    gDPLoadTextureTile_4b(D_801AB9F4++, &D_80052450[arg3 * 4], G_IM_FMT_IA, 104, 0, 0, 0, 7, 7, 0, G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMASK, G_TX_NOMASK, G_TX_NOLOD, G_TX_NOLOD);
    gSPDisplayList(D_801AB9F4++, D_800527D0);
}

INCLUDE_ASM(const s32, "main/src/1AF0", func_80028244);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80028370);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80028444);

INCLUDE_ASM(const s32, "main/src/1AF0", func_80028540);
