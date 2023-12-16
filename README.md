###### Initiation_assembleur

### Lien Tuto assembleur
[Assembleur](https://www.youtube.com/watch?v=fvtd2Ut3MHw&list=PLrSOXFDHBtfEs7PCC6r44iXiX5gMlbjcR)

## Ajouter un dossier à un dépot git déja existant
[Tuto en ligne](https://smart-tech.mg/git-importer-un-repertoire-existant-dans-son-repository/)

[Conversation CGPT](https://chat.openai.com/share/164e7e71-600e-4228-abbc-d5fbd25f042c)

## Installer nasm (sans le terminal wsl)
An easy alternative for Windows 10 would be installing NASM with the winget Package Manager.

Run the Command Prompt as an Administrator and then:

1. **Install NASM**
winget install nasm -i
2. **Add it to the Environment Variables**
setx Path "%Path%;C:\Program Files\NASM\" (sinon ajouter le fichier NASM dans ce chemin)
3. **Vérifier la version**
nasm --version

mon chemin perso nasm : C:\Users\jerem\AppData\Local\bin\NASM
mettre NASM dans C:\Program Files
puis : setx Path "%Path%;C:\Program Files\NASM\"

cd              // change directory, back to your home
cd ..           // change directory, one level up
cd my_folder    // change directory, move down to "my_folder"
FERMER ET OUVRIR VS CODE

## Syntaxe MARKDOWN
[Markdown](https://chat.openai.com/share/b9232320-f046-4fb9-8de8-46651ba94544) 


##### Tuto rentrer dans WSL & installer nasm (avec wsl)

1. renter dans WSL : wsl
1. rentrer dans Ubuntu : wsl -d Ubuntu
2. maj des packages : sudo apt-get update
3. installer : sudo apt install nasm

### TP1
# assembleur en linux 64 bits

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

# assembleur windows 64 bit

bits 64 

extern GetStdHandle
extern WriteConsoleA
extern ExitProcess

section .data
    message db 'Hello World !', 10

section .bss
    written resq 1

section .text
    global main
    main:
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

