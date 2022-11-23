.model small
.stack 100h
.data
    qtde equ 8
    str1 db '12345678'    
    str2 db qtde dup(?)
.code

    pulalinha macro  PL ;macro para pular linha
    mov ah,02
    mov dl,PL
    int 21H         
    endm

    main proc
        mov ax,@data
        mov ds,ax    ;inicializa ds
        mov es,ax    ;inicializa ES
        call inv
        call imp
        mov ah,4ch
        int 21h
    main endp

    inv proc
        lea si,str+7
        lea di,str2
        std
        mov cx,qtde
    inverte:
        movsb
        add di,2
        loop inverte
    ret
    inv endp

    imp proc
        cld
        mov cx,qtde
        lea si,str2
        mov ah,02
    imprime:
        lodsb
        mov dl,al
        int 21h 
        loop imprime
    ret
    imp endp


end main
