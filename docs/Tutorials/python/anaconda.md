---
title: "Anaconda - środowisko wirtualne"
date: 2020-08-27
draft: false
---

Moduł `Anaconda` jest dostępny na superkomputerze Okeanos.

Jeżeli wymagane jest użycie niedostępnych w systemie Anaconda bibliotek języka
Python, należy je zainstalować samodzielnie z wykorzystaniem
środowiska wirtualnego. Można to zrobić według poniższej instrukcji.

* Uruchamiamy [sesję interaktywną](../HPC-intro/slurm_intro.md).

Przy pierwszym uruchomieniu może być konieczna dodatkowa konfiguracja środowiska Anaconda.

* Ładujemy moduł Anaconda Pythona z listy [dostępnego modułu](../HPC-intro/ustawianie_srodowiska.md).
* Sprawdzamy że działa, przykładowo listując domyślnie zainstalowane biblioteki `conda list` wywołując komendę python.

    ```.sh
    $ conda list
    $ python
    Python 3.8.3 (default, Jul  2 2020, 16:21:59) 
    [GCC 7.3.0] :: Anaconda, Inc. on linux
    Type "help", "copyright", "credits" or "license" for more information.
    ```

* Logujemy się do nowej powłoki `bash -l`
* Tworzymy środowisko wirtualne `conda create --prefix $HOME/envs/my_env_name python=3`
* Aktywujemu środowisko `conda activate $HOME/envs/my_env_name`

```.sh
CommandNotFoundError: Your shell has not been properly configured to use 'conda activate'.
To initialize your shell, run

    $ conda init <SHELL_NAME>
```

* Zgodnie z sugestią, inicjalizujemy środowisko, np `conda init bash`.
Polecenie to doda zmienne aktywujące Anacondę do pliku `~/.bashrc`; Plik ten jest automatycznie wczytywany podczas otwierania powłoki `bash`. W celu trwałego pożegnania się z Anacondą należy ręcznie zmodyfikować plik `~/.bashrc`.

```.sh
==> For changes to take effect, close and re-open your current shell. <==
```

* Zgodnie z kolejną sugestią, zamykamy powłokę (Ctrl+D lub `exit`).

Następnie (lub przy kolejnym uruchomieniu):

1. Ponownie otwieramy powłokę `bash -l`.
2. Aktywujemy środowisko wirtualne `conda activate $HOME/envs/my_env_name`
3. Jeśli jest potrzeba instalujemy dodatkowe biblioteki `conda install --channel $URL $PACKAGE_NAME`
4. Środowisko wirtualne jest gotowe. Po zakończeniu pracy wystarczy wydać polecenie `conda deactivate`, a wracając do pracy należy pamiętać, żeby je wcześniej aktywować (punkt 1,2) - dopiero wówczas zainstalowane lokalnie biblioteki będą dostępne.

Przydatne linki:

<https://conda.io/projects/conda/en/latest/user-guide/cheatsheet.html>
<https://conda.io/projects/conda/en/latest/commands.html>
