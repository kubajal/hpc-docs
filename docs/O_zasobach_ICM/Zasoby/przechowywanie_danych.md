---
title: ""
date: 2020-04-28
draft: false
---

Poniższa tabelka prezentuje dostępne w infrastrukturze ICM zasoby służące przechowywaniu danych.

Aktualna widoczność zasobów (storage) z poszczególnych systemów:

| Storage                    | hpc (topola) - `L`   | topola - `O`       | okeanos - `L`      | okeanos - `O`      | rysy - `L`         | rysy - `O`         |
|--------------------------  | -------------------- | ------------------ | ------------------ | -------------------| ------------------ | ------------------ |
| /lu/topola/temp/$USER/     | :heavy_check_mark:   | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :x:                | :x:                |
| /icm/home/$USER/           | :heavy_check_mark:   | :heavy_check_mark: | :x:                | :x:                | :x:                | :x:                |
| /lustre/tetyda/home/$USER/ | :x:                  | :x:                | :heavy_check_mark: | :heavy_check_mark: | :x:                | :x:                |
| /lu/tetyda/home/$USER/     | :heavy_check_mark:   | :x:                | :heavy_check_mark: | :heavy_check_mark: | :x:                | :x:                |
| /home/$USER/               | :x:                  | :x:                | :x:                | :x:                | :heavy_check_mark: | :heavy_check_mark: |

<!-- 
| /home/$USER/               |  [?]                 |  [?]               |  [?]               |  [?]               |  [?]               |   [?]              | 
-->

Gdzie:

* `L` - węzeł dostępowy (login).
* `O` - węzeł obliczeniowy.
* `/lu/tetyda/home/$USER/` jest aliasem `/lustre/tetyda/home/$USER/`.

Docelowo planowany jest następujący podział:

| Zasób            | Topola             | Okeanos            | Rysy              | Uwagi                                                                |
|------------------|--------------------| -------------------| ----------------- |--------------------------------------------------------------------- |
| Storage globalny | /lu/tetyda/$USER/  | /lu/tetyda/$USER/  | /lu/tetyda/$USER/ | katalog widoczny z węzłów dostępowych (do wymiany danych)            |
| Storage lokalny  | /lu/topola/$USER/  | /lu/tetyda/$USER/  | /lu/tetyda/$USER/ | katalog widoczny z węzłów dostępowych i obliczeniowych (do obliczeń) |


<!--
| Zasób                  | widoczny na     | pod ścieżką       |
|----------------------- |-----------------| ----------------- |
| Lokalny                | topola          |  /icm/home        |
| Współdzielony wymiany  | okeanos, topola |  /icm/tmp         |
| Lokalny tymczasowy     | topola          |  /lu/topola/temp  |
| Lokalny                | okeanos, topola |  /lu/tetyda/home  |
| Lokalny                | rysy            |  /home            |
-->


<!--
| Zasób                  | widoczny na     | pod ścieżką       | quota      | limit plików   | backup  |
|----------------------- |-----------------| ----------------- | ---------- |--------------- |---------|
| Lokalny                | topola          |  /icm/home        | 100 GB     | 140 000        | nie     |
| Współdzielony wymiany  | okeanos, topola |  /icm/tmp         | 1 000 GB   | 300 000        | nie     |
| Lokalny tymczasowy     | topola          |  /lu/topola/temp  | -          |                | nie     |
| Lokalny                | okeanos, topola |  /lu/tetyda/home  | -          |                | nie     |
| Lokalny                | rysy            |  /home            | 200 GB     |                | nie     |
 -->
 
<!-- !!! warning
   Nie wolno wykorzystywać katalogu domowego do intensywnego zapisu i odczytu plików tymczasowych generowanych w trakcie obliczeń, o ile informacje widoczne podczas logowania nie mówią inaczej.
   Do tego celu na każdym systemie obliczeniowym przeznaczone są katalogi tymczasowe. -->
