---
title: ""
date: 2020-04-28
draft: false
--- 

Często pojawia się pytanie czy użytkownik ma dostęp do XXX?

Aby sprawdzić status grantu / konta / qos należy użyć polecenia `sacctmgr`, udostępnionego przez system *Slurm*.

```.slurm
sacctmgr show user $USER # pokaż informacje o użytkowniku
sacctmgr show assoc where account=<grant_id> format=Cluster,Account%25,Partition%20,user,QOS,DefaultQOS,GrpTRESMins%50 # pokaż informację o grancie
sacctmgr show assoc where user=$USER format=Cluster,Account%25,Partition%20,user,QOS,DefaultQOS,GrpTRESMins%50 # pokaż w jakich jestem grantach i do których qos mam dostęp
sacctmgr show assoc format=Cluster,Account%25,Partition%20,user,QOS,DefaultQOS,GrpTRESMins%50 | grep $USER # j.w.

sacctmgr show qos format=name,MaxWall,Priority,MaxTRESPU%50 # pokaż limit czasu obliczen dla poszczególnych qos
```

Więcej informacji o na poszczegółnych systemach (topola/okeanos/rysy) znajduje się [tu](../../O_zasobach_ICM/Zasoby/komputery_w_icm.md).

Inne przydatne komendy:

```.slurm
id $USER     # udostępnia podstawowe dane o użytkowniku
finger $USER # udostępnia podstawowe dane o użytkowniku
groups $USER # udostępnia listę grup, do których należy użytkownik
getent group NAZWA_GRUPY # wypisuje użytkowników należących do danej grupy, np GRANTu
limit # limity nałożone na procesy użytkownika
```

**Jak sprawdzić zużycie grantu?**

System slurm umożliwia sprawdzenie ilości zużytych zasobów.
Należy mieć na uwadze, że na Topoli/Rysach/Okeanosie są to niezależne systemy.
Zatem komenda zwróci ilość wykorzystanych zasobów na danej maszynie.
Z węzła dostępowego na Topoli/Rysach/Okeanosie należy wywołać komendę:

```.slurm
icm-show-grant-usage <grant_id> [yyyy-mm-dd yyyy-mm-dd] # aktualnie zużycie
```

Przykładowo

```.text
alice@rysy ~ $ icm-show-grant-usage GR12-34 2020-01-01 2020-07-30
You are on the Rysy cluster.
Usage summary for grant app-installers (from 2020-01-01 to 2020-07-30):

--------------------------------------------------------------------
     Cluster           Login                TRES    Usage(coreh)
--------------------------------------------------------------------
        rysy           alice                 cpu             234
        rysy             bob                 cpu             567
--------------------------------------------------------------------
                                    Total usage:             801
--------------------------------------------------------------------



Usage summary for grant GR12-34 (from 2020-01-01 to 2020-07-30):

--------------------------------------------------------------------
     Cluster           Login                TRES    Usage(coreh)
--------------------------------------------------------------------
        rysy           alice            gres/gpu             123
        rysy             bob            gres/gpu             456
--------------------------------------------------------------------
                                    Total usage:             579
--------------------------------------------------------------------

```

<!-- 
```.slurm
sacctmgr show assoc where account=<grant_id> format=user,GrpTRESMins%50  # limit cpu w grancie
``` -->
