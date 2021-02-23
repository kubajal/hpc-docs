# Terminal multiplexer

!!! question
    Czy kiedykolwiek spotkałeś się z sytuacją, w której wykonujesz długotrwałe, interaktywne zadanie na zdalnym komputerze i nagle twoje połączenie zostaje zerwane, sesja SSH zakończona, a twoja praca utracona? 
    Na szczęście istnieje narzędzie o nazwie **Screen**, które pozwala nam wznowić sesje.


Program `screen` to multiplekser terminala. Oznacza to, że można rozpocząć sesję `screen`, a następnie otworzyć dowolną liczbę okien (terminali wirtualnych) wewnątrz tej sesji. Procesy działające w `screen` będą nadal działać, nawet gdy ich okno nie będzie widoczne (np. połączenie internetowe zostanie zerwane).

Poniżej przykład użycia programu `screen` na komputerze Okeanos.

1) [Logujemy się](../Logowanie/ssh.md)

    username@okeanos-login1:~> # należy zapamiętać na którym login-nodzie jesteśmy

2) Uruchamiamy `screen`'a

    username@okeanos-login1:~> screen -S <nazwa_zadania>

3) Uruchamiamy zadanie w trybie interaktywnym

    username@okeanos-login1:~> srun -n1 --partition=okeanos --account=GrantXX_YY --time=48:00:00 --pty /bin/bash -l

4) Włączamy program w trybie interaktywnym, np kompilacje.


    username@nid00015:~> make -j1 ./mystuff
    # w przypadku openfoam'a
    username@nid00015:~> git clone https://git.icm.edu.pl/owu-public/spack-icm-okeanos.git
    username@nid00015:~> source ./spack-icm-okeanos/share/spack/setup-env.sh
    username@nid00015:~> spack spec -LI openfoam@2006%gcc@8.3.0^mpich
    username@nid00015:~> spack install -j1 --verbose openfoam@2006%gcc^mpich

Więcej o kompilacji z użyciem `spack'a` jest dostępny [tu](./instalacja_oprogramowania_spack.md).

5) Odłączamy sesję screena `Ctrl+A+D`

6) Wylogowujemy się z Okeanosa i wyłączamy komputer na noc...

7) Rano logujemy się z powrotem na Okeanosa. Jeśli został nam przydzielony inny węzeł dostępowy, należy się przelogować
(np. `username@okeanos-login2:~> ssh login1`)

    username@okeanos-login1:~>screen -ls # sprawdzamy listę aktywnych sesji screen'a
    username@okeanos-login1:~>screen -r <nazwa_zadania> # logujemy się do właściwej
    username@nid00015:~> # kontynuujemy zadanie na węźle obliczeniowym

Przydatne polecenia:

```.console
echo $STY  # zwraca nazwę sesji, np. 12345.pts-abc-01-12 jeśli jesteśmy wewnątrz sesji
echo $TERM # zwraca "screen" jeśli jesteśmy wewnątrz sesji
```

Więcej przykładów:

- google: screen terminal multiplexer examples
- <https://linuxize.com/post/how-to-use-linux-screen/>
- <https://kapeli.com/cheat_sheets/screen.docset/Contents/Resources/Documents/index>
