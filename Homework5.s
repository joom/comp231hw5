# COMP231 Assignment 5
# Cumhur Korkut & Tyler Harden

###########
# Question 3: the result of f(10,8,1) is 10.
###########

.data  #keeping the strings
    promptFirst: .asciiz "Enter the first value: "
    promptSecond: .asciiz "Enter the second value: "
    promptThird: .asciiz "Enter the third value: "
    newLine: .asciiz "\n"

.text

main:
    addiu   $sp,$sp,-24
    sw  $ra,20($sp)
    sw  $fp,16($sp)
    move    $fp,$sp

# Start Taking Input
    li $v0, 4       #code for printing out to console in MIPS
    la $a0, promptFirst #printing out the "promptFirst"
    syscall
    li    $v0, 5        #loading in value from console
    syscall
    addi $t0, $v0, 0 #save value in t0
    

    li $v0, 4       #code for printing out to console in MIPS
    la $a0, promptSecond    #printing out the "promptSecond"
    syscall                 
    li    $v0, 5        #loading in value from console     
    syscall
    addi $t1, $v0, 0   #save value in t1

    li $v0, 4           #code for printing out to console in MIPS
    la $a0, promptThird #printing out the "promptThird"
    syscall
    li    $v0, 5        #loading in value from console     
    syscall
    addi $t2, $v0, 0   #save value in t2

    #move temporary values to argument registers
    move $a0, $t0
    move $a1, $t1
    move $a2, $t2

    jal f

    addi    $a0, $v0, 0  #print the result
    li    $v0, 1
    syscall

    li $v0, 4           #code for printing out to console in MIPS
    la $a0, newLine #printing out the "newLine"
    syscall
    li $v0, 4           #code for printing out to console in MIPS
    la $a0, newLine #printing out the "newLine"
    syscall

    j main #start over

f: #function f
    addiu   $sp, $sp,-32 #adjustment
    sw  $ra, 28($sp) #store address in stack
    sw  $fp, 24($sp) #save fp to stack
    sw  $s1, 20($sp) #save s1 to stack
    sw  $s0, 16($sp) #save s0 to stack
    move    $fp, $sp
    sw  $a0, 32($fp) #save a0 to fp
    sw  $a1, 36($fp) #save a1 to fp
    sw  $a2, 40($fp) #save a2 to fp
    lw  $v1, 32($fp) #load v1 from fp
    lw  $v0, 36($fp) #load v0 from fp

    slt $v0, $v0, $v1
    bne $v0, $0, notEqual #branch if v0 is not zero
    lw  $v0,36($fp)
    j   equal           #if v0 is zero, jump to "equal"

notEqual:
    lw  $v0,32($fp)

    addiu   $v0, $v0, -1 #adjustment
    move    $a0, $v0
    lw  $a1, 36($fp) #load a1 from fp
    lw  $a2, 40($fp) #load a2 from fp
    jal f           #jump to function f
    move    $s1, $v0
    lw  $v0, 36($fp) #load v0 from fp

    addiu   $v0,$v0,-1 #adjustment
    move    $a0,$v0
    lw  $a1,40($fp) #load a1 from fp
    lw  $a2,32($fp) #load a2 from fp
    jal f           #jump to function f
    move    $s0,$v0
    lw  $v0,40($fp) #load v0 from fp

    addiu   $v0,$v0,-1 #adjustment
    move    $a0,$v0
    lw  $a1,32($fp) #load a1 from fp
    lw  $a2,36($fp) #load a2 from fp
    jal f           #jump to function f
    move    $a0,$s1 #move from s1 to a0
    move    $a1,$s0 #move from s0 to a1
    move    $a2,$v0 #move from v0 to a2
    jal f           #jump to function f

equal:
    move    $sp,$fp
    lw  $ra,28($sp) #load address from stack
    lw  $fp,24($sp) #load fp from stack pointer
    lw  $s1,20($sp) #load s1 from stack pointer
    lw  $s0,16($sp) #load s0 from stack pointer
    addiu   $sp,$sp,32
    j   $ra         #jump back to registered address
