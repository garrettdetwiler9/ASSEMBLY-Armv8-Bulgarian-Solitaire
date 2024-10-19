@ Garrett Detwiler

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global main
.type main, %function

main:
	push {fp, lr}
	add fp, sp, #4
	
	@ r9 = &numPiles
	sub sp, sp, #8
	mov r9, sp

	@ memory allocation for array of size 45
	mov r0, #45
	mov r0, r0, LSL #2

	sub sp, sp, r0 @ sp = array[0]
	mov r10, sp @ r10 = &array
	str sp, [fp, #-8] @ &sp to first available address
	mov r0, #0 @ numPiles = 0
	str r0, [fp, #-12] @ &(arraySize) to second available address
	ldr r1, [fp, #-12] @ r1 = numPiles

	@ set seed
	bl time
	bl srand

	mov r8, #0 @ loop sentinel
	bl roundZero
	bl printRound

for_loop:

	cmp r8, #1
	beq end_for_loop

	bl playRound
	bl arrangePiles
	bl printRound
	bl roundConfig
	b for_loop

end_for_loop:

	bl printRound
	
	sub sp, fp, #4
	pop {fp, pc}