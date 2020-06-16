---
title: "Kompilatory"
date: 2020-06-10
draft: false
---

Przydatne polecenia:
```
module avail -t 2>&1 | grep -i gcc
module avail -t 2>&1 | grep -i cmake
module avail -t 2>&1 | grep -i intel
module avail -t 2>&1 | grep -i cuda
module avail -t 2>&1 | grep -i PrgEnv
module avail -t 2>&1 | grep -i clang
module avail -t 2>&1 | grep -i compilers
```

Stan z 10 VI 2020

|               | Topola                               | Okeanos                     | Rysy                          |
|-------------- | ------------------------------------ | --------------------------- | ----------------------------- |
| **Cuda**      |                                      |                             | gpu/cuda/9.2                  |
|               |                                      |                             | gpu/cuda/10.0                 |
|               |                                      |                             | gpu/cuda/10.1                 |
|               |                                      |                             | gpu/cuda/10.2                 |
| Prefix path   | `common/compilers/`                  |                             | `common/compilers/`           |
| **GNU (GCC)** | gcc/4.8.1                            |                             |                               |
|               |                                      | gcc/6.1.0                   |                               |
|               |                                      | gcc/7.3.0                   |                               |
|               |                                      | gcc/7.3.0                   |                               |
|               |                                      | gcc/8.1.0                   |                               |
|               | gcc/8.3.0                            | gcc/8.3.0(default)          |                               |
|               | gcc/7.3.1(default)                   |                             | gcc/7.3.1                     |
|               |                                      |                             | gcc/8.3.1                     |
| **Intel**     | intel/2013/sp1                       |                             |                               |
|               | intel/2015/update6                   |                             |                               |
|               | intel/2016/update4                   |                             |                               |
|               | intel/2017/update5                   |                             |                               |
|               | intel/2018/initial                   |                             |                               |
|               | intel/2018/update1(default)          |                             |                               |
|               |                                      |                             | intel/2018u1                  |
|               |                                      |                             | intel/2020                    |
|               |                                      | intel/18.0.1.163            |                               |
|               |                                      | intel/19.0.1.144            |                               |
|               |                                      | intel/19.1.0.166            |                               |
| **Clang**     |                                      |                             | clang/7.0.0                   |
|               |                                      |                             | clang/9.0.0                   |
| **PrgEnv**    |                                      | PrgEnv-cray/6.0.5(default)  |                               |
|               |                                      | PrgEnv-gnu/6.0.5(default)   |                               |
|               |                                      | PrgEnv-intel/6.0.5(default) |                               |

Inne narzędzia

|               | Topola                               | Okeanos                     | Rysy                          |
|-------------- | ------------------------------------ | --------------------------- | ----------------------------- |
|               |                                      |                             |                               |
| **Cmake**     | cmake/2.8.12                         |                             |                               |
|               | cmake/3.6.2                          |                             |                               |
|               | cmake/3.11.3                         |                             |                               |
|               | cmake/3.16.3                         |                             |                               |

<!-- 

## cmake

`module avail -t 2>&1 | grep -i cmake`

### Topola

```
common/cmake/2.8.12
common/cmake/3.6.2
common/cmake/3.11.3
common/cmake/3.16.3
```

### Okeanos

brak

### Rysy

brak

## GNU Compiler Collection (GCC)

`module avail -t 2>&1 | grep -i gcc`

### Topola

```
common/compilers/gcc/4.8.1
common/compilers/gcc/7.3.1(default)
common/compilers/gcc/8.3.0
```

### Okeanos

```
gcc/6.1.0
gcc/7.3.0
gcc/8.1.0
gcc/8.3.0(default)
```

### Rysy

```
common/compilers/gcc/7.3.1
common/compilers/gcc/8.3.1
```

## Intel

`module avail -t 2>&1 | grep -i intel`

### Topola

```
common/compilers/intel/2013/sp1
common/compilers/intel/2015/update6
common/compilers/intel/2016/update4
common/compilers/intel/2017/update5
common/compilers/intel/2018/initial
common/compilers/intel/2018/update1(default)
```

### Okeanos

```
intel/18.0.1.163
intel/19.0.1.144
intel/19.1.0.166
```

### Rysy

```
common/compilers/intel/2018u1
common/compilers/intel/2020
```

## CUDA

`module avail -t 2>&1 | grep -i cuda`

### Topola

Brak.

### Okeanos

Brak.

### Rysy

```
gpu/cuda/10.0
gpu/cuda/10.1
gpu/cuda/10.2
gpu/cuda/9.2
```

## Inne

### Topola

```
common/compilers/llvm/3.9.1
common/compilers/mono/5.0.1.1
common/compilers/pgi/17.4
```

## Clang

`module avail -t 2>&1 | grep -i clang`

### Topola

Brak.

### Okeanos

Brak.

### Rysy

```
common/compilers/clang/7.0.0
common/compilers/clang/9.0.0
```

## PrgEnv

`module avail -t 2>&1 | grep -i PrgEnv`

### Topola

Brak.

### Okeanos

```
PrgEnv-cray/6.0.5(default)
PrgEnv-gnu/6.0.5(default)
PrgEnv-intel/6.0.5(default)
```

### Rysy

Brak. -->





<!-- 
## Rysy
compilers/intel/13.1.3(@)
compilers/intel/2015/update5(@)
compilers/intel/2015/update6(@)
compilers/intel/2016/update2(@)
compilers/intel/2016/update4(@)
compilers/intel/2017/update1(@)
compilers/intel/2017/update5(@)
compilers/llvm/3.9.1(@)
compilers/pgi/17.4(@)
common/compilers/gcc/4.8.1
common/compilers/gcc/7.3.1(default)
common/compilers/gcc/8.3.0
common/compilers/gnu/4.8.1(default)
common/compilers/gnu/7.3.1
common/compilers/gnu/8.3.0
common/compilers/intel/2013/sp1
common/compilers/intel/2015/update6
common/compilers/intel/2016/update4
common/compilers/intel/2017/update5
common/compilers/intel/2018/initial
common/compilers/intel/2018/update1(default)
common/compilers/llvm/3.9.1
common/compilers/mono/5.0.1.1
common/compilers/pgi/17.4

## Okeanos

gcc/6.1.0
gcc/7.3.0
gcc/8.1.0
gcc/8.3.0(default)

PrgEnv-gnu/6.0.5(default)
craype-ml-plugin-py2/gnu71/1.1.4
craype-ml-plugin-py3/gnu71/1.1.4

PrgEnv-cray/6.0.5(default)
PrgEnv-gnu/6.0.5(default)
PrgEnv-intel/6.0.5(default)

craype-intel-knc
PrgEnv-intel/6.0.5(default)
intel/18.0.1.163
intel/19.0.1.144
intel/19.1.0.166

## Rysy

/apps/modulefiles/gpu:
gpu/cuda/10.0
gpu/cuda/10.1
gpu/cuda/10.2
gpu/cuda/9.2
/apps/modulefiles/common:
common/compilers/clang/7.0.0
common/compilers/clang/9.0.0
common/compilers/gcc/7.3.1
common/compilers/gcc/8.3.1
common/compilers/intel/2018u1
common/compilers/intel/2020 -->
