;Count the even and odd parity numbers of 150 data stored in memory starting from C050H. Store the counts in D000H and D001H respectively.

LXI H, C050H ; Load HL with the starting address of the data
MVI C, 96H
MVI D, 00H ; COunt of odd parity
MVI E, 00H ; Count of even parity

MOV A,M 
ADI 00H 
JPE SKIP     
INR D 
JMP DOWN  
BEL : INR E

SKIP : INX H
DCR C
JNZ SKIP  
MOV A, D
STA D000H ; Store the count of odd parity numbers at D000H
MOV A, E
STA D001H ; Store the count of even parity numbers at D001H
HLT
END