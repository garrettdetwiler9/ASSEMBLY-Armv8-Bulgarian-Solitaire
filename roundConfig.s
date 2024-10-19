@ Garrett Detwiler

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global roundConfig
.type roundConfig, %function

roundConfig:

	push {fp, lr}
	add fp, sp, #4
	
	ldr r6, [r9] @ r6 = numPiles
	cmp r6, #9 
	bne next_round 

	mov r0, #0 @ r0 = 0
	mov r2, #9 @ r2 = 9
	mov r7, #8 @ r7 = 8

loop:

	sub r2, r6, r7 @ r2 = numPiles - r7
	mov r1, r0, LSL #2 
	ldr r4, [r10, r1]
	
	nested_loop:
		cmp r2, #9
		bge end_nested_loop
		
		mov r3, r2, LSL #2
		ldr r5, [r10, r3]

		cmp r4, r5
		beq next_round

		add r2, r2, #1 @ r2++
		bl nested_loop

end_nested_loop:

	add r0, r0, #1 
	sub r7, r7, #1

	cmp r0, #9
	bge all_done @ if (r0 >= 9)	
	bl loop

all_done:

	mov r8, #1

next_round:
	
	sub sp, fp, #4
	pop {fp, pc}