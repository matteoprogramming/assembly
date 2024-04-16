#The hello word program in assembly
# 16-04-2024

.data
testo: .asciz "Hello world"

.text
    lui a0, 0x10010    # Load address of the string into a0
    li a7, 4           # System call number for printing string
    ecall
    li a7, 10          # System call number for exit
    ecall
