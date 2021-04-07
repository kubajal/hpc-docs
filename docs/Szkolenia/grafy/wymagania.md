## Checklista

!!! warning "Checklista"
    Uczestnicy warsztatów powinni upewnić się **przed warsztatami**, że:

    - wypełnili [formularz użytkownika KDM](assets/formularz-uzytkownika.pdf) i przesłali go na jj358817@icm.edu.pl
    - mają odblokowany port 22 na swoim komputerze

??? info "Wypełnienie formularza użytkownika KDM"

    Aby organizatorzy warsztatów mogli wydać konto i hasło do logowania się na superkomputerze Rysy i Okeanos, uczestnicy warsztatów zobowiązani:

    - są przeczytać [Regulamin użytkownika KDM](https://kdm.icm.edu.pl/O_zasobach_ICM/Formalnosci/regulamin/)
    - podpisać własnoręcznie lub elektronicznie Profilem Zaufowanym [formularz użytkownika KDM](assets/formularz-uzytkownika.pdf) i wysłać go zeskanowany/podpisany elektronicznie na adres jj358817@icm.edu.pl z tytułem: "*imię nazwisko* - formularz użytkownika".

    W przesłanym [formularzu użytkownika KDM](assets/formularz-uzytkownika.pdf) należy zostawić puste rubryki: *Proponowany identyfikator użytkownika*, *Hasło*, *Kierownik realizowanego grantu*, *Telefon do kierownika grantu*, *Data i podpis dla kierownika grantu / osoby odpowiedzialnej za gościa ICM*.

??? info "Odblokowanie portu 22"

    Aby móc uczestniczyć w warsztatach, niezbędne jest, aby sieć, do której komputer jest podłączony, dopuszczała połączenia wychodzące na porcie 22. Również firewall w komputerze (o ile jest aktywny) musi je dopuszczać.

    **Windows 10**

    1. Otwórz okno konsoli (można to na przykład zrobić tak: wciśnij jednocześnie klawisze `Windows` i `R`, wpisz `cmd` i
      naciśnij klawisz `Enter`).
    2. Wpisz w konsoli:
    ```
    ssh hpc.icm.edu.pl
    ```
    3. Jeżeli pojawi się prośba o hasło (`Password: `), albo prośba o potwierdzenie przy próbie połączenia (zaczynająca się od `The authenticity of host`... to połączenie działa poprawnie. Jeśli pojawi się coś innego lub też nic się nie pojawi, oznacza to, że najprawdopodobniej port 22 jest zablokowany.

    **Windows 7, 8, 8.1**

    1. Jeśli nie masz zainstalowanego programu PuTTY, pobierz go ze strony <https://putty.org> (plik MSI, wersja 64-bitowa), a następnie zainstaluj.
    2. Otwórz program PuTTY.
    3. W polu *Host Name (or IP address)* wpisz `hpc.icm.edu.pl` , a następnie wciśnij przycisk *Open*.
    4. Jeżeli pojawi się ostrzeżenie zaczynające się od słów *The server's host key is not cached in the registry*, lub też pojawi się okno konsoli z tekstem `login as:` , to połączenie działa poprawnie. Jeśli pojawi się coś innego lub też nic się nie pojawi, oznacza to, że najprawdopodobniej port 22 jest zablokowany.
    
    **Linux/MacOS**

    1. Otwórz konsolę.
    2. Wpisz w niej:
    ```
    ssh hpc.icm.edu.pl
    ```
    3. Jeżeli pojawi się prośba o hasło (`Password: `), albo prośba o potwierdzenie przy próbie połączenia (zaczynająca się od `The authenticity of host`... to połączenie działa poprawnie. Jeśli pojawi się coś innego lub też nic się nie pojawi, oznacza to, że najprawdopodobniej port 22 jest zablokowany.

## FAQ

??? question "Nie działa `ssh hpc.icm.edu.pl` - co zrobić?"

    **Hot-spot**

    Jeśli problem jest po stronie sieci, można wypróbować podłączenie się do hot-spota w telefonie. Sposoby na utworzenie
    hot-spota zależą od oprogramowania telefonu.

    **Zmiana ustawień firewalla**

    Jeśli problemem jest firewall w komputerze blokujący połączenie, trzeba zmienić jego ustawienia. Szczegółowe instrukcje nie są tutaj podane, ponieważ sposób na zrobienie tego jest ściśle zależny od konkretnego firewalla. Jeśli zmiana jego ustawień jest niemożliwa, warto spróbować użyć innego komputera.

    **Kontakt z prowadzącymi**

    W razie kłopotów z połączeniem przez SSH, jeśli nie udało się rozwiązać problemów samodzielnie, zachęcamy do kontaktu z prowadzącymi zajęcia, którzy w miarę możliwości postarają się pomóc.

    **Uwaga**: wszelkie problemy z połączeniem trzeba rozwiązać jeszcze **przed** warsztatami, ponieważ w ich trakcie nie będzie już na to czasu.

??? question "Czym jest [formularz użytkownika KDM](assets/formularz-uzytkownika.pdf) i jak go wypełnić?"

    **Komputery Dużej Mocy**

    Komputery Dużej Mocy (KDM) to część ICMUW odpowiedzalna za administrację superkomputerami.

    **Formularz użytkownika KDM**

    To dokument potwierdzający tożsamość osoby uczestniczącej w warsztatach. ICMUW ze względów bezpieczeństwa musi ewidencjonować komu wydawane są konta szkoleniowe, na których uczestnicy będą pracować podczas warsztatów. Podpisanie go jest konieczne do wydania nazwy użytkownika szkoleniowego i hasła do niego, a co za tym idzie - do efektywnego wykorzystania czasu warsztatów.

    **Jak wypełnic Formularz użytkownika KDM?**

    Następujące pola mogą zostać puste: *Proponowany identyfikator użytkownika*, *Hasło*, *Kierownik realizowanego grantu*, *Telefon do kierownika grantu*, *Data i podpis dla kierownika grantu / osoby odpowiedzialnej za gościa ICM*. Formularz podpisany własnoręcznie lub elektronicznie należy wysłać na adres jj358817@icm.edu.pl z tytułem: "*imię nazwisko* - formularz użytkownika".
