.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.12.1 */

# Handwritten function
glabel func_8003CEC0
/* 182C0 8003CEC0 40026000 */  mfc0       $v0, $12 # handwritten instruction
/* 182C4 8003CEC4 03E00008 */  jr         $ra
/* 182C8 8003CEC8 00000000 */   nop
/* 182CC 8003CECC 00000000 */  nop
