# MB SOFTWARE
# Exercise 2.1 -- 14-04-2024
# Given an array in the data segment, print 1 if it is sorted incrementally, 0 otherwise.
.data
l: .word 7
x: .word -2, -1, 8, 8, 17, 48, 78, 556
# WE ASSUME THE LENGHT IS >= 1 (in the case of 1 it's ok... it is alone and happy!)
# strict inequality > is required to an incrementation be considered for us!
.text
	la s0, x  # in s0 we put the address of the array
	lw t0, l  # in t0 we put the length of the array
	addi a0, zero, 1   # by default we consider that it is not sorted incremetally -- we are optimistic
	# we will put the contents of two consecutive array elements in t1 and t2 in order to compare them
cicla:	lw t1, 0(s0) # in t0 the first element of comparison
	lw t2 4(s0)  # in t1 the second element of comparison
	addi s0, s0, 4    # we prepare the pointer for the new elements by putting it forward by 4
	addi t0, t0, -1	  # we decrement the lenght of the list
	ble t1, t2, salta # let's check that we are in the optimistic case
	addi a0, zero, 0  # ops... we are not in the optimistic case... we have to change a0 in 0
	bgt t1, t2, fine  # and now we can move the end without looking and the end
salta:	bne t0, zero, cicla # cicla cicla... chi cerca trova!
fine:	li a7, 1 # now let's print a0
	ecall
	li a7, 10 	# and we can exit
	ecall		# bye bye ...