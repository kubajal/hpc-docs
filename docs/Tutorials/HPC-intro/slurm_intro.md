---
title: "SLURM"
date: 2020-03-16
draft: false
---


## Slurm - definicja

!!! Info
    SLURM (dawniej *Simple Linux Utiliy for Resource Management*)
    to system kolejkowy działający na wielu komputerach z listy Top500.
    W ICM system ten obsługuje wszystkie komputery dużej mocy.

System kolejkowy to element systemu operacyjnego odpowiedzialny za zarządzanie zasobami komputera obliczeniowego i przydzielanie ich użytkownikom zgodnie z obowiązującymi zasadami.
Pozwala na optymalne wykorzystanie mocy obliczeniowych i pamięci komputera.

Kolejne zadania użytkowników zostają umieszczone w tzw. kolejce.
Gdy zadeklarowane przez użytkowników zapotrzebowanie przekracza dostępne zasoby obliczeniowe tj. czasu procesora, pamięci operacyjnej i dyskowej, zadania kolejno oczekują na dostęp.
Praca z systemem kolejkowym przebiega następująco:

1. Użytkownik pisze tzw. skrypt, w którym określa zasoby niezbędne do przeprowadzenia obliczeń, a także sposób wykonania zadania
użytkownik umieszcza zadanie w kolejce
2. System kolejkowy na bieżąco sprawdza dostępność zasobów; gdy jest taka możliwość, rezerwuje zasoby według specyfikacji użytkownika, po czym uruchamia zadanie
3. Po zakończeniu obliczeń system kolejkowy zwalnia zarezerwowane zasoby i próbuje je zarezerwować dla następnych zadań czekających w kolejce

**Oficjalna dokumentacja:**

<https://slurm.schedmd.com/documentation.html>

## Podstawowe komendy systemu kolejkowego

Za pomocą komend systemu SLURM możemy sterować przebiegiem obliczeń naszego zadania.
Aby zaplanować zadanie, można użyć polecenia salloc, sbatch lub srun.

* `sbatch` zawsze tworzy nowy przydział zasobów po jego wywołaniu, wykonuje skrypt zadania na jednym z przydzielonych węzłów (master node), a następnie zwalnia przydział po zakończeniu skryptu. Dodatkową cechą sbatch jest to, że przeanalizuje skrypt w czasie przesyłania zadania - zamiast podawać argumenty z wiersza poleceń, opcje sbatch mogą zostać zapisane za pomocą linii rozpoczynających się od #SBATCH. Jeżeli poda się argumenty do wiersza poleceń to zastępią one opcje #SBATCH w skrypcie, więc można wywoływać pojedynczy skrypt wsadowy dla różnych przydziałów wielkości zadania, określając opcje -N lub -n w wierszu polecenia podczas przesyłania skryptu zadania zsbatch

* `srun` może, ale nie musi, utworzyć alokację, w zależności od sposobu jej wywołania. Jeśli zostanie wywołany w wierszu poleceń węzła logowania, utworzy nowy przydział i wykona polecenie po srun. Jeśli zostanie wywołany w skrypcie wsadowym, po prostu uruchomi zadanie na bieżącym przydziale. Podobnie, srun może otrzymać argument --jobid, który każe mu uruchomić zadanie jako część danego 'job`a' i jego alokacji.

* `salloc` zawsze tworzy nowy przydział zasobów, gdy jest wywoływany, ale nie musi uruchamiać żadnych zadań w przydzielonych węzłach. Typowym przykładem użycia salloc jest utworzenie przydziału w celu uruchomienia serii kolejnych poleceń srun poprzez interaktywną sesję bash lub skrypt uruchamiany z węzła logowania. Zwalnia przydział po zakończeniu sesji skryptu lub sesji bash.

Źródło: <https://cvw.cac.cornell.edu/slurm/basics_allocation>

## Skrypty systemu kolejkowego

Opis zadania i zapotrzebowanie na zasoby można specyfikować w specjalnym
skrypcie - pliku tekstowym dla systemu SLURM. Skrypt tworzy użytkownik.
Skrypt składa się z tzw. dyrektyw systemu SLURM, czyli linii zaczynające
się od słowa `#SLURM` oraz instrukcji uruchamiających odpowiedni
program.

* Pierwsza linia skryptu **musi** zawierać ścieżkę do interpretera
    (shell), który ma wykonać skrypt na przydzielonym węźle
    obliczeniowym np.
    `#!/bin/bash -l`.
