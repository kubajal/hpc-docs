---
title: "Licencje krajowe: ANSYS"
date: 2020-06-16
draft: false
---

<!-- <Last revision: 2020-06-16 by M. Hermanowicz <m.hermanowicz@icm.edu.pl> -->

## Licencja krajowa

### Konfiguracja serwera licencji

- Ze strony [ANSYS](http://www.ansys.com/customer) należy pobrać wersję bieżącą pakietu (dla większości użytkowników) ANSYS Academic Research CFD. Po dane logowania na tę stronę należy zwrócić się do firmy SymKom.
- Nie powinno być potrzeby pobierania pakietu z serwerem licencji.
- Przy instalacji w oknie konfiguracji licencji podać:
      - ANSYS Licensing Interconnect port number - 1734
      - ANSYS FLEXlm port number - 1723
      - jako serwer - **licenses4.icm.edu.pl**
- Powyższe numery portów są inne niż domyślnie proponowane. Proszę zwrócić na to uwagę.
- Zmiana ustawień serwera licencji nie wymaga reinstalacji pakietu. Zmiany wprowadza się za pomocą programu ANSLIC_ADMIN (Windows: Start> All Programs> ANSYS x.y> ANSYS Client Licensing> Client ANSLIC_ADMIN Utility x.y)
- W przypadku problemów z dostępem do serwera licencji należy upewnić się u administratorów sieci w swojej jednostce, czy nie jest blokowany dostęp do serwera *licenses4.icm.edu.pl* na portach *1723, 1724, 1734* oraz *7242*. Jest to główna przyczyna większości problemów zgłaszanych do nas.

!!! Warning "Uwaga"
    Na komputerze, na którym uruchamiane są obliczenia, należy jednorazowo uruchomić program ANSLIC_ADMIN, wybrać zakładkę "Set License Preferences for User" i ustawić kolejność licencji, jakie będą pobierane z serwera. W zakładce Solver i PrepPost na pierwszym miejscu powinien znaleźć się Ansys Academic Research CFD (lub Ansys Academic Research POLYFLOW).

### Ustalanie numeru IP

Swój numer IP na potrzeby licencji (tzw. publiczny) można sprawdzić przez dowolną stronę typu: [http://whatismyipaddress.com](http://whatismyipaddress.com) czy [http://www.whatismyip.com](http://www.whatismyip.com). Numery z zakresu **192.168.0.0–192.168.255.255** lub **172.16.0.0–172.31.255.255** są numerami sieci wewnętrznej jednostki.

## Uruchamianie

### Tryby pracy

ANSYS Fluent może być wykonywany zarówno w trybie wsadowym jak i interakcyjnie. Praca w trybie wsadowym wymaga wcześniejszego przygotowania pliku zawierającego dane opisujące model oraz poleceń sterujących wykonaniem programu. Taki plik jest następnie wykorzystany jako plik wejściowy dla przebiegu. Najczęściej tryb interakcyjny stosuje się na etapie definiowania modelu, wykonywania początkowych obliczeń oraz postprocessingu. Tryb wsadowy natomiast jest bardzo przydatny podczas wykonywania dużej liczby obliczeń iteracyjnych. Działanie programu ANSYS Fluent rozpoczyna się poleceniem:

```bash
fluent
```

uzupełnionym o listę argumentów. Sposób wykonania programu zależeć będzie od podanych argumentów.

ANSYS Fluent może działać w wersji pojedynczej precyzji oraz w podwójnej precyzji. W większości przypadków, solver działający w pojedynczej precyzji daje wystarczająco dokładne wyniki. Rozpoczynając działanie Fluenta w wierszu poleceń można wskazać zarówno precyzję, z jaką będą wykonywane obliczenia, jak i wymiar przestrzenny modelu (2D lub 3D). W szczególności:

```bash
fluent 2d
```

uruchamia solver dwuwymiarowy i działający w pojedynczej precyzji.

```bash
fluent 3d
```

uruchamia solver trójwymiarowy, działający w pojedynczej precyzji.

```bash
fluent 2ddp
```

uruchamia solver dwuwymiarowy, działający w podwójnej precyzji.

```bash
 fluent 3ddp
```

uruchamia solver trójwymiarowy, działający w podwójnej precyzji.

### Graficzny interfejs użytkownika

Graficzny interfejs użytkownika składa się z czterech logicznych części: okna konsoli, paneli sterujących, okienek dialogowych oraz okien graficznych. Okno konsoli jest głównym oknem, za pośrednictwem którego steruje się wykonaniem programu. Działanie z konsoli jest możliwe albo za pomocą tekstowego interfejsu użytkownika lub graficznego interfejsu użytkownika, w którym polecenia wydaje się poprzez układ rozwijalnych okien zawierających polecenia należące do różnych poziomów menu.

### Tekstowy interfejs użytkownika

Tekstowy system menu jest interfejsem hierarchicznym. Ponieważ bazuje tylko na tekście, łatwo jest wpływać na jego działanie za pomocą standardowych narzędzi przeznaczonych do działania na tekstach. W szczególności to co zostało wprowadzone może być zapisane do pliku, zmodyfikowane za pomocą edytora, a następnie ponownie wczytane i wykonane. Struktura systemu menu jest podobna do struktury katalogowej na dysku. W chwili rozpoczęcia działania programu użytkownik znajduje się na poziomie najwyższym. Aby wyświetlić spis poleceń dostępnych na bieżącym poziomie, należy nacisnąć na Enter. Nazwy kolejnych poziomów menu, w odróżnieniu od nazw poleceń, są zakończone znakiem /.

### Uruchamianie w trybie wsadowym

Sposób uruchomienia Fluenta w trybie wsadowym zależy od systemu operacyjnego. Tu podany jest sposób odpowiedni dla komputerów pracujących pod kontrolą systemu GNU/Linux. Aby rozpocząć działanie programu należy wprowadzić polecenie:

```bash
fluent inne_opcje -g -i inputfile > outputfile
```

Znaczenie kolejnych elementów polecenia:

- **-g** wskazuje, że program ma być uruchomiony z pominięciem graficznego interfejsu użytkownika;
- **-i** poprzedza nazwę pliku sterującego wykonywaniem zadania we Fluencie;
- inputfile jest nazwą pliku, w którym znajdują się polecenia sterujące. Są to odpowiedniki poleceń, jakie można wprowadzać podczas pracy w trybie interaktywnym;
- **outputfile** jest plikiem, w którym zostanie umieszczone to, co pojawiłoby się na konsoli podczas pracy w trybie interakcyjnym (komunikaty, raporty o residuach, itd);
- **inne_opcje** oznacza inne opcje wywołania Fluenta, w szczególności zdefiniowanie wymiaru zadania (2d, 3d), podwójnej precyzji obliczeń (2ddp, 3ddp) oraz ustawienia niezbędne podczas obliczeń wykorzystujących większą liczbę procesów.

### Uwaga o pliku **inputfile**

Plik **inputfile** może być plikiem typu journal utworzonym podczas wcześniejszych sesji Fluenta, lub też plikiem utworzonym za pomocą edytora tekstowego. W każdym przypadku plik ten może zawierać tylko polecenia interfejsu tekstowego. Przykładowy plik inputfile jest przedstawiony poniżej:

```bash
rc example.cas
solve/init/init
it 50
wd example50.dat
it 50
wd example100.dat
exit
```

Plik ten opisuje następujące czynności:

- wczytanie pliku zawierającego definicję zadania (geometria, warunki brzegowe, inne ustawienia, itd) (tu: example.cas);
- wykonanie 100 iteracji w dwóch grupach po 50, z zapisaniem wyników do pliku example50.dat po wykonaniu 50 iteracji, oraz do pliku example100.dat po wykonaniu kolejnych 50 iteracji;
- ostatnia linia powoduje zakończenie działania programu.

Przykładowy plik **inputfile** wykorzystuje standardowe aliasy (it jest aliasem dla sekwencji poleceń solve/iterate, rc jest aliasem polecenia file/read-case, wd jest aliasem równoważnym file/write-data, itd).

Inny sposób zapisania ciągu poleceń z przykładu to:

```bash
file/read-case example.cas
solve/init/init
solve/iterate 50
file/write-data example50.dat
solve/iterate 50 50
file/write-data example100.dat
exit
```

## Tryb wsadowy

Zaleca się, aby wszystkie zadania obliczeniowe na dużych maszynach w ICM były uruchamiane za pośrednictwem systemów kolejkowych. Na klastrze hydra kolejkami steruje system SLURM. System SLURM (SLURM) zapewnia środowisko wsadowego wykonywania zadań użytkowników. Jego zadaniem jest optymalne wykorzystanie dostępnych zasobów w celu jak najwydajniejszego wykonywania zadań. Na tej stronie podano tylko podstawowe informacje niezbędne do rozpoczęcia obliczeń w trybie wsadowym. Więcej informacji znajduje się na stronie poświęconej SLURMowi.

!!! Warning "Uwaga"
    Obowiązek korzystania z systemu kolejkowego dotyczy przede wszystkim wykonywania symulacji. Etapy preprocessingu (tworzenie siatek obliczeniowych) oraz postprocessing można wykonywać interaktywnie, ale również wtedy wymagane jest otwarcie zadania kolejkowego w trybie interakcyjnym.

### Przygotowanie zadania wsadowego dla Fluenta

Podczas uruchamiania obliczeń w trybie wsadowym (batch) użytkownik nie może komunikować się z wykonywanym programem. Dlatego niezbędne jest wcześniejsze przygotowanie informacji potrzebnych w toku wykonywania wszystkich zaplanowanych czynności, tak aby program mógł je wykorzystać w stosownym momencie. Zakres tych informacji, ich format oraz sposób przygotowania zależy od konkretnego programu. Najczęściej istnieje wiele możliwości uzyskania tego samego efektu. Dlatego wskazówki podane na tej stronie należy traktować jako przykłady, a nie jako ściśle obowiązujące reguły. W trybie wsadowym niedostępny jest interfejs graficzny.

W przypadku programu Fluent dobrym rozwiązaniem jest skorzystanie z kombinacji plików .cas oraz tekstowego pliku wejściowego, poniżej oznaczanego nazwą inputfile. W pliku .cas znajduje się opis modelu (siatka obliczeniowa, definicje parametrów, warunki brzegowe, itd.) i plik ten najczęściej tworzy się korzystając z interfejsu graficznego. Natomiast w pliku inputfile umieszcza sie dodatkowe polecenia sterujące realizacją obliczeń.

**Uwaga o pliku inputfile**: Plik inputfile może być plikiem 'journal' utworzonym podczas wcześniejszych sesji Fluenta, lub też plikiem utworzonym za pomocą edytora tekstowego. W każdym przypadku plik ten może zawierać tylko polecenia interfejsu tekstowego.

### Przykład

Przykładowy plik **inputfile**:

```bash
rc example.cas
solve/init/init
it 50
wd example50.dat
it 50
wd example100.dat
exit
```

Plik ten opisuje następujące czynności:

- wczytanie pliku zawierającego definicję zadania (geometria, warunki brzegowe, inne ustawienia, itd) (tu: example.cas);
- wykonanie 100 iteracji w dwóch grupach po 50, z zapisaniem wyników do pliku example50.dat po wykonaniu 50 iteracji, oraz do pliku example100.dat po wykonaniu kolejnych 50 iteracji;
- ostatnia linia powoduje zakończenie działania programu.

W powyższym pliku wykorzystano standardowe aliasy: it jest aliasem dla sekwencji poleceń solve/iterate, rc jest aliasem polecenia file/read-case, wd jest aliasem równoważnym file/write-data, itd.

Inny sposób zapisania ciągu poleceń z przykładu to:

```bash
file/read-case example.cas
solve/init/init
solve/iterate 50
file/write-data example50.dat
solve/iterate 50 50
file/write-data example100.dat
exit
```

W ogólnym przypadku w pliku **inputfile** można umieścić znacznie więcej poleceń.

Kolejny przykład dotyczy zagadnienia ewolucyjnego:

```bash
read-case example.cas
solve/init/init
solve/set/time-step
0.001
solve/dual-time-iterate
10
500
write-data Model.dat
exit
yes
```

Plik ten opisuje następujące czynności:

- wczytanie pliku zawierającego opis zadania (tu: example.cas);
- zdefiniowanie długości kroku czasowego (0.001 s);
- wykonanie obliczeń dla 10 kroków czasowych; w każdym kroku wykona się maksymalnie 500 iteracji;
- zapisanie wyników otrzymanych po wykonaniu 10 kroków czasowych do pliku Model.dat;
- exit powoduje zakończenie działania programu.

Ostatnia linia w przykładzie (**yes**) jest niezbędna, bowiem przed zakończeniem działania Fluent wyświetla komunikat:

```bash
The current case and data have not been saved. Ok to discard?
```

Odpowiedź na ten komunikat również musiała znaleźć się w pliku input.

!!! Warning "Uwaga"
    Podczas przygotowywania zadania wsadowego należy poprawnie przewidzieć ciąg pytań generowanych przez program w miarę jego wykonywania i przygotować odpowiedzi na wszystkie takie komunikaty. Każda zmiana w stosunku do założonego scenariusza (czyli rozbieżność między pytaniami generowanymi przez program - a odpowiedziami znajdującymi się w pliku wejściowym) powoduje niepoprawny przebieg zadania wsadowego. Dlatego po wykonaniu obliczeń warto jest przejrzeć zapis poleceń w pliku konsoli (w tym opisie najczęściej oznaczanym jako output i sprawdzić poprawność realizacji kolejnych poleceń.

## Zrównoleglanie

### Przykład skryptu kolejkowego

Przykładowy skrypt kolejkowy uruchamiający obliczenia na kilku procesorach na hydrze może wyglądać następująco:

```bash
#!/bin/bash -l
#SBATCH --job-name=nazwa
#SBATCH -N 2
#SBATCH -n 24
#SBATCH -p hydra
#SBATCH -A G00-00
#SBATCH -C ib
#SBATCH --time=10:00:00
#SBATCH --mem=24gb
##
echo Job started>raport
echo "  "  at `date` >>raport
echo "  "  on host `hostname` >>raport
##
module load fluent
fluent 3ddp -ssh -pib -t24  -g -i inputfile > output
##
echo Job finished at `date` >>raport
```

- Opcja **-g** oznacza wyłączenie trybu graficznego.
- **-i** inputfile oznacza, że komunikacja z programem Fluent będzie odbywała się za pomocą pliku inputfile, natomiast wszystkie komunikaty generowane przez Fluenta, które podczas pracy interaktywnej pojawiałyby się na konsoli, będą zapisywane do pliku output.
- Informacje wyróżnione kolorem w pliku skryptowym są związane z wykorzystaniem Fluenta w obliczeniach wieloprocesowych.
- Sposób, w jaki definiuje się liczbę procesorów, na których będzie wykonywane zadanie:

```.slurm
#SBATCH -N 2
#SBATCH -n 24
```

Powyższa przykładowa konfiguracja oznacza, że obliczenia będą wykonywane na dwóch węzłach (-N 2), sumarycznie korzystając z (-n 24) procesów. Liczba 24 pojawia się w poleceniu wywołującym Fluenta:

```bash
fluent 3ddp -ssh -pib -t24  -i inputfile >output
```

Z podanych wartości wynika, że na jeden węzeł przypada 12 procesów i nie jest to wartość przypadkowa, a bezpośrednio związana z rodzajem węzłów dostępnych na hydrze. Z przyczyn praktycznych najlepiej jest zajmować na obliczenia całe węzły, a zatem liczba procesów powinna być wielokrotnością 12.

W przypadku zadań wymagających większej pamięci/liczby węzłów należy odpowiednio zmienić wartości #SBATCH -N x, #SBATCH -n y oraz parametr -t y w wywołaniu Fluenta. Nie należy zwiększać parametru #SBATCH --mem=24gb

- Opcja **-ssh** wymusza użycie ssh zamiast rsh do komunikacji wewnętrznej procesów. W większości przypadków jest to niezbędne ustawienie.
- Opcja **-pib** oznacza wykorzystanie komunikacji typu infiniband.

Ustawienie to pojawia się również w definicji zadania w opcji:

```.slurm
#SBATCH -C ib
```

### System Topola

Skrypt przeznaczony do uruchamiania zadań na Topoli wygląda analogicznie. Niewielkie zmiany są spowodowane inną architekturą tej części klastra.

!!! Warning "Uwaga"
    Dostęp do partycji **topola** jest przyznawany na podstawie indywidualnych zgłoszeń.

```.slurm
#!/bin/bash -l
#SBATCH --job-name=nazwa
#SBATCH -N 2
#SBATCH -n 56
#SBATCH -p topola
#SBATCH -A G00-00
#SBATCH --time=10:00:00
#SBATCH --mem=100gb
##
echo Job started>raport
echo "  "  at `date` >>raport
echo "  "  on host `hostname` >>raport
##
module load fluent
fluent 3ddp -pib -slurm -t56  -g -i inputfile >output
##
echo Job finished at `date` >>raport
```

**Główne różnice** to:

- Jeden węzeł zawiera 28 procesorów, dlatego korzystnie jest w obliczeniach wykorzystywać wielokrotność 28.
- Węzły dysponują większą pamięcią.
- Należy zdefiniować partycję 'topola' za pomocą ustawienia #SBATCH -p topola.
- Nie ma potrzeby definiowania parametru #SBATCH -C ib
