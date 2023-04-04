#include "common.h"
#include <PR/gu.h>
#include <PR/os_convert.h>
#include <malloc.h>
#include <math.h>

typedef union {
    u32 n;
    struct {
        u8 a;
        u8 b;
        u8 c;
        u8 d;
    } b;
} UnkStruct3;

typedef struct {
    /* 0x00 */ s32 unk0;
    /* 0x04 */ s32 unk4;
    /* 0x08 */ s32 unk8;
    /* 0x0C */ s32 unkC;
    /* 0x10 */ s32 count;
    /* 0x14 */ u32 unk14;
    /* 0x18 */ u32 unk18;
    /* 0x1C */ UnkStruct3 unk1C;
    /* 0x20 */ s16 unk20;
    /* 0x22 */ s16 unk22;
    /* 0x24 */ Vtx* unk24;
} UnkStruct5;

void func_80029000(UnkStruct5* param_1, Vtx* param_2, s32 param_3, s32 param_4, s32 param_5)
{
    param_2->n.ob[0] = param_1->unk20 + param_3;
    param_2->n.ob[1] = param_1->unk22 - param_4;
    param_2->n.ob[2] = 0;
    param_2->n.flag = 0;
    param_2->n.tc[0] = param_3 * 0x40;
    param_2->n.tc[1] = param_4 * 0x40 + param_5;
    param_2->n.n[0] = -1;
    param_2->n.n[1] = -1;
    param_2->n.n[2] = -1;
    param_2->n.a = 0xFF;
}

void func_80029054(s32 arg0, s32 arg1, s32 arg2, UnkStruct5* arg3, UnkStruct3 arg4)
{
    s32 temp_lo;
    s32 var_a0;
    s32 var_s2;
    Vtx* temp_v0;
    s32 t0;
    s32 division;

    arg3->unk0 = arg1;
    arg3->unk4 = arg0;

    switch (arg4.b.c) { /* irregular */
        case 0:
            t0 = 4;
            break;
        case 3:
            t0 = 0x20;
            break;
        case 2:
            t0 = 0x10;
            break;
        case 1:
            t0 = 8;
            break;
    }
    var_a0 = (s32)(0x8000 / t0);
    division = var_a0 / arg0;
    if ((u8)arg4.n == 2) {
        division = division / 2;
    }
    arg3->unk8 = division;
    temp_lo = ((arg1 + division) - 1) / division;
    arg3->unkC = temp_lo;
    arg3->count = ((temp_lo + 2) * 2);
    arg3->unk1C = arg4;
    arg3->unk20 = (s32)((f64)arg3->unk4 / 2.0f * -1);
    arg3->unk22 = (s32)((f64)arg3->unk0 / 2.0f);
    arg3->unk24 = temp_v0 = malloc(arg3->count * sizeof(Vtx));

    func_80029000(arg3, temp_v0++, 0, 0, arg2);
    func_80029000(arg3, temp_v0++, arg3->unk4, 0, arg2);
    for (var_s2 = 1; var_s2 < arg3->unkC; var_s2++) {
        func_80029000(arg3, temp_v0++, 0, var_s2 * arg3->unk8, arg2);
        func_80029000(arg3, temp_v0++, arg3->unk4, var_s2 * arg3->unk8, arg2);
    }
    func_80029000(arg3, temp_v0++, 0, arg3->unk0, arg2);
    func_80029000(arg3, temp_v0++, arg3->unk4, arg3->unk0, arg2);

    frexp((f64)arg3->unk4, (int*)&arg3->unk14);
    frexp((f64)arg3->unk8, (int*)&arg3->unk18);
}

INCLUDE_ASM(const s32, "main/src/4400", func_80029304);

Gfx* func_80029ACC(Gfx* gfx, UnkStruct5* arg1)
{
    s32 var_t1;
    s32 var_t2;
    s32 temp_v1;
    Vtx* ptr;

    temp_v1 = arg1->unk1C.b.c;
    var_t1 = 0;
    if (temp_v1 < 2) {
        if (temp_v1 >= 0) {
            gDPSetTextureLUT(gfx++, G_TT_NONE);
        }
    }

    ptr = arg1->unk24;
    for (var_t2 = 0; var_t2 < (arg1->unkC - 1); var_t2++) {
        if (var_t1 == 0) {
            gSPVertex(gfx++, ptr, 16, 0);
            ptr += 14;
        }

        gSP1Triangle(gfx++, (var_t1), (var_t1 + 2), (var_t1 + 1), 0); // v0, v1, v2
        gSP1Triangle(gfx++, (var_t1 + 3), (var_t1 + 1), (var_t1 + 2), 0); // v3, v2, v1

        var_t1 = var_t1 + 2;
        if (var_t1 == 0xE) {
            var_t1 = 0;
        }
    }

    if (var_t1 == 0) {
        gSPVertex(gfx++, ptr, 16, 0);
    }

    gSP1Triangle(gfx++, (var_t1), (var_t1 + 2), (var_t1 + 1), 0); // v0, v1, v2
    gSP1Triangle(gfx++, (var_t1 + 3), (var_t1 + 1), (var_t1 + 2), 0); // v3, v2, v1

    return gfx;
}

void func_80029C6C(UnkStruct5* arg0)
{
    free(arg0->unk24);
}

void func_80029C88(UnkStruct5* arg0, s8 arg1, s8 arg2, s8 arg3, s32 arg4)
{
    s32 var_t0;
    Vtx* var_v1;

    var_v1 = arg0->unk24;
    for (var_t0 = 0; var_t0 < arg0->count; var_t0++) {
        var_v1->n.n[0] = arg1;
        var_v1->n.n[1] = arg2;
        var_v1->n.n[2] = arg3;
        var_v1->n.a = arg4;
        var_v1++;
    }
}

void func_80029CD0(UnkStruct5* arg0, s32 arg1, s32 arg2)
{
    s32 var_b;
    Vtx* ptr;
    s32 var_a;
    s32 i;

    var_a = -arg0->unk20;
    var_a = var_a - arg1;

    var_b = -arg0->unk22;
    var_b = arg2 + var_b;

    ptr = arg0->unk24;
    for (i = 0; i < arg0->count; i++) {
        ptr->n.ob[0] += var_a;
        ptr->n.ob[1] += var_b;
        ptr++;
    }

    arg0->unk20 = -arg1;
    arg0->unk22 = arg2;
}
