section .text
    global strstr

strstr:
    test rsi, rsi
    jz .ret_null

    test byte [rsi], 0
    jz .ret_strstr

    .loop:
        mov rax, rdi 
        mov rdx, rsi

    .loop_strstr:
        mov al, [rax] 
        mov bl, [rdx] 
        test bl, bl
        jz .ret_strstr 

        cmp al, bl
        jne .increment 

        inc rax
        inc rdx
        jmp .loop_strstr 

    .increment:
        inc rdi
        test byte [rdi], 0
        jnz .loop 

    .ret_null:
        xor rax, rax
        ret

    .ret_strstr:
        mov rax, rdi
        ret
