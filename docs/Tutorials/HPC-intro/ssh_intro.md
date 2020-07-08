---
title: "Logowanie SSH"
date: 2020-02-26
draft: false
---

## SSH - logowanie

!!! Info
    Logowanie do ICM: `ssh username@hpc.icm.edu.pl`
    W przypadku niektórych systemów możliwy/wymagany jest dodatkowy krok logowania wykonany z komputera hpc.icm.edu.pl, np. `ssh rysy`, `ssh okeanos`.

## Tworzenie kluczy SSH

Logowanie użytkowania może być uwierzytelnione poprzez podanie hasła lub użycie klucza kryptograficznego.
Klucze są bezpieczniejsze (i wygodniejsze - nie trzeba za każdym razem wpisywać hasła).

```.sh
# Aby wygenerować klucze SSH na lokalnym komputerze należy użyć komendy:
ssh-keygen
# Następnie należy skopiować klucz publiczny na serwer docelowy:
ssh-copy-id -i ~/.ssh/mykey.pub user@your.server.example.com
# Tylko Ty (i żaden inny użytkownik) powinieneś mieć możliwość odczytywania kluczy:
chmod 400 ~/.ssh/mykey
# Jeśli chcesz użyć już istniejącego klucza, nie zapomnij dodać go do 'ssh agent' na lokalnej maszynie
ssh-add ~/.ssh/mykey
# if `ssh-add` fails saying `Could not open a connection to your authentication agent.` you have to start the ssh-agent
eval `ssh-agent -s`

# logowanie
ssh user@your.server.example.com
# logowanie z użyciem konkretnego klucza
ssh -o IdentitiesOnly=yes -i ~/.ssh/example_rsa user@your.server.example.com
# logowanie z użyciem hasła (zamiast klucza)
ssh -o PubkeyAuthentication=no user@your.server.example.com
```


### Zmiana kluczy

1\. System Windows + Putty (klient ssh): Należy uruchomić program
'regedit' (systemowa aplikacja w Windows). Następnie w panelu po lewej
stronie wyszukać w drzewie wpis:

```.sh
HKEY_CURRENT_USER\Software\UserName\PuTTY\SshHostKeys
```

i w oknie po prawej stronie odszukać wiersz zawierający nazwę 'hpc.icm.edu.pl', a następnie go usunąć.

2\. System Linux: Aby usunąć stary klucz wykonujemy w terminalu komendę:

```.sh
ssh-keygen -f $HOME/.ssh/known_hosts -R hpc.icm.edu.pl
```

## Manager haseł

Program [pass](https://www.passwordstore.org/) jest menadżerem haseł umożliwiającym użytkownikom linux'a bezpieczne przechowywanie haseł na lokalnym komputerze.
Przykładowo:

```.sh
$ pass zdalne_komputery/icm -c
Copied zdalne_komputery/icm to clipboard. Will clear in 45 seconds.
```

## Kończenie pracy

Po skończeniu pracy należy się wylogować poleceniem `exit` lub `logout`
lub kombinacją klawiszy `Ctrl+D`.
