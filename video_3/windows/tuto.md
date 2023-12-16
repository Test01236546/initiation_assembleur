1. assembler le fichier : nasm -f win64 windows\a64win.asm -o windows\a64.obj (cré l'objet)
2. fait le truc à exécuter après : .\windows\golink.exe windows\a64.obj /entry main /console kernel32.dll user32.dll

attention aux chemins

