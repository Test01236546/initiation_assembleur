


; documentation : https://learn.microsoft.com/fr-fr/windows/console/getstdhandle

bits 64                                    

%define HELLO 'Hello World !'   

extern GetStdHandle                         
extern WriteConsoleA                            ; A pour ansi et W pour unicode
extern ExitProcess                          

section .data                               
    message db HELLO, 10
    message_length equ $-message            
section .bss                                
    written resq 1

section .text                               
    global main                             
    main:
        mov rcx, -11                            ; on veut faire de l'écrit donc flux standar. Je place -11 dans registre rcx
        call GetStdHandle

        sub rsp, 32
        sub rsp, 8

        ;name_func(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) il faut mettre le 8 puis le 7 etc (dépiler)

        mov rcx, rax                            ; là c'est des entiers, float -> xmm0...xmm3, rax prend call GetStdHandle et met dans rcx
        mov rdx, message                        ; xmm1
        mov r8, message_length                  ; xmm2
        mov r9, written                         ; xmm3
        mov qword [rsp+32], 0                   ; le cinquième est indiqué sur la pile. rsp pour se mettre début pile et 32 pour laisser les 32 bits suivants libre. Le 0 vient de la doc
        call WriteConsoleA

        add rsp, 32+8

    xor ecx, ecx                                ; 
        call ExitProcess
