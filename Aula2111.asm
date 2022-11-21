.model small
.stack 100h
.data
    mag db 'se vira !!!!!!!!!$$'
    magc db 17 dup('$')
    magz db 17 dup ('0$')

.code
    copy macro str1,str2,tam
    local volta
    mov cx,tam
    xor bx,bx
    volta:
    mov al,str1[bx]
    mov str2[bx],al
    inc bx
    loop volta
    endm

    imp macro str
    mov ah,02
    mov dl,10
    int 21h
    mov ah,09h
    lea dx,str
    int 21h
    endm

    main proc

        mov ax,@data
        mov ds,ax
        copy mag,magc,17
        imp mag
        imp magc
        copy magz,mag,17
        imp mag
        mov ah,4ch
        int 21h
    
    main endp

end main