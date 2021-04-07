# Materiały wprowadzające

Do wzięcia udziału w warsztatach **konieczne** jest zainstalowanie klienta SSH na własnym komputerze oraz upewnienie się, że na własnym komputerze i w sieci lokalnej odblokowane są porty 22 i "indywidualny" port (zawwwyczaj porty 4800-4900), który zostanie rozesłany uczestnikom z mailem potwierdzającym udział w warsztatach.

W celu komfortowego uczestnictwa w warsztatach Uczestnicy powinni ponadto (ale nie muszą):

 - znać podstawy powłoki _bash_
 - znać podstawy języka Python (podczas warsztatów korzystamy z _Jupyter Notebook_)

## SSH

**Uwaga - instalacja SSH jest krytycznie ważna do wzięcia udziału w warsztatach!**

SSH (_Secure Shell_, _bezpieczna powłoka_) to technika łączenia się dwóch komputerów przy pomocy szyfrowanego połączenia. SSH używamy do połączenia własnego komputera z superkomputerem Rysy. Więcej informacji na temat łączenia się (w tym nazwy użytkowników i hasła) przekażą instruktorzy.

Kilka przydatnych informacji o SSH:

 - [Learn SSH In 6 Minutes - Beginners Guide to SSH Tutorial](https://www.youtube.com/watch?v=v45p_kJV9i4)
 - [tutorial "Linux i sieci: Podstawowe polecenia Unix’a", autor: Robert Paciorek](http://www.opcode.eu.org/Podstawowe_polecenia_Unix.pdf), rozdział 3

### Instalacja SSH na własnym komputerze

Poprawna instalacja SSH na własnym komputerze jest kluczowa dla udanego wzięcia udziału w warsztatach. SSH należy zainstalować jeszcze przed warsztatami. Poniżej znajdują się wskazówki jak to zrobić dla różnych rodzajów systemów operacyjnych. Dużo informacji na ten temat znajduje się także w internecie. W razie problemów z instalacją SSH można także pisać do instruktorów.

#### Klient SSH na Windows 7/8/10

Jedną z możliwości dostępnych na Windows jest zainstalowanie programu "putty": [link do ściągnięcia](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html). Z `MSI (‘Windows Installer’)` należy wybrać wersję 32-bit albo 64-bit. Aby zweryfikować instalację putty należy otworzyć konsolę cmd.exe (Start -> wyszukanie "cmd.exe") i wpisać `putty` lub `putty.exe`. Powinna otworzyć się aplikacja okienkowa. Poniżej znajduje się wygląd konsoli po wpisaniu tej komendy.

```
Microsoft Windows [Version 10.0.18362.1082]
(c) 2019 Microsoft Corporation. All rights reserved.

C:\WINDOWS\system32>putty
# (w tym momencie powinna otworzyc sie aplikacja okienkowa i oznacza to ze tryb tekstowy programu putty dziala)
```

Uwaga - nie będziemy korzystać z aplikacji okienkowej putty, a jedynie z jej wersji tekstowej (dostępnej w terminalu cmd.exe). Dlatego bardzo ważne jest upewnienie się, że konsola cmd.exe widzi polecenie `putty` lub `putty.exe`. Jeżeli po wpisaniu komendy `putty` lub `putty.exe` w terminalu cmd.exe nie startuje aplikacja okienkowa, to znaczy że nie działa tryb tekstowy putty. Należy jeszcze raz spróbować zainstalować putty. W razie dalszych problemów należy napisać do instruktorów.

#### Klient SSH na Linux lub MacOS

Na tych systemach operacyjnych klient SSH jest zazwyczaj zainstalowany od początu. Aby zweryfikować instalację klienta SSH należy na nich otworzyć konsolę np. `bash` i wpisać `ssh`. Tak powinien wyglądać rezultat wykonania tej komendy:

 ```
 $ ssh
usage: ssh [-46AaCfGgKkMNnqsTtVvXxYy] [-B bind_interface]
           [-b bind_address] [-c cipher_spec] [-D [bind_address:]port]
           [-E log_file] [-e escape_char] [-F configfile] [-I pkcs11]
           [-i identity_file] [-J [user@]host[:port]] [-L address]
           [-l login_name] [-m mac_spec] [-O ctl_cmd] [-o option] [-p port]
           [-Q query_option] [-R address] [-S ctl_path] [-W host:port]
           [-w local_tun[:remote_tun]] destination [command]
 ```

Jeśli komunikat wygląda inaczej to należy zainstalować klienta SSH przy pomocy wbudowanego managera pakietów: `apt`, `yum` lub `brew`. W razie dalszych problemów można się kontaktować z instruktorami.

## Powłoka systemu Linux/Unix (bash)

Powłoka systemowa (zwana także konsolą lub terminalem) to podstawowy interfejs użytkownika po zalogowaniu się przy pomocy SSH na komputery ICM. Służy do wpisywania komend tekstowych i podstawowej manipulacji systemem operacyjnym, np. przeglądania plików, uruchamiania programów itd. Powłoka, którą używamy na zajęciach nazywa się _bash_. W trakcie warsztatów znajomość podstaw tej powłoki może okazać się przydatna.

Polecane materiały nt. powłoki _bash_:

 - [tutorial "Linux i sieci: Podstawowe polecenia Unix’a", autor: Robert Paciorek](http://www.opcode.eu.org/Podstawowe_polecenia_Unix.pdf), rodziały 1, 2
 - [interaktywna strona z emulatorem bash](https://repl.it/languages/bash) - można na niej przećwiczyć polecenia z ["Linux i sieci: Podstawowe polecenia Unix’a"](http://www.opcode.eu.org/Podstawowe_polecenia_Unix.pdf).

## Język Python i Jupyter Notebook

`Jupyter Notebook` to wygodny sposób na uruchamiania i pisania kodu w języku Python przez aplikację przeglądarkową. Będziemy wykorzystwać go w części praktycznej do manipulacji Trovares xGT. Dlatego przydatne będzie zrozumienie podstaw używania `Jupyter Notebook`.

Polecane materiały nt. powłoki _Jupyter Notebook_:

 - [Kurs Python, odc 2 - IDE oraz Jupyter Notebook](https://www.youtube.com/watch?v=OpF89fxImxM)
 - [Jupyter Notebook Tutorial: Introduction, Setup, and Walkthrough](https://www.youtube.com/watch?v=HW29067qVWk)
