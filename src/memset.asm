section .text
    global memset

memset:
    mov rax, rdi  ; Store destination address in rax for return

    .loop:
        test rdx, rdx  ; Check if n == 0
        jz .ret_memset  ; If yes, jump to return

        mov byte [rdi], sil  ; Store the byte value (SIL) into the memory at [RDI]
        inc rdi
        dec rdx  ; Decrement the counter 
        jmp .loop 

    .ret_memset:
        ret
