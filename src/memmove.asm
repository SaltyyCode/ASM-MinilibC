section .text
    global memmove

memmove:
    mov rax, rdi
    cmp rdi, rsi
    jae .loop ; Jump if above or equal
    jmp .reverse_loop

    .loop:
        test rdx, rdx
        jz .ret_memmove
        mov al, [rsi]
        mov [rdi], al 
        inc rsi 
        inc rdi 
        dec rdx 
        jmp .loop 
    
    .reverse_loop:
        test rdx, rdx 
        jz .ret_memmove 
        mov al, [rsi + rdx - 1]  
        mov [rdi + rdx - 1], al 
        dec rdx  
        jmp .reverse_loop  

    
    .ret_memmove:
        ret
        
