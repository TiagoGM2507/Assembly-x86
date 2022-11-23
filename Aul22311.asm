.model small
.stack 100h
.data
    arr dw 31h,32h,34h,35h,36h,?
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
        call insert
        call imp
        mov ah,4ch
        int 21h
    main endp

    insert proc
        std
        lea si,arr+8
        lea di,arr+0ah
        mov cx,3
        rep movsw
        mov word ptr[di],33h
    ret
    insert endp

    imp proc
        cld
        mov cx,6
        lea si,arr
        
    imprime:
        lodsw
        mov dx,ax
        mov ah,02
        mov dl,al
        int 21h 
        loop imprime
    ret
    imp endp


end main
