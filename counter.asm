section .text
global _start

_start:
    mov rax, 0
    mov rbx, 1

    l1:
        add rax, rbx
        inc rbx
        cmp rbx, 1000000
        jl  l1

    call print_uint

    mov rax, 60
    syscall

print_uint:
    xor rcx, rcx
    mov r8, 10
    .loop:
        xor rdx, rdx
        div r8
        add dl, 0x30
        dec rsp
        mov [rsp], dl
        inc rcx
        test rax, rax
        jnz .loop

    .print_chars_on_stack:
        xor rax, rax
        mov rsi, rsp
        mov rdx, rcx
        push rcx
        mov rax, 1
        mov rdi, 1
        syscall
        pop rcx
        add rsp, rcx
    ret
