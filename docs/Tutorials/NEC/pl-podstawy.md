---
title: "[PL] Podstawy"
date: 2020-11-05
draft: false
---

<!-- <Last revision: 2020-11-05 by M. Hermanowicz <m.hermanowicz@icm.edu.pl> -->

!!! Note
    Niniejszy dokument (wraz z notatką dot. SOL) jest także dostępny w
    formacie [PDF][pl_nec_tsubasa_pdf].

[pl_nec_tsubasa_pdf]: ./pdf/pl_nec_tsubasa.pdf

!!! Info
    Dokument opisuje podstawy użytkowania komputera wektorowego NEC
    SX-Aurora Tsubasa, dostępnego w centrum obliczeniowym ICM
    UW. Treść jest oparta na cytowanej w tekście dokumentacji i ma na
    celu zebranie podstawowych informacji i ich źródeł na potrzeby
    użytkowników ICM.


Użycie komputera NEC wymaga zalogowania się do klastra Rysy przez
[SSH] za pośrednictwem systemu dostępowego `hpc.icm.edu.pl`. Można
wykonać tę czynność w dwóch krokach:

[SSH]: https://en.wikipedia.org/wiki/Secure_Shell

```.sh
ssh username@hpc.icm.edu.pl
ssh rysy
```

Alternatywnie można wywołać instrukcję `ssh` z opcją `-J` (ang. *jump
host*), która pozwala określić host pośredniczący w połączeniu z
systemem docelowym (szczegóły: `man ssh`).

Obciążeniem klastra i zadaniami użytkowników zarządza [Slurm],
natomiast oprogramowanie zorganizowane jest w formie
[modułów]. Pojedynczy węzeł obliczeniowy partycji **ve** (*PBaran*) może być
używany interaktywnie – jak poniżej – lub wsadowo (patrz kolejne
akapity).


[Slurm]: https://slurm.schedmd.com/overview.html
[modułów]: https://modules.readthedocs.io/en/latest

```.sh
srun -A GRANT_ID -p ve --gres=ve:1 --pty bash -l
```

Po uruchomieniu sesji interaktywnej zostaje automatycznie zdefiniowana
nowa zmienna środowiskowa `$VE NODE NUMBER`, która określa która z
kart VE zostanie użyta przez oprogramowanie użytkownika.  Wartość tej
zmiennej można sprawdzić i zdefiniować manualnie za pomoca instrukcji,
odpowiednio, [echo], [export]. Oprogramowanie służące obsłudze kart VE
znajduje się w katalogu `/opt/nec/ve`. Jego efektywne wykorzystanie
wymaga modyfikacji niektórych [zmiennych środowiskowych], takich jak
`$PATH`, `$LD_LIBRARY_PATH` i innych, czego można w wygodny sposób dokonać
za pomocą instrukcji [source].

```.sh
source /opt/nec/ve/mpi/2.2.0/bin/necmpivars.sh
```

[echo]: https://en.wikipedia.org/wiki/Echo_(command)
[export]: https://ss64.com/bash/export.html
[zmiennych środowiskowych]: https://en.wikipedia.org/wiki/Environment_variable
[source]: https://ss64.com/bash/source.html


Ustawienie zmiennych środowiskowych (jak powyżej) sprawia, że
narzędzia VE stają się dostępne dla użytkownika – wśród nich
kompilatory NEC języków C, C++ i Fortran, które można wywołać
instrukcjami, odpowiednio, `ncc`, `nc++` i `nfort` lub ich
odpowiednimi wariantami MPI: `mpincc`, `mpinc++` i `mpinfort`.  Należy
pamiętać, że w systemie dostępnych jest kilka wersji kompilatorów,
dlatego zajść potrzeba uwzględnienia numeru wersji przy ich wywołaniu,
np. `ncc-2.5.1`. Ogólny schemat użycia kompilatorów NEC jest zgodny ze
standardem znanym z GNU GCC: `<kompilator> <opcje> <plik
źródłowy>`. Tabela poniżej listuje zbiór kilkunastu podstawowych opcji
kompilatorów NEC. Ostatnie cztery z nich, oznaczone czerwoną czcionką,
pozwalają na analizę wydajności i szczegółów wektoryzacji
programów. Ponadto, niektóre z nich wymagają dodatkowo zdefiniowania
odpowiednich zmiennych środowiskowych. Pełna lista opcji wraz z opisem
generowanych danych wyjściowych znajduje się w [PROGINF/FTRACE User’s
Guide] oraz w [dokumentacji][necdoc] poszczególnych kompilatorów.

