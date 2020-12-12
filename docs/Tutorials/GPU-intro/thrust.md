---
title: "3 Thrust Library"
date: 2020-12-11
draft: false
---

## Thrust Library

!!! info "According to nVidia:"

    Thrust is a C++ template library for CUDA based on the Standard Template Library (STL). Thrust allows you to implement high performance parallel applications with minimal programming effort through a high-level interface that is fully interoperable with CUDA C.

    Thrust provides a rich collection of data parallel primitives such as scan, sort, and reduce, which can be composed together to implement complex algorithms with concise, readable source code. By describing your computation in terms of these high-level abstractions you provide Thrust with the freedom to select the most efficient implementation automatically. As a result, Thrust can be utilized in rapid prototyping of CUDA applications, where programmer productivity matters most, as well as in production, where robustness and absolute performance are crucial.

## Reduction

```.cu

#include <stdio.h>
#include <thrust/device_vector.h>

void cpu_sum(int *x, int n)
{
    int result = 0;
    for(unsigned int i=0; i < n; ++i) { 
        result += x[i];
    }
    printf("CPU Sum is %d \n", result);
}

void gpu_sum(int *x, int n)
{

    thrust::device_vector<int> d_vec(n,0); // initialize all n integers of a device_vector to 0

    for(unsigned int i = 0; i < n; ++i)
    {
        d_vec[i] = x[i];
    }

    int t_sum = thrust::reduce(d_vec.begin(), d_vec.end(), (int) 0, thrust::plus<int>());
    printf("GPU (thrust) Sum is %d \n", t_sum);
}


int main()
{
    int h[] = {10, 1, 8, -1, 0, -2, 3, 5, -2, -3, 2, 7, 0, 11, 0, 2};
    
    int size = sizeof(h);
    int count = size/sizeof(int);

    cpu_sum(h, count);
    gpu_sum(h, count);

    return 0;
}
```

## SAXPY

**SAXPY** stands for “Single-Precision A·X Plus Y”. 
It is a function in the standard Basic Linear Algebra Subroutines (BLAS)library.

```.cu
#include <stdio.h>
#include <thrust/device_vector.h>
#include <iostream>

struct saxpy_functor
{
    const float a;
    saxpy_functor(float _a) : a(_a) {}


    __host__ __device__
    float operator()(const float& x, const float& y) const 
    {
        return a * x + y;
    }

};

void saxpy_fast(float A, thrust::device_vector<float>& X, thrust::device_vector<float>& Y)
{
    // Y <- A * X + Y
    thrust::transform(X.begin(), X.end(), Y.begin(), Y.begin(), saxpy_functor(A));
}

int main(void)
{
    // allocate three device_vectors with 5 elements
    thrust::device_vector<float> X(5);
    thrust::device_vector<float> Y(5);

    // initialize the arrays to 0,1,2,3,4
    thrust::sequence(X.begin(), X.end());
    thrust::sequence(Y.begin(), Y.end());

    saxpy_fast(100, X, Y);

    // print contents of Y
    for(int i = 0; i < Y.size(); i++)
        std::cout << "Y[" << i << "] = " << Y[i] << std::endl;
}

// output
// Y[0] = 0
// Y[1] = 101
// Y[2] = 202
// Y[3] = 303
// Y[4] = 404
```

## Additional reading

[Official Quick Start Guide](https://docs.nvidia.com/cuda/archive/11.0/pdf/Thrust_Quick_Start_Guide.pdf).
