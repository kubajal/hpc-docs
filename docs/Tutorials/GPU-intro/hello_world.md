---
title: "1 Hello World"
date: 2020-02-25
draft: false
---


Write a simple `ex1_hello_world.cu` application using cuda.
Experiment with different amount of blocks and threads per block.

```.cu
#include <stdio.h>

__global__ void print_from_gpu(void) {
    int tidx = blockIdx.x*blockDim.x+threadIdx.x;
    printf("Hello from device! My threadId = blockIdx.x *blockDim.x + threadIdx.x <=> %d = %d * %d + %d \n",
    tidx, blockIdx.x, blockDim.x, threadIdx.x);
}

int main(void) {
    printf("Hello World from host!\n");

    print_from_gpu<<<2,3>>>();  // <<<blocks, threads_per_block>>>

    cudaDeviceSynchronize();
    return 0;
}
```

Compile and run:

```.sh
$ nvcc ex1_hello_world.cu -o hello_world
$ ./hello_world
```

If you have an account at ICM HPC, you can use the *Rysy* cluster to run GPU jobs:

```.sh
ssh username@hpc.icm.edu.pl
ssh rysy
# run interactive session
srun -N1 -n4 --account=GRANT_NAME --gres=gpu:1 --time=01:00:00 --pty /bin/bash -l
# prepare enviroment
module load gpu/cuda/10.2
```
