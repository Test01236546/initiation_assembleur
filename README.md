###### Initiation_assembleur

## Ajouter un dossier à un dépot git déja existant
[Tuto en ligne](https://smart-tech.mg/git-importer-un-repertoire-existant-dans-son-repository/) \n
[Conversation CGPT](https://chat.openai.com/share/164e7e71-600e-4228-abbc-d5fbd25f042c)

## Installer nasm
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