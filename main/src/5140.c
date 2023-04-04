#include "common.h"
#include <PR/os_pi.h>
#include <nusys.h>

int unkperiph_detect(OSMesgQueue*, u8*, char*);
void unkperiph_read_10(OSMesgQueue*, int, void*, char*);

extern NUCallBackList D_800528E8;
extern s32 D_800DC7F0;

int unkperiph_init(void)
{
    char sp10;

    if (unkperiph_detect(&nuSiMesgQ, NULL, &sp10)) {
        return 1;
    }

    nuContNum += 1;
    nuSiCallBackAdd(&D_800528E8);
    return 0;
}

void unkperiph_deinit(void)
{
    nuSiCallBackRemove(&D_800528E8);
}

void unkperiph_func_900(void)
{
    char sp10;
    unkperiph_read_10(&nuSiMesgQ, 0, &D_800DC7F0, &sp10);
}

s32 get_unkperiph_value(void)
{
    return D_800DC7F0;
}
