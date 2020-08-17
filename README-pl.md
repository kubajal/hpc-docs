# Instrukcja użytkowania serwisu/repozytorium

## Edycja treści z poziomu WWW

   1. Zakładamy konto użytkownika Github: https://github.com
   2. W serwisie z dokumentacją (https://icm-uw.github.io/hpc-docs/): na każdej (pod)stronie przy nagłówku działu znajduje się link o nazwie **Edit this page**, prowadzący do logowania w serwisie Github (punkt 1). Zalogowanie pozwala na edycję treści danej strony w repozytorium bezpośrednio z poziomu przeglądarki internetowej.
   3. Wprowadzone zmiany potwierdzamy na dole strony: *Commit changes*.

## Edycja treści z poziomu klienta **git**

1. Klonujemy repozytorium z dokumentacją:
```sh
$ git clone https://git.icm.edu.pl/owu/hpc-docs.git
# jeżeli użytkownik ma właczone 2FA
username: <Login Name>
password: <Personal Access Token> (gitlab --> profile --> access tokens)
```

2. Instalujemy środowisko wirtualne Pythona, aktywujemy je, a następnie instalujemy **mkdocs** wraz z zależnościami określonymi w pliku *requirements.txt*:

```sh
$ pyenv python-venv
# A w przypadku Pythona 3:
$ python -m venv python-venv
```

```sh
# Aktywacja:
$ source ./python-venv/bin/activate
```

```sh
# Instalacja mkdocs:
$ cd hpc-docs
$ pip install -r requirements.txt
```

3. Będąc w sklonowanym repozytorium uruchamiany lokalną instancję **mkdocs**, żeby monitorować (na razie *offline*) wprowadzane zmiany:
```sh
$ mkdocs serve
```

4. Wprowadzamy zmiany w plikach Markdown (*.md) lub tworzymy nowe. Żeby sprawdzić efekt zmian kierujemy przeglądarkę internetową na adres http://127.0.0.1:8000

5. Jeżeli zmiany są zadowalające, wysyłamy je na serwer (z katalogu **hpc-docs**):
```sh
$ mkdocs gh-deploy
```

Po chwili zmiany będą widoczne *online* (https://icm-uw.github.io/hpc-docs/).

6. Dodatkowo dodajemy do repozytorium zmodyfikowane pliki źródłowe (*.md):
```sh
$ cd hpc-docs
$ git add ./
$ git commit -m "Adding this and that"
$ git push
```

### Uwagi

- Do zarządzania układem (pod)stron wykorzystujemy sekcję **nav** w pliku *mkdocs.yml*.
