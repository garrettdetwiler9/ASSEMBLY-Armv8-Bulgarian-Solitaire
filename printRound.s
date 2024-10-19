@ Garrett Detwiler

.cpu cortex-a53
.fpu neon-fp-armv8

.data
	finalConfig: .asciz "\nFinal Configuration:\n"
	currentPiles: .asciz "\nPiles:\n"
	pile: .asciz "%d, "
	newline: .asciz "\n"
.text
.align 2
.global printRound
.type printRound, %function

printRound:
	
	push {fp, lr}
	add fp, sp, #4

	mov r4, #1 @
 	mov r5, #0 @
	ldr r6, [r9] @ r6 = numPiles

	cmp r8, #1 @ if (sentinel r8 == 1)
	bne current_piles
	ldr r0, =finalConfig
	bl printf
	bl all_done

current_piles:

	ldr r0, =currentPiles
	bl printf
	
all_done:

	for_loop:
		ldr r0, =pile
		cmp r4, r6
		bgt end_for_loop
		ldr r1, [r10, r5] @ r1 = array[i]
		bl printf
	
		add r4, r4, #1 @ i++
		add r5, r5, #4 @ increment array index
		b for_loop

	end_for_loop:
		ldr r0, =newline
		bl printf

		sub sp, fp, #4
		pop {fp, pc}