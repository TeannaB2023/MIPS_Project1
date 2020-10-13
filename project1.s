# MIPS Programming Project 1
	.data # This is the section to declare variables that will be used in the program
	x: .space 11 # The space for the id is initialized (an id only has 10 characters)

	.text # This is the section where the instructions will be written
main:
	li	$v0, 8	# load value of 8 so syscall knows that it will be reading from and story the input
	la	$a0, x	# Loads the address of the id input to $a0 register
	li	$a1, 11	# Loads the amount of space that is allocated for the input 
	syscall		# Completes the read string instruction
	
	add	$t0, $zero, $zero	# Temporarily hold a test value that will eventually represent sum
	add	$t3, $zero, $zero	# Keeps track of the increments for the loop

START:	
	lb	$t1, 0($a0)		# Loads the ASCII value of the first character
	slti	$t2, $t1, 48		# Evaluates if the ASCII value could be a number or letter
	bne	$t2, $zero, NOT		# If the value of the character is less than it's not a viable number

NUM:
	slti	$t2, $t1, 58		# Checks if the value represents a number
	beq	$t2, $zero, UPPER	# If not check to see if it's an uppercase letter

UPPER:
	slti	$t2, $t1, 91		# Checks if the value represents an uppercase letter
	beq	$t2, $zero, LOWER	# If not check to see if it's a lowercase letter

LOWER:
	addi	$t1, $t1, -87		# Adjusts the value of a lower case letter
	add	$t0, $t0, $t1		# Adds the character value to the sum

NOT:					# If not the sum is skipped over
	addi	$a0, $a0, 1		# Increment the address by one
	addi	$t3, $t3, 1		# Increment the loop counter by 1	
	slti	$t4, $t3, 10		# This will check if current place of the loop is still on the input 
	bne	$t4, $zero, START	# The program will loop for only 10 iterations
			
	sh	$t0, 0($a0)	# Store the sum in memory right after the id string
	li	$v0, 1		# Loads value that tells syscall to print
	lh	$a0, 0($a0)	# Load the sum from memory so it can be printed
	syscall			# Completes the print instruction

	li	$v0, 10		# Exit program call
	syscall
