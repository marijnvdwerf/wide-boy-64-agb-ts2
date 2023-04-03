.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.12.1 */

glabel func_8003B500
/* 16900 8003B500 00851026 */  xor        $v0, $a0, $a1
/* 16904 8003B504 28C10010 */  slti       $at, $a2, 0x10
/* 16908 8003B508 14200034 */  bnez       $at, .L8003B5DC
/* 1690C 8003B50C 00000000 */   nop
/* 16910 8003B510 30420003 */  andi       $v0, $v0, 0x3
/* 16914 8003B514 14400018 */  bnez       $v0, .L8003B578
/* 16918 8003B518 0004C023 */   negu      $t8, $a0
/* 1691C 8003B51C 33180003 */  andi       $t8, $t8, 0x3
/* 16920 8003B520 13000007 */  beqz       $t8, .L8003B540
/* 16924 8003B524 00D83023 */   subu      $a2, $a2, $t8
/* 16928 8003B528 00601021 */  addu       $v0, $v1, $zero
/* 1692C 8003B52C 88820000 */  lwl        $v0, 0x0($a0)
/* 16930 8003B530 88A30000 */  lwl        $v1, 0x0($a1)
/* 16934 8003B534 00982021 */  addu       $a0, $a0, $t8
/* 16938 8003B538 14430033 */  bne        $v0, $v1, .L8003B608
/* 1693C 8003B53C 00B82821 */   addu      $a1, $a1, $t8
.L8003B540:
/* 16940 8003B540 2401FFFC */  addiu      $at, $zero, -0x4
/* 16944 8003B544 00C13824 */  and        $a3, $a2, $at
/* 16948 8003B548 10E00024 */  beqz       $a3, .L8003B5DC
/* 1694C 8003B54C 00C73023 */   subu      $a2, $a2, $a3
/* 16950 8003B550 00E43821 */  addu       $a3, $a3, $a0
.L8003B554:
/* 16954 8003B554 8C820000 */  lw         $v0, 0x0($a0)
/* 16958 8003B558 8CA30000 */  lw         $v1, 0x0($a1)
/* 1695C 8003B55C 24840004 */  addiu      $a0, $a0, 0x4
/* 16960 8003B560 14430029 */  bne        $v0, $v1, .L8003B608
/* 16964 8003B564 24A50004 */   addiu     $a1, $a1, 0x4
/* 16968 8003B568 1487FFFA */  bne        $a0, $a3, .L8003B554
/* 1696C 8003B56C 00000000 */   nop
/* 16970 8003B570 1000001A */  b          .L8003B5DC
/* 16974 8003B574 00000000 */   nop
.L8003B578:
/* 16978 8003B578 00053823 */  negu       $a3, $a1
/* 1697C 8003B57C 30E70003 */  andi       $a3, $a3, 0x3
/* 16980 8003B580 10E00009 */  beqz       $a3, .L8003B5A8
/* 16984 8003B584 00C73023 */   subu      $a2, $a2, $a3
/* 16988 8003B588 00E43821 */  addu       $a3, $a3, $a0
.L8003B58C:
/* 1698C 8003B58C 90820000 */  lbu        $v0, 0x0($a0)
/* 16990 8003B590 90A30000 */  lbu        $v1, 0x0($a1)
/* 16994 8003B594 24840001 */  addiu      $a0, $a0, 0x1
/* 16998 8003B598 1443001B */  bne        $v0, $v1, .L8003B608
/* 1699C 8003B59C 24A50001 */   addiu     $a1, $a1, 0x1
/* 169A0 8003B5A0 1487FFFA */  bne        $a0, $a3, .L8003B58C
/* 169A4 8003B5A4 00000000 */   nop
.L8003B5A8:
/* 169A8 8003B5A8 2401FFFC */  addiu      $at, $zero, -0x4
/* 169AC 8003B5AC 00C13824 */  and        $a3, $a2, $at
/* 169B0 8003B5B0 10E0000A */  beqz       $a3, .L8003B5DC
/* 169B4 8003B5B4 00C73023 */   subu      $a2, $a2, $a3
/* 169B8 8003B5B8 00E43821 */  addu       $a3, $a3, $a0
.L8003B5BC:
/* 169BC 8003B5BC 88820000 */  lwl        $v0, 0x0($a0)
/* 169C0 8003B5C0 98820003 */  lwr        $v0, 0x3($a0)
/* 169C4 8003B5C4 8CA30000 */  lw         $v1, 0x0($a1)
/* 169C8 8003B5C8 24840004 */  addiu      $a0, $a0, 0x4
/* 169CC 8003B5CC 1443000E */  bne        $v0, $v1, .L8003B608
/* 169D0 8003B5D0 24A50004 */   addiu     $a1, $a1, 0x4
/* 169D4 8003B5D4 1487FFF9 */  bne        $a0, $a3, .L8003B5BC
/* 169D8 8003B5D8 00000000 */   nop
.L8003B5DC:
/* 169DC 8003B5DC 18C00008 */  blez       $a2, .L8003B600
/* 169E0 8003B5E0 00C43821 */   addu      $a3, $a2, $a0
.L8003B5E4:
/* 169E4 8003B5E4 90820000 */  lbu        $v0, 0x0($a0)
/* 169E8 8003B5E8 90A30000 */  lbu        $v1, 0x0($a1)
/* 169EC 8003B5EC 24840001 */  addiu      $a0, $a0, 0x1
/* 169F0 8003B5F0 14430005 */  bne        $v0, $v1, .L8003B608
/* 169F4 8003B5F4 24A50001 */   addiu     $a1, $a1, 0x1
/* 169F8 8003B5F8 1487FFFA */  bne        $a0, $a3, .L8003B5E4
/* 169FC 8003B5FC 00000000 */   nop
.L8003B600:
/* 16A00 8003B600 03E00008 */  jr         $ra
/* 16A04 8003B604 00001021 */   addu      $v0, $zero, $zero
.L8003B608:
/* 16A08 8003B608 03E00008 */  jr         $ra
/* 16A0C 8003B60C 24020001 */   addiu     $v0, $zero, 0x1
