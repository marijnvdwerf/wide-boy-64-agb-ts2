.include "macro.inc"

/* assembler directives */
.set noat
.set noreorder
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.12.1 */

# Handwritten function
glabel func_8003CEB0
/* 182B0 8003CEB0 40024800 */  mfc0       $v0, $9 # handwritten instruction
/* 182B4 8003CEB4 03E00008 */  jr         $ra
/* 182B8 8003CEB8 00000000 */   nop
/* 182BC 8003CEBC 00000000 */  nop