* Kolejne linie powinny zawierać specyfikację zasobów

!!! Note
    Task jest rozumiany jako pojedynczy proces uruchomiony przez aplikację użytkownika.
    Rezerwacja zasobów oraz wszystkie uruchamiane komendy systemowe i programy nazywane są w skrócie zadaniem.

Większość opcji ma swoje skróty.
W razie wątpliwości można zajrzeć do instrukcji korzystając z polecenia `man sbatch` lub `man srun`
Poniżej przedstawiona jest lista najczęściej używanych opcji:

| Skrót    | Pełna nazwa             |  Znaczenie                                                                                      |
|----------|:------------------------|:------------------------------------------------------------------------------------------------|
| -N       |  --nodes=               | Liczba węzłów dostępowych do rezerwacji dla zadania.  |
| ---      |  --ntasks-per-node      | Liczba 'tasków' per węzeł. Opcja ta jest przydatna w przypadku hybrydowych aplikacji MPI / OpenMP, w której do każdego węzła należy przypisać tylko jedno „zadanie / stopień” MPI, jednocześnie umożliwiając części OpenMP wykorzystanie pozostałych procesorów dostępnych na węźle w ramach zaalokowanego zadania. |
| -n       |  --ntasks=         | Liczba procesów do uruchomienia. Domyśla wartość to jeden proces per węzeł.                     |
| -p       |  --partition=      | Zadanie uruchamiane będzie w dostępnej dla użytkownika partycji (np. topola, okeanos)           |
| -q       |  --qos=            | quality of service                                                                              |
| -A       |  --account=        | Numer grantu obliczeniowego użytkownika grant, np. G99-99. Używane w celach sprawozdawczych.    |
| -c       |  --cpus-per-task=  | Liczba procesorów per proces. |
| -J       |  --job-name=       | Ustawia nazwę zadania, domyślnie jest to nazwa skryptu. Pod taką nazwą będzie widziane zadanie w systemie, np. przy wyświetlaniu listy zadań.  |
| -t       |  --time=`hh:mm:ss`   |    Maksymalna długość działania zadania od momentu jego uruchomienia `gg:mm:ss`. Po tym czasie zadanie zostanie przerwane przez system kolejkowy. |
| -C       |  --constraint      | Możliwość zażądania sprzętu o konkretnych, np. typu procesora.                                  |
| ---      |  --gres=gpu:`4`      | Użycie dodatkowych zasobów, np GPU (klaster Rysy).                                              |
| ---      |  --mem=            | Rezerwacja pamięci per node (megabytes).                                                        |
| ---      |  --mem-per-cpu=    | Rezerwacja pamięci per CPU (megabytes).                                                         |
| ---      |  --mail-user=      | Adres email użytkownika, np. `--mail-user=user@somewhere.com` |
| ---      |  --mail-type=      | Kiedy wysłać powiadomienie email (`ALL` lub `END`). Nieustawienie opcji - brak powiadomienia.    |


### Przykładowe skrypty

#### Partycja Topola

Poniższy skrypt uruchamia obliczenia w programie Quantum Espresso:

```.slurm
#!/bin/bash -l
#SBATCH -J qe-1
#SBATCH -N 1
#SBATCH --ntasks-per-node 12
#SBATCH --mem 5000
#SBATCH --time=20:00:00
#SBATCH --account=GYY-XX
#SBATCH --partition=topola
#SBATCH --output="qe.out"

module load apps/espresso/6.1.0
mpirun -n 12 pw.x < S.in
```

* w systemie kolejkowym zadnie będzie funkcjonowało pod nazwą "qe-1"
* na jednym węźle obliczeniowym z wykorzystaniem 12 rdzeni
    obliczeniowych
* dla zadania przydzielone zostanie 5GB pamięci operacyjnej
* zlecający deklaruje, że zadanie zakończy się w czasie krótszym niż
    20 godzin (po tym czasie zadanie zostanie przerwane przez system
    kolejkowy)
* zadanie zostaje przypisane do grantu o numerze GYY-XX
* Plik sterujący S.dat powinien być umieszczony w katalogu z którego
    uruchamiane jest zadanie
* Polecenie "*module load apps/espresso/6.1.0*" ustawia środowisko
    (dostęp do programu, zmienne środowiskowe) niezbędne do uruchomienia
    programu.
