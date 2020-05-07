; Preenche a memória RAM
; com um contador progresssivo. O valor
; da RAM[2] tem o tamanho total do vetor.
; O vetor deve começar em RAM[3]
;
; RAM[0] e RAM[1] podem ser usados livremente
;
; ------------------------------------
; antes       | depois
;             |
; RAM[0]:     | RAM[0]:  
; RAM[1]:     | RAM[1]:  
; RAM[2]:  4  | RAM[2]:  4
; RAM[3]:  0  | RAM[3]:  0 -
; RAM[4]:  0  | RAM[4]:  1 | vetor
; RAM[5]:  0  | RAM[5]:  2 | 
; RAM[6]:  0  | RAM[6]:  3 -
; RAM[7]:  0  | RAM[7]:  0

;ATUAL:
leaw $0, %A 
movw %A, (%A)

LOOP:
leaw $0, %A 
movw (%A), %D 
leaw %2, %A 
subw (%A), %D, %D 

leaw $END, %A 
jle %D 
nop 

leaw $3, %A 
movw %A, %D 
leaw %0, %A 
addw (%A), %D, %D 
leaw $1, %A 
movw %D, (%A)
leaw $0, %A 
movw (%A), %D 
leaw $1, %A
movw (%A), %A 
movw %D, (%A)
leaw $0, %A 
movw (%A), %D 
incw %D 
movw %D, (%A)

leaw $LOOP, %A 
jmp
nop


END: 
