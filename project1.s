# MIPS Programming Project 1
.data # This is the section to declare variables that will be used in the program
x: .asciiz # The variable of the student ID is declared and the value representation is ASCII

.text # This is the section where the instructions will be written
main: # High Level Approach
	# Identify the ASCII value and relate it to the base 30 value
	# If the char value is in Base N continue to add the Base N value to the output
	# Else jump past the add to output instruction
	# Keep completing the same instructions until the end of the id is reached 
	# Output the sum of the viable character values