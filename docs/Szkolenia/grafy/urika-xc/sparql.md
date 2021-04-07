# SPARQL - Przykłady i ćwiczenia
 
## Wypisanie wszystkich trójek w bazie
```
select ?subject ?predicate ?object where {
    ?subject ?predicate ?object
}
```
Alternatywnie:
```
select * where {
    ?subject ?predicate ?object
}
```

`select *` oznacza, że w tabeli z wynikami zostaną umieszczone wszystkie zmienne wraz z dopasowanymi do nich wartościami. Jest to dobre rozwiązanie, jeśli zmiennych jest niewiele. W przypadku bardziej złożonych zapytań z reguły interesują nas wartości wyłącznie części z nich. 

### Ćwiczenie 1
Wypisz wyłącznie predykaty.

??? Rozwiązanie
    ```
    select ?predicate where {
        ?subject ?predicate ?object
    }
    ```
 
## Wypisanie wszystkich podmiotów (bez powtórzeń)
```
select distinct ?subject where {
    ?subject ?predicate ?object
}
```
`select distinct` zwraca tylko unikalne wiersze w odpowiedzi, a więc takie, które mają różną wartość w przynajmniej jednej kolumnie od wszystkich pozostałych wierszy. 

## Wypisanie nazw podmiotów (zamiast ich IRI)
```
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?subject_name ?predicate ?object where {
    ?subject ?predicate ?object .
    ?subject rdfs:label ?subject_name
}
```

Powyższy przykład pokazuje użycie spójnika AND (znak kropki), a także nazwy zmiennej do innego celu, niż nazwanie kolumny wynikowej. 

## Sortowanie i limitowanie liczby rozwiązań
```
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>

select ?subject_name ?predicate ?object where {
    ?subject ?predicate ?object .
    ?subject rdfs:label ?subject_name
}
order by desc(?subject_name)
limit 10
```

`order by desc(?zmienna)` powoduje sortowanie wyników malejąco wg nazwy zmiennej. Można też oczywiście sortować rosnąco: `order by ?zmienna`, jak również sortować po kilku zmiennych. `limit 10` pozostawia tylko 10 pierwszych wyników. Obie te opcje są często łączone ze sobą. 

## Wypisanie imion wszystkich kobiet wraz z ich pochodzeniem etnicznym, jeśli jest ono znane

```
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix ntnames: <http://semanticbible.org/ns/2006/NTNames#>

select ?name ?ethnicity where {
    ?s a ntnames:Woman .
    ?s rdfs:label ?name
    optional {
        ?s ntnames:ethnicity ?ethnicity
    }
}
```

Powyższy przykład pokazuje użycie spójnika OR (klauzula optional), a także predykatu `a`, oznaczającego, że przedmiot jest typem (klasą) podmiotu. Jest to relacja analogiczna, jak między klasą a instancją klasy w programowaniu obiektowym. 

### Ćwiczenie 2
Wypisz imiona wszystkich ludzi, ich płeć oraz pochodzenie etniczne (o ile jest ono znane).

Wskazówki:

- Zarówno klasa mężczyzn (`ntnames:Man`), jak i klasa kobiet (`ntnames:Woman`) są podklasami szerszej klasy `ntnames:Human`.
- Predykat podklasy to `rdfs:subClassOf`.

??? Rozwiązanie
    ```
    prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
    prefix ntnames: <http://semanticbible.org/ns/2006/NTNames#>

    select ?name ?gender ?ethnicity where{
        ?s a ?class .?s rdfs:label ?name .
        ?class rdfs:subClassOf ntnames:Human .
        ?class rdfs:label ?gender
        optional {
            ?s ntnames:ethnicity ?ethnicity
        }
    }
    ```
 
## Odnalezienie wszystkich ludzi, mających na imię Józef (ang. Joseph), wraz z opisem na ich temat
```
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix ntnames: <http://semanticbible.org/ns/2006/NTNames#>

select ?name ?iri ?description ?comment where {
    ?iri a ntnames:Man .
    ?iri rdfs:label ?name .
    filter regex(?name, "Joseph", "")
    optional {
        ?iri ntnames:description ?description
    }
    optional {
        ?iri rdfs:comment ?comment
    }
}
```

Powyższy przykład ilustruje filtrowanie wyników za pomocą wyrażenia regularnego: nazwa musi zawierać ciąg `Joseph`. Dodatkowo przykład ten pokazuje, w jaki sposób można użyć więcej niż jednej klauzuli `optional`, w momencie, gdy chcemy uzyskać obie informacje, a jeśli jest to niemożliwe, spróbować uzyskać choć jedną z nich. 