[necdoc]: https://www.hpc.nec/documents/
[PROGINF/FTRACE User’s Guide]: https://www.hpc.nec/documents/sdk/pdfs/g2at03e-PROGINF_FTRACE_User_Guide_en.pdf

| Opcja	                |  Opis	                                   |
|-----------------------|------------------------------------------|
| `-c`                  |  tworzy plik obiektowy                   |
| `-o`                  |  nazwa pliku wyjściowego                 |
| `-I/path/to/include`  |  włączenie plików nagłówkowych           |
| `-L/path/to/lib`      |  włączenie bibliotek                     |
| `-g`                  |  symbole dla debuggera                   |
| `-Wall`               |  ostrzeżenia o składni                   |
| `-Werror`             |  treat warnings as errors                |
| `-O[0-4]`             |  poziomy optymalizacji                   |
| `-ftrace`             |  użycie *profilera*                      |
| `-proginf`            |  włącz analizę wykonania programu        |
| `-report-all`         |  raportuj diagnostyke                    |
| `-traceback`          |  informacje zwrotne nt. wykonania programu |
| `-fdiag-vector=[0-3]` |  poziom szczegółów diagnostyki wektorowej |


Programy mogą być uruchamiane bezpośrednio, poprzez podanie ścieżki
dostępu do nich, lub pośrednio poprzez użycie programu ładującego VE
(`ve_exec`) – przykłady z uwzględnieniem MPI zestawiono poniżej. Listę
opcji `mpirun` można uzyskać na stronie [podręcznika
systemowego][manmpirun] lub wydając polecenie `mpirun -h`.


```.sh
./program
```

```.sh
ve_exec ./program
```

```.sh
mpirun ./program
```

```.sh
mpirun -v -np 2 -ve 0-1 ./program # enables the use of VE cards 0 and 1
```

Pełna dokumentacja dotycząca wszystkich komponentów SX-Aurora Tsubasa
(sprzętowych i programowych) znajduje się na [stronie internetowej
NEC][necdoc]. Przystępne dla użytkownika wprowadzenie znajduje się
także na [dedykowanym blogu][necblog].


[manmpirun]: https://www.open-mpi.org/doc/v4.0/man1/mpirun.1.php

[necblog]: https://sx-aurora.github.io/posts/VE-first-steps

Wsadowy tryb pracy VE wymaga stworzenia skryptu i zlecenia go do
kolejki Slurm. Przykładowa treść takiego pliku znajduje się
poniżej. Zawarte w nim opcje specyfikują nazwę zadania (`-J`), żądaną
liczbę węzłów obliczeniowych (`-N`), rdzeni CPU (`--ntasks-per-node`),
pamięć (`-mem`; tutaj w megabajtach), limit czasowy (`--time`),
identyfikator grantu (`-A`), partition (`-p`), domyślne zasoby
(`--gres`), plik wyjściowy (`--output`), a także właściwe instrukcje,
które zostaną wykonane w ramach zadania po przyznaniu
zasobów. Wyczerpująca lista dostępnych znajduje się w
[dokumentacji][slurmdoc].

[slurmdoc]: https://slurm.schedmd.com/documentation.html


```.sh
#!/bin/bash -l
#SBATCH -J name
#SBATCH -N 1
#SBATCH --ntasks-per-node 1
#SBATCH --mem 1000
#SBATCH --time=1:00:00
#SBATCH -A <Grant ID>
#SBATCH -p ve
#SBATCH --gres=ve:1
#SBATCH --output=out

./program
```

Poniżej przedstawiono podstawowe polecenia służące pracy z zadaniami
Slurm: zlecanie zadania do kolejki (`sbatch`), które zwraca nadany
identyfikator, wyświetla wszystkie zadania użytkownika i ich status
(`squeue`), zwraca szczegóły dotyczące wybranego zadania (`scontrol`),
anuluje wykonanie zadania (`scancel`). Pełna lista dostępnych opcji
znajduje się w [dokumentacji Slurm][slurmdoc].

```.sh
sbatch job.sl # zleca zadania do kolejki
squeue -u $USER # listuje wszystkie zadania użytkownika
scontrol show job <ID> # zwraca szczegóły zadania o danym identyfikatorze
scancel <ID> # anuluje zadanie o danym identyfikatorze
```

Klaster Rysy nie posiada dedykowanego systemu plików na potrzeby
obliczeń. Oznacza to, że wszystkie obliczenia należy prowadzić w swoim
katalogu domowym (`$HOME`). Partycja ve (węzeł PBaran) jest ponadto
przeznaczony do zadań wykorzystujących karty VE i nie powinien być
używany do zadań, które znacznie obciążają CPU.

