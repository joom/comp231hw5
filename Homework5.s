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
    syscall

	li $v0, 4		#code for printing out to console in MIPS
	la $a0, promptSecond	#printing out the "promptSecond"
	syscall					#loading in value from console
	li    $v0, 5		
    syscall

    li $v0, 4			#code for printing out to console in MIPS
	la $a0, promptThird	#printing out the "promptSThird"
	syscall
	li    $v0, 5		#loading in value from console
    syscall

    