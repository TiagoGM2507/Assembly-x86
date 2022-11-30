.model small
.data
    str1 db 'BBBBBBBB'
    str2 db 'BBBBBBBB'
    resultado db 'igual$'
    resultado1 db 'diferente$'
.code
    main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    lea di,str1
    lea si,str2
    cld
    mov cx,10
    repe cmpsb
    jz tem 
    lea dx,resultado1
    jmp imp
tem:
    lea dx,resultado
imp:
    mov ah,09
    int 21h


    mov ah,4ch
    int 21h
    main endp

end main