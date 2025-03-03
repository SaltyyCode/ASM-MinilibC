section .text
    global strcasecmp

strcasecmp:
    xor rax, rax
    xor rcx, rcx 

    .loop:
        mov al, [rdi + rcx] 
        mov bl, [rsi + rcx]
        cmp al, 'A'
        jb .to_lower_s2
        cmp al, 'Z'
        ja .to_lower_s2
        or al, 0x20
        
    .to_lower_s2:
        cmp bl, 'A'
        jb .compare_loop
        cmp bl, 'Z'
        ja .compare_loop
        or bl, 0x20 

    .compare_loop:
        cmp al, bl  
        jne .ret_strcasecmp 
        test al, al
        je .ret_strcasecmp
        inc rcx
        jmp .loop

    .ret_strcasecmp:
        movzx eax, al
        movzx ebx, bl
        sub eax, ebx
        movsx rax, eax
        ret