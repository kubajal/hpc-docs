---
title: ""
date: 2020-06-09
draft: false
---


Oficjalna dokumentacja <https://sylabs.io/docs/>

## Po co kontenery?

*BYOE*: Bring Your Own Environment!

Kontenery zmieniają przestrzeń użytkownika w wymienny komponent.
Oznacza to, że programy, niestandardowe konfiguracje i środowisko, 
może być niezależne od systemu operacyjnego np. CentOS, Fedora, Ubuntu itp. 
Kontener Singularity spakuje wszystko, czego potrzebujesz, w jeden weryfikowalny plik.

Uruchamiając kontener (np. nowy PC, centrum HPC, nowy użytkownik/członek zespołu) zaoszczędzamy czas związany z 
konfiguracją środowiska i instalacją bibliotek niezbędnych do uruchomienia programu.

## Przykłady

### Sesja Interaktywna

Najpierw należy wejść na węzeł obliczeniowy
w systemie Topola

```.sh
srun -N1 -n10 --partition=topola --account=NR_GRANTU --qos=hpc --time=01:00:00 --pty /bin/bash -l
```

lub w systemie Okeanos

```.sh
srun -N1 -n10 --partition=okeanos --account=NR_GRANTU --time=01:00:00 --pty /bin/bash -l
module load common/go/1.13.12
module load common/singularity/3.5.3
```

lub w systemie Rysy

```.sh
srun -N1 -n4 --account=app-NR_GRANTU --gres=gpu:1 --time=01:00:00 --pty /bin/bash -l
```

Możemy użyć polecenia `singularity`.
Jako przykład posłuży kontener o nazwie 'lolcow'.

```.sh
singularity search lolcow  # wyszukaj kontenery o nazwie lolcow
singularity pull library://sylabsed/examples/lolcow  # ściągnij wybrany kontener
```

Po ściągnięciu kontenera

```.sh
singularity run lolcow_latest.sif  # uruchom kontener z domyślnym programem
singularity exec lolcow_latest.sif cowsay moo # wywołaj polecenie 'cowsay' z argumentem 'moo'
singularity shell --cleanenv lolcow_latest.sif # wejdź do kontenera - sesja interaktywna wewnątrz kontenera
# jeżeli nie chcemy przekazywać zmiennych środowiskych systemu hosta do wnętrza kontenera, należy użyć flagi --cleanenv 
```

## Zlecenie zadań

Zlecenie zadań z wykorzystaniem kontera singularity, odbywa się analogicznie jak dla innych programów

zadanie.slurm

```.slurm
#!/bin/bash -l
#SBATCH -J __JOBNAME__
#SBATCH -N __NUMBER_OF_NODES__
#SBATCH --ntasks-per-node __PROCESORS_PER_NODE__
#SBATCH -A __GRANT_NAME_GXXX__
#SBATCH -p __PARTITION__


module load common/go/1.13.3  # na systemie okeanos
module load common/singularity/3.4.2  # na systemie okeanos

singularity exec moj_kontener.sif ./skrypt_do_wykonania_wewnatrz_kontenera.sh
```

skrypt_do_wykonania_wewnatrz_kontenera.sh

```.sh
#!/bin/bash -l

echo hello # program do wykonania wewnątrz kontenera
```

### Singularity a MPI

Szczegóły na oficjalnej stronie singularity:
<https://sylabs.io/guides/3.4/user-guide/mpi.html>

## Budowanie kontenerów

Obecnie nie jest możliwe budowanie kontenerów singularity bezpośrednio na maszynach ICM.
Kontener musi zostać zbudowany na lokalnym komputerze użytkownika (lub w chmurze).

```.sh
sudo singularity build image.sif recipe.def
```
