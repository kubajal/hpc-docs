---
title: "Aplikacje"
date: 2020-04-09
draft: false
---

<!-- <Last revision: 2020-04-15 by M. Hermanowicz <m.hermanowicz@icm.edu.pl> -->

## Informacje ogólne

!!! success "Status aplikacji i przykłady"
    Na stronie [CI status](./ci_status.md) przedstawiona jest operacyjność aplikacji zainstalowanych na komputerach ICM.
    Dostępnę są też przykłady do ściągnięcia.

Zbiór aplikacji dostępnych na komputerach ICM ulega częstym zmianom –
w szczególności pod względem zainstalowanych wersji. Poniższa lista
zawiera najważniejsze z nich, jednak należy mieć na uwadze, że może
nie uwzględniać niedawnych zmian.

**Czy możemy zainstalować aplikację X**? W większości przypadków tak –
  pod warunkiem, że jej licencja na to pozwala. Preferowane jest tym
  samym oprogramowanie objęte jedną z [wolnych
  licencji][gpl-compatible], również tych, które nie są kompatybilne z
  GNU GPL, ale spełniają [definicję wolnego
  oprogramowania][free_software].

[gpl-compatible]: https://www.gnu.org/licenses/license-list.en.html#GPLCompatibleLicenses
[free_software]: https://www.gnu.org/philosophy/free-sw.en.html

Użytkownicy ICM mają ponadto dostęp do aplikacji objętych licencjami
krajowymi. W przypadku programów, które nie należą do tej kategorii, a
nie są objęte wolną licencją, obowiązek pozyskania licencji i
dopełnienia jej warunków spoczywa na Użytkowniku.

Prośby o instalację aplikacji należy zgłaszać [tu](../../kontakt.md).

Użytkownicy mają także możliwość samodzielnej kompilacji i instalacji
oprogramowania z wykorzystaniem dostępnych w systemach narzędzi. W tym
przypadku również mają zastosowanie powyższe uwagi dotyczące licencji.

