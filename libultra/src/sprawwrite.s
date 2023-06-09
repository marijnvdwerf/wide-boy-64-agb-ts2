.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.12.1 */

glabel __osSpRawWriteIo
/* 1DEA0 80042AA0 27BDFFE8 */  addiu      $sp, $sp, -0x18
/* 1DEA4 80042AA4 AFBF0014 */  sw         $ra, 0x14($sp)
/* 1DEA8 80042AA8 AFBE0010 */  sw         $fp, 0x10($sp)
/* 1DEAC 80042AAC 03A0F021 */  addu       $fp, $sp, $zero
/* 1DEB0 80042AB0 AFC40018 */  sw         $a0, 0x18($fp)
/* 1DEB4 80042AB4 AFC5001C */  sw         $a1, 0x1C($fp)
/* 1DEB8 80042AB8 8FC30018 */  lw         $v1, 0x18($fp)
/* 1DEBC 80042ABC 30620003 */  andi       $v0, $v1, 0x3
/* 1DEC0 80042AC0 14400003 */  bnez       $v0, .L80042AD0
/* 1DEC4 80042AC4 00000000 */   nop
/* 1DEC8 80042AC8 08010ABA */  j          .L80042AE8
/* 1DECC 80042ACC 00000000 */   nop
.L80042AD0:
/* 1DED0 80042AD0 3C048006 */  lui        $a0, %hi(D_8005A2A0)
/* 1DED4 80042AD4 2484A2A0 */  addiu      $a0, $a0, %lo(D_8005A2A0)
/* 1DED8 80042AD8 3C058006 */  lui        $a1, %hi(D_8005A2A4)
/* 1DEDC 80042ADC 24A5A2A4 */  addiu      $a1, $a1, %lo(D_8005A2A4)
/* 1DEE0 80042AE0 0C00EBEC */  jal        __assert
/* 1DEE4 80042AE4 24060035 */   addiu     $a2, $zero, 0x35
.L80042AE8:
/* 1DEE8 80042AE8 0C00F454 */  jal        func_8003D150
/* 1DEEC 80042AEC 00000000 */   nop
/* 1DEF0 80042AF0 10400003 */  beqz       $v0, .L80042B00
/* 1DEF4 80042AF4 00000000 */   nop
/* 1DEF8 80042AF8 08010AC7 */  j          .L80042B1C
/* 1DEFC 80042AFC 2402FFFF */   addiu     $v0, $zero, -0x1
.L80042B00:
/* 1DF00 80042B00 8FC20018 */  lw         $v0, 0x18($fp)
/* 1DF04 80042B04 3C03A000 */  lui        $v1, %hi(D_A0000000)
/* 1DF08 80042B08 00431025 */  or         $v0, $v0, $v1
/* 1DF0C 80042B0C 8FC3001C */  lw         $v1, 0x1C($fp)
/* 1DF10 80042B10 AC430000 */  sw         $v1, %lo(D_A0000000)($v0)
/* 1DF14 80042B14 08010AC7 */  j          .L80042B1C
/* 1DF18 80042B18 00001021 */   addu      $v0, $zero, $zero
.L80042B1C:
/* 1DF1C 80042B1C 03C0E821 */  addu       $sp, $fp, $zero
/* 1DF20 80042B20 8FBF0014 */  lw         $ra, 0x14($sp)
/* 1DF24 80042B24 8FBE0010 */  lw         $fp, 0x10($sp)
/* 1DF28 80042B28 03E00008 */  jr         $ra
/* 1DF2C 80042B2C 27BD0018 */   addiu     $sp, $sp, 0x18
