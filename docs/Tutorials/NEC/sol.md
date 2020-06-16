---
title: "2. SOL: Neural Networks"
date: 2020-04-09
draft: false
---

<!-- <Last revision: 2020-04-09 by M. Hermanowicz <m.hermanowicz@icm.edu.pl> -->

The [SOL project][sol] aims at accelerating neural network
tasks. Working as middleware, it integrates with PyTorch, TensorFlow
and MxNet, and supports NEC SX-Aurora Tsubasa as well as standard CPU
and GPU architectures (x86, ARM64, NVIDIA).

[sol]: http://sysml.neclab.eu/projects/sol
[soldoc]: http://sysml.neclab.eu/projects/sol/talks

The software, including offline documentation, is located in the
`/apps/nec/sol` directory. SOL is provided as a Python Wheel package (no
system module available) and needs to be installed locally (via `pip`)
by each user:

```.sh
pip3 install --user /apps/nec/sol/sol-0.1.8-py3-none-any.whl # installs SOL
pip3 install --user torch torchvision numpy # installs other (example) requirements
```

Consult the project website for [use cases, papers, and presentations][soldoc].
