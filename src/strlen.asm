section .text
global strlen

strlen:
    xor rax, rax ; Initialize rax at 0 to count chars

    .loop:
        cmp byte[rdi], 0 ; Compare current byte of 1st arg (rdi) w/ 0
        je .ret_strlen  ; Jump if equal 0 to return strlen
        inc rdi ; Increment rdi to switch to next char (byte)
        inc rax ; Increment counter
        jmp .loop ; Jump to start loop
    
    .ret_strlen:
        ret ; Return value;
        