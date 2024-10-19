@ Garrett Detwiler

.cpu cortex-a53
.fpu neon-fp-armv8

.data 

.text
.align 2
.global arrangePiles
.type arrangePiles, %function


arrangePiles:

	push {fp, lr}
	add fp, sp, #4
	
	mov r4, #0 @ i = 0
	ldr r6, [r9] @ r6 = numPiles

while_loop:

	cmp r4, r6 @ if (i == numPiles)
	bge end_while_loop

	mov r5, r4, LSL #2 @ r5 = &array[i]
	ldr r3, [r10, r5] @ r3 = array[i]
	
	cmp r3, #0
	bne skipArrange @ avoids rearranging a single pile if i = 0
	sub r6, r6, #1 @ decrement numPiles
	mov r3, r6, LSL #2 @ r3 = &array[numPiles - 1]
	ldr r3, [r10, r3] @ r3 = array[numPiles - 1]
	str r3, [r10, r5] @ array[0] = r3

skipArrange:
	add r4, r4, #1
	bl while_loop

end_while_loop:
	cmp r4, r6 @ if (i == numPiles)
	beq endArrange 
	
	mov r5, r4, LSL #2 @ r5 = &array[i]
	ldr r3, [r10, r5] @ r3 = array[i]
	cmp r3, #0
	bne endArrange

	sub r6, r6, #1 @ decrement numPiles

endArrange:
	str r6, [r9]

	sub sp, fp, #4
	pop {fp, pc}
	