section .text
    global strpbrk

strpbrk:
    xor rax, rax

    .loop_strpbkr:
        cmp byte [rdi + rax], 0
        je .ret_null
        xor rcx, rcx

    .check_char:
        cmp byte [rsi + rcx], 0
        je .increment
        movzx rdx, byte [rsi + rcx]
        cmp byte [rdi + rax], dl
        je .ret_strpbrk
        inc rcx
        jmp .check_char

    .increment:
        inc rax
        jmp .loop_strpbkr

    .ret_null:
        xor rax, rax
        ret

    .ret_strpbrk:
        lea rax, [rdi + rax]
        ret
