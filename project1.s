# MIPS Programming Project 1
	.data # This is the section to declare variables that will be used in the program
	x: .space 8 # The space for the id is initialized (an id only has 8 characters)

	.text # This is the section where the instructions will be written
main:
	li	$v0, 8	# load value of 8 so syscall knows that it will be reading from and story the input
	la	$a0, x	# Loads the address of the id input to $a0 register
	li	$a1, 8	# Loads the amount of space that is allocated for the input
	syscall	# Keep completing the same instructions until the end of the id is reached 
# Error: Attempt to execute non-instruction at 0x00400034