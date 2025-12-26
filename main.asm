section .data
message: db 'Qual seu nome? ', 0
hello: db 'Hello, ', 0

section .bss

;resb = reserve byte
;reservando um buufer de 16 bytes
name: resb 16

section .text
global _start

extern print
extern print_char
extern print_uint
extern print_int
extern print_newline
extern read
extern exit

_start:
    mov rdi, 0xFFFFFFFFFFFFFFFF
    call print_uint
    call print_newline

    mov rdi, -273
    call print_int
    call print_newline

    mov rdi, message
    call print
    
    mov rdi, name
    mov rsi, 16
    call read

    test rax, rax
    jz .end

    push rax

    mov rdi, hello
    call print

    pop rax
    
    mov rdi, rax
    call print
    
    mov rdi, '!'
    call print_char
    call print_newline

.end:
    xor rdi, rdi
    jmp exit

