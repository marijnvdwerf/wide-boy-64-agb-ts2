.include "macro.inc"

/* assembler directives */
.set noat
.set noreorder
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.12.1 */

# Handwritten function
glabel func_8003AAE0
/* 15EE0 8003AAE0 18A00011 */  blez       $a1, .L8003AB28
/* 15EE4 8003AAE4 00000000 */   nop
/* 15EE8 8003AAE8 240B4000 */  addiu      $t3, $zero, 0x4000
/* 15EEC 8003AAEC 00AB082B */  sltu       $at, $a1, $t3
/* 15EF0 8003AAF0 1020000F */  beqz       $at, .L8003AB30
/* 15EF4 8003AAF4 00000000 */   nop
/* 15EF8 8003AAF8 00804021 */  addu       $t0, $a0, $zero
/* 15EFC 8003AAFC 00854821 */  addu       $t1, $a0, $a1
/* 15F00 8003AB00 0109082B */  sltu       $at, $t0, $t1
/* 15F04 8003AB04 10200008 */  beqz       $at, .L8003AB28
/* 15F08 8003AB08 00000000 */   nop
/* 15F0C 8003AB0C 2529FFE0 */  addiu      $t1, $t1, -0x20
/* 15F10 8003AB10 310A001F */  andi       $t2, $t0, 0x1F
/* 15F14 8003AB14 010A4023 */  subu       $t0, $t0, $t2
.L8003AB18:
/* 15F18 8003AB18 BD100000 */  cache      0x10, 0x0($t0) # handwritten instruction
/* 15F1C 8003AB1C 0109082B */  sltu       $at, $t0, $t1
/* 15F20 8003AB20 1420FFFD */  bnez       $at, .L8003AB18
/* 15F24 8003AB24 25080020 */   addiu     $t0, $t0, 0x20
.L8003AB28:
/* 15F28 8003AB28 03E00008 */  jr         $ra
/* 15F2C 8003AB2C 00000000 */   nop
.L8003AB30:
/* 15F30 8003AB30 3C088000 */  lui        $t0, 0x8000
/* 15F34 8003AB34 010B4821 */  addu       $t1, $t0, $t3
/* 15F38 8003AB38 2529FFE0 */  addiu      $t1, $t1, -0x20
.L8003AB3C:
/* 15F3C 8003AB3C BD000000 */  cache      0x00, 0x0($t0) # handwritten instruction
/* 15F40 8003AB40 0109082B */  sltu       $at, $t0, $t1
/* 15F44 8003AB44 1420FFFD */  bnez       $at, .L8003AB3C
/* 15F48 8003AB48 25080020 */   addiu     $t0, $t0, (0x80000020 & 0xFFFF)
/* 15F4C 8003AB4C 03E00008 */  jr         $ra
/* 15F50 8003AB50 00000000 */   nop
/* 15F54 8003AB54 00000000 */  nop
/* 15F58 8003AB58 00000000 */  nop
/* 15F5C 8003AB5C 00000000 */  nop
