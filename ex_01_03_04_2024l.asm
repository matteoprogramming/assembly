# ©MB-SOFTWARE - All rights are reserved
# 03/04/2024
# Write an assembly program that adds all the elements
# in even positions of a nested list and prints this sum.

.data
lista:  .word n01         
n01:    .word 5, n02          
n04:    .word -2, 0   
n02:    .word 7, n03
n03:    .word 10, n04  
#Note: the order in the data is not important    

    

# We will use:
# s0 --> as the pointer (it will contain the addresses)
# s1 --> as the position counter
# t0 --> for the i-th element in the list
# a0 --> as the sum of the elements in even positions
# a bit of italian...

.text

	lw s0, lista				
	beq s0, zero, fine	   # We check that the list is not empty
	add a0, zero, zero 	   # We set a0 to 0
	add s1, zero, zero	   # we set s1 t0 0
	
sangue_rosso:
        addi s1, s1, 1             # Increment the position counter s1
        lw t0, 0(s0)               # Load the current value from 'lista' into t0
        lw s0, 4(s0)               # Advance the 'lista' address to the next element
        andi s2, s1, 1             # Check if the position is even (s1 is even)
        beq s2, zero, pari         # Branch to 'pari' if s1 is even
        add a0, a0, t0             # Add the current value to the sum

pari:
        bne s0, zero, sangue_rosso # If we're not at the end of the list, jump back to 'sangue_rosso'

fine:
        addi a7, zero, 1           # Load the system call code for printing whatever in a0 (we load 1 in a7) 
        ecall                      # Execute the syscall
        addi a7, zero, 10          # Load the system call code for terminating the program into a7
        ecall                      # Execute the syscall to terminate the program
