---
title: "Python - środowisko wirtualne"
date: 2020-04-30
draft: false
---

<!-- <Last revision: 2020-04-30 by M. Hermanowicz <m.hermanowicz@icm.edu.pl> -->

## Instalacja - *virtualenv*

Jeżeli wymagane jest użycie niedostępnych w systemie bibliotek języka
Python, należy je zainstalować samodzielnie z wykorzystaniem
środowiska wirtualnego. Można to zrobić według poniższej instrukcji.

0. Uruchamiamy [sesję interaktywną](../HPC-intro/slurm_intro.md).
1. Ładujemy interpreter Pythona z [dostępnego modułu](../HPC-intro/ustawianie_srodowiska.md).
2. Tworzymy środowisko wirtualne (Python 3.x): `python3.6 -m venv python_venv` (gdzie `python_venv` jest nazwą nowego folderu, w którym zostanie utworzone środowisko wirtualne.
3. Aktywujemy środowisko: `source ./python_venv/bin/activate`
4. Aktualizujemy narzędzie: `pip install --upgrade pip`
5. Instalujemy potrzebne biblioteki, np. `pip install numpy`
6. Środowisko wirtualne jest gotowe. Po zakończeniu pracy wystarczy wydać polecenie "deactivate", a wracając do pracy z Pythonem należy pamiętać, żeby je wcześniej aktywować (punkt 3) - dopiero wówczas zainstalowane lokalnie biblioteki będą dostępne.
