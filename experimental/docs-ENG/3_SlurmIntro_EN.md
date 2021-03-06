---
title: "3 SLURM Introduction ENG"
date: 2020-03-16
draft: true
---


## Slurm commands

'The Slurm Workload Manager, or Slurm, is a free and open-source job scheduler for Linux and Unix-like kernels, used by many of the world's supercomputers and computer clusters.' - Wikipedia

Official documentation:

<https://slurm.schedmd.com/documentation.html>

### Selected commands

To schedule a job use salloc, sbatch or srun command.

* `sbatch` always creates a new resource allocation when it is invoked, executes a job script on one of the allocated nodes (master node), then releases the allocation once the script terminates. An additional feature of sbatch is that it will parse this script at job submission time for lines that begin with #SBATCH and contain sbatch options in lieu of command line arguments. Command line arguments override the same #SBATCH options in the script, so a single batch script can be invoked for different task-sized allocations by specifying -N or -n options on the command line when submitting a job script withsbatch

* `srun` may or may not create an allocation, depending on how it is invoked. If it is invoked on the command line of a login node, then it will create a new allocation and execute the command following srun. If it is invoked in a batch script, it will simply run a task on the current allocation. Likewise, srun may be given a --jobid argument that tells it to run the task as part of the given job, on the specified job's own allocation.

* `salloc` always creates a new resource allocation when it is invoked, but doesn't necessarily run any tasks on the allocated nodes. The typical use case of salloc is to create an allocation in order to run a series of subsequent srun commands either through an interactive bash session, or a script which runs from the login node. It releases the allocation after the script or bash session terminates.

Source: <https://cvw.cac.cornell.edu/slurm/basics_allocation>

Example of starting of an interactive job

```.sh
srun -p <partition_name>  -A <grant_name> -N 1 -n 12 --time=1:00:00 --pty /bin/bash -l # cluster: topola, okeanos
srun -A <grant_name> -N 1 -n 12 --time=1:00:00 --gres=gpu:2 --pty /bin/bash -l # cluster: rysy
```

## To check job status

```.sh
squeue # lista aktualnie zakolejkowanych/uruchomionych zada??
squeue -l -j <job_ID> # Check job status
squeue --start -j <job_ID> # to see when a job will start
squeue -u $USER # show your jobs

sstat -a -j ID_zadania/ID_zadania.batch # zu??ycie zasob??w w ramach krok??w (step) dzia??aj??cego zadania
sacct # zu??ycie zasob??w zako??czonego ju?? zadania/kroku

scontrol show job <job_ID> # szczeg????y zadania
scontrol show partition <nazwa_partycji> # w??a??ciwo??ci partycji
scontrol show node <nazwa_w??z??a> # w??a??ciwo??ci w??z??a

sinfo -N -l # lista w??z????w
scancel <job_ID> # kill the job
scancel -u $USER # kill all jobs belonging to user
```

### Example of formating 'squeue' output

```.sh
# squeue - format output
#  %j   Job or job step name.
#  %i   Job or job step id.

squeue -o "%16j %i"
CLB:batch_HotKar 17817851
CLB:batch_HotKar 17817852
CLB:batch_HotKar 17817853
CLB:d3q27q7/batc 17817943
CLB:d3q27q7/batc 17817944
CLB:d3q27q7/batc 17817945

# print second column
squeue -o "%16j %i" | grep "d3q27*" | awk '{print $2}'  
17817943
17817944
17817945
```

## To check grant/account status

```.sh
# czy u??ytkownik ma dost??p do XXX?
sacctmgr show user $USER # poka?? informacje o u??ytkowniku
id $USER # poka?? informacje o u??ytkowniku i jego grupach dost??pu

module avail # poka?? moduly dost??pne na danym klastrze

sacctmgr show assoc format=account,cluster,user,qos | grep $USER  # poka?? w jakich jestem grupach i do kt??rych qos mam dost??p
sacctmgr show qos format=name,MaxWall # poka?? limit czasu obliczen dla qos

# jak policzy?? ile grantu jeszcze zosta??o?
/apps/bin/chkgrantusage <grant_id> [yyyy-mm-dd yyyy-mm-dd] # aktualnie zu??ycie
sacctmgr show assoc where account=<grant_id> format=user,GrpTRESMins%50  # limit cpu w grancie
```
