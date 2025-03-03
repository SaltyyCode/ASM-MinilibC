section .text
    global strrchr

strrchr:
    xor rax, rax
    xor rcx, rcx

    .loop:
        mov dl, byte [rdi + rax]
        test dl, dl
        jz .ret

        cmp dl, sil
        lea rdx, [rdi + rax]
        cmove rcx, rdx

        inc rax
        jmp .loop

    .ret:
        test rcx, rcx
        cmp sil, 0
        cmovz rcx, rdi
        lea rdx, [rdi + rax]
        cmovz rcx, rdx
        
        mov rax, rcx
        ret