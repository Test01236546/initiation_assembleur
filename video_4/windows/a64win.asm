




bits 64                                    

%define HELLO 'Hello World !'   

extern GetStdHandle                         
extern WriteConsoleA                        
extern ExitProcess                          

section .data                               
    message db HELLO, 10
    message_length equ $-message            
section .bss                                
    written resq 1

section .text                               
    global main                             
    main:
        mov rcx, -11
        call GetStdHandle

        sub rsp, 32
        sub rsp, 8

        ;name_func(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) il faut mettre le 8 puis le 7 etc (dépiler)

        mov rcx, rax                            ; là c'est des entiers, float -> xmm0...xmm3
        mov rdx, message                        ; xmm1
        mov r8, message_length                  ; xmm2
        mov r9, written                         ; xmm3
        mov qword [rsp+32], 0                   ; le cinquième est indiqué sur la pile
        call WriteConsoleA

        add rsp, 32+8

        xor ecx, ecx
        call ExitProcess
