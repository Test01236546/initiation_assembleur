bits 64

section .data
    message db 'Hello World !', 10      ; pas compris mais pour afficher

section .text
    global _start               ; dire où trouver la variable (aurait pu être mis plus haut)
    _start:
        mov rax, 1
        mov rdi, 1
        mov rsi, message
        mov rdx, 13+1
        syscall

        mov rax, 60              ; cette partie vise à fermer le programme
        mov rdi, 0
        syscall 















