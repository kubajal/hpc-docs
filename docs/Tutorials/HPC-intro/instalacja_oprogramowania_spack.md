---
title: "Instalacja Oprogramowania - spack"
date: 2021-01-04
draft: false
---

!!! Info
    Spack to menedżer pakietów dla superkomputerów. 
    **Ułatwia** instalację oprogramowania naukowego. 
    Spack nie jest powiązany z konkretnym językiem; 
    pozwala zbudować stos oprogramowania w Pythonie lub R, 
    link'ować biblioteki napisane w C, C++ lub Fortran'ie. 
    Ponadta można łatwo zmieniać kompilatory lub celować w określone mikroarchitektury.

Źródła:

* <https://spack.io/>
* <https://spack.readthedocs.io/en/latest/>
* <https://www.youtube.com/watch?v=z7ZdnCkaPCY&ab_channel=InsideHPCReport>

W repozytorium <https://git.icm.edu.pl/owu-public> znajduje się
folder `spack-icm-base` z wersją spacka, używanej w ICMie oraz zestaw paczek (namespace `icm`).

Kolejne dwa repozytoria to `spack-icm-topola` i `spack-icm-okeanos` będące fork-ami `base`. 
Zawierające one specyficzne konfiguracje dla poszczególnych systemów.

## Przykład

Poniżej przedstawione są komendy pozwalające zbudować program [OpenFOAM](https://www.openfoam.com/) na komputerze Topola.

1. Klonujemy projekt `spack-icm-topola` z git:

    ```.sh
        $ git clone https://git.icm.edu.pl/owu-public/spack-icm-topola.git`
    ```

2. Wchodzimy na węzeł obliczeniowy (to ważne, spack nie chce działać z tcsh):

    ```.sh
        $ srun -N1 -n10 --partition=topola --account=GRANT_NAME --qos=hpc --time=08:00:00 --pty /bin/bash -l
    ```

3. Ustawiamy środowisko dla spack-a:

    ```.sh
        $ module load common/spack/0.15.4
        $ source ./spack-icm-topola/share/spack/setup-env.sh
    ```

4. Sprawdzamy środowisko spack-a:

    ```.sh
        $ spack find -L
        ==> XXX installed packages
        ....
    ```

5. Specyfikujemy aplikację którą chcemy zainstalować

    ```.sh
        $ spack spec -LI openfoam@2006^/brej2ys
    ```

    Ogólne oznaczenia wersji i zależności:

    ```.sh
        xxx@wersja_1234
        xxx^/zaleznosc_np_openmpi
        xxx~bez_tej_zaleznosci
    ```

    Na komputerze topola zależność `^/brej2ys` wskazuje na openmpi (dla mpich-a to `^/xtz6bcc`).
    W przypadku openfoam'a należy wybrać openmpi.

6. Instalujemy

    ```.sh
        $ spack install openfoam@2006^/brej2ys
    ```

    Możemy sprawdzić szczegóły instalacji

    ```.sh
        $ spack find --deps --long openfoam@2006^openmpi

        ==> 1 installed package
        -- linux-centos7-haswell / gcc@4.8.5 ----------------------------
        ...
    ```

7. Ładujemy moduł z openfoam'em przygotowany przez spack'a.
   Moduł i instalacja jest specyficzna dla użytkownika który je wykonywał.

    ```.sh
        $ module avail
        ------------------------------------------
        /icm/home/user_name/ICM/spack-icm-topola/share/spack/modules/linux-centos7-haswell
         -------------------------------------------
        openfoam-2006-gcc-4.8.5-abcdefg

        $ module load openfoam-2006-gcc-4.8.5-abcdefg
    ```

8. Uruchamiamy openfoam'a

    ```.sh
        $ TESTDIR=katalog_roboczy
        $ cp -r ${FOAM_TUTORIALS}/multiphase/interFoam/laminar/damBreak $TESTDIR
        $ cd $TESTDIR
        $ ./Allclean
        $ ./Allrun

        #Sprawdzamy logi:
        $ cat damBreakFine/log.interFoam
    ```

Dla Okeanos'a procedura jest analogiczna.

## Przydatne polecenia

```.sh
spack find xxx - pokazuje jakie paczki udało sie spackowi już zainstalować
spack find --long xxx - pokazuje hashe
spack find --deps xxx - pokazuje jakie zależności dla danej paczki
spack list xxx - pokazuje co umie zainstalować
spack info xxx - pokazuje w jakich wersje i zależności dla danej paczki
spack external find - aktulalizuje wiedze o paczkach obecnych w
systemie (np. zainstalowanych bez pomocy spacka)
spack config get config - pokazuje konfiguracje (tempdir, spack-cache, etc)
```

### Przygotowanie do instalacji

```.sh
[user@t7-4 ICM]$ source spack-icm-topola/share/spack/setup-env.sh
[user@t7-4 ICM]$ cd spack-icm-topola/
[user@t7-4 spack-icm-topola]$ spack spec -LI openfoam


xxx@wersja_1234
xxx^zaleznosc_np_openmpi
xxx~bez_tej_zaleznosci

spack install xxx@wersja_1234^zaleznosc_np_openmpi
```

### Inne

```.sh
[user@t7-4 ICM]$ find spack-icm-* -type f -name "*setup-env.sh"
spack-icm-base/share/spack/setup-env.sh
spack-icm-topola/share/spack/setup-env.sh

# definicje budowalnych/preinstalowanych paczek w systemie
cat spack-icm-topola/etc/spack/packages.yaml 

# definicje zależności dla programu openfoam
cat spack-icm-topola/var/spack/repos/builtin/packages/openfoam-org/package.py 

# denicje paczek mpich i openmpi dostosowane do topoli
cat spack-icm-topola/var/spack/repos/icm-edu-pl/packages/ 

# logi z budowy
/lu/topola.temp/spack-stage/moja_paczka 
```