* Polecenie "*mpirun -n 12 pw.x < S.in*" uruchamia właściwy program
    obliczeniowy w środowisku równoległym MPI.

### Partycja Okeanos

```.slurm
#!/bin/tcsh
#SBATCH -J qe-1
#SBATCH -N 1
#SBATCH --ntasks-per-node 12
#SBATCH --account=GYY-XX
#SBATCH --partition=okeanos
#SBATCH --output="qe.out"

module swap PrgEnv-cray PrgEnv-intel
module load espresso/6.1.0
srun -n 12 pw.x < S.in
```

### Partycja Rysy

W celu uruchomienia aplikacji na GPU niezbędne jest podanie opcji `--gres=gpu:liczba_gpu`.

```.slurm
#!/bin/bash -l
#SBATCH -J gpu_test
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --account=GYY-XX
#SBATCH --time=01:00:00
#SBATCH --qos=normal

srun hello_world_cuda
```

Przykładowy program *hello_world_cuda* znajduje się w sekcji [Podstawy GPU](../GPU-intro/hello_world.md).

## Wstawianie zadania do kolejki

Polecenie `sbatch` służy do wstawiania zadań do systemu kolejkowego.
Wszystkie flagi, które można wyspecyfikować w tym poleceniu,
alternatywnie podaje się w pierwszym bloku komentarza skryptu
kolejkowego w liniach zaczynających się od `#SBATCH` .
Niektóre opcje tego polecenia są specyficzne dla danego komputera.

!!! Info
    Zlecanie zadań na system `topola` możliwe jest ***bezpośrednio z węzła dostępowego*** `hpc.icm.edu.pl`.
    W przypadku pozostałych systemów możliwy/wymagany jest ***dodatkowy krok logowania*** wykonany z komputera
    hpc.icm.edu.pl, np. `ssh rysy`, `ssh okeanos`.

Więcej o komputerach dostępnych w ICM [tutaj](../../O_zasobach_ICM/Zasoby/komputery_w_icm.md).

### Tryb wsadowy

Wstawienie do kolejki zadania opisanego skryptem `MojeZadanie.batch`
wykonujemy komendą:

```.sh
sbatch MojeZadanie.batch
```

Umieści ona w systemie kolejkowym zadanie wsadowe (bez możliwości
interakcji z wykonywanym programem). Dodatkowe opcje wykonania zadania
możemy wprowadzać w skrypcie lub podać jako parametry polecenia
`sbatch`.

### Tryb interaktywny

Aby uzyskać dostęp do zasobów w trybie interaktywnym z dostępem do
powłoki (shell), wykonujemy komendę:

`srun --cpu_bind=none -p nazwa_partycji -A G99-99 --pty bash -l`

Nazwa partycji (kolejki) zależy od konkretnej maszyny, na której ma być
uruchamiane zadanie. Dla komputera hydra, spis dostępny jest
[tutaj](/Hydra#Kolejki_.28partycje.29 "wikilink"). Dodatkowo wymagany
jest numer grantu obliczeniowego, w ramach którego prowadzone są prace
(w przykładzie G99-99)

Dodatkowe opcje wykonania zadania możemy wprowadzać jedynie jako
parametry polecenia `srun`, np.

`srun --partition=topola -w wn1234 -A G99-99 -N 1 --ntasks-per-node 6 --pty bash -l`

zadanie zostanie uruchomione na *jednym* węźle o nazwie *wn1234*, z rezerwacją na *6
procesorów/rdzeni (per węzeł) *

#### Przykład rozpoczęcia pracy interaktywnej

```.sh
srun -p <partition_name>  -A <grant_name> -N 1 -n 12 --time=1:00:00 --pty /bin/bash -l # cluster: topola, okeanos
srun -A <grant_name> -N 1 -n 12 --time=1:00:00 --gres=gpu:2 --pty /bin/bash -l # cluster: rysy
```

## Quality of Service (QOS)

Parametr ten określa na jak długo możliwa jest alokacja zasobów oraz priorytet w uruchomieniu zadania.

Aby przypisać zadanie do konkretnego qos'a należy ustalić zmienną:

```.slurm
--qos=NAZWA_QOSa
```

Szczegóły qos'ów dostępnych w ICM znajdują się [tu](../../O_zasobach_ICM/Zasoby/komputery_w_icm.md).
