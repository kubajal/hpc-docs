---
title: ""
date: 2020-04-30
draft: false
---

Po wstawieniu zadania do kolejki poleceniem `sbatch` system kolejkowy powiadamia nas o przyznanym numerze zadania (`JOBID`).
Jeśli polecenie to wykonamy gdy nasz program został już uruchomiony,
możemy między innymi sprawdzić, na których węzłach/procesorach wykonywane są nasze obliczenia.
W czasie trwania obliczeń na węźle możemy połączyć się z tym węzłem przy pomocy **ssh**,
nasza sesja zostanie jednak przypisana do tych samych procesorów, które wykorzystuje zadnie.
Z tego powodu nadużywanie logowania na węzły może prowadzić do obniżenia wydajności prowadzonych obliczeń.

```.slurm
squeue # lista aktualnie zakolejkowanych/uruchomionych zadań
squeue -l -j <job_ID> # Sprawdź status zadania
squeue --start -j <job_ID> # Sprawdź planowany czas rozpoczęcia zadania
squeue -u $USER # pokaż zadania należące do użytkownika

sstat -a -j ID_zadania/ID_zadania.batch # zużycie zasobów w ramach kroków (step) działającego zadania
sacct # zużycie zasobów zakończonego już zadania/kroku
sacct --format=jobid,jobname,account,partition,ntasks,alloccpus,maxrss,elapsed,state,exitcode -j JOBID
 # informacje o wykorzystaniu zasobów zadania zakończonego o numerze podanym jako JOBID

scontrol show job <job_ID> # informacje o wszystkich parametrach, które system kolejkowy przyznał zadaniu.

scancel <job_ID> # analuj zadanie
scancel -u $USER # analuj wszystkie zadania należące do użytkownika
```

### Przykład sformatowania wydruku „squeue”

```.slurm
# squeue - format output
#  %j   Job or job step name.
#  %i   Job or job step id.

squeue -o "% 16j% i"
CLB: batch_HotKar 17817851
CLB: batch_HotKar 17817852
CLB: batch_HotKar 17817853
CLB: d3q27q7 / batc 17817943
CLB: d3q27q7 / batc 17817944
CLB: d3q27q7 / batc 17817945

# wydrukuj drugą kolumnę
squeue -o "% 16j% i" | grep "d3q27 *" | awk „{print 2 USD}”
17817943
17817944
17817945
```
