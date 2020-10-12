# MIPS Programming Project 1
	.data # This is the section to declare variables that will be used in the program
	x: .space 9 # The space for the id is initialized (an id only has 8 characters)

	.text # This is the section where the instructions will be written
main:
	li	$v0, 8	# load value of 8 so syscall knows that it will be reading from and story the input
	la	$a0, x	# Loads the address of the id input to $a0 register
	li	$a1, 9	# Loads the amount of space that is allocated for the input 
	syscall	# Completes the read string instruction
	
	add	$t0, $zero, $zero	# Temporarily hold a test value that will eventually represent sum
	add	$t3, $zero, $zero	# Keeps track of the increments for the loop

START:	
	lb	$t1, 0($a0)		# Loads the ASCII value of the first character
	addi	$t2, $zero, 97		# Stores starting value of lowercase letters in ASCII
	blt	$t1, $t2, NOT		# If the value of the character greater than the LC value it's added to the sum

LOWER:
	addi	$t1, $t1, -87		# Adjusts the value of a lower case letter
	add	$t0, $t0, $t1		# Adds the character value to the sum

NOT:					# If not the sum is skipped over
	addi	$a0, $a0, 1		# Increment the address by one
	addi	$t3, $t3, 1		# Increment the loop counter by 1	
	slti	$t4, $t3, 8		# This will check if current place of the loop is still on the input 
	bne	$t4, $zero, START	# The program will loop for only 8 iterations

	sw	$t0, 0($a0)	# Store the sum in memory right after the id string
	li	$v0, 1		# Loads value that tells syscall to print
	lw	$a0, 0($a0)	# Load the sum from memory so it can be printed
	syscall			# Completes the print instruction

	li	$v0, 10		# Exit program call
	syscall
