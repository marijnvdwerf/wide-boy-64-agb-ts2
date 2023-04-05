// TODO: include proper nusys header

#include <PR/os_pi.h>
#include <PR/ultratypes.h>

typedef short NUScMsg;
typedef struct st_SiCommonMesg {
    NUScMsg mesg;
    OSMesgQueue* rtnMesgQ;
    s32 error;
    void* dataPtr;
} NUSiCommonMesg;

typedef struct st_CallBackList {
    struct st_CallBackList* next;
    s32 (**func)(NUSiCommonMesg*);
    u16 majorNo;
    u8 funcNum;
} NUCallBackList;

extern u16* nuGfxCfb_ptr;
extern OSMesgQueue nuSiMesgQ;
extern u32 nuContNum;
extern void nuSiCallBackAdd(NUCallBackList* list);
extern void nuSiCallBackRemove(NUCallBackList* list);
extern s32 nuEepromRead(u8 address, u8* buffer, u16 len);
extern s32 nuEepromWrite(u8 address, u8* buffer, u16 len);
