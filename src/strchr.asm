section .text
    global strchr

strchr:
    xor rax, rax   ; Initialize rax at 0 for offset  

    .loop:
        cmp byte [rdi + rax], 0 ; Compare current byte + offset to keep memory adress w/ 0
        je .null_case ; If equal jump to null_case
        cmp byte [rdi + rax], sil ; Compare current byte with wanted char (sil = 8 bit register of rsi)
        je .ret_strchr ; If equal jump to return case          
        inc rax  ; Increment offset to next char              
        jmp .loop ; jump to start loop

    .ret_strchr:
        lea rax, [rdi + rax]     ; Load Effective Adress (lea) of found byte to print adress
        ret ; Return adress

    .error_case:
        xor rax, rax  ; Reset rax at 0          
        ret ; Return 0 (error)

    .null_case:
        cmp sil, 0  ; Compare searched char with 0 if \O is searched
        je .ret_strchr ; If equal jump to return case          
        jmp .error_case ; Else jump to error case           
