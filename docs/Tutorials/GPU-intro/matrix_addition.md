---
title: "3 Element-wise Matrix Add"
date: 2020-02-25
draft: false
---

As a step by step instruction has been presented in tutorial 2,
here is a time for a stand-alone practice.

Accelerate the serial, element-wise square matrix addition code using cuda kernel.

```.cpp
#include <stdio.h>


cpu_add_matrix_elementwise (float* a, float* b, float* c, int N)
{
    int index;

    for (int i=0; i <N; ++i)
        for (int j=0; j <N; ++j)
        {
            index = i + j*N
            c[index] = a[index] + b[index];
        }
}

void print_matrix(float *Matrix, const int N)
{
    for (int i=0; i <N; ++i)
    {
        printf("\n");
        for (int j=0; j <N; ++j)
        {
            int index = i + j*N;
            printf(" %f ",Matrix[index]);
        }
    }  
}

void CPU_version_wrapper(const int N)
{
    const int mem_size = N*N*sizeof(float);

    float* A = (float*)malloc(mem_size);
    float* B = (float*)malloc(mem_size);
    float* C = (float*)malloc(mem_size);

    // initialize data
    for (int i=0; i <N; ++i)
    {
        for (int j=0; j <N; ++j)
        {
            int index = i + j*N;
            A[index] = 2.*index;
            B[index] = 3.*index;
        }
    }

    // run calculations
    cpu_add_matrix_elementwise(A,B,C,N);
    print_matrix(C, N);

    // Free memory
    free(A); free(B); free(C);
}

int main(){
    const int N = 8;
    CPU_version_wrapper(N);
    printf("\n----------------------------------\n");
    //GPU_version_wrapper(N);
    printf("\n");
    return 0;
}
```
