---
title: "Komputery"
date: 2020-03-16
draft: false
---

## Maszyny obliczeniowe w ICM

Poniżej przedstawiamy zestawienie i krótką charakterystykę maszyn obliczeniowych ICM.
Po zalogowaniu się przez ssh na węzeł dostępowy (hpc.icm.edu.pl) można ponownie użyć ssh do zalogowania się na kolejną maszynę (np. Okeanos, Rysy), niedostępna zza firewalla. Po zalogowaniu na węzeł dostępowy *hpc.icm.edu.pl* może występować on pod nazwą *hpc*.

!!! Info
    Zlecanie zadań na system `topola` możliwe jest ***bezpośrednio z węzła dostępowego*** `hpc.icm.edu.pl`.
    W przypadku pozostałych systemów możliwy/wymagany jest ***dodatkowy krok logowania*** wykonany z komputera
    hpc.icm.edu.pl, np. `ssh rysy`, `ssh okeanos`.

| Nazwa    | Typ                           | Architektura                | Liczba węzłów obliczeniowych | Parametry węzła obliczeniowego                     |
|----------| :-----------------------------| :---------------------------| :----------------------------| :--------------------------------------------------|
|Okeanos   | Superkomputer                 | Intel Haswell Cray XC40     |1084                          | 24 rdzenie, 128 GB pamięci RAM                     |
|Topola    | Klaster HPC, Klaster PL-Grid  | Intel Haswell Huawei E9000  |223                           | 28 rdzeni, 64 lub 128 GB pamięci RAM               |
|Rysy/GPU      | Klaster GPU    | Intel Skylake, NVIDIA Volta                |6                             | 36 rdzenie, 380 GB pamięci RAM, 4 GPU              |
|Rysy/PBaran | Komputer wektorowy, NEC Aurora A300-8    | Intel Xeon Gold 6126 / NEC SX-Aurora Tsubasa   | 1        | 24 rdzenie, 192 GB RAM / 8 x 8 rdzeni, 8 x 48 GB RAM  |


![Okeanos](KomputeryImages/Okeanos_foto.jpg)

*Superkomputer Okeanos*

**Informacje o systemie (hardware)**

Poniższe komendy slurm'a pozwalają na sprawdzenie informacji o systemie:

```.slurm
scontrol show partition <nazwa_partycji> # właściwości partycji
scontrol show node <nazwa_węzła> # właściwości węzła

sinfo -N -l # lista węzłów
smap -i 2 # quasi-graficzna informacja o wykorzystaniu węzłów
```


## QOS na poszczególnych systemach

QOS - Quality of Service

### Topola - qos

```.sh
[username@hpc ~]$ sacctmgr show qos format=name,MaxWall,Priority,MaxTRESPU%50


      Name     MaxWall   Priority                                     MaxTRESPU
---------- ----------- ---------- ---------------------------------------------
    normal                      0
       hpc  7-00:00:00        750
    plgrid  7-00:00:00        750
       egi  7-00:00:00        500
     meteo                   1500  
```

### Okeanos - qos

```.sh
okeanos-login1 /home/username> sacctmgr show qos format=name,MaxWall,Priority,MaxTRESPU%50


      Name     MaxWall   Priority                                     MaxTRESPU
---------- ----------- ---------- ---------------------------------------------
    normal                      0
       hpc  2-00:00:00        750
     ocean  4-00:00:00       1000                                     node=1024
ocean-long  7-00:00:00        750                                      node=256
```

### RYSY - qos

```.sh
username@rysy ~ $ sacctmgr show qos format=name,MaxWall,Priority,MaxTRESPU%50


      Name     MaxWall   Priority                                     MaxTRESPU
---------- ----------- ---------- ---------------------------------------------
    normal  2-00:00:00        100                                        node=2
     limit    06:00:00        100            cpu=8,gres/gpu=1,gres/ve=1,mem=90G
     short    00:15:00      10000
      prio  2-00:00:00      10000
      long  7-00:00:00          1     cpu=8,gres/gpu=1,gres/ve=1,mem=90G,node=1
      none                      0                                         cpu=0
```

Skróty:

- *TRES* - Trackable RESources. A TRES is a resource that can be tracked for usage or used to enforce limits against

- *PU* - Processing Unit.