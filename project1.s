# MIPS Programming Project 1
	.data # This is the section to declare variables that will be used in the program
	x: .space 9 # The space for the id is initialized (an id only has 8 characters)

	.text # This is the section where the instructions will be written
main:
	li	$v0, 8	# load value of 8 so syscall knows that it will be reading from and story the input
	la	$a0, x	# Loads the address of the id input to $a0 register
	li	$a1, 9	# Loads the amount of space that is allocated for the input 
	syscall	# Keep completing the same instructions until the end of the id is reached 
	
	add	$t0, $zero, $zero	# Temporarily hold a test value that will eventually represent sum
START:	
	lb	$t1, 0($a0)		# Loads the ASCII value of the first character
	addi	$t2, $zero, 97		# Stores starting value of lowercase letters in ASCII
	blt	$t1, $t2, NOTLOWER	# If the value of the character greater than the LC value it's added to the sum
LOWER:
	addi	$t1, $t1, -87		# Adjusts the value of a lower case letter
	add	$t0, $t0, $t1		# Adds the character value to the sum
NOTLOWER:				# If not the sum is skipped over
	sw	$t0, 8($a0)	# Store the sum in memory right after the id string
	li	$v0, 1		# Loads value that tells syscall to print
	lw	$a0, 8($a0)	# Load the sum from memory so it can be printed
	syscall			# Completes the print instruction

	li	$v0, 10		# Exit program call
	syscall
