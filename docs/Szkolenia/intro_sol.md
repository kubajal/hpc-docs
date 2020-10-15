---
title: "Effective Neural Networks *Without* GPU. SOL: Transparent Neural Network Acceleration on NEC SX-Aurora TSUBASA"

date: 2020-10-15
draft: false
---

<!-- <Last revision: 2020-10-15 by M. Hermanowicz <m.hermanowicz@icm.edu.pl> -->

## Introduction

**Full title**: Effective Neural Networks *Without* GPU. SOL: Transparent Neural Network Acceleration on NEC SX-Aurora TSUBASA

In 2019, ICM University of Warsaw expanded its HPC infrastructure with
a specialized vector computer, [NEC SX Aurora
TSUBASA](https://www.nec.com/en/global/solutions/hpc/sx/index.html),
with eight vector processors. Aurora TSUBASA is used at ICM UW for
calculations in physics, chemistry, AI, as well as development work
intended to adapt and optimize the existing software to work on the
new computer architecture.

Distinctive features of NEC SX-Aurora TSUBASA are:

High memory bandwidth (48 GB, HBM2) of the Vector Engine (>1 TB/s) at
< 300 W, 64 fully functional vector registers and 192 double precision
FP operations per cycle, Works within the GNU/Linux environment –
natively or in the accelerator mode.

The Workshop is intended as an introduction to two software frameworks
designed specifically for NEC SX-Aurora TSUBASA:

[NEC SOL – Transparent Neural Network
Acceleration](http://sysml.neclab.eu/projects/sol/) – an AI
acceleration middleware enabling wide range of optimizations for
neural network workloads. It integrates with existing Machine Learning
frameworks such as PyTorch and TensorFlow. SOL offers broad support
for hardware architectures including CPUs (x86, arm64), GPUs (NVIDIA),
and NEC SX-Aurora TSUBASA. It does not require modification of the
original source code allowing the user to focus on solving the problem
rather than on the specifics of the hardware architecture;

[Frovedis – FRamework Of VEctorized and DIStributed data
analytics](https://github.com/frovedis/frovedis) – data analytics
software primarily targeting the NEC SX-Aurora TSUBASA architecture.


## Agenda

1. SOL: Transparent Neural Network Acceleration
   - Introduction
   - Integration with PyTorch
   - Integration with ONNX
   -Deployment
2. Frovedis: FRamework Of VEctorized and DIStributed data analytics
3. Hands-on session: SOL at ICM infrastructure
					    

## Materials

* Video: [YouTube](https://www.youtube.com/watch?v=PrlUvsPra8o)

* Presentations [EN]:
    * [SOL – Nicolas Weber](./materials/SOL4VE.pdf)
    * [Frovedis – Erich Focht](./materials/Frovedis_Intro_ICM_Warsaw_2020_09_30.pdf)