## Wypisanie danych geolokalizacyjnych Babilonu

```
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix ntnames: <http://semanticbible.org/ns/2006/NTNames#>

select ?cityName ?pred ?value where {
    ?city a ntnames:City .
    ?city rdfs:label ?cityName .
    filter regex(?cityName, "Babylon", "")
    ?city ntnames:location ?location .
    ?location ?pred ?value
}
```

Powyższy przykład pokazuje, jak w grafie RDF przechowywane są liczby całkowite (`xsd:int`) oraz liczby zmiennoprzecinkowe (`xsd:double`). 

### Ćwiczenie 3
Odnajdź wszystkie miasta, które znajdują się na północny zachód od Babilonu (ang. *Babylon*) Pomiń te miasta, których współrzędne są nieznane.

Wskazówki:

- sprawdzenie, czy wartość liczbowa zmiennej x jest większa od zmiennej y: `filter (?x > ?y)`;
- Babilon leży na półkuli północnej i na wschód od południka 0.

??? Rozwiązanie
    ```
    prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
    prefix ntnames: <http://semanticbible.org/ns/2006/NTNames#>

    select ?otherCityName ?otherCityLongitude ?otherCityLatitude where {
        ?city a ntnames:City .
        ?city rdfs:label ?cityName .
        filter regex(?cityName, "Babylon", "")
        ?city ntnames:location ?location .
        ?location ntnames:longitude ?babylonLongitude.
        ?location ntnames:latitude ?babylonLatitude .

        ?otherCity a ntnames:City .
        ?otherCity rdfs:label ?otherCityName .
        ?otherCity ntnames:location ?otherCityLocation .
        ?otherCityLocation ntnames:longitude ?otherCityLongitude .
        ?otherCityLocation ntnames:latitude ?otherCityLatitude

        filter (?otherCityLongitude < ?babylonLongitude)
        filter (?otherCityLatitude > ?babylonLatitude)
    }
    ```

## Odległość innych miast od Babilonu w km

```
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix ntnames: <http://semanticbible.org/ns/2006/NTNames#>
prefix afq: <http://jena.hpl.hp.com/ARQ/function#>

select ?otherCityName ?distance where {
    ?city a ntnames:City .
    ?city rdfs:label ?cityName .
    filter regex(?cityName, "Babylon", "")
    ?city ntnames:location ?location .
    ?location ntnames:longitude ?babylonLongitude.
    ?location ntnames:latitude ?babylonLatitude .

    ?otherCity a ntnames:City .
    ?otherCity rdfs:label ?otherCityName .
    ?otherCity ntnames:location ?otherCityLocation .
    ?otherCityLocation ntnames:longitude ?otherCityLongitude .
    ?otherCityLocation ntnames:latitude ?otherCityLatitude

    bind(afq:haversinemeters(?babylonLatitude, ?babylonLongitude, ?otherCityLatitude, ?otherCityLongitude) / 1000 as ?distance)
}
```

Powyższy przykład wykorzystuje funkcję bind, która przypisuje wartość zmiennej - w tym wypadku było to użyteczne, ponieważ odległość między miastami, choć daje się obliczyć z dostępnych danych, nie jest przechowywana jawnie w grafie.Do obliczenia odległości została wykorzystana funkcja wbudowana Cray Graph Engine o nazwie haversinemeters z uprzednio zadeklarowanej przestrzeni nazw afq. 

### Ćwiczenie 4

Wypisz nazwy 10 miast, znajdujących się najbliżej Babilonu.
??? Rozwiązanie
    ```
    prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
    prefix ntnames: <http://semanticbible.org/ns/2006/NTNames#>
    prefix afq: <http://jena.hpl.hp.com/ARQ/function#>

    select ?otherCityName ?distance where {
        ?city a ntnames:City .
        ?city rdfs:label ?cityName .
        filter regex(?cityName, "Babylon", "")
        ?city ntnames:location ?location .
        ?location ntnames:longitude ?babylonLongitude.
        ?location ntnames:latitude ?babylonLatitude .

        ?otherCity a ntnames:City .
        ?otherCity rdfs:label ?otherCityName .
        ?otherCity ntnames:location ?otherCityLocation .
        ?otherCityLocation ntnames:longitude ?otherCityLongitude .
        ?otherCityLocation ntnames:latitude ?otherCityLatitude

        bind(afq:haversinemeters(?babylonLatitude, ?babylonLongitude, ?otherCityLatitude, ?otherCityLongitude) / 1000 as ?distance)
    }
    order by ?distance
    limit 10
    ```
