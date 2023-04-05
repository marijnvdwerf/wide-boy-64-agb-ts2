#include "common.h"
#include <PR/os_cache.h>
#include <PR/os_pi.h>
#include <nusys.h>

extern OSPiHandle* D_800528D0;
extern s32 D_80052330;

void func_80028C30(void)
{
}

void init_gba_handle(void)
{
    D_800528D0 = osCartRomInit();
    func_80028C30();
    D_800528D0->pulse = 6;
}

void try_init_gba_handle(void)
{
    if (D_800528D0 == NULL) {
        init_gba_handle();
    }
}

int gba_read(int arg0)
{
    u32 sp10;

    osEPiReadIo(D_800528D0, arg0 & 0x0FFFFFFF, &sp10);
    return sp10;
}

void write_to_gba(u32 arg0, u32 arg1)
{
    osEPiWriteIo(D_800528D0, arg0 & 0x0FFFFFFF, arg1);
}

void nuPiReadRom(u32 devAddr, void* dramAddr, s32 size, u32 pri)
{
    OSIoMesg dmaMesgBuf;
    OSMesgQueue mesgQ;
    OSMesg mesgBuf;

    devAddr &= 0x0FFFFFFF;
    osInvalDCache(dramAddr, size);
    osCreateMesgQueue(&mesgQ, &mesgBuf, 1);

    dmaMesgBuf.hdr.pri = pri;
    dmaMesgBuf.hdr.retQueue = &mesgQ;
    dmaMesgBuf.dramAddr = dramAddr;
    dmaMesgBuf.devAddr = devAddr;
    dmaMesgBuf.size = size;

    osEPiStartDma(D_800528D0, &dmaMesgBuf, OS_READ);
    osRecvMesg(&mesgQ, &mesgBuf, OS_MESG_BLOCK);
}

void dmaFUN_80028db8(s32 devAddr, void* dramAddr, s32 size, s8 pri)
{
    OSIoMesg dmaMesgBuf;
    OSMesgQueue mesgQ;
    OSMesg mesgBuf;

    devAddr &= 0x0FFFFFFF;
    osInvalDCache(dramAddr, size);
    osCreateMesgQueue(&mesgQ, &mesgBuf, 1);

    dmaMesgBuf.hdr.pri = pri;
    dmaMesgBuf.hdr.retQueue = &mesgQ;
    dmaMesgBuf.dramAddr = dramAddr;
    dmaMesgBuf.devAddr = devAddr;
    dmaMesgBuf.size = size;

    osEPiStartDma(D_800528D0, &dmaMesgBuf, OS_WRITE);
    osRecvMesg(&mesgQ, &mesgBuf, OS_MESG_BLOCK);
}

void dma_some_stuff(s32 devAddr, void* dramAddr, s32 size)
{
    nuPiReadRom(devAddr, dramAddr, size, OS_MESG_PRI_NORMAL);
}

s32 func_80028E8C(s32 arg0, u8* arg1, s32 arg2, s32 arg3)
{
    s32 retval;

    write_to_gba(0xB4200004, 2);
    if (arg3 != 0) {
        retval = nuEepromWrite(arg0, arg1, arg2);
    } else {
        retval = nuEepromRead(arg0, arg1, arg2);
    }
    D_80052330 = 1;
    return retval;
}

void dmaFUN_80028f1c(s32 devAddr, void* vAddr, s32 nbytes, s32 direction)
{
    OSIoMesg mb;
    OSMesgQueue mq;
    void* sp50;

    osInvalDCache(vAddr, nbytes);
    osCreateMesgQueue(&mq, &sp50, 1);
    osPiStartDma(&mb, 0, direction, devAddr, vAddr, nbytes, &mq);
    osRecvMesg(&mq, 0, 1);
}

void dma_read(void* vAddr, int devAddr, int nbytes)
{
    dmaFUN_80028f1c(devAddr, vAddr, nbytes, 0);
}

void dma_write(int devAddr, void* vAddr, int nbytes)
{
    dmaFUN_80028f1c(devAddr, vAddr, nbytes, 1);
}
