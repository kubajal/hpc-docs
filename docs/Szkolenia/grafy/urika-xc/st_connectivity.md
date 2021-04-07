# Algorytm Source-Target Connectivity

Algorytm ten jest w swojej idei bardzo prosty - znajduje on długość najkrótszej ścieżki w grafie od węzła źródłowego do węzła docelowego (o ile ona istnieje). Wartości predykatów są ignorowane. 

Parametrami algorytmu są IRI wierzchołków: źródłowego oraz docelowego. Zwracana jest pojedyncza wartość - liczba całkowita oznaczająca liczbę "przeskoków" (ang. hops) od wierzchołka źródłowego do docelowego.

!!! warning "Odległości w grafie skierowanym"
    Graf RDF jest grafem skierowanym, więc odległość od wierzchołka A do wierzchołka B nie musi być taka sama, jak w przeciwnym kierunku. Co więcej, ścieżka w jednym kierunku może istnieć, a w przeciwnym - nie.

## Sprawdzenie, ile pokoleń dzieli Jezusa od Adama

Przydatne informacje:

- Pewną niedogodnością jest fakt, że musimy uprzednio znać IRI. Niestety, nie znalazłem sposobu, jak w jednym zapytaniu odnaleźć, a następnie użyć IRI. Potrzeba więc najpierw odnaleźć IRI, zapamiętać je bądź zapisać gdzieś, a następnie wywołać algorytm.
- Algorytm, którego chcemy użyć to `cray:graphAlgorithm.st_connectivity`.
- Interesują nas wyłącznie zależności `ntnames:childOf`.

### Odnalezienie IRI Jezusa oraz Adama

```
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix ntnames: <http://semanticbible.org/ns/2006/NTNames#>

select ?jesus ?adam where {
    ?jesus rdfs:label ?jesus_name
    filter regex(?jesus_name, "^Jesus$", "")
    ?adam rdfs:label ?adam_name
    filter regex(?adam_name, "Adam", "")
}
```

Użycie wyrażenia regularnego `^Jesus$` jest konieczne, ponieważ w Biblii wspomniany jest jeszcze Bar-Jezus, a nie o niego nam chodzi.

### Uruchomienie algorytmu S-T Connectivity w Cray Graph Engine
```
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
prefix cray: <http://cray.com/>
prefix ntnames: <http://semanticbible.org/ns/2006/NTNames#>

select * 
where {
    construct {
          ?s  ntnames:childOf ?o
    } where {
          ?s ntnames:childOf ?o
    }
    invoke cray:graphAlgorithm.st_connectivity(ntnames:Jesus, ntnames:Adam)
    producing ?nHops
}
```

Bardzo charakterystyczna jest tutaj kolejność klauzul zagnieżdżonych wewnątrz klauzuli select:

1. `construct`
2. `where`
3. `invoke`
4. `producing`

Klauzula `where` ustawia zmienne, podobnie, jak to się działo w przypadku zwykłych zapytań `select ... where`.

Klauzula `construct` określa, w jaki sposób utworzyć graf, wykorzystując zmienne z klauzuli `where`. To właśnie na tym nowo skonstruowanym, tymczasowym grafie będzie działać wywołany później algorytm grafowy. W tym konkretnym przypadku okrajamy graf tylko do trójek `A -> childOf -> B`, a więc relacji pokrewieństwa między rodzicem a dzieckiem. Wszystkie inne fakty zostają tutaj pominięte.

Klauzula `invoke` określa, jaki algorytm powinien zostać wywołany. Widzimy dalej, w jaki sposób zostały do algorytmu przekazane parametry liczbowe.

Wbudowane algorytmy grafowe zwracają dane w formie tabeli, analogicznie, jak zapytanie `select`. Klauzula `producing` określa, jak powinny być nazwane kolejne kolumny tej tabeli.
