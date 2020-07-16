---
title: ""
date: 2020-05-14
draft: false
--- 

!!! Info
    Logowanie do ICM: `ssh username@hpc.icm.edu.pl`
    W przypadku niektórych systemów możliwy/wymagany jest dodatkowy krok logowania wykonany z komputera hpc.icm.edu.pl, np. `ssh rysy`, `ssh okeanos`.

Wieloetapowe logowanie bywa uciążliwe przy pracy na plikach.

- Konieczność każdorazowego wpisywanie hasła można uprościć poprzez użycie [klucza ssh](ssh_intro.md).

- Konieczność wieloetapowego logowania można uprościć poprzez tunelowanie połączenia.

## Tunelowanie ssh

[Tunel](https://pl.wikipedia.org/wiki/Tunel_(informatyka)) – zestawienie połączenia między dwoma odległymi hostami tak, by stworzyć wrażenie, że są połączone bezpośrednio. - Wikipedia.

W celu zkonfigurowania tunelowania połaczeń należy zedytować pliki `~/.ssh/config` oraz `/etc/hosts`.
Wpisz swój login w miejsce `nazwa_uzytkownika`.

### ~/.ssh/config

```.sh
Host *
  ServerAliveInterval 100
  ServerAliveCountMax 2
  ControlPath ~/.ssh/%r@%h:%p
  ControlMaster auto
  User nazwa_uzytkownika

Host hpc
  HostName hpc.icm.edu.pl
  User nazwa_uzytkownika
  LocalForward 8022 rysy:22
  LocalForward 8023 okeanos:22
  

Host icm-okeanos
  Port 8023
  User nazwa_uzytkownika


Host icm-rysy
  Port 8022
  User nazwa_uzytkownika
```

### /etc/hosts

```.sh
127.0.0.1 localhost
127.0.1.1 nazwa_uzytkownika_na_lokalnym_kompuerze
127.0.0.1 icm-rysy
127.0.0.1 icm-okeanos


# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

!!! note
    Aby tunel był otwarty należy zalogować się na węzeł dostępowy  `ssh username@hpc.icm.edu.pl`.

## Kopiowanie plików i logowanie - tips & tricks

Przykład użycia:

```.sh
$ to_hpc lokalny_folder zdalny_folder_docelowy
$ to_rysy lokalny_folder zdalny_folder_docelowy
$ to_okeanos lokalny_folder zdalny_folder_docelowy

$ to_hpc zdalny_folder_zrodlowy lokalny_folde_docelowy
$ to_rysy zdalny_folder_zrodlowy lokalny_folde_docelowy
$ to_okeanos zdalny_folder_zrodlowy lokalny_folde_docelowy

$ rysy # zaloguj się bezpośrednio na klaster rysy (jeżeli tunel nie był wcześniej otwarty, to funkcja zrobi to automatycznie).
$ okeanos # zaloguj się bezpośrednio na klaster okeanos (jeżeli tunel nie był wcześniej otwarty, to funkcja zrobi to automatycznie).

$ mkdir $HOME/Desktop/mountDir/OKEANOS
$ mount-okeanos # zdalny katalog domowy użytkownika zostanie zamontowany pod $HOME/Desktop/mountDir/OKEANOS

$ mkdir $HOME/Desktop/mountDir/TOPOLA
$ mount-topola # zdalny katalog domowy użytkownika zostanie zamontowany pod $HOME/Desktop/mountDir/TOPOLA
```

Poprzez lokalny_folder rozumie się folder znajdujący się na lokalnym komputerze (PC) użytkownika.
Aby funkcje `to_XXX/from_XXX, itd` były widoczne w systemie, należy je dodać do pliku `~/.bashrc`.

### ~/.bashrc

```.sh
# Dodaj poniższe linijki pod koniec pliku .bashrc
# Plik ten jest wczytywany przy uruchomieniu systemu.
# Aby zaktualizować środowisko (bez konieczności restartu) użyj komendy $source .bashrc


function rysy() {
    if ! ssh -O check hpc;
    then
        ssh -N -f -M hpc
    fi
    ssh icm-rysy
}

function okeanos() {
    if ! ssh -O check hpc;
    then
        ssh -N -f -M  hpc
    fi
    ssh icm-okeanos
}


function mount-okeanos()
{
   MOUNTDIR="$HOME/Desktop/mountDir/OKEANOS"
   mkdir -p $MOUNTDIR
   sshfs nazwa_uzytkownika@icm-okeanos:/lustre/tetyda/home/nazwa_uzytkownika ${MOUNTDIR}
}

function mount-topola()
{
   MOUNTDIR="$HOME/Desktop/mountDir/TOPOLA"
   mkdir -p $MOUNTDIR
   sshfs nazwa_uzytkownika@hpc:/icm/home/nazwa_uzytkownika ${MOUNTDIR}
}


function to_host {
    LOCAL_SOURCE=$1
    REMOTE_DESTINATION_DIR=$2

    if ! test -z "$LOCAL_SOURCE" && ! test -z "$REMOTE_DESTINATION_DIR"
    then
        rsync -avzhe ssh --progress ${LOCAL_SOURCE} ${REMOTE_HOME_DIR}${REMOTE_DESTINATION_DIR}
    else
        echo "Usage: to_remote LOCAL_SOURCE REMOTE_DESTINATION_DIR"
    fi
}

function from_host {
    SOURCE_ON_REMOTE=$1
    LOCAL_DESTINATION_DIR=$2

    if ! test -z "$SOURCE_ON_REMOTE" && ! test -z "$LOCAL_DESTINATION_DIR"
    then
      rsync -avzhe ssh --progress ${REMOTE_HOME_DIR}${SOURCE_ON_REMOTE} ${LOCAL_DESTINATION_DIR}
    else
      echo "Usage: from_remote SOURCE_ON_REMOTE LOCAL_DESTINATION_DIR"
    fi
}


function to_hpc {
    REMOTE_HOME_DIR="nazwa_uzytkownika@hpc:/icm/home/nazwa_uzytkownika/"
    to_host $@
}

function from_hpc {
    REMOTE_HOME_DIR="nazwa_uzytkownika@hpc:/icm/home/nazwa_uzytkownika/"
    from_host $@
}

function to_okeanos {
    REMOTE_HOME_DIR="nazwa_uzytkownika@icm-okeanos:/lustre/tetyda/home/nazwa_uzytkownika/"
    to_host $@
}

function from_okeanos {
    REMOTE_HOME_DIR="nazwa_uzytkownika@icm-okeanos:/lustre/tetyda/home/nazwa_uzytkownika/"
    from_host $@
}

function to_rysy {
    REMOTE_HOME_DIR="nazwa_uzytkownika@icm-rysy:/home/nazwa_uzytkownika/"
    to_host $@
}

function from_rysy {
    REMOTE_HOME_DIR="nazwa_uzytkownika@icm-rysy:/home/nazwa_uzytkownika/"
    from_host $@
}
```

## Zdalne Edytowanie plików textowych

Użykownicy, którzy lubią edytować pliki tekstowe w środowisku graficznym mogą skorzystać z programu `VScode`.
Posiada on wtyczkę `Remote-SSH`, która pozwala na zdalną edycję plików.
Inną wartą uwagi wtyczką jest `Live Share` - umożliwa ona współdzielenie terminala z innym użytkownikem programu VScode.
