section .text
    global strncmp

strncmp:
    xor rax, rax
    test rdx, rdx
    je .ret_null_case

    .loop:
        mov al, [rdi] 
        mov dl, [rsi]  
        cmp al, dl    
        jne .ret_strcmp 

        test al, al 
        je .ret_strcmp 
        
        dec rdx
        jz .ret_null_case

        inc rdi  
        inc rsi  
        jmp .loop 

    .ret_strcmp:
        movzx rax, al
        movzx rdx, dl  
        sub rax, rdx
        ret
    
    .ret_null_case:
        xor rax, rax
        ret
