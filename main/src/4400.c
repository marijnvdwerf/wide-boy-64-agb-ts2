#include "common.h"

typedef struct {
    /* 0x00 */ char pad0[0xC];
    /* 0x0C */ s8 unkC; /* inferred */
    /* 0x0D */ s8 unkD; /* inferred */
    /* 0x0E */ s8 unkE; /* inferred */
    /* 0x0F */ s8 unkF; /* inferred */
} unkStruct24; /* size = 0x10 */

typedef struct {
    /* 0x00 */ char pad0[0x10];
    /* 0x10 */ s32 unk10; /* inferred */
    /* 0x14 */ char pad14[0x10]; /* maybe part of unk10[5]? */
    /* 0x24 */ unkStruct24* unk24; /* inferred */
} unkStruct; /* size = 0x28 */

INCLUDE_ASM(const s32, "main/src/4400", func_80029000);

INCLUDE_ASM(const s32, "main/src/4400", func_80029054);

INCLUDE_ASM(const s32, "main/src/4400", func_80029304);

INCLUDE_ASM(const s32, "main/src/4400", func_80029ACC);

INCLUDE_ASM(const s32, "main/src/4400", func_80029C6C);

void func_80029C88(unkStruct* arg0, s8 arg1, s8 arg2, s8 arg3, s32 arg4)
{
    s32 var_t0;
    unkStruct24* var_v1;

    var_v1 = arg0->unk24;
    for (var_t0 = 0; var_t0 < arg0->unk10; var_t0++) {
        var_v1->unkC = arg1;
        var_v1->unkD = arg2;
        var_v1->unkE = arg3;
        var_v1->unkF = arg4;
        var_v1++;
    }
}

INCLUDE_ASM(const s32, "main/src/4400", func_80029CD0);
