#!/bin/bash -l
#SBATCH -J gpu_test
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --nodes=1 
#SBATCH --account=YOUR_GRANT
#SBATCH --time=01:00:00 
#SBATCH --qos=normal

date 
module load gpu/cuda/11.1  
cd /home/$USER/rysy/folder_with_your_cuda_exercises
nvcc ex1_hello_world.cu -o ex1_hello_world
srun ex1_hello_world
