### Informacje ogólne

- Centralnym serwerem pocztowym w ICM jest `mail.icm.edu.pl`.

- Adres użytkownika w ICM jest postaci `login@icm.edu.pl`. Tworzone są również aliasy `i.nazwisko@icm.edu.pl` oraz `imie.nazwisko@icm.edu.pl`.

- Do autoryzacji należy używać swojego loginu i hasła.

- Do obsługi poczty z poziomu terminala polecamy używać programów `mutt` lub `pine` na `delcie` (są one odpowiednio skonfigurowane).

- Zalecamy regularne czytanie poczty bądź skonfigurowanie przekierowania listów na inny adres (opis poniżej).

- Poczty w ICM można używać wyłącznie w celach związanych z prowadzonym projektem.

### Odbieranie poczty

Możliwe jest też odpowiednie skonfigurowanie swojego programu pocztowego, aby pobierał pocztę bezpośrednio z serwera IMAP. Czytanie poczty jest możliwe wyłącznie przy pomocy protokołów IMAP z wykorzystaniem szyfrowania.

- **Poczta wychodząca**:
    - serwer: smtp.icm.edu.pl
    - protokół: SMTP
    - port: 587
    - szyfrowanie: STARTTLS

- **Poczta przychodząca**:
    - Serwer przychodzący: imap.icm.edu.pl
    - Protokół: IMAP
    - Port: 993
    - Szyfrowanie: SSL/TLS

### Przekierowanie poczty

Użytkowników odbierających pocztę w swojej macierzystej instytucji prosimy o założenie w swoim katalogu domowym pliku o nazwie `.forward` zawierającego:
```
\nazwakontawicm,adres@naserwerzezewnetrznym
```

W ten sposób poczta wysyłana na adres w ICM będzie automatycznie przesyłana pod wskazany adres przy jednoczesnym zachowaniu jej kopii lokalnie w ICM.

### Przeglądarka WWW

Pod adresem: [https://webmail.icm.edu.pl](https://webmail.icm.edu.pl) można przeczytać pocztę z poziomu przeglądarki WWW. Hasło takie jak w sieci ICM.