section .text
    global memcpy

memcpy:
    mov rax, rdi

    .loop:
        test rdx, rdx 
        jz .ret_memcpy

        mov al, [rsi]
        mov [rdi], al 

        inc rsi 
        inc rdi 
        dec rdx 
        jmp .loop 

    .ret_memcpy:
        ret 
