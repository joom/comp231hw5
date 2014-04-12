# Authors: Cumhur Korkut & Tyler Harden
# Creation Date: 4/20/14

.data  #define data to be used in the ".data" section
promptFirst: .asciiz "\n Enter the first value: "
promptSecond: .asciiz "\n Enter the second value: "
promptThird: .asciiz "\n Enter the third value: "

.text

main:
	li $v0, 4
	la $a0, promptFirst
	syscall
