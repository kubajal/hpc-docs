---
title: "[EN] Basic Usage"
date: 2020-04-09
draft: false
---

<!-- <Last revision: 2020-04-30 by M. Hermanowicz <m.hermanowicz@icm.edu.pl> -->

!!! Note
    Please note that a PDF version of the materials contained herein (including SOL) is also [available][en_nec_tsubasa_pdf].

[en_nec_tsubasa_pdf]: ./pdf/en_nec_tsubasa.pdf

!!! Info
    This document aims to provide basic information on how to use the NEC SX-Aurora Tsubasa system
    available at ICM UW computational facility. The contents herein are based on a number of documents,
    as referenced in the text, to provide a concise quick start guide and suggest further reading material for
    the ICM users.

To use the Tsubasa installation users must access the login node first
at `hpc.icm.edu.pl` through [SSH] and then establish a further
connection to the Rysy cluster:

[SSH]: https://en.wikipedia.org/wiki/Secure_Shell

```.sh
ssh username@hpc.icm.edu.pl
ssh rysy
```

Alternatively, the `-J` command line option can be passed to the OpenSSH
client to specify a jump host (here the `hpc` login node) through which
the connection to Rysy will be established (issue `man ssh` command for
details).

The system runs [Slurm Workload Manager] for job scheduling and
[Environment Modules] to manage software. The single compute node
(PBaran) of the ve partition can be used interactively – as shown below
– or as a batch job (see further in the text).

[Slurm Workload Manager]: https://slurm.schedmd.com/overview.html
[Environment Modules]: https://modules.readthedocs.io/en/latest

```.sh
srun -A GRANT_ID -p ve --gres=ve:1 --pty bash -l
```

Once the interactive shell session has started, the environmental
variable `$VE NODE NUMBER` is being automatically set to control which
VE card is to be used by the user programs. This variable can be read
and set manually with [echo] and [export] commands,
respectively. The software used to operate the VEs – including
binaries, libraries, header files, etc. – is installed in `/opt/nec/ve`
directory. Its effective use requires modification of the
[environmental variables], such as `$PATH`, `$LD LIBRARY PATH` and
others, which can be done conveniently with the [source] command:

[echo]: https://en.wikipedia.org/wiki/Echo_(command)
[export]: https://ss64.com/bash/export.html
[environmental variables]: https://en.wikipedia.org/wiki/Environment_variable
[source]: https://ss64.com/bash/source.html

```.sh
source /opt/nec/ve/mpi/2.2.0/bin/necmpivars.sh
```

Sourcing the variables makes various VE tools accessible within the
user environment. This includes the NEC compilers for C, C++, and
Fortran languages that can be invoked by `ncc`, `nc++`, and `nfort`,
respectively, or by their respective MPI wrappers: `mpincc`,
`mpinc++`, and `mpinfort`. Please note that several compiler versions
are currently installed and it might be necessary to include a version
number in your command, e.g. `ncc-2.5.1`. The general usage is
consistent with the GNU GCC: `<compiler> <options> <source file>`. The
table below lists several standard options for the NEC compilers – see
[documentation][necdoc] for details.

| Option                |  Description                             |
|-----------------------|------------------------------------------|
| `-c`                  |  create object file                      |
| `-o`                  |  output file name                        |
| `-I/path/to/include`  |  include header files                    |
| `-L/path/to/lib`      |  include libraries                       |
| `-g`                  |  debugger symbols                        |
| `-Wall`               |  enable syntax warnings                  |
| `-Werror`             |  treat warnings as errors                |
| `-O[0-4]`             |  optimisation levels                     |
| `-ftrace`             |  use the profiler                        |
| `-proginf`            |  enable execution analysis               |
| `-report-all`         |  report diagnostics                      |
| `-traceback`          |  provides traceback information          |
| `-fdiag-vector=[0-3]` |  level of details for vector diagnostics |

The last four of them are used for performance analysis and allow for
efficient software development. Some of these, apart from being used
as command line options at compile time, also rely on dedicated
environmental variables that need to be set at runtime. For a full
list of performance-related options, variables, as well as their
output description, see [PROGINF/FTRACE User’s Guide] and the
compiler-specific [documentation][necdoc].

[necdoc]: https://www.hpc.nec/documents/
[PROGINF/FTRACE User’s Guide]: https://www.hpc.nec/documents/sdk/pdfs/g2at03e-PROGINF_FTRACE_User_Guide_en.pdf

The binaries can be run directly by specifying the path or by using
the VE loader program (`ve exec`) – a few examples including parallel
execution are listed below:

```.sh
./program
```

```.sh
ve_exec ./program
```

```.sh
mpirun ./program
```

```.sh
mpirun -v -np 2 -ve 0-1 ./program # enables the use of VE cards 0 and 1
```

For a full list of options available for `mpirun` see the corresponding
[manual page] or issue `mpirun -h command`.

[manual page]: https://www.open-mpi.org/doc/v4.0/man1/mpirun.1.php

Full documentation for SX-Aurora Tsubasa, its hardware and software
components, is available at the [NEC website][necdoc]. An accessible
introduction to using Tsubasa is also provided on the [blog][necblog].

[necblog]: https://sx-aurora.github.io/posts/VE-first-steps

Another, non-interactive, mode of operation is a batch mode which
requires a script to be submitted to Slurm. An example job script is
shown below.

```.sh
#!/bin/bash -l
#SBATCH -J name
#SBATCH -N 1
#SBATCH --ntasks-per-node 1
#SBATCH --mem 1000
#SBATCH --time=1:00:00
#SBATCH -A <Grant ID>
#SBATCH -p ve
#SBATCH --gres=ve:1
#SBATCH --output=out

./program
```

It specifies the name of the job (`-J`), requested number of nodes (`-N`),
CPUs (`--ntasks-per-node`), memory (`-mem`; here in Megabytes), wall time
limit (`--time`), grant ID (`-A`), partition (`-p`), generic resources
(`--gres`), output file (`--output`), and the actual commands to be
executed once the resources are granted. See [Slurm documentation][slurmdoc] for
an extensive list of available options.

[slurmdoc]: https://slurm.schedmd.com/documentation.html

Below are few basic example commands used to work with job scrips:
submitting the job (`sbatch`) which returns the ID number assigned to
the it by the queuing system, listing the user’s jobs along with their
status (`squeue`), listing the details of the specified job
(`scontrol`), cancelling execution of the job (`scancel`). Consult the
[documentation][slurmdoc] for more.

```.sh
sbatch job.sl # submits the job
squeue -u $USER # lists the user’s current jobs
scontrol show job <ID> # lists the details of the job specified by given <ID>
scancel <ID> # cancels the job with given <ID>
```

Since there’s no dedicated filesystem to be used for calculations on
the Rysy cluster, in contrast to other ICM systems, the jobs should be
run from within the $HOME directory. The ve partition (PBaran compute
node) is intended for jobs utilizing VE cards, and as such it should
not be used for intensive CPU-consuming tasks.
