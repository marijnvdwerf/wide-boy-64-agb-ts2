.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.12.1 */

glabel strcpy
/* 21750 80046350 00A41023 */  subu       $v0, $a1, $a0
/* 21754 80046354 30420003 */  andi       $v0, $v0, 0x3
/* 21758 80046358 10400012 */  beqz       $v0, .L800463A4
/* 2175C 8004635C 00803021 */   addu      $a2, $a0, $zero
/* 21760 80046360 90A20000 */  lbu        $v0, 0x0($a1)
/* 21764 80046364 A0820000 */  sb         $v0, 0x0($a0)
/* 21768 80046368 24A50001 */  addiu      $a1, $a1, 0x1
/* 2176C 8004636C 10400028 */  beqz       $v0, .L80046410
/* 21770 80046370 24860001 */   addiu     $a2, $a0, 0x1
.L80046374:
/* 21774 80046374 90A20000 */  lbu        $v0, 0x0($a1)
/* 21778 80046378 A0C20000 */  sb         $v0, 0x0($a2)
/* 2177C 8004637C 24A50001 */  addiu      $a1, $a1, 0x1
/* 21780 80046380 1440FFFC */  bnez       $v0, .L80046374
/* 21784 80046384 24C60001 */   addiu     $a2, $a2, 0x1
/* 21788 80046388 08011904 */  j          .L80046410
/* 2178C 8004638C 00000000 */   nop
.L80046390:
/* 21790 80046390 90A20000 */  lbu        $v0, 0x0($a1)
/* 21794 80046394 A0C20000 */  sb         $v0, 0x0($a2)
/* 21798 80046398 24A50001 */  addiu      $a1, $a1, 0x1
/* 2179C 8004639C 1040001C */  beqz       $v0, .L80046410
/* 217A0 800463A0 24C60001 */   addiu     $a2, $a2, 0x1
.L800463A4:
/* 217A4 800463A4 30C20003 */  andi       $v0, $a2, 0x3
/* 217A8 800463A8 1440FFF9 */  bnez       $v0, .L80046390
/* 217AC 800463AC 00000000 */   nop
.L800463B0:
/* 217B0 800463B0 8CA30000 */  lw         $v1, 0x0($a1)
/* 217B4 800463B4 3C02FF00 */  lui        $v0, (0xFF000000 >> 16)
/* 217B8 800463B8 00621024 */  and        $v0, $v1, $v0
/* 217BC 800463BC 14400003 */  bnez       $v0, .L800463CC
/* 217C0 800463C0 24A50004 */   addiu     $a1, $a1, 0x4
/* 217C4 800463C4 08011904 */  j          .L80046410
/* 217C8 800463C8 A0C00000 */   sb        $zero, 0x0($a2)
.L800463CC:
/* 217CC 800463CC 3C0200FF */  lui        $v0, (0xFF0000 >> 16)
/* 217D0 800463D0 00621024 */  and        $v0, $v1, $v0
/* 217D4 800463D4 14400004 */  bnez       $v0, .L800463E8
/* 217D8 800463D8 3062FF00 */   andi      $v0, $v1, 0xFF00
/* 217DC 800463DC 00031402 */  srl        $v0, $v1, 16
/* 217E0 800463E0 08011904 */  j          .L80046410
/* 217E4 800463E4 A4C20000 */   sh        $v0, 0x0($a2)
.L800463E8:
/* 217E8 800463E8 10400007 */  beqz       $v0, .L80046408
/* 217EC 800463EC 00031402 */   srl       $v0, $v1, 16
/* 217F0 800463F0 ACC30000 */  sw         $v1, 0x0($a2)
/* 217F4 800463F4 306200FF */  andi       $v0, $v1, 0xFF
/* 217F8 800463F8 1440FFED */  bnez       $v0, .L800463B0
/* 217FC 800463FC 24C60004 */   addiu     $a2, $a2, 0x4
/* 21800 80046400 08011904 */  j          .L80046410
/* 21804 80046404 00000000 */   nop
.L80046408:
/* 21808 80046408 A4C20000 */  sh         $v0, 0x0($a2)
/* 2180C 8004640C A0C00002 */  sb         $zero, 0x2($a2)
.L80046410:
/* 21810 80046410 03E00008 */  jr         $ra
/* 21814 80046414 00801021 */   addu      $v0, $a0, $zero
/* 21818 80046418 00000000 */  nop
/* 2181C 8004641C 00000000 */  nop