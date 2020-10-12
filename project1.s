# MIPS Programming Project 1
	.data # This is the section to declare variables that will be used in the program
	x: .space 9 # The space for the id is initialized (an id only has 8 characters)

	.text # This is the section where the instructions will be written
main:
	li	$v0, 8	# load value of 8 so syscall knows that it will be reading from and story the input
	la	$a0, x	# Loads the address of the id input to $a0 register
	li	$a1, 9	# Loads the amount of space that is allocated for the input 
	syscall	# Keep completing the same instructions until the end of the id is reached 

	addi	$t0, $zero, 3	# Temporarily hold a test value that will eventually represent sum
	sw	$t0, 8($a0)	# Store the sum in memory right after the id string
	li	$v0, 1		# Loads value that tells syscall to print
	lw	$a0, 8($a0)	# Load the sum from memory so it can be printed
	syscall			# Completes the print instruction

	li	$v0, 10		# Exit program call
	syscall
