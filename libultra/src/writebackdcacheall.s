.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.12.1 */

# Handwritten function
glabel osWritebackDCacheAll
/* AAD0 8002F6D0 3C088000 */  lui        $t0, 0x8000
/* AAD4 8002F6D4 240A2000 */  addiu      $t2, $zero, 0x2000
/* AAD8 8002F6D8 010A4821 */  addu       $t1, $t0, $t2
/* AADC 8002F6DC 2529FFF0 */  addiu      $t1, $t1, -0x10
.L8002F6E0:
/* AAE0 8002F6E0 BD010000 */  cache      0x01, 0x0($t0) # handwritten instruction
/* AAE4 8002F6E4 0109082B */  sltu       $at, $t0, $t1
/* AAE8 8002F6E8 1420FFFD */  bnez       $at, .L8002F6E0
/* AAEC 8002F6EC 25080010 */   addiu     $t0, $t0, (0x80000010 & 0xFFFF)
/* AAF0 8002F6F0 03E00008 */  jr         $ra
/* AAF4 8002F6F4 00000000 */   nop
/* AAF8 8002F6F8 00000000 */  nop
/* AAFC 8002F6FC 00000000 */  nop
