---
title: "SOL: sieci neuronowe"
date: 2020-11-05
draft: false
---

<!-- <Last revision: 2020-11-05 by M. Hermanowicz <m.hermanowicz@icm.edu.pl> -->


[Projekt SOL][sol] ma na celu optymalizację pracy z sieciami
neuronowymi. Jest to oprogramowanie pośredniczące (ang. *middleware*),
które integruje się z takimi narzędziami, jak PyTorch, TensorFlow i
MxNet.  SOL posiada wsparcie dla architekruey NEC SX-Aurora Tsubasa,
ale może też pracować na standardowych platformach CPU i GPU (x86,
ARM64, NVIDIA).

Oprogramowanie wraz z kopią dokumentacji znajduje się w katalogu
`/apps/nec/sol`. SOL dostępny jest w formie pakietu Python Wheel (nie
jest dostępny w systemie modułów) i tym samym każdy użytkownik musi
wykonać własną, lokalną instalację za pomocą narzędzia `pip` – patrz
poniżej. Przykłady użycia, publikacje i prezentacje dostępne są na
[stronie internetowej projektu][soldoc].

[sol]: http://sysml.neclab.eu/projects/sol
[soldoc]: http://sysml.neclab.eu/projects/sol/talks

```.sh
pip3 install --user /apps/nec/sol/sol-0.1.8-py3-none-any.whl # installs SOL
pip3 install --user torch torchvision numpy # installs other (example) requirements
```
