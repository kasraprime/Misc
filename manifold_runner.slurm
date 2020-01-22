#!/bin/bash
#SBATCH --job-name=test_Manifold         # Job name
#SBATCH --partition=develop              # Partition. change to gpu for actually using clusters
#SBATCH --qos=medium+                     # Queue 
#SBATCH --nodes=1                    # Number of nodes
#SBATCH --ntasks-per-node=1             # MPI processes per node
#SBATCH --mem=20G 
#SBATCH --output=slurm.out
#SBATCH --workdir=/home/bq93815/ferraro_user/manifold-alignment/sbatch_output
#SBATCH --error=slurm.err
#SBATCH --gres=gpu:4
#SBATCH --account=pi_ferraro 
#SBATCH --constraint=hpcf2018



num_epochs="${1}"

script_file=/home/bq93815/ferraro_user/manifold-alignment/train.py
experiment_name=UWDeepCCA
task_name=uw

printf "\n"
# echo "batch_size ${batch_size} num_epochs 200"
echo "--num_epochs ${num_epochs}"
printf "\n"

for iter in 1
do
	    echo "iter number $iter"
		python ${script_file} train ${experiment_name} ${num_epochs} ${task_name}
done