???+ info "Wersje aplikacji"
    Werjse aplikacji na poszczególnych maszynach

    ```Bash tab=
    #!/bin/bash

    FILE="list_of_apps.txt"
    rm -f $FILE

    echo "Generated on: $(date)" >>  $FILE
    for app in $(ls /apps/modulefiles/apps/); do
        echo -e "================ APP: $app ==============\n"
        echo "" >>  $FILE
        if [ ! "$app" == "r" ]
        then     
            module avail -t 2>&1 | grep -i $app | grep -v "@" | sed 's/apps\///' | sort | uniq | tee -a $FILE
        else
            module avail -t 2>&1 | grep -i apps/r/ | grep -v "@" | sed 's/apps\///' | sort | uniq | tee -a $FILE
        fi
    done
    ```

    ```Okeanos tab=
    Generated on: wto, 23 cze 2020, 21:27:53 CEST

    abinit/8.10.1
    abinit/8.10.3(default)
    abinit/8.10.3-patch

    amber/14

    ansys/17.0
    ansys/17.1
    ansys/19.1

    bedtools2/2.29.2

    castep/19.11

    cp2k/6.1.0(default)

    cpmd/v4

    elk/5.2.14

    espresso/6.1
    espresso/6.1.0(default)
    espresso/6.2.1
    espresso/6.4
    espresso/6.5

    esys-particle/2.3.5

    fluent/17.0
    fluent/17.1
    fluent/18.0
    fluent/19.1

    gromacs/2018.4-plumed
    gromacs/2019.0
    gromacs/2020(default)

    lammps/31Mar17
    lammps/5Jun19(default)

    ls-dyna/10.1.0(default)
    ls-dyna/11.0.0
    ls-dyna/8.0.0

    namd/2.11
    namd/2.13(default)

    ncl/6.6.2

    nwchem/6.6
    nwchem/6.8

    openfoam/1218(default)

    phonopy/1.10.4

    r/3.4.2

    samtools/1.10

    siesta/4.1
    siesta/4.1-b4

    tensorflow/1.13.0

    vasp/5.2.12
    vasp/5.4.4(default)
    vasp/5.4.4_optics
    vasp/5.4.4_vtst

    vtstscripts/93

    xz/5.2.4

    ```

    ```Topola tab=
    Generated on: wto, 23 cze 2020, 21:36:18 CEST

    abinit/8.0.6
    abinit/8.10.3(default)
    abinit/8.4.4

    atat/3.36

    blastplus/2.2.28(default)

    bwa/0.7.12(default)

    cfour/1.0

    chargemol/09.02.2017

    cp2k/6.1.0(default)

    cpmd/v4

    dalton/2015



    elk/4.0.15
    elk/4.3.6(default)
    elk/4.3.6_libxc

    espresso/4.3.2
    espresso/5.0.2
    espresso/5.0.3
    espresso/5.1.1
    espresso/5.2.0
    espresso/5.3.0
    espresso/6.1.0(default)
    espresso/6.3.0
    espresso/6.5

    exciting/boron
    exciting/nitrogen

    fluent/17.1.0
    fluent/17.2.0
    fluent/18.0
    fluent/18.2(default)
    fluent/19.0
    fluent/20.1

    fluka/2011.2c
    fluka/2011.2c-3

    freefem/3.56-1

    gadget/2.0.7

    gamess/2012.R2

    gaussian/g09.B.01
    gaussian/g09.D.01
    gaussian/g09.E.01
    gaussian/g16.A.01(default)

    genesis/parallel/2.3.1
    genesis/sequential/2.3

    gromacs/2020
    gromacs/5.1.1(default)

    hadoop/cdh-4.3.0
    hadoop/cdh-tt-4.3.0

    imb/2014

    julia/0.5.0
    julia/0.6.2
    julia/1.1.1

    lammps/16Mar18
    lammps/16Mar18_mpi3
    lammps/16Mar18_mpi3_rigid
    lammps/30Jul16
    lammps/30Jul16_reax
    lammps/5Jun19(default)
    lammps/6Dec13-mkl

    mathematica/10.3
    mathematica/11.0

    matlab/R2016b(default)

    meep/1.14
    meep/1.2
    meep/1.3

    migraine/0.5

    mrbayes/3.2.2(default)

    music/1.0

    namd/2.13(default)
    namd/2.9b2

    newtonx/1.4.0

    nwchem/6.3
    nwchem/6.8(default)

    octave/3.8.0

    openfoam/2.1.1
    openfoam/5.0

    openmx/3.7

    orca/3.0.1
    orca/3.0.3
    orca/4.0.1
    orca/4.2.1

    paraview/4.1.0

    patran/2012.2.2

    pcj-blast/0.1.0(default)

    plumed/2.2.1

    psi4/0b5

    r/3.0.2
    r/3.1.0
    r/3.1.2
    r/3.5.1

    raspa/2.0

    rosetta/2013wk48-bin
    rosetta/2013wk48-bin_single(default)
    rosetta/2020.08.61146

    rx/gnu/3.1.2
    rx/gnu/3.3.1
    rx/gnu/3.3.2
    rx/gnu/3.3.3
    rx/gnu/3.4.0
    rx/intel/3.1.2
    rx/intel/3.3.1
    rx/intel/3.3.2
    rx/intel/3.3.3
    rx/intel/3.4.0(default)

    shifter/16.08

    siesta/4.0b

    sire/14.3


    wannier90/2.0.1
    wannier90/3.0.0(default)

    wannier_tools/2.4.1


    ```

## Lista aplikacji

###**ABINIT**
* *A software suite to calculate the optical, mechanical,
  vibrational, and other observable properties of materials. Starting
  from the quantum equations of density functional theory, you can
  build up to advanced applications with perturbation theories based
  on DFT, and many-body Green's functions (GW and DMFT). ABINIT can
  calculate molecules, nanostructures and solids with any chemical
  composition, and comes with several complete and robust tables of
  atomic potentials* (za [stroną internetową][abinit] projektu).

