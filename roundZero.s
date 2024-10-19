@ Garrett Detwiler

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global roundZero
.type roundZero, %function

roundZero:

	push {fp, lr}
	add fp, sp, #4

	mov r4, #0
	mov r5, #0
	mov r7, #45 @ r7 = numCards

for_loop:

	cmp r4, r7 @ if (r4 >= 45)
	bge end_for_loop
	mov r0, #0
	
	@ r4 += rand() % (45 - r4) + 1
	bl rand
	sub r1, r7, r4 @ r1 = 45 - r4
	bl modulo
	add r0, r0, #1
	add r4, r4, r0 

	str r0, [r10, r5] @ array[i] = r0
	ldr r6, [r9] @ r6 = numPiles
	add r6, r6, #1 @ increment numPiles
	str r6, [r9] @ numPiles = numPiles + 1
	add r5, r5, #4
	bl for_loop

end_for_loop:

	str r6, [r9] @ update numPiles
	
	sub sp, fp, #4
	pop {fp, pc}