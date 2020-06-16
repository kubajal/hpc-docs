---
title: "Module"
date: 2020-04-28
draft: false
---

Polecenia module służą do ustawienia środowiska obliczeniowego.
Przykładowe sposoby użycia:

```.sh
module list # wypisuje listę obecnie załadowanych modułów użytkownika
module avail # wypisuje listę wszystkich dostępnych modułów (m.in. wszystkie dostępne wersje kompilatorów)
module avail -t 2>&1 | grep -i <soft_name>  # wypisuje listę wszystkich dostępnych modułów  (case insensitive)
module load [modulefile ...] # ładuje moduł o nazwie modulefile
module unload [modulefile ...] # usuwa moduł
module swap oldmodule newmodule # podmienia moduł oldmodule na moduł newmodule
module help [modulefile ...] # wyświetla informację na temat modułu (czasem niestety niewystarczającą, więcej można odnaleźć po załadowaniu modułu i odwiedzeniu odpowiedniej strony manuala)
module display [modulefile ...] # wyświetla zawartość danego modułu (zwykle są to komendy ustawiające zmienne środowiskowe)
```

Czasami rzeczywistość jest inna niż nam się wydaje.
Do sprawdzenia przydają się polecenia:

```.sh
which moja_aplikacja  # pokazuje która wersja aplikacji jest domyślna
whereis moja_aplikacja   # pokazuje scieżkę do aplikacji
moja_aplikacja --version
moja_aplikacja --help
lld sciezka_do_folderu/moja_aplikacja  # print shared library dependencies
echo $PATH
set  # pokazuje/ustawia zmienne powłoki (shell)
```
