# Authors: Cumhur Korkut & Tyler Harden
# Creation Date: 4/20/14

.data  #define data to be used in the ".data" section
promptFirst: .asciiz "\n Enter the first value: "
promptSecond: .asciiz "\n Enter the second value: "
promptThird: .asciiz "\n Enter the third value: "

.text

main:
	li $v0, 4		#code for printing out to console in MIPS
	la $a0, promptFirst	#printing out the "promptFirst"
	syscall
	li    $v0, 5 		#loading in value from console
	addi $a1, $v0, $Zero
    syscall

	li $v0, 4		#code for printing out to console in MIPS
	la $a0, promptSecond	#printing out the "promptSecond"
	syscall					
	li    $v0, 5		#loading in value from console
	addi $a2, $v0, $Zero		
    syscall

    li $v0, 4			#code for printing out to console in MIPS
	la $a0, promptThird	#printing out the "promptThird"
	syscall
	li    $v0, 5		#loading in value from console
	addi $a3, $v0, $Zero		
    syscall

    
    jr recursiveSequence

result:					#print the $t0 value to console
	addi $v0, $a1, 0
	
	lw $s3, 0($sp)				#load third result from stack
	lw $s2, 4($sp)				#load second result from stack
	lw $s1, 8($sp)				#load first result from stack
	lw $a3, 12($sp)				#load third argument from stack
	lw $a2, 16($sp)				#load second argument from stack
	lw $a1, 20($sp)				#load first argument from stack
	lw $ra, 24($sp)				#load the return address
	
	addi $sp, $sp 28
	jr $ra
	
	
	
					

recursiveSequence: 			#workhorse

	addi $sp, $sp, -28			#move the stack down 16
	sw $ra, 24($sp)				#save the return address
	sw $a1, 20($sp)				#save first argument to stack
	sw $a2, 16($sp)				#save second argument to stack
	sw $a3, 12($sp)				#save third argument to stack
	sw $s1, 8($sp)				#save first result to stack
	sw $s2, 4($sp)				#save second result to stack
	sw $s3, 0($sp)				#save third result to stack

	blt $a1, $a2, result	
    beq $a1, $a2, result		# if(a1 <= a2) jump to result

    addi $a1, $a1, -1 			#x-1, call recursive on everything
	jal recursiveSequence

	add $s1, $v0, $zero 		#saving the value from the first recrursive call

	addi $a1, $a1, 1 			#restore first value

	addi $a2, $a2, -1 			#y-1

								#swap values by 
	addi $t0, $a1, 0			#t0 = a1
	addi $t1, $a2, 0			#t1 = a2
	addi $a1, $t1, 0			#a1 = t1
	addi $a2, t0, 0				#a2 = t2
								#y-1,x,z

									#swap values by 
	addi $t0, $a3, 0			#t0 = a3
	addi $t1, $a2, 0			#t1 = a2
	addi $a1, $t1, 0			#a1 = t1
	addi $a3, t0, 0				#a3 = t2
								#y-1, z, x

	jal recursiveSequence

	add $s2, $v0, $zero 		#saving the value from the first recrursive call


	addi $a1, $a1, 1 			#restore first value

								#swap values by 
	addi $t0, $a1, 0			#t0 = a1
	addi $t1, $a2, 0			#t1 = a2
	addi $a1, $t1, 0			#a1 = t1
	addi $a2, t0, 0				#a2 = t2
								#z,y,x

	addi $a1, $a1, -1			#setting z to z-1				

									#swap values by 
	addi $t0, $a3, 0			#t0 = a3
	addi $t1, $a2, 0			#t1 = a2
	addi $a1, $t1, 0			#a1 = t1
	addi $a3, t0, 0				#a3 = t2
								#z-1, x, y
	jal recursiveSequence




	