*  [https://www.abinit.org][abinit]
[abinit]: https://www.abinit.org/
* Licencja: GNU General Public License
* Dostępność: Topola, Okeanos

***

###**AMBER**
* A suite of biomolecular simulation programs.
[amber]: https://ambermd.org/
* [https://ambermd.org/][amber]
* Licencja krajowa
* Dostępność: Okeanos

***

###**ANSYS Fluent**
* Offers *physical modeling capabilities needed to
  model flow, turbulence, heat transfer and reactions for industrial
  applications* (za [stroną internetową][ansys] programu).

[ansys]: https://www.ansys.com/products/fluids/ansys-fluent
* [https://www.ansys.com/products/fluids/ansys-fluent][ansys]
* [Licencja krajowa](../../Licencje_krajowe/ansys.md)
* Dostępność: Topola, Okeanos

***

###**CP2K**
* *A quantum chemistry and solid state physics software
  package that can pe
  rform atomistic simulations of solid state,
  liquid, molecular, periodic, material, crystal, and biological
  systems. CP2K provides a general framework for different modeling
  methods such as DFT using the mixed Gaussian and plane waves
  approaches GPW and GAPW. Supported theory levels include DFTB, LDA,
  GGA, MP2, RPA, semi-empirical methods (AM1, PM3, PM6, RM1, MNDO, ...),
  and classical force fields (AMBER, CHARMM, ...). CP2K can do
  simulations of molecular dynamics, metadynamics, Monte Carlo,
  Ehrenfest dynamics, vibrational analysis, core level spectroscopy,
  energy minimization, and transition state optimization using NEB or
  dimer method.* (za [stroną internetową][cp2k] projektu).

[cp2k]: https://www.cp2k.org/
* [https://www.cp2k.org/][cp2k]
* Licencja: GNU General Public License
* Dostępność: Topola, Okeanos

***

###**CPMD**
* *A parallelized plane wave / pseudopotential implementation
  of Density Functional Theory, particularly designed for ab-initio
  molecular dynamics* (za [stroną internetową][cpmd] projektu).

[cpmd]: https://www.cpmd.org
* [https://www.cpmd.org][cpmd]
* Licencja: własnościowa, gratis dla organizacji non-profit
* Dostępność: Topola

***

###**DALTON**
* A molecular electronic structure program.
[dalton]: https://daltonprogram.org
* [https://daltonprogram.org][dalton]

* Licencja: własnościowa
* Dostępność: Topola

***

### **ELK**
* *An all-electron full-potential linearised augmented-plane wave (LAPW) code.*

[elk]: http://elk.sourceforge.net/
* [http://elk.sourceforge.net/][elk]

* Licencja: GNU General Public License
* Dostępność: Topola, Okeanos

***

###**EXCITING**
*A full-potential all-electron density-functional-theory package implementing the families of linearized augmented planewave methods. It can be applied to all kinds of materials, irrespective of the atomic species involved, and also allows for exploring the physics of core electrons. A particular focus are excited states within many-body perturbation theory* (za [stroną internetową][exciting] projektu).

[exciting]: http://exciting-code.org
* [http://exciting-code.org][exciting]
* Licencja: GNU General Public License
* Dostępność: Topola

***

###**ESYS-PARTICLE**
* *Open Source software for particle-based numerical modelling. The software implements the Discrete Element Method (DEM), a widely used technique for modelling processes involving large deformations, granular flow and/or fragmentation* (za [stroną internetową][esys] projektu).

[esys]: https://launchpad.net/esys-particle
* [https://launchpad.net/esys-particle][esys]
* Licencja: Apache License 2.0
* Dostępność: Okeanos

***

###**FHI-AIMS**
* Full-Potential, All-Electron Electronic Structure Theory with Numeric Atom-Centered Basis Functions.

[fhi]: https://aimsclub.fhi-berlin.mpg.de/
* [https://aimsclub.fhi-berlin.mpg.de/][fhi]
* Licencja: [własnościowa][fhi-license]
[fhi-license]: https://aimsclub.fhi-berlin.mpg.de/aims_obtaining_simple.php
* Dostępność: Topola

***

###**GAMESS**
* *The General Atomic and Molecular Electronic Structure System (GAMESS)
is a general ab initio quantum chemistry package.*

[gamess]: https://www.msg.chem.iastate.edu/gamess/
* [https://www.msg.chem.iastate.edu/gamess/][gamess]
* Licencja: [własnościowa][gamess-license]
[gamess-license]: https://www.msg.chem.iastate.edu/gamess/download.html
* Dostępność: Topola

***

###**GAUSSIAN**
* Electronic structure modelling software.

* [https://gaussian.com/][gaussian]
[gaussian]: https://gaussian.com/
* Licencja: własnościowa
* Dostępność: Topola

***

###**GROMACS**
* *GROMACS is a versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles* (za [stroną internetową projektu][gromacs]).

[gromacs]: http://www.gromacs.org

* [http://www.gromacs.org][gromacs]
* Licencja: GNU Lesser General Public License
* Dostępność: Topola, Okeanos

***

###**JULIA**
* The Julia Programming Language designed for high performance.
* [https://julialang.org][julia]
[julia]: https://julialang.org
* Licencja: MIT License
* Dostępność: Topola

***

###**LAMMPS**
* *A classical molecular dynamics code with a focus on materials modeling. It's an acronym for Large-scale Atomic/Molecular Massively Parallel Simulator.*
* [https://lammps.sandia.gov][lammps]
[lammps]: https://lammps.sandia.gov
* Licencja: GNU General Public License
* Dostępność: Topola, Okeanos

***

###**LD-DYNA**
* A general-purpose finite element program.
* [http://www.lstc.com/products/ls-dyna](http://www.lstc.com/products/ls-dyna)
* Licencja: własnościowa
* Dostępność: Okeanos

***

###**NAMD**
* *A parallel molecular dynamics code designed for high-performance simulation of large biomolecular systems.*
* [https://www.ks.uiuc.edu/Research/namd/][namd]
[namd]: https://www.ks.uiuc.edu/Research/namd/
* Licencja: [własnościowa](https://www.ks.uiuc.edu/Research/namd/license.html)
* Dostępność: Topola, Okeanos

***

###**NWChem**
* Computational chemistry tools.
* [http://www.nwchem-sw.org/index.php/Main_Page](http://www.nwchem-sw.org/index.php/Main_Page)
* Licencja: [Educational Community License](https://opensource.org/licenses/ecl2.php)
* Dostępność: Topola, Okeanos

***

###**OpenFOAM**
*  Free and open source CFD software.
* [https://www.openfoam.com/](https://www.openfoam.com/)
* Licencja: GNU General Public License
* Dostępność: Topola, Okeanos

***

###**OpenMX**
* *OpenMX (Open source package for Material eXplorer) is a software package for nano-scale material simulations based on density functional theories (DFT), norm-conserving pseudopotentials, and pseudo-atomic localized basis functions. The methods and algorithms used in OpenMX and their implementation are carefully designed for the realization of large-scale ab initio electronic structure calculations on parallel computers based on the MPI or MPI/OpenMP hybrid parallelism* (za [stroną internetową][openmx] projektu).
* [http://www.openmx-square.org/][openmx]
[openmx]: http://www.openmx-square.org
* Licencja: GNU General Public License
* Dostępność: Topola

***

###**ORCA**
* A quantum-chemical software package.
* [https://www.faccts.de/orca/](https://www.faccts.de/orca/)
* Licencja: własnościowa
* Dostępność: Topola

***

###**QUANTUM ESPRESSO**
* *An integrated suite of Open-Source computer codes for electronic-structure calculations and materials modeling at the nanoscale. It is based on density-functional theory, plane waves, and pseudopotentials* (za [stroną internetową][qe] projektu).
[qe]: https://www.quantum-espresso.org/
* [https://www.quantum-espresso.org/][qe]
* Licencja: GNU General Public License
* Dostępność: Topola, Okeanos

***

###**R**
* *R is a free software environment for statistical computing and graphics.*
* [https://www.r-project.org](https://www.r-project.org)
* Licencja: GNU General Public License
* Dostępność: Topola, Okeanos

***

###**SIESTA**
* *SIESTA is both a method and its computer program implementation, to perform efficient electronic structure calculations and ab initio molecular dynamics simulations of molecules and solids. SIESTA's efficiency stems from the use of a basis set of strictly-localized atomic orbitals* (za [stroną internetową][siesta] projektu).
[siesta]: https://departments.icmab.es/leem/siesta/
* [https://departments.icmab.es/leem/siesta/][siesta]
* Licencja: GNU General Public License (od wersji 4.0)
* Dostępność: Topola, Okeanos

***

###**VASP**
* *The Vienna Ab initio Simulation Package: atomic scale materials modelling from first principles.*
* [https://www.vasp.at](https://www.vasp.at)
* Licencja: własnościowa
* Dostępność: Topola, Okeanos
