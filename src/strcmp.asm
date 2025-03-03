section .text
    global strcmp

strcmp:
    xor rax, rax 

    .loop:
        mov al, [rdi] 
        mov dl, [rsi]  
        cmp al, dl    
        jne .ret_strcmp 

        test al, al 
        je .ret_strcmp 

        inc rdi  
        inc rsi  
        jmp .loop 

    .ret_strcmp:
        movzx rax, al ; Move with zero extend = convert 8 bit to 64 bit
        movzx rdx, dl  
        sub rax, rdx  ; rax - rdx for return s1[i] - s2[i]
        ret
