---
title: "Licencje krajowe: ANSYS"
date: 2020-06-16
draft: false
---

<!-- <Last revision: 2020-06-16 by M. Hermanowicz <m.hermanowicz@icm.edu.pl> -->

## Zasady dostępu do licencji

- Umieszczanie w publikacjach, na plakatach itp. informacji o wykorzystanym oprogramowaniu według informacji na stronie Gaussiana.
- Umieszczanie w publikacjach, na plakatach itp. informacji o miejscu wykonywanych obliczeń.
- Przesłanie corocznego sprawozdania z wykonanych obliczeń do końca stycznia na adres e-mail 
  **gaussian-licencja([monkey](https://en.wikipedia.org/wiki/At_sign#Names_in_other_languages))icm.edu.pl**
- Nieprzesłanie sprawozdania w zadanym terminie będzie skutkowało zablokowaniem dostępu do programu Gaussian w ICM.
- **Sprawozdanie** dotyczące wykorzystania oprogramowania Gaussian udostępnianego przez ICM powinno zawierać następujące informacje:
      - określenie tematyki badawczej (spis bieżących, planowanych i ukończonych projektów/grantów), do realizacji której program jest wykorzystywany - wystarczy wypunktowana lista tematów;
      - lista publikacji, powstałych dzięki wykorzystaniu oprogramowania Gaussian;
      - wykorzystywanie oprogramowania w realizacji prac licencjackich, magisterskich oraz doktorskich itp. - należy podać tytuły oraz autorów i ich afiliacje.

## Gaussian

**Gaussian** to jeden z najpopularniejszych i najczęściej używanych programów do obliczeń kwantowo-mechanicznych. Dzięki łatwości użycia już po kilku minutach można przygotować dane wejściowe do programu (input), a dzięki wielorakim możliwościom programu można uzyskać interesujące nas informacje o układzie molekularnym. Obecnie dzięki modelowi ONIOM zakres stosowania tego oprogramowania znacznie sie rozszerzył - można bowiem łączyć obszary, które chcemy badać na poziomie ab initio z obszarami opisywanymi na bardziej uproszczonym poziomie (półempirycznym, czy mechaniki molekularnej).

Wśród wielu możliwości najczęściej wykorzystywane są:

- obliczenie energii oraz optymalizacja struktury układu na poziomie półempirycznym, HF, post-HF (MP2, MP4, CI, QCISD, CCSD, CBS itp.), DFT;
- wyznaczanie stanów przejściowych (TS) reakcji;
- obliczanie częstości drgań (widm w podczerwieni i ramanowskich);
- wyznaczanie energii tworzenia (thermochemical properties);
- wyznaczanie momentów multipolowych, ładunków atomowych, polaryzowalności, hiperpolaryzowalności;
- wyznaczanie rozkładów gęstości elektronowej, potencjału molekularnego (MEP), kształtu orbitali molekularnych;
- wyznaczanie stałych ekranowania i przenikalności magnetycznej (NMR).

Oprogramowanie Gaussian może być uruchamiane praktycznie na każdym komputerze - od PC (Windows, Linux), poprzez stacje robocze (SGI, SUN, IBM itd.), po komputery dużej mocy typu CRAY (SV1, T3E), NEC SX, SGI Origin 3000, i inne. Na komputerach równoległych Gaussian może być wykonywany na kilku procesorach jednocześnie zarówno w modelu SMP, jak i distributed memory.

Oprogramowanie jest ciągle rozwijane przez kilka grup naukowców na całym świecie.

## Przykładowy skrypt Slurm

!!! Warning "Uwaga"
    Ze względu na limit miejsca w katalogu home użytkownika, proponujemy prowadzenie obliczeń w katalogu tmp. Poniżej przykładowy skrypt z możliwością zapisu w katalogu `tmp`.

```bash
#!/bin/bash -l
#SBATCH -J GAUSSIAN_TEST
#SBATCH -N 1
#SBATCH --ntasks-per-node 14
#SBATCH --mem 5000
#SBATCH --time=20:00:00
#SBATCH -A GXX-YY
#SBATCH -p  topola
#SBATCH --output="job.out"

module load apps/gaussian/g09.D.01

mkdir /icm/tmp/$USER/$$
export GAUSS_SCRDIR=/icm/tmp/$USER/$$
g09 < input.dat > output.dat
rm -fr /icm/tmp/$USER/$$

#--ntasks-per-node powinno być równe %nproc=8 w input.dat
#--mem powinno być większe niż input.dat
#-A należy podać numer grantu
```

Ze względu na limit miejsca w katalogu home, możliwe jest też doprecyzowanie jak duże mają być pliki tymczasowe,w pliku inputowym, przez opcję **%MaxDisk**.
