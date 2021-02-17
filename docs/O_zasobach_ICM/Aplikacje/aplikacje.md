---
title: "Aplikacje"
date: 2020-04-09
draft: false
---


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

???+ info "Wersje Aplikacji"
    Wersje aplikacji na poszczególnych maszynach

    === "Okeanos"

        ``` .sh
        Generated on: czw, 11 lut 2021, 19:41:41 CET

        abinit/8.10.1
        abinit/8.10.3(default)
        abinit/8.10.3-patch

        bedtools2/2.29.2

        castep/19.11

        cp2k/6.1.0(default)

        espresso/6.1
        espresso/6.1.0(default)
        espresso/6.2.1
        espresso/6.4
        espresso/6.5
        espresso/6.6

        fluent/17.0
        fluent/17.1
        fluent/18.0
        fluent/19.1

        gromacs/2018.4-plumed
        gromacs/2019.0
        gromacs/2020(default)

        julia/1.3.0

        lammps/31Mar17
        lammps/5Jun19(default)

        ls-dyna/10.1.0(default)
        ls-dyna/11.0.0
        ls-dyna/11.1
        ls-dyna/8.0.0

        module_permission_check

        namd/2.11
        namd/2.13(default)

        ncl/6.6.2

        nwchem/6.6
        nwchem/6.8

        openfoam/1218(default)

        r/3.4.2

        samtools/1.10

        siesta/4.1
        siesta/4.1-b4

        tau/2.30

        tensorflow/1.13.0

        vasp/5.2.12
        vasp/5.4.4(default)
        vasp/5.4.4_optics
        vasp/5.4.4-spinorb
        vasp/5.4.4_vtst
        vasp/6.1.1

        vtstscripts/93

        wannier90/3.1.0-gnu
        wannier90/3.1.0-intel

        xz/5.2.4
        ```

    === "Topola"

        ``` .sh
        Generated on: czw, 11 lut 2021, 19:47:07 CET

        abinit/8.0.6
        abinit/8.10.3(default)
        abinit/8.4.4
        abinit/9.2.2

        ambertools/20

        bedtools/2.30.0

        cp2k/6.1.0(default)

        cpmd/v4

        crystal/17

        dalton/2015

        elk/4.3.6(default)
        elk/6.8.4

        espresso/5.0.2
        espresso/5.0.3
        espresso/6.1.0(default)
        espresso/6.3.0
        espresso/6.5

        fluent/15.0
        fluent/18.0
        fluent/18.2(default)
        fluent/19.0
        fluent/20.1

        gaussian/g09.B.01
        gaussian/g09.D.01
        gaussian/g09.E.01
        gaussian/g16.A.01(default)

        gromacs/2020
        gromacs/5.1.1(default)

        hadoop/cdh-4.3.0
        hadoop/cdh-tt-4.3.0

        julia/1.1.1

        lammps/16Mar18_mpi3_rigid
        lammps/5Jun19(default)

        mathematica/10.3
        mathematica/11.0

        matlab/R2016b(default)

        meep/1.14
        meep/1.3

        module_permission_check

        namd/2.13(default)

        nwchem/6.8(default)

        octave/5.2.0

        openfoam/2.1.1
        openfoam/5.0

        orca/4.2.1

        picard-tools/2.24.0

        plumed/2.2.1

        r/3.5.1
        r/4.0.3

        rosetta/2020.08.61146

        samtools/1.11

        siesta/4.0b
        siesta/4.1-b4

        star/2.7.7a

        subread/2.0.1

        trimmomatic/0.39

        vasp/5.4.1
        vasp/5.4.4(default)
        vasp/5.4.4_wannier
        vasp/5.4.4_wannier_patch
        vasp/6.1.1

        wannier90/2.0.1
        wannier90/3.0.0(default)
        wannier90/3.1.0
        ```

    === "Bash"

        ``` .sh
        #!/bin/bash

        # this scripts generates a list of available applications based on modules.

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

## Opis aplikacji

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
