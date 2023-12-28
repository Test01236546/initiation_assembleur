
; ;main est une etiquette
; ; pour les etiquette on peut utiliser quasi tous les carateres 
; ; on peut utiliser un "$" pour dire que c'est une etiquette ex : $rcx sera forcément etiquette
; <etiquette> : 
;     <instruction> <operande(s)>
;     <instruction> <operande(s)>
;     <instruction> <operande(s)>
; ;on peut mettre ":" devant message mais pas obligatoire

; cpu 8086 ;on peut ne demander des instructions que de certains processeurs (après le bits)




bits 64                                     ;pas obligatoire mais explicite (% au 32 bits par exemple)

%define HELLO 'Hello World !'   ; macro : on remplace toutes les occurences dun terme par un autre (avant assemblage, ici après le bits 64)
; %assign                         ; c'est aussi une macro

extern GetStdHandle                         ; Gestionnaire de périphérique kernel32.dll
extern WriteConsoleA                        ; Ecriture en mode console
extern ExitProcess                          ; Arrêt du processus 

section .data                               ;bloc nommé data    (nommé segment ou section)
    message db HELLO, 10
    message_length equ $-message            ; dispensable mais on peut remplacer le 13 plus loin
section .bss                                ;bloc nommé bss     (nommé segment ou section)
    written resq 1

section .text                               ;bloc nommé text    (nommé segment ou section) 
    global main                             ;on exporte sinon on pourrait pas utiliser avec GoLink
    main:
        mov rcx, -11
        call GetStdHandle

        sub rsp, 32
        sub rsp, 8

        mov rcx, rax
        mov rdx, message
        mov r8, message_length
        mov r9, written 
        mov qword [rsp+32], 0
        call WriteConsoleA

        add rsp, 32+8

        xor ecx, ecx
        call ExitProcess
