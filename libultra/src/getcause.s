.include "macro.inc"

/* assembler directives */
.set noat
.set noreorder
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.12.1 */

# Handwritten function
glabel func_8003CEA0
/* 182A0 8003CEA0 40026800 */  mfc0       $v0, $13 # handwritten instruction
/* 182A4 8003CEA4 03E00008 */  jr         $ra
/* 182A8 8003CEA8 00000000 */   nop
/* 182AC 8003CEAC 00000000 */  nop