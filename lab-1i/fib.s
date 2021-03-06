	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	push {r3, r4, r5, r6, lr}  	@ PROLOG

	mov r5,#0                       @ r5 = i = 0
        mov r6,#0                       @ r6 = sum = 0
        sub r3,r5,#1                    @ r3 = previous = r5-1 = -1
	mov r4,#1                       @ r4 = result = 1
	
.For:
	cmp r5,r0                       @ compare r5(i) to r0(x)
	ble .L3                         @ if r5<=r0 goto .L3 
	mov r0,r4                       @ r0 = r4 (return result)
	pop {r3, r4, r5, r6, pc}       

	@ END CODE MODIFICATION
.L3:
	add r6,r4,r3                    @ r6 = r3+r4 (sum=result+previous)
	mov r3,r4                       @ r3 = r4 (previous = result)
	mov r4,r6                       @ r4 = r6 (result = sum)
	add r5,#1                       @ r5 = r5+1 (i++) 
	bl .For                         @ goto .For

	.size fibonacci, .-fibonacci
	.end
