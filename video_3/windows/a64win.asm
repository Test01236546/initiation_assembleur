
;main est une etiquette
; pour les etiquette on peut utiliser quasi tous les carateres pour les etiquettes
; on peut utiliser un "$" pour dire que c'est une etiquette ex : $rcx sera forcément etiquette
<etiquette> : 
    <instruction> <operande(s)>
    <instruction> <operande(s)>
    <instruction> <operande(s)>
;on peut mettre ":" devant message mais pas obligatoire




bits 64                                     ;pas obligatoire mais explicite (% au 32 bits par exemple)

extern GetStdHandle
extern WriteConsoleA
extern ExitProcess      ; api windows

section .data                               ;bloc nommé data
    message db 'Hello World !', 10

section .bss                                ;bloc nommé bss
    written resq 1

section .text                               ;bloc nommé text
    global $rcx
    $rcx:
        mov rcx, -11
        call GetStdHandle

        sub rsp, 32
        sub rsp, 8

        mov rcx, rax
        mov rdx, message
        mov r8, 13
        mov r9, written 
        mov qword [rsp+32], 0
        call WriteConsoleA

        add rsp, 32+8

        xor ecx, ecx
        call ExitProcess
