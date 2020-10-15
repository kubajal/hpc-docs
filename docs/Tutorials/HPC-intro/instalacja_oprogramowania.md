---
title: "Instalacja Oprogramowania"
date: 2020-07-14
draft: false
---


Dostępność oprogramowania oraz wymagania dla instalacji nowych programów na komputerach ICM opisane są [tu](../../O_zasobach_ICM/Aplikacje/aplikacje.md).
Ze względów bezpieczeństwa, administratorzy nie mogą instalować mało rozpoznawalnego i słabo udokumentowanego oprogramowania w systemie.

W takiej sytuacji użytkownik może zainstalować program lokalnie, na swoim koncie.

!!! note "Ogólna procedura"  
    Aplikacje różnią się między sobą. Poniższa, ogólna procedura może stanowić punkt startowy.

### Ściągnięcie kodu źródłowego

```.sh
wget https://somewhere.com/archive.tar.gz
tar -zxvf archive.tar.gz
# lub
git clone https://github.com/somewhere/something.git
```

### Instalacja programu w lokalnym katalogu

Instalacja programu w lokalnym katalogu użytkownika, np. `$HOME/myapps`.

```.sh
cd extracted_archive
make configure
./configure --prefix=$HOME/myapps
make
make install
```

### Dodatek - zmienna $PATH

Aby nie musieć każdorazowo wpisywać pełnej ścieżki do programu w celu jego uruchomienia, można zmodyfikować systemową zmienną `$PATH`.
<!-- Jeżeli użytkownik chce mieć możliwość uruchomienia programu wpisując jego nazwę w linii poleceń, to powinien dodać pełną ścieżkę do programu do systemowej zmiennej `$PATH`. -->

Więcej w Google: *How to set your $PATH variable in Linux*

- <https://opensource.com/article/17/6/set-path-linux>

- <https://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path>

- <https://linuxize.com/post/how-to-add-directory-to-path-in-linux/>

Różne systemy mogą mieć ustawione różne domyślne powłoki.

```.sh
echo "$SHELL"
/bin/tcsh # topola i okeanos
/bin/bash # rysy
```

Przykładowo, jeżeli korzystamy z powłoki `bash`, to należy zmodyfikować plik `~/.bashrc`

```.sh
export PATH=$PATH:$HOME/myapps/application_XYZ/place_with_the_file
```

Plik ten wczytywany automatycznie w trakcie ładowania powłoki `bash`
(np. podczas logowania - o ile `bash` jest ustawiony jako domyślna powłoka).
Aby nie logować się ponownie, wystarczy wczytać plik `~/.bashrc`.

```.sh
$ source ~/.bashrc
```

Celem ćwiczenia, użytkownik może dodać poniższe linie do pliku  `~/.bashrc`

```.sh
alias say_something='/usr/bin/echo '
alias say_hello_user="say_something hello ${USER}"
```

Następnie można sprawdzić działanie nowych skrótów:

```.sh
[someone@hpc ~]$ say_hello_user
say_hello_user: Command not found.
$ source ~/.bashrc
... some errors - powłoka tcsh nie interpretuje niektórych komend bash'a
[someone@hpc ~]$ bash -l
[someone@hpc ~]$ say_something blahblah
blahblah
[someone@hpc ~]$ say_hello_user
hello someone
```

Dla innych powłok procedura jest podobna.

Chcąc zmienić powłokę należy wpisać `bash | tcsh | ksh ` w linii poleceń.
