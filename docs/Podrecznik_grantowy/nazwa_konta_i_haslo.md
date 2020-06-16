
# Nazwa konta i hasło

Nazwa konta użytkownika i hasło tworzone są w momencie [rejestracji użytkownika](./zakladanie_konta.md) w bazie grantów (dotyczy kierownika grantu) lub na etapie [dodawania współwykonawcy do grantu](./jak_wystapic_o_grant_obliczeniowy.md). Hasło wysyłane jest automatycznie e-mailem, na adres podany w formularzu rejestracyjnym.

- Nazwa konta składa się z max. 8 znaków. Nie jest to adres mailowy podawany przy pierwszej rejestracji w bazie grantów, lecz login tworzonym w drugim etapie rejestracji.
- Uwaga: hasło wygenerowane na formularzu nie jest aktywowane. Należny używać tylko hasła wysłanego drogą mailową.
- Kierownik grantu powinien również utworzyć konto składające się z max.8 znaków, [dodając siebie jako współwykonawcę do grantu](./jak_wystapic_o_grant_obliczeniowy.md).

W razie trudności z uzyskaniem prawidłowego hasła do konta prosimy o wysłanie maila na adres [kontakt](../kontakt.md).

## Dostęp do ICM

Aby móc korzystać z zasobów obliczeniowych ICM, należy zalogować się na komputer dostępowy `login.icm.edu.pl` za pomocą protokołu SSH, przy użyciu nazwy konta, jakie założyliśmy w systemie grantowym (do logowania nie używamy adresu e-mail!).

Na osobnych stronach można znaleźć przykłady połączeń z komputerów z systemem [Windows](../Tutorials/HPC-intro/ssh_windows.md) oraz [UNIX/Linux](../Tutorials/HPC-intro/ssh_intro.md).

Zlecanie zadań na systemy hydra oraz topola możliwe jest bezpośrednio z komputera `hpc.icm.edu.pl`. W przypadku pozostałych systemów wymagany jest dodatkowy krok logowania wykonany z komputera `hpc.icm.edu.pl`, np. `ssh okeanos` lub `ssh rysy`.

## Pierwsze logowanie

Przy pierwszym logowaniu użytkownik zostanie poproszony o zmianę hasła.

Na ekranie pojawią się komunikaty:

```.sh
WARNING: Your password has expired.
You must change your password now and login again!
Changing password for user login_użytkownika

Enter login(LDAP) password:                 <----- wpisać hasło początkowe z maila
New password:                               <----- wpisać nowe hasło
Retype new password:                        <----- ponownie  wpisać nowe hasło
LDAP password information changed for username
```

- **Uwaga**: przy wprowadzaniu hasła na ekranie **nic się nie dzieje** tzn. nie miga kursor ani nie pojawiają się żadne znaki ukrywające wprowadzane hasło. Po wprowadzeniu hasła należy wcisnąć enter.

- Jeśli hasło przesłane e-mailem nie dotarło do użytkownika na etapie rejestracji, wskazane jest w pierwszej kolejności sprawdzenie katalogu spam w poczcie. Jeśli pojawią się dalsze trudności prosimy o [kontakt](../kontakt.md).

- Zmiany hasła można dokonać ponownie posługując się poleceniem `passwd`. Zmieniane hasło nie może być: palindromem, ciągiem sąsiednich znaków z klawiatury oraz podobne do hasła poprzedniego.
