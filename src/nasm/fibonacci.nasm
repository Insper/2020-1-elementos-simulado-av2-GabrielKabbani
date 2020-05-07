;Calcule a série de fibonacci, sendo
; RAM[0] o valor que define o tamanho da
; série e RAM[5] o seu inicio
;
; RAM[0]:  5     <--- Tamanho da série (sempre > 2)
; RAM[1]:        ---- livre para uso!   CONTADOR  
; RAM[2]:        ---- livre para uso!   GUARDADOR TEMPORARIO
; ....
; RAM[5]:  1       -- inicio
; RAM[6]:  1       |
; RAM[7]:  2       |
; RAM[8]:  3       |
; RAM[9]:  5       v série (N=5)

leaw $6, %A 
movw %A, %D 
leaw $1, %A 
movw %D, (%A)
movw %A, %D 

leaw $5,%A 
movw %D, (%A)
leaw $6, %A 
movw %D, (%A)

LOOP:
leaw $1, %A 
movw (%A), %D 
incw %D 
movw %D, (%A)

leaw $5, %A
subw %D, %A, %D 
leaw $0, %A 
subw (%A), %D 
leaw $END, %A 
jl %D 
nop

leaw $1, %A 
movw (%A), %D
subw %D, %A, %D
movw %D, %A 
movw (%A), %D 
leaw $2, %A 
movw %D, (%A)
leaw $1, %A 
movw (%A), %D
leaw $2, %A
subw %D, %A, %D
movw %D, %A
movw (%A), %D 
leaw $2, %A 
addw (%A), %D, %D 
movw %D, (%A)

leaw $1, %A 
movw (%A), %A 
movw %D, (%A)

leaw $LOOP, %A 
jmp
nop 



END:



