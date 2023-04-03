.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.12.1 */

glabel __osGetActiveQueue
/* 1DF80 80042B80 27BDFFF8 */  addiu      $sp, $sp, -0x8
/* 1DF84 80042B84 AFBE0000 */  sw         $fp, 0x0($sp)
/* 1DF88 80042B88 03A0F021 */  addu       $fp, $sp, $zero
/* 1DF8C 80042B8C 3C028005 */  lui        $v0, %hi(D_80052BEC)
/* 1DF90 80042B90 08010AE6 */  j          .L80042B98
/* 1DF94 80042B94 8C422BEC */   lw        $v0, %lo(D_80052BEC)($v0)
.L80042B98:
/* 1DF98 80042B98 03C0E821 */  addu       $sp, $fp, $zero
/* 1DF9C 80042B9C 8FBE0000 */  lw         $fp, 0x0($sp)
/* 1DFA0 80042BA0 03E00008 */  jr         $ra
/* 1DFA4 80042BA4 27BD0008 */   addiu     $sp, $sp, 0x8
/* 1DFA8 80042BA8 00000000 */  nop
/* 1DFAC 80042BAC 00000000 */  nop
