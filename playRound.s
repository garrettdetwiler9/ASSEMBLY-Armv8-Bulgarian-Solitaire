@ Garrett Detwiler

.cpu cortex-a53
.fpu neon-fp-armv8

.data 

.text
.align 2
.global playRound
.type playRound, %function

playRound:

	push {fp, lr}
	add fp, sp, #4

	mov r4, #0 @ current pile number
	mov r5, #0 @ current pile size
	ldr r6, [r9] @ r6 = numPiles
	mov r7, #0 @ current address shift for array

for_loop:

	cmp r4, r6
	bge end_for_loop
	
	ldr r5, [r10, r7] @ r5 = array[i]
	sub r5, r5, #1 @ subtracts one card from pile
	str r5, [r10, r7] @ array[i] = r5
	add r4, r4, #1 @ increment pile number
	add r7, r7, #4 @ increment pile address
	b for_loop

end_for_loop:
	
	str r4, [r10, r7] @ array[numPiles - 1] = r4
	ldr r6, [r9] @ r6 = numPiles
	add r6, r6, #1 @ increment numPiles
	str r6, [r9] @ str incremented numPiles

	sub sp, fp, #4
	pop {fp, pc}