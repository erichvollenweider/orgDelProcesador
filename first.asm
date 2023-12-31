; First
; Este programa pide dos enteros como entrada e imprime su suma

%include "asm_io.inc"

; Los datos iniciados se colocan en el segmento .data
segment .data
; Estas etiquetas se refieren a las cadenas usadas para la salida
prompt1     db      "Digite un numero: ", 0
prompt2     db      "Digite otro numero: ", 0

outmsg1     db      "Ud. ha digitado ", 0
outmsg2     db      " y ", 0
outmsg3     db      " la suma es ", 0

; Los datos no iniciados se colocanen el segmento .bss
segment .bss
; Estas etiquetas señalan a palabras dobles usadas para almacenar los datos
input1      resd    1
input2      resd    1

; El codigo se coloca en el segmento .text
segment .text
        global asm_main
asm_main:

enter       0,0
pusha

mov         eax,        prompt1     ; print out prompt
call        print_string

call        read_int                ; lee un entero
mov         [input1],   eax         ; lo almacena en input1

mov         eax,        prompt2     ; print out prompt
call        print_string

call        read_int                ; lee un entero
mov         [input2],   eax         ; lo almacena input2

mov         eax,        [input1]    ; eax = dword en input1
add         eax,        [input2]    ; eax += dword en input2
mov         ebx,        eax         ; ebx = eax

dump_regs   1                       ; imprime los valores de los registros
dump_mem    2,          outmsg1, 1  ; imprime la memoria

; Ahora se imprimen los resultados en una serie de pasos

mov         eax,        outmsg1
call        print_string            ; se imprime el primer mensaje
mov         eax,        [input1]
call        print_int               ; se imprime input1
mov         eax,        outmsg2
call        print_string            ; se imprime el segundo mensaje
mov         eax,        [input2]
call        print_int               ; se imprime input2
mov         eax,        outmsg3
call        print_string            ; se imprime el tercer mensaje
mov         eax,        ebx
call        print_int               ; se imprime la suma (ebx)
call        print_nl                ; se imprime una nueva linea

popa
mov         eax,        0           ; retorna a C
leave
ret